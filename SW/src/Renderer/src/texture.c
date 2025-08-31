/* Copyright (C) 2025, Evangelos Kolovos
 * This library is distributed under the MIT License.
 *
 * ---------- Texture -------------
 * Converts an uncompressed 24-bpp BMP into In-memory 2D texture
 * with optional mip chain and sampling helpers.
 */



#include "texture.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#include "ff.h"
#define TEX_POW2 1      //Power of 2 texture optimization  (Ensure textures are Power of 2)

static inline int clamp(int x, int min, int max) {
    if (x < min) return min;
    if (x > max) return max;
    return x;
}
static inline Color avg4(Color c0, Color c1, Color c2, Color c3) {
    uint8_t b = (c0.ch.b + c1.ch.b + c2.ch.b + c3.ch.b + 2) >> 2;
    uint8_t g = (c0.ch.g + c1.ch.g + c2.ch.g + c3.ch.g + 2) >> 2;
    uint8_t r = (c0.ch.r + c1.ch.r + c2.ch.r + c3.ch.r + 2) >> 2;
    uint8_t a = (c0.ch.a + c1.ch.a + c2.ch.a + c3.ch.a + 2) >> 2;
    return color_rgba(r, g, b, a);
}



//PUBLIC API
Texture* TextureLoad(const char* filename, int buildMipChain) {
	//read and validate 54 byte BMP header
	FIL fil;
	FRESULT fres = f_open(&fil, filename, FA_READ);
	if(fres != FR_OK) return NULL;

	UINT br;	//bytes read
	uint8_t header[54];
	if(f_read(&fil, header, 54, &br) || br != 54) { f_close(&fil); return NULL; }
	if(header[0] != 'B' || header[1] != 'M')      { f_close(&fil); return NULL; }

	int32_t  width  = *(int32_t*)&header[18];
	int32_t  height = *(int32_t*)&header[22];
	int16_t  bpp    = *(int16_t*)&header[28];
	uint32_t offset = *(uint32_t*)&header[10];

	if (width <= 0 || height <= 0 || bpp != 24)    { f_close(&fil); return NULL; }



	// allocate texture struct and pixel buffer
	Texture* tex = calloc(1, sizeof(Texture));
	if(!tex) { f_close(&fil); return NULL; }

	tex->width  = width;
	tex->height = height;
	tex->pixels = (Color*)malloc(sizeof(Color) * width * height);
	if(!tex->pixels) { free(tex); f_close(&fil); return NULL; }

	// seek to pixel data
	if(f_lseek(&fil, offset)) { free(tex->pixels); free(tex); f_close(&fil); return NULL; }

	const int row_padded = (width * 3 + 3) & ~3;
	uint8_t*  row = malloc(row_padded);
	if (!row) { free(tex->pixels); free(tex); f_close(&fil); return NULL; }


	// stream rows
	for (int y = 0; y < height; ++y){
	    if (f_read(&fil, row, row_padded, &br) || br != (UINT)row_padded) {
	        free(row); free(tex->pixels); free(tex); f_close(&fil); return NULL;
	    }

	    int dst_y = y; //height - 1 - y;	// Flip BMP rows to top-down
	    Color* dst = tex->pixels + dst_y * width;
	    for (int x = 0; x < width; ++x) {
	        dst[x].ch.b = row[x*3 + 0];
	        dst[x].ch.g = row[x*3 + 1];
	        dst[x].ch.r = row[x*3 + 2];
	        dst[x].ch.a = 255;
	    }
	}
	free(row);
	f_close(&fil);


    if (buildMipChain)
        Texture_BuildMipChain(tex);
    

    printf("Loaded BMP: %dx%d, %d bpp, offset %u\n", width, height, bpp, offset);
    return tex;
}

void Texture_BuildMipChain(Texture* baseTex){
    if (!baseTex || baseTex->mips || baseTex->width < 2 || baseTex->height < 2)
        return;

    /* ---- calculate #levels : floor(log2(max(w,h))) + 1 ------------- */
    uint32_t w = baseTex->width, h = baseTex->height;
    uint8_t levels = 1;
    while (w > 1 || h > 1) {
        w = w > 1 ? w >> 1 : 1;
        h = h > 1 ? h >> 1 : 1;
        ++levels;
    }
    baseTex->levels = levels;

    /* ---- allocate array of Texture structs (levels-1 extra) -------- */
    baseTex->mips = (Texture *)calloc(levels - 1, sizeof(Texture));
    if (!baseTex->mips) { baseTex->levels = 1; return; }

    /* ---- generate each level -------------------------------------- */
    const Texture *src = baseTex;
    for (uint8_t lv = 1; lv < levels; ++lv) {
        Texture *dst = &baseTex->mips[lv - 1];
        dst->width  = src->width  > 1 ? src->width  >> 1 : 1;
        dst->height = src->height > 1 ? src->height >> 1 : 1;
        dst->levels = 1;        /* a mip itself has no sub-mips */
        const size_t numPx = (size_t)dst->width * dst->height;
        dst->pixels = (Color *)malloc(numPx * sizeof(Color));
        if (!dst->pixels) { Texture_FreeMipChain(baseTex); return; }

        /* 2×2 box filter */
        for (uint32_t y = 0; y < dst->height; ++y) {
            for (uint32_t x = 0; x < dst->width; ++x) {
                uint32_t sx = x << 1, sy = y << 1;   /* source coords   */
                Color c00 = src->pixels[ (sy    ) * src->width + (sx    ) ];
                Color c10 = src->pixels[ (sy    ) * src->width + (sx + 1 < src->width ? sx + 1 : sx) ];
                Color c01 = src->pixels[ (sy + 1 < src->height ? sy + 1 : sy) * src->width + (sx    ) ];
                Color c11 = src->pixels[ (sy + 1 < src->height ? sy + 1 : sy) * src->width + (sx + 1 < src->width ? sx + 1 : sx) ];
                dst->pixels[y * dst->width + x] = avg4(c00, c10, c01, c11);
            }
        }
        src = dst;     // next source is this level
    }
}

