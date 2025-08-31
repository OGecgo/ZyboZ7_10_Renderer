/* Tiny vector/matrix library.
*/


#pragma once
#include <math.h>
#include <float.h>

//helpers
#define VEC_MATH_EPS 1.0e-6f
static const float  PI_F = (float)0x1.921fb54442d18p+1L;
static const float  DEG2RAD_F = (float)0x1.921fb54442d18p+1L / 180.0;
static inline float  deg2radf(float  deg) { return deg * (PI_F / 180.0f); }
static inline float  rad2degf(float  rad) { return rad * (180.0f / PI_F); }




// -------------------------- Vector2 -------------------------------
typedef struct { float x, y; } Vec2;

static inline Vec2  vec2(float x, float y)                { Vec2 v = {x, y}; return v; }
static inline Vec2  vec2_add    (Vec2 a, Vec2 b)          { return vec2(a.x + b.x, a.y + b.y); }
static inline Vec2  vec2_add3   (Vec2 a, Vec2 b, Vec2 c)  { return vec2(a.x + b.x + c.x, a.y + b.y + c.y); }
static inline Vec2  vec2_sub    (Vec2 a, Vec2 b)          { return vec2(a.x - b.x, a.y - b.y); }
static inline Vec2  vec2_scale  (Vec2 v, float s)         { return vec2(v.x * s, v.y * s); }
static inline Vec2  vec2_div    (Vec2 v, float s)         { return vec2(v.x / s, v.y / s); }
static inline Vec2  vec2_mul    (Vec2 v1,Vec2 v2)         { return vec2(v1.x * v2.x, v1.y * v2.y); }
static inline float vec2_dot    (Vec2 a, Vec2 b)          { return a.x * b.x + a.y * b.y; }
static inline float vec2_len_sq (Vec2 v)                  { return vec2_dot(v, v); }
static inline float vec2_len    (Vec2 v)                  { return sqrtf(vec2_len_sq(v)); }
static inline Vec2  vec2_norm   (Vec2 v)                  { float l = vec2_len(v); return (l < VEC_MATH_EPS) ? v : vec2_div(v, l); }
static inline Vec2  vec2_lerp   (Vec2 a, Vec2 b, float t) { return vec2(a.x + t * (b.x - a.x), a.y + t * (b.y - a.y)); }



// -------------------------- Vector3 -------------------------------
typedef struct { float x, y, z; } Vec3;

static inline Vec3 vec3(float x, float y, float z)        { Vec3 v = {x, y, z}; return v; }
static inline Vec3 vec3s(float x)                         { Vec3 v = { x, x, x }; return v; }
static inline Vec3 vec3_add     (Vec3 a, Vec3 b)          { return vec3(a.x + b.x, a.y + b.y, a.z + b.z); }
static inline Vec3 vec3_add3    (Vec3 a, Vec3 b, Vec3 c)  { return vec3(a.x + b.x + c.x, a.y + b.y + c.y, a.z + b.z + c.z); }
static inline Vec3 vec3_sub     (Vec3 a, Vec3 b)          { return vec3(a.x - b.x, a.y - b.y, a.z - b.z); }
static inline Vec3 vec3_scale   (Vec3 v, float s)         { return vec3(v.x * s, v.y * s, v.z * s); }
static inline Vec3 vec3_div     (Vec3 v, float s)         { return vec3(v.x / s, v.y / s, v.z / s); }
static inline Vec3 vec3_mul     (Vec3 v1, Vec3 v2)        { return vec3(v1.x * v2.x, v1.y * v2.y, v1.z * v2.z); }
static inline float vec3_dot    (Vec3 a, Vec3 b)          { return a.x*b.x + a.y*b.y + a.z*b.z; }
static inline float vec3_len_sq (Vec3 v)                  { return vec3_dot(v, v); }
static inline float vec3_len    (Vec3 v)                  { return sqrtf(vec3_len_sq(v)); }
static inline Vec3 vec3_norm    (Vec3 v)                  { float l = vec3_len(v); return (l < VEC_MATH_EPS) ? v : vec3_div(v, l); }
static inline Vec3 vec3_cross   (Vec3 a, Vec3 b)          { return vec3( a.y*b.z - a.z*b.y,   a.z*b.x - a.x*b.z,  a.x*b.y - a.y*b.x ); }
static inline Vec3 vec3_lerp    (Vec3 a, Vec3 b, float t) { return vec3( a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t, a.z + (b.z - a.z) * t);}



