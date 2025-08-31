#include "renderer.h"
#include "vector.h"
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include "platform/VTU.h"
#include "platform/profiler.h"



#define LIGHT_DIR   vec3( 0, 1, -1 )       //inverted
#define LIGHT_DIR_N vec3(0, 0.707107f, -0.707107f)	//normalized
#define LIGHT_COL   vec3(1.0f, 0.956f, 0.839f)
#define LIGHT_AMBIENT vec3(0.212, 0.227, 0.259)



void writePixel(const Framebuffer* fb, int x, int y, float z, Color col) {
    if (x < 0 || x >= fb->width || y < 0 || y >= fb->height) return;

    uint32_t* crow = fb->color + (y * fb->color_pitch);
    float*    zrow = fb->depth + (y * fb->depth_pitch);

    if(z < zrow[x]) {
        zrow[x] = z;		//depthbuffer[y][x] = z;
        crow[x] = col.bgra;	//framebuffer[y][x] = col;
    }
}

static void DrawLine(const Framebuffer* fb, int x0, int y0, int x1, int y1, Color col){
    int dx  =  abs(x1 - x0);
    int dy  = -abs(y1 - y0);
    int sx  = (x0 < x1) ?  1 : -1;
    int sy  = (y0 < y1) ?  1 : -1;
    int err = dx + dy;

    for (;;) {

    	//if (x0 >= 0 && x0 < WIDTH && y0 >= 0 && y0 < HEIGHT)
        writePixel(fb, x0, y0, 0, col);

        if (x0 == x1 && y0 == y1) break;
        int e2 = 2 * err;
        if (e2 >= dy){ err += dy; x0 += sx; }
        if (e2 <= dx){ err += dx; y0 += sy; }
    }
}


static inline int clampInt(int v, int lo, int hi) { 
    return v < lo ? lo : (v > hi ? hi : v);
}
static float edge(float ax, float ay, float bx, float by, float px, float py){
    return (bx - ax) * (py - ay) - (by - ay) * (px - ax);
}
static inline int isBackface(const Vec4 p0, const Vec4 p1, const Vec4 p2){
    //2-D signed volume of the parallelepiped from(x,y,w)
    float det =   p0.x * (p1.y * p2.w - p1.w * p2.y)
                + p0.y * (p1.w * p2.x - p1.x * p2.w)
                + p0.w * (p1.x * p2.y - p1.y * p2.x);

    const float kEps = 1e-7f;    // cull micro-triangles
    if(fabs(det) < kEps)
        return true;

    return det >= 0.0f;
}




// SUTHERLAND-HODGEMAN  CLIPPING
static inline VSOut LerpVSOut(const VSOut *a, const VSOut *b, float t){
    VSOut o;
    o.pos      = vec4_lerp(a->pos, b->pos, t);
    o.worldPos = vec3_lerp(a->worldPos, b->worldPos, t);
    o.uv       = vec2_lerp(a->uv,       b->uv,       t);
    o.normal   = vec3_lerp(a->normal,   b->normal,   t);
    o.tangent  = vec3_lerp(a->tangent,  b->tangent,  t);
    o.tanSign  = a->tanSign + t * (b->tanSign - a->tanSign);
    return o;
}

enum { PL_LEFT=1, PL_RIGHT=2, PL_BOTTOM=4, PL_TOP=8, PL_NEAR=16, PL_FAR=32 };
static inline uint8_t OutCode(const Vec4 p){
    uint8_t c = 0;
    if(p.x < -p.w)  c |= PL_LEFT;
    if(p.x >  p.w)  c |= PL_RIGHT;
    if(p.y < -p.w)  c |= PL_BOTTOM;
    if(p.y >  p.w)  c |= PL_TOP;
    if(p.z <  0.0f) c |= PL_NEAR;
    if(p.z >  p.w)  c |= PL_FAR;
    return c;

    //return  ((uint8_t)(p.x < -p.w) << 0) |
    //    ((uint8_t)(p.x >  p.w) << 1) |
    //    ((uint8_t)(p.y < -p.w) << 2) |
    //    ((uint8_t)(p.y >  p.w) << 3) |
    //    ((uint8_t)(p.z <  0.f) << 4) |
    //    ((uint8_t)(p.z >  p.w) << 5);
}

