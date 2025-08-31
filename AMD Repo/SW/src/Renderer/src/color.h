#pragma once
#include <stdint.h>
#include <math.h>
#include "vector.h"


typedef union {
    struct { uint8_t b, g, r, a; } ch;
    uint32_t bgra;
} Color;


static inline Color color_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a) {
    Color c;
    c.bgra = ((uint32_t)a << 24) | ((uint32_t)r << 16) | ((uint32_t)g << 8) | (uint32_t)b;
    return c;
}

static inline Color color_rgb(uint8_t r, uint8_t g, uint8_t b) {
    Color c;
    c.bgra = (255u << 24) | ((uint32_t)r << 16) | ((uint32_t)g << 8) | (uint32_t)b;
    return c;
}



// Maps [0,1] to [0,255] with saturation.
static inline uint8_t float_to_u8_sat(float x) {
    x = x * 255.0f + 0.5f;               // scale and round
    x = fminf(fmaxf(x, 0.0f), 255.0f);   // clamp
    return (uint8_t)x;                   // truncate
}


static inline Color color_fromVec(Vec3 v) {
    uint32_t r = float_to_u8_sat(v.x);
    uint32_t g = float_to_u8_sat(v.y);
    uint32_t b = float_to_u8_sat(v.z);

    Color c;
    c.bgra = (255u << 24) | (r << 16) | (g << 8) | b;
    return c;
}


static inline Vec3 color_toVec(Color c) {
    const float INV_255 = 1.0f / 255.0f;
    return vec3(c.ch.r * INV_255, c.ch.g * INV_255, c.ch.b * INV_255);
}