// -------------------------- Vector4 -------------------------------
typedef struct { float x, y, z, w; } Vec4;
static inline Vec4 vec3_toVec4(Vec3 v, float w) { Vec4 v2 = { v.x, v.y, v.z, w}; return v2; }
static inline Vec3 vec4_toVec3(Vec4 v) { Vec3 v2 = { v.x, v.y, v.z }; return v2; }

static inline Vec4 vec4(float x, float y, float z, float w) { Vec4 v = { x, y, z, w }; return v; }
static inline Vec4 vec4_add     (Vec4 a, Vec4 b)            { return vec4(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w); }
static inline Vec4 vec4_add3    (Vec4 a, Vec4 b, Vec4 c)    { return vec4(a.x + b.x + c.x, a.y + b.y + c.y, a.z + b.z + c.z, a.w +b.w +c.w); }
static inline Vec4 vec4_scale   (Vec4 v, float s)           { return vec4(v.x * s, v.y * s, v.z * s, v.w * s); }
static inline Vec4 vec4_lerp    (Vec4 a, Vec4 b, float t){
    Vec4 r;
    r.x = a.x + t * (b.x - a.x);
    r.y = a.y + t * (b.y - a.y);
    r.z = a.z + t * (b.z - a.z);
    r.w = a.w + t * (b.w - a.w);
    return r;
}



// ------------------------ Int vectors -----------------------------
typedef struct { int x, y; } IntVec2;
typedef struct { int x, y, z; } IntVec3;
typedef struct { int x, y, z, w; } IntVec4;




// matrix4×4  ROW-MAJOR  [Y][X]
typedef struct { float m[4][4]; } Mat4;

static inline Mat4 mat4_zero(void) { Mat4 r = {0}; return r; }
static inline Mat4 mat4_identity(void){
    Mat4 R = {0};
    for(int i=0;i<4;++i) R.m[i][i] = 1.0f;
    return R;
}

static inline Mat4 mat4_add(Mat4 A, Mat4 B){
    Mat4 R;
    for (int r = 0; r < 4; ++r)
        for (int c = 0; c < 4; ++c)
            R.m[r][c] = A.m[r][c] + B.m[r][c];
    return R;

}
static inline Mat4 mat4_sub(Mat4 A, Mat4 B){
    Mat4 R;
    for(int r=0; r<4; ++r)
        for (int c=0; c<4; ++c)
            R.m[r][c] = A.m[r][c] - B.m[r][c];
    return R;
}
static inline Mat4 mat4_mul(Mat4 A, Mat4 B){
    Mat4 R = {0};
    for (int j = 0; j < 4; ++j)
        for (int i = 0; i < 4; ++i)
            for (int k = 0; k < 4; ++k)
                R.m[j][i] += A.m[j][k] * B.m[k][i];
    return R;

}
static inline Vec4 mat4_mulVec(Vec4 v, Mat4 M){
    return (Vec4){
        v.x * M.m[0][0] + v.y * M.m[1][0] + v.z * M.m[2][0] + v.w * M.m[3][0],
        v.x * M.m[0][1] + v.y * M.m[1][1] + v.z * M.m[2][1] + v.w * M.m[3][1],
        v.x * M.m[0][2] + v.y * M.m[1][2] + v.z * M.m[2][2] + v.w * M.m[3][2],
        v.x * M.m[0][3] + v.y * M.m[1][3] + v.z * M.m[2][3] + v.w * M.m[3][3]
    };
}
static inline Mat4 mat4_transpose(Mat4 M){
    Mat4 R;
    for (int j = 0; j < 4; ++j)
        for (int i = 0; i < 4; ++i)
            R.m[j][i] = M.m[i][j];
    return R;
}