static inline float PlaneDist(const Vec4 p, int plane){
    switch (plane){
        case PL_LEFT:   return  p.x + p.w;   // x = -w  → inside if ≥0
        case PL_RIGHT:  return  p.w - p.x;   // x = +w  → inside if ≥0
        case PL_BOTTOM: return  p.y + p.w;   // y = -w
        case PL_TOP:    return  p.w - p.y;   // y = +w
        case PL_NEAR:   return  p.z;         // z =  0
        case PL_FAR:    return  p.w - p.z;   // z = +w
    }
    return 0.0f;
}
static inline bool triangleCullCheck(const Vec4 p0, const Vec4 p1, const Vec4 p2){
    uint8_t code0 = OutCode(p0);
    uint8_t code1 = OutCode(p1);
    uint8_t code2 = OutCode(p2);

    return ( code0& code1 & code2) != 0;
}

#define MAX_VERTS 12   // worst case after clipping a triangle by 6 planes is 10
static int ClipTriangleToFrustum(const VSOut *v0, const VSOut *v1, const VSOut *v2, VSOut outTris[MAX_VERTS][3]){
    uint8_t o0 = OutCode(v0->pos);
    uint8_t o1 = OutCode(v1->pos);
    uint8_t o2 = OutCode(v2->pos);

    if( (o0|o1|o2) == 0) {         //completely inside
        outTris[0][0] = *v0;
        outTris[0][1] = *v1;
        outTris[0][2] = *v2;
        return 1;
    }
    if( (o0&o1&o2) != 0) return 0; // completely outside
        


    VSOut poly[MAX_VERTS];
    int n = 3;
    poly[0] = *v0;  poly[1] = *v1;  poly[2] = *v2;

    static const int planes[6] = {  PL_LEFT, PL_RIGHT, PL_BOTTOM, PL_TOP, PL_NEAR, PL_FAR  };

    // Sutherland–Hodgman clip loop
    for (int p = 0; p < 6 && n; ++p) {
        VSOut next[MAX_VERTS];
        int   m = 0;

        for (int i = 0; i < n; ++i) {
            int   j  = (i + 1) % n;
            VSOut A  = poly[i];
            VSOut B  = poly[j];

            float da = PlaneDist(A.pos, planes[p]);
            float db = PlaneDist(B.pos, planes[p]);

            int   ina = (da >= 0.0f);
            int   inb = (db >= 0.0f);

            if (ina && inb) {                     // in -> in 
                next[m++] = B;
            } else if (ina && !inb) {             // in -> out 
                float t  = da / (da - db);
                next[m++] = LerpVSOut(&A, &B, t);
            } else if (!ina && inb) {             // out -> in 
                float t  = da / (da - db);
                next[m++] = LerpVSOut(&A, &B, t);
                next[m++] = B;
            }
            // out -> out : emit nothing 
        }
        memcpy(poly, next, m * sizeof(VSOut));
        n = m;
    }

    //Triangulate the resulting convex polygon
    int triCount = 0;
    for (int i = 1; i + 1 < n; ++i) {
        outTris[triCount][0] = poly[0];
        outTris[triCount][1] = poly[i];
        outTris[triCount][2] = poly[i + 1];
        ++triCount;
    }
    return triCount;
}







//RENDER STAGES
static inline float rsqrt_safe(float x) {
    return 1.0f / sqrtf(fmaxf(x, 1e-20f));
}

static inline Vec3 norm_fast(Vec3 v) {
    float invlen = rsqrt_safe(vec3_dot(v, v));
    return vec3_scale(v, invlen);
}


