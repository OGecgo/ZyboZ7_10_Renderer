#pragma once
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

typedef struct {
    uint32_t *color;   // pointer to first pixel RGBA8
    float    *depth;   // pointer to first depth value
    int       width, height;
    int       color_pitch;  // elements per row
    int       depth_pitch;  // elements per row
} Framebuffer;

typedef struct Display Display;		// Encapsulated Display Struct




// Create/initialize display system (allocates color and z buffers)
Display* Display_Create(int width, int height);
void Display_Destroy(Display *disp);


// Acquire a back buffer for this frame. Valid until next Acquire
Framebuffer Display_AcquireFrame(Display *disp);

// Present current frame to HDMI (flush color, swap, vsync)
void Display_Present(Display *disp, const Framebuffer *fBuf);

void Display_GetResolution(const Display* disp, int* outW, int* outH);