//Special case MULs
static inline Vec4 mat4_mulVec3_w1(Vec3 v, Mat4 M){
    return (Vec4){
        v.x * M.m[0][0] + v.y * M.m[1][0] + v.z * M.m[2][0] +  M.m[3][0],
        v.x * M.m[0][1] + v.y * M.m[1][1] + v.z * M.m[2][1] +  M.m[3][1],
        v.x * M.m[0][2] + v.y * M.m[1][2] + v.z * M.m[2][2] +  M.m[3][2],
        v.x * M.m[0][3] + v.y * M.m[1][3] + v.z * M.m[2][3] +  M.m[3][3]
    };
}
static inline Vec3 mat4_mulVec3_w0(Vec3 p, Mat4 M) {
    return (Vec3){
        p.x*M.m[0][0] + p.y*M.m[1][0] + p.z*M.m[2][0],
        p.x*M.m[0][1] + p.y*M.m[1][1] + p.z*M.m[2][1],
        p.x*M.m[0][2] + p.y*M.m[1][2] + p.z*M.m[2][2]
    };
}



//TRANSFORM MATRICES
static inline Mat4 mat4_scaling(float sx, float sy, float sz) {
    Mat4 r = {0};
    r.m[0][0] = sx; r.m[1][1] = sy; r.m[2][2] = sz; r.m[3][3] = 1.0f;
    return r;
}
static inline Mat4 mat4_translation(float x,float y,float z){
    Mat4 r = mat4_identity();
    r.m[3][0] = x; r.m[3][1] = y; r.m[3][2] = z;
    return r;
}
static inline Mat4 mat4_rotationX(float rad){
    float c = cosf(rad), s = sinf(rad);
    Mat4 r = mat4_identity();
    r.m[1][1]= c;  r.m[1][2]= s;
    r.m[2][1]=-s;  r.m[2][2]= c;
    return r;
}
static inline Mat4 mat4_rotationY(float rad){
    float c = cosf(rad), s = sinf(rad);
    Mat4 r = mat4_identity();
    r.m[0][0]= c;  r.m[0][2]=-s;
    r.m[2][0]= s;  r.m[2][2]= c;
    return r;
}
static inline Mat4 mat4_rotationZ(float rad){
    float c = cosf(rad), s = sinf(rad);
    Mat4 r = mat4_identity();
    r.m[0][0]= c;  r.m[0][1]= s;
    r.m[1][0]=-s;  r.m[1][1]= c;
    return r;
}



/* View matrix.
 * Parameters:
 *   eye   : camera position
 *   pitch : rotation about +X (radians).
 *   yaw   : rotation about +Y (radians).
 *
 * Result:
 *   Transforms world space into camera space where camera forward is +Z.
 */
static inline Mat4 mat4_viewMatrix(Vec3 eye, float pitch, float yaw){
    float cosPitch = cosf(pitch);
    float sinPitch = sinf(pitch);
    float cosYaw   = cosf(yaw);
    float sinYaw   = sinf(yaw);

    Vec3 xaxis = { cosYaw, 0, -sinYaw };
    Vec3 yaxis = { sinYaw * sinPitch, cosPitch, cosYaw * sinPitch };
    Vec3 zaxis = { sinYaw * cosPitch, -sinPitch, cosPitch * cosYaw };


    Mat4 V = {0};
    V.m[0][0] = xaxis.x;  V.m[0][1] = yaxis.x;  V.m[0][2] = zaxis.x;  
    V.m[1][0] = xaxis.y;  V.m[1][1] = yaxis.y;  V.m[1][2] = zaxis.y;
    V.m[2][0] = xaxis.z;  V.m[2][1] = yaxis.z;  V.m[2][2] = zaxis.z;
    V.m[3][0] = -vec3_dot(xaxis, eye);  V.m[3][1] = -vec3_dot(yaxis, eye);  V.m[3][2] = -vec3_dot(zaxis, eye);      V.m[3][3] = 1;
    return V;
}

static inline Mat4 mat4_perspective(float fov_rad, float aspect, float zNear, float zFar){
    float f = 1.0f / tanf(0.5f * fov_rad);   // cotangent       

    Mat4 P = {0};
    P.m[0][0] = f / aspect;
    P.m[1][1] = f;
    P.m[2][2] = zFar / (zFar - zNear);
    P.m[2][3] = 1.0f;
    P.m[3][2] = -zNear * zFar / (zFar - zNear);

    return P;
}