static Color ShadeFragment(const VSOut* v0, const VSOut* v1, const VSOut* v2, Vec3 worldPos, Vec2 uv, Vec3 N, Vec3 T, float tanSign, const Texture *diffuseTex, const Texture *normalTex, Vec3 camPos) {
    // Colors
    Vec3 diffuseCol = Sample2D(diffuseTex, uv.x, uv.y);
    const Vec3 specularCol = vec3(1.0f, 0.956f, 0.839f);
    const float specStrength = .5, shininess = 128;		// Skin 0.06/16		metal 0.5/64
    //const float normalStrength = 1;

    //Tangents and Bitangents
    N = norm_fast(N); //vec3_norm(N);
    //T = norm_fast(T);
    //T = norm_fast(vec3_sub(T, vec3_scale(N, vec3_dot(N, T))));  //Orthonormalise T against N (fix interpolation skew)
   	//Vec3 B = vec3_scale(vec3_cross(N, T), tanSign);     	    //Binormals

   	//Normal Texture
    //Vec3 normalCol = Sample2D(normalTex, uv.x, uv.y);
    //normalCol = vec3_sub(vec3_scale(normalCol, 2), vec3s(1));  //remap normals
    //normalCol.x *= normalStrength;  normalCol.y *= normalStrength;
    //normalCol = norm_fast(normalCol);

    // Tangent to world: n_ws = T * x  +  B * y  +  N * z
    //N = norm_fast( vec3_add3(
    //    vec3_scale(T, normalCol.x),
    //    vec3_scale(B, normalCol.y),
    //    vec3_scale(N, normalCol.z)
    //));



    //Diffuse Light (Lambert)
    float diff = fmaxf(0, vec3_dot(N, LIGHT_DIR_N));
    Vec3 diffLight = vec3_scale(LIGHT_COL, diff);

    //Blinn-Phong (Specular)
    Vec3 viewDir = norm_fast(vec3_sub(camPos, worldPos));
    Vec3 h = norm_fast(vec3_add(LIGHT_DIR_N, viewDir));
    float nh = fmaxf(0.0f, vec3_dot(N, h));
    float spec = powf(nh, shininess) * specStrength;
    Vec3 specLight = vec3_scale(LIGHT_COL, spec);


    //Combine color and light
    Vec3 col = vec3_add3(
        vec3_mul(diffuseCol, LIGHT_AMBIENT),
        vec3_mul(diffuseCol, diffLight),
        vec3_mul(specularCol, specLight)
    );

    return color_fromVec(col);
}