void Texture_FreeMipChain(Texture* baseTex){
    if(!baseTex || !baseTex->mips) return;

    for(int i=0; i<baseTex->levels-1; ++i)
        free(baseTex->mips[i].pixels);

    free(baseTex->mips);
    baseTex->mips = NULL;
    baseTex->levels = 1;
}
void TextureFree(Texture* tex){
    if (!tex) return;

    free(tex->pixels);
    Texture_FreeMipChain(tex);
    free(tex);
}



// SAMPLERS
Vec3 Sample2D(const Texture* tex, float u, float v) {
    u -= floorf(u);  // Wrap UVs into [0,1]
    v -= floorf(v);
    int x = clamp( (int)(u * tex->width), 0, tex->width - 1);
    int y = clamp( (int)(v * tex->height), 0, tex->height - 1);

    Color c = tex->pixels[y * tex->width + x];
    return color_toVec(c);
}



// Per-channel lerp with 8-bit fixed-point weight t in [0..256]
static inline uint32_t lerp_u32_8(uint32_t a, uint32_t b, int t){
    uint32_t rb  =  (a & 0x00FF00FFu),   rb2 =  (b & 0x00FF00FFu);
    uint32_t ga  = ((a >> 8) & 0x00FF00FFu), ga2 = ((b >> 8) & 0x00FF00FFu);
    uint32_t rbm = ((rb*(256 - t)) + (rb2*t)) >> 8;
    uint32_t gam = ((ga*(256 - t)) + (ga2*t)) >> 8;
    return (rbm & 0x00FF00FFu) | ((gam & 0x00FF00FFu) << 8);
}

static inline Vec3 bgra8_to_vec3(uint32_t px){
    const float inv255 = 1.0f/255.0f;
    float b = (float)( px        & 0xFFu) * inv255;
    float g = (float)((px >> 8 ) & 0xFFu) * inv255;
    float r = (float)((px >> 16) & 0xFFu) * inv255;
    return vec3(r,g,b);
}

Vec3 Sample2DBilinear(const Texture *tex, float u, float v){
    u -= floorf(u); v -= floorf(v);                 // wrap

    // Map to texel space
    float fx = u * tex->width  - 0.5f;
    float fy = v * tex->height - 0.5f;

    int x0 = (int)floorf(fx), y0 = (int)floorf(fy);
    int x1 = x0 + 1,          y1 = y0 + 1;

    // Fixed-point frac weights (0-256)
    int wx = (int)((fx - (float)x0) * 256.0f + 0.5f);
    int wy = (int)((fy - (float)y0) * 256.0f + 0.5f);

#if TEX_POW2
    x0 &= tex->width  - 1; x1 &= tex->width  - 1;
    y0 &= tex->height - 1; y1 &= tex->height - 1;
#else
    // Clamp
    if (x0 < 0) x0 = 0; if (y0 < 0) y0 = 0;
    if (x1 >= tex->width)  x1 = tex->width  - 1;
    if (y1 >= tex->height) y1 = tex->height - 1;
#endif

    const uint32_t* row0 = &tex->pixels[y0 * tex->width].bgra;
    const uint32_t* row1 = &tex->pixels[y1 * tex->width].bgra;

    uint32_t c00 = row0[x0], c10 = row0[x1];
    uint32_t c01 = row1[x0], c11 = row1[x1];

    uint32_t c0 = lerp_u32_8(c00, c10, wx);
    uint32_t c1 = lerp_u32_8(c01, c11, wx);
    uint32_t c  = lerp_u32_8(c0,  c1,  wy);

    return bgra8_to_vec3(c);
}


Vec3 Sample2DTrilinear(const Texture* tex, float u, float v, float lod){
    if (lod <= 0.0f || tex->levels == 1)
        return Sample2DBilinear(tex, u, v);


    int  low = (int)lod;
    float t  = lod - low;
    if (low >= tex->levels - 1) //check if lod out of mip bounds
        low = tex->levels - 2, t = 1.0f;

    const Texture *tex0 = (low == 0) ? tex : &tex->mips[low - 1];
    const Texture *tex1 = &tex->mips[low];

    Vec3 c0 = Sample2DBilinear(tex0, u, v);
    Vec3 c1 = Sample2DBilinear(tex1, u, v);
    return vec3_lerp(c0, c1, t);
}
