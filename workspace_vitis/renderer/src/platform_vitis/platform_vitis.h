#pragma once
#include <stdint.h>
#include <stdbool.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xtime_l.h"

#include "../zybo_z7_hdmi/display_ctrl.h"
#include "../zybo_z7_hdmi/vga_modes.h"

#include "xil_types.h"
#include "xuartps.h"

// data about size of monitors
#define sizeType1280x720() (&VMODE_1280x720)


typedef struct Platform {
    DisplayCtrl dispCtrl;
    XUartPs uart;
    bool running;

    u32* frame;
    int size_frame_bytes;

    //timer
    XTime freq_frame;
    XTime prev_frame;    

    uint8_t keys[256];              //pressed
    // uint8_t keys_pressed[256];   //down once // we cannot have that checks. only if it pressed
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
/*  on this project they do nothing. */
void  Platform_Shutdown(Platform* plat);


//INPUT
static inline int IsKeyPressed(const Platform* p, uint8_t vk){
    return p->keys[vk] != 0;
}
static inline int IsKeyDown(const Platform* p, uint8_t vk){
    return false;
}
static inline int IsKeyUp(const Platform* p, uint8_t vk){
    return false; 
}