//#define TOP_LEFT_RULE
static inline void RasterizeTriangle(const Framebuffer* fb, const VSOut* v0, const VSOut* v1, const VSOut* v2, const Texture *diffuse, const Texture *normalMap, Vec3 camPos, Color col){
	_PROF_BEGIN("RasterizeTriangle");

	// perspective divide    Clip->NDC
    const float W_EPS = 0.00001;        //!!! w-clamp is a heuristic to avoid sign flips.  Disable if CLIPPING_ON

    Vec4 p0 = v0->pos;   if(p0.w<=W_EPS)p0.w=W_EPS;           const float invW0=1/p0.w;    p0.x*=invW0;  p0.y*=invW0;  p0.z*=invW0;
    Vec4 p1 = v1->pos;   if(p1.w<=W_EPS)p1.w=W_EPS;           const float invW1=1/p1.w;    p1.x*=invW1;  p1.y*=invW1;  p1.z*=invW1;
    Vec4 p2 = v2->pos;   if(p2.w<=W_EPS)p2.w=W_EPS;           const float invW2=1/p2.w;    p2.x*=invW2;  p2.y*=invW2;  p2.z*=invW2;

    //if(edge(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y)>=0) return; //backface cull  performed earlier

    // NDC->screen   ViewPortTransform
    const float sx0 = (p0.x + 1) * 0.5f * fb->width,   sy0 = (1 - p0.y) * 0.5f * fb->height;
    const float sx1 = (p1.x + 1) * 0.5f * fb->width,   sy1 = (1 - p1.y) * 0.5f * fb->height;
    const float sx2 = (p2.x + 1) * 0.5f * fb->width,   sy2 = (1 - p2.y) * 0.5f * fb->height;
    

    int minx = (int)floorf(fminf(sx0, fminf(sx1, sx2)));   // bounding box
    int maxx = (int)ceilf (fmaxf(sx0, fmaxf(sx1, sx2)));
    int miny = (int)floorf(fminf(sy0, fminf(sy1, sy2)));
    int maxy = (int)ceilf (fmaxf(sy0, fmaxf(sy1, sy2)));
    minx = clampInt(minx, 0, fb->width - 1);    //Viewport Clip			//HW (per tri)
    maxx = clampInt(maxx, 0, fb->width - 1);							//HW (per tri)
    miny = clampInt(miny, 0, fb->height - 1);							//HW (per tri)
    maxy = clampInt(maxy, 0, fb->height - 1);							//HW (per tri)




    // ------ INCREMENTAL RASTERIZER ------
    float area2 = edge(sx0, sy0, sx1, sy1, sx2, sy2);
    if (area2 == 0.0f) { _PROF_END("RasterizeTriangle");  return; }

    // Orientation so that inside is >= 0
    const float orient = (area2 > 0.0f) ? 1.0f : -1.0f;
    const float invArea = 1.0f / (area2 * orient);   // 1 / abs(area2)

    // Edge-function coefficients: E(x,y) = A*x + B*y + C
    const float A01 = (sy1 - sy2) * orient, B01 = (sx2 - sx1) * orient;  // edge v1->v2
    const float A12 = (sy2 - sy0) * orient, B12 = (sx0 - sx2) * orient;  // edge v2->v0
    const float A20 = (sy0 - sy1) * orient, B20 = (sx1 - sx0) * orient;  // edge v0->v1


#ifdef TOP_LEFT_RULE
    // Top-left rule flags computed from ORIGINAL deltas
    const float dy01 = sy2 - sy1, dx01 = sx2 - sx1;
    const float dy12 = sy0 - sy2, dx12 = sx0 - sx2;
    const float dy20 = sy1 - sy0, dx20 = sx1 - sx0;
    const int   TL01 = (dy01 < 0.0f) || (dy01 == 0.0f && dx01 > 0.0f);
    const int   TL12 = (dy12 < 0.0f) || (dy12 == 0.0f && dx12 > 0.0f);
    const int   TL20 = (dy20 < 0.0f) || (dy20 == 0.0f && dx20 > 0.0f);
#endif

    // Starting pixel center
    const float px0 = (float)minx + 0.5f;
    const float py0 = (float)miny + 0.5f;
    // Initial edge values at first pixel center (oriented)
    float e0_row = edge(sx1, sy1, sx2, sy2, px0, py0) * orient; // v1->v2
    float e1_row = edge(sx2, sy2, sx0, sy0, px0, py0) * orient; // v2->v0
    float e2_row = edge(sx0, sy0, sx1, sy1, px0, py0) * orient; // v0->v1


    for(int y = miny; y <= maxy; ++y) {
        float e0 = e0_row, e1 = e1_row, e2 = e2_row;
        uint32_t* crow = fb->color + y * fb->color_pitch;
        float*    zrow = fb->depth + y * fb->depth_pitch;

        for(int x = minx; x <= maxx; ++x) {

			#ifdef TOP_LEFT_RULE	   // Top-left coverage test
            const int c0 = (e0 > 0.0f) || (TL01 && e0 == 0.0f);
            const int c1 = (e1 > 0.0f) || (TL12 && e1 == 0.0f);
            const int c2 = (e2 > 0.0f) || (TL20 && e2 == 0.0f);
            const int inside = c0 && c1 && c2;
			#else
            const int inside = (e0 >= 0.0f) & (e1 >= 0.0f) & (e2 >= 0.0f);	 // Uniform coverage test (no top-left rule)
        	#endif

            if(inside) {
                float depth = (p0.z * e0 + p1.z * e1 + p2.z * e2) * invArea;   // Affine NDC depth (p.z is already post-divide),  normalize by area

                if (depth < zrow[x]) {
                	// Perspective-correct barycentrics for attributes
                	const float denom = e0 * invW0 + e1 * invW1 + e2 * invW2;
                	//const float invDen = 1.0f / denom;                // or NEON reciprocal + NR refine
                    const float w0 = (e0 * invW0) / denom;
                    const float w1 = (e1 * invW1) / denom;
                    const float w2 = (e2 * invW2) / denom;

                    //Interpolation
                    Vec3 worldPos = vec3_add3(vec3_scale(v0->worldPos, w0), vec3_scale(v1->worldPos, w1), vec3_scale(v2->worldPos, w2));
                    Vec2 uv       = vec2_add3(vec2_scale(v0->uv, w0),       vec2_scale(v1->uv, w1),       vec2_scale(v2->uv, w2));
                    Vec3 N        = vec3_add3(vec3_scale(v0->normal, w0),   vec3_scale(v1->normal, w1),   vec3_scale(v2->normal, w2));
                    Vec3 T 		  = vec3_add3(vec3_scale(v0->tangent, w0),  vec3_scale(v1->tangent, w1),  vec3_scale(v2->tangent, w2));
                    float tanSign = v0->tanSign * w0 + v1->tanSign * w1 + v2->tanSign * w2;
                    tanSign       = tanSign < 0.f ? -1.f : 1.f;

                    // Pixel Shaders
                    Color c = ShadeFragment(v0, v1, v2, worldPos, uv, N, T, tanSign, diffuse, normalMap, camPos);
                    zrow[x] = depth;
                    crow[x] = c.bgra;
                }
            }
            e0 += A01;  e1 += A12;  e2 += A20;	// Move right +1 px
        }
        e0_row += B01;  e1_row += B12;  e2_row += B20;	// Move down + 1 scanline
    }

    _PROF_END("RasterizeTriangle");
}






