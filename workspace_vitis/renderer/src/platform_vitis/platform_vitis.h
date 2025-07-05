#pragma once
#include <stdint.h>
#include <stdbool.h>
#include "xil_types.h"
#include "xil_cache.h"

#include "../zybo_z7_hdmi/display_ctrl.h"
#include "../zybo_z7_hdmi/vga_modes.h"

#include "xil_types.h"


typedef struct Platform {
    u32 width, height;
    DisplayCtrl dispCtrl;
    bool running;

    u32* frame;
    int size_frame_bytes;
    // LARGE_INTEGER freq;   //timer
    // LARGE_INTEGER prev;    


    // uint8_t keys[256];           //pressed
    // uint8_t keys_pressed[256];   //down once
    // uint8_t keys_released[256];  //up once

} Platform;

/*  Initialise window, back-buffer, high-res timer. */
bool Platform_Init(Platform* plat, const void* size);
/*  Non-blocking message pump; sets plat->running = false on WM_QUIT. */
void  Platform_PumpEvents(Platform* plat);
/*  Seconds elapsed since last call. */
float Platform_GetDeltaTime(Platform* plat);
/*  Copy src RGBA32 buffer (w×h) into the DIBSection & schedule WM_PAINT. */
void  Platform_BlitBuffer(Platform* plat, const uint32_t* src);
/*  Free GDI objects and restore timer granularity. */
void  Platform_Shutdown(Platform* plat);


//INPUT
// static inline int IsKeyPressed(const Platform* p, uint8_t vk){
//     return p->keys[vk] != 0;
// }
// static inline int IsKeyDown(const Platform* p, uint8_t vk){
//     return p->keys_pressed[vk] != 0;
// }
// static inline int IsKeyUp(const Platform* p, uint8_t vk){
//     return p->keys_released[vk] != 0;
// }

// Size types
// const void* sizeType1280x720(){
//     return &VMODE_1280x720;
// }

// added only for vitis project
// if you want you can set your size from vga_modules header