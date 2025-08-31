#pragma once
#include <stdint.h>
#include <math.h>

#define FP_FRAC_BITS   16
#define FP_ONE         (1u << FP_FRAC_BITS)        // 0x00010000
#define FP_MIN_F       (-32768.0f)                 // lowest exactly representable integer
#define FP_MAX_F       (32767.9999847412109375f)   // 32767 + (65535/65536)

typedef int32_t fixed32;

static inline fixed32 float_to_fixed32(float x) {
    // clamp to avoid overflow
    if(x < FP_MIN_F) x = FP_MIN_F;
    if(x > FP_MAX_F) x = FP_MAX_F;
    // round-to-nearest
    long v = lrintf(x * (float)FP_ONE);
    return (fixed32)v;
}


static inline float fixed32_to_float(fixed32 x) {
    return (float)x / (float)FP_ONE;
}