static inline void VertexProcessor(VSOut* restrict out , const Mesh* restrict mesh, const int index, const Mat4* restrict mvp, const Mat4* restrict model) {
    // --- Position (Vec3 -> world Vec3, clip Vec4) --------------------------
    const float px = mesh->Pos[index].x;
    const float py = mesh->Pos[index].y;
    const float pz = mesh->Pos[index].z;

    // world = [px,py,pz,1] * model
    const float wx = px*model->m[0][0] + py*model->m[1][0] + pz*model->m[2][0] + model->m[3][0];
    const float wy = px*model->m[0][1] + py*model->m[1][1] + pz*model->m[2][1] + model->m[3][1];
    const float wz = px*model->m[0][2] + py*model->m[1][2] + pz*model->m[2][2] + model->m[3][2];

    out->worldPos.x = wx;
    out->worldPos.y = wy;
    out->worldPos.z = wz;

    // clip = [px,py,pz,1] * MVP   (keeps your current API)
    out->pos.x = px*mvp->m[0][0] + py*mvp->m[1][0] + pz*mvp->m[2][0] + mvp->m[3][0];
    out->pos.y = px*mvp->m[0][1] + py*mvp->m[1][1] + pz*mvp->m[2][1] + mvp->m[3][1];
    out->pos.z = px*mvp->m[0][2] + py*mvp->m[1][2] + pz*mvp->m[2][2] + mvp->m[3][2];
    out->pos.w = px*mvp->m[0][3] + py*mvp->m[1][3] + pz*mvp->m[2][3] + mvp->m[3][3];



    // --- Normal (Vec3) -----------------------------------------------------
    // world normal = [nx,ny,nz,0] * model  (uses upper-left 3x3)
    // NOTE: for non-uniform scale you should use inverse-transpose(model3x3).

    const float nx = mesh->Normal[index].x;
    const float ny = mesh->Normal[index].y;
    const float nz = mesh->Normal[index].z;

    float nwx = nx*model->m[0][0] + ny*model->m[1][0] + nz*model->m[2][0];
    float nwy = nx*model->m[0][1] + ny*model->m[1][1] + nz*model->m[2][1];
    float nwz = nx*model->m[0][2] + ny*model->m[1][2] + nz*model->m[2][2];

    // normalize
    float nlen2 = nwx*nwx + nwy*nwy + nwz*nwz;
    if(nlen2 > 1.0e-6f) {
        float inv = 1.0f / sqrtf(nlen2);
        nwx *= inv; nwy *= inv; nwz *= inv;
    }
    out->normal.x = nwx; out->normal.y = nwy; out->normal.z = nwz;


    // --- Tangent (xyz transformed like a direction; w is handedness) -------
    const float tx = mesh->Tangent[index].x;
    const float ty = mesh->Tangent[index].y;
    const float tz = mesh->Tangent[index].z;
    out->tanSign   = mesh->Tangent[index].w;

    float twx = tx*model->m[0][0] + ty*model->m[1][0] + tz*model->m[2][0];
    float twy = tx*model->m[0][1] + ty*model->m[1][1] + tz*model->m[2][1];
    float twz = tx*model->m[0][2] + ty*model->m[1][2] + tz*model->m[2][2];

    // normalize
    float tlen2 = twx*twx + twy*twy + twz*twz;
    if (tlen2 > 1.0e-6f) {
        float inv = 1.0f / sqrtf(tlen2);
        twx *= inv; twy *= inv; twz *= inv;
    }
    out->tangent.x = twx; out->tangent.y = twy; out->tangent.z = twz;


    //UV
    out->uv = mesh->UV[index];
}



//PUBLIC API
void ClearBuffers(const Framebuffer* fb, Color col){
	_PROF_BEGIN("ClearBuffers");

    for(int y = 0; y < fb->height; ++y) {
        uint32_t* crow = fb->color + (y * fb->color_pitch);
        float*    zrow = fb->depth + (y * fb->depth_pitch);

        for(int x = 0; x < fb->width; ++x) {
            crow[x] = col.bgra;
            zrow[x] = 1.0f;
        }
    }

    _PROF_END("ClearBuffers");
}






#define CACHED_VBO			// FLAT_VBO  INDEXED_VBO  CACHED_VBO  HW_VBO

#ifdef CACHED_VBO
#include <stdlib.h>
typedef struct __attribute__((aligned(64))) {
    uint32_t tag;     // vertex index stored here
    VSOut    out;     // cached VS output
} CacheEntry;

typedef struct {
    CacheEntry* entries;   // array of size numSets (power of two)
    uint32_t    mask;       // numSets-1
} Cache;


int cacheInit=0;
__attribute__((section(".ocm_bss"), aligned(64)))
static CacheEntry vtxCacheEntries[8];
__attribute__((section(".ocm_bss"), aligned(64)))
Cache vtxCache;

static inline void Cache_Init(Cache* c, size_t entriesNum){
    //c->entries = aligned_alloc(64, sizeof(CacheEntry)*entriesNum);
    //memset(c->entries, 0, sizeof(CacheEntry)*entriesNum);
	c->entries = vtxCacheEntries;

    c->mask = (uint32_t)(entriesNum - 1);
}

static inline void Cache_Invalidate(Cache* c){
    size_t num = c->mask + 1;
    for (size_t i = 0; i < num; ++i)
      	c->entries[i].tag = -1;
}

// simple direct-mapped index -> set
#define SET_FROM_IDX(cache, idx) ((idx) & (cache)->mask)

static inline const VSOut* Cache_Get(Cache* __restrict c,  const Mesh* __restrict mesh, uint32_t idx, const Mat4* __restrict mvp, const Mat4* __restrict model){
    uint32_t set = SET_FROM_IDX(c, idx);
    CacheEntry* entry = &c->entries[set];

    __builtin_prefetch(entry);
    if(entry->tag == idx){
    	//hit+=1;
        return &entry->out;
    }

    // miss: compute and overwrite
    //miss+=1;
    VertexProcessor(&entry->out, mesh, idx, mvp, model);
    entry->tag = idx;
    return &entry->out;
}
#endif



#ifdef HW_VBO
int VTUInit=0;

float   pBuffer[500000] __attribute__((aligned(64)));   // clip-space pos
float  wpBuffer[500000] __attribute__((aligned(64)));   // world-space pos
float   nBuffer[500000] __attribute__((aligned(64)));   // normals
float   tBuffer[500000] __attribute__((aligned(64)));   // tangents

#endif








void DrawMesh(const Framebuffer* fb, const Mesh* mesh, Vec3 pos, Vec3 rot, Vec3 scale, Camera* cam, Texture* diffuseTex, Texture* normalTex, Color col){
    _PROF_BEGIN("DrawMesh");

	//Model Matrix S*R*T
    Mat4 model = mat4_identity();
    model = mat4_mul(model, mat4_scaling(scale.x, scale.y, scale.z));
    model = mat4_mul(model, mat4_rotationZ(deg2radf(rot.z)));
    model = mat4_mul(model, mat4_rotationY(deg2radf(rot.y)));
    model = mat4_mul(model, mat4_rotationX(deg2radf(rot.x)));
    model = mat4_mul(model, mat4_translation(pos.x, pos.y, pos.z));

    // View + projection matrix
    Mat4 view = cam->viewMatrix;
    Mat4 proj = cam->projMatrix;
    Mat4 mvp = mat4_mul( mat4_mul(model, view), proj);

    //Normal matrix = inverse-transpose of upper-left 3×3
    //Mat4 N = mat3_inverse(mat3_transpose(mat4_toMat3(model)));

    _PROF_BEGIN("VertexProcessor");
#ifdef FLAT_VBO
    for(size_t i = 0; i < mesh->vertexCount; i+=3) {
    	__builtin_prefetch(&mesh->Pos[i+48]);
    	__builtin_prefetch(&mesh->Normal[i+48]);
        __builtin_prefetch(&mesh->Tangent[i+48]);
    	__builtin_prefetch(&mesh->UV[i+48]);

    	VSOut out0, out1, out2;
        VertexProcessor(&out0, mesh, i,   &mvp, &model);
        VertexProcessor(&out1, mesh, i+1, &mvp, &model);
        VertexProcessor(&out2, mesh, i+2, &mvp, &model);


        if(isBackface(out0.pos, out1.pos, out2.pos)) continue;          //BACKFACE CULL
        //if(triangleCullCheck(out0.pos, out1.pos, out2.pos)) continue;   //TRIANGLE CULL
        //TRIANGLE CLIP
        //VSOut clipped[8][3];
        //int nTris = ClipTriangleToFrustum(&out0, &out1, &out2, clipped);
        //for (int t = 0; t < nTris; ++t)
        //    RasterizeTriangle(fb, &clipped[t][0], &clipped[t][1], &clipped[t][2], diffuseTex, normalTex, cam->pos, col);

        RasterizeTriangle(fb, &out0, &out1, &out2,   diffuseTex, normalTex, cam->pos, col);
    }
#endif

#ifdef INDEXED_VBO
    for(size_t t = 0; t < mesh->indexCount; t += 3) {
    	//__builtin_prefetch(&mesh->Indices[t + 24]); // pull indices ahead
    	uint32_t i0 = mesh->Indices[t];
    	uint32_t i1 = mesh->Indices[t+1];
        uint32_t i2 = mesh->Indices[t+2];

    	VSOut out0, out1, out2;
    	VertexProcessor(&out0, mesh, i0, &mvp, &model);
    	VertexProcessor(&out1, mesh, i1, &mvp, &model);
        VertexProcessor(&out2, mesh, i2, &mvp, &model);


    	if(isBackface(out0.pos, out1.pos, out2.pos)) continue;          //BACKFACE CULL
    	//if(triangleCullCheck(out0.pos, out1.pos, out2.pos)) continue;   //TRIANGLE CULL
        //TRIANGLE CLIP
        //VSOut clipped[8][3];
        //int nTris = ClipTriangleToFrustum(&out0, &out1, &out2, clipped);
        //for (int t = 0; t < nTris; ++t)
        //    RasterizeTriangle(fb, &clipped[t][0], &clipped[t][1], &clipped[t][2], diffuseTex, normalTex, cam->pos, col);

         RasterizeTriangle(fb, &out0, &out1, &out2,   diffuseTex, normalTex, cam->pos, col);
    }
#endif

#ifdef CACHED_VBO
    if(cacheInit==0)
        Cache_Init(&vtxCache, 8);
    Cache_Invalidate(&vtxCache);

    for(size_t t = 0; t < mesh->indexCount; t += 3) {
    	//CACHED
        __builtin_prefetch(&mesh->Indices[t + 24]); // pull indices ahead
        uint32_t i0 = mesh->Indices[t];
        uint32_t i1 = mesh->Indices[t+1];
        uint32_t i2 = mesh->Indices[t+2];

        // optionally prefetch the cache lines you’ll hit
        __builtin_prefetch(&vtxCache.entries[SET_FROM_IDX(&vtxCache, i0)]);
        __builtin_prefetch(&vtxCache.entries[SET_FROM_IDX(&vtxCache, i1)]);
        __builtin_prefetch(&vtxCache.entries[SET_FROM_IDX(&vtxCache, i2)]);

        const VSOut out0 = *Cache_Get(&vtxCache, mesh, i0, &mvp, &model);
        const VSOut out1 = *Cache_Get(&vtxCache, mesh, i1, &mvp, &model);
        const VSOut out2 = *Cache_Get(&vtxCache, mesh, i2, &mvp, &model);

        if(isBackface(out0.pos, out1.pos, out2.pos)) continue;          //BACKFACE CULL

        RasterizeTriangle(fb, &out0, &out1, &out2, diffuseTex, normalTex, cam->pos, col);
    }
#endif

#ifdef HW_VBO
    if(VTUInit==0){
    	VTUInit=1;
    	int res = VTU_Init();
    	if(res!=0)
    		xil_printf("ERROR: VTU initialization failed!   ERROR CODE: %d \n", res);
    }

    fixed32 mvp_fixed32[16], model_fixed32[16];
    int idx = 0;
    for(int r = 0; r < 4; ++r){
        for (int c = 0; c < 4; ++c){
        	mvp_fixed32[idx] = float_to_fixed32( mvp.m[c][r] );
        	model_fixed32[idx] = float_to_fixed32( model.m[c][r] );
        	idx++;
    }   }



    VTU_SetMatrix(mvp_fixed32);
    VTU_DispatchStream(mesh->VTU_posBuffer, pBuffer,  mesh->vertexCount*16);

    VTU_SetMatrix(model_fixed32);
    VTU_DispatchStream(mesh->VTU_posBuffer, wpBuffer, mesh->vertexCount*16);
    VTU_DispatchStream(mesh->VTU_nrmBuffer, nBuffer,  mesh->vertexCount*16);
    VTU_DispatchStream(mesh->VTU_tanBuffer, tBuffer,  mesh->vertexCount*16);


    // Consume HW-transformed positions from pBuffer and rasterize
    /*for(size_t t = 0; t < mesh->indexCount; t += 3) {
    	uint32_t i0 = mesh->Indices[t];
    	uint32_t i1 = mesh->Indices[t+1];
    	uint32_t i2 = mesh->Indices[t+2];

    }*/
#endif


    _PROF_END("VertexProcessor");
    _PROF_END("DrawMesh");
}



