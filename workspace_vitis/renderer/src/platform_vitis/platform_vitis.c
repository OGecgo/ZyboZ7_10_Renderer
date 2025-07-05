#include "platform_vitis.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "xparameters.h"
#include "xstatus.h"


//PUBLIC API
bool Platform_Init(Platform *p, const void* size){
    if (!p) return false;
    int width  = ((VideoMode *)size)->width;
    p->size_frame_bytes = width * ((VideoMode *)size)->height * sizeof(u32);
    
    // static u32 frameBuf[DISPLAY_NUM_FRAMES][1280*720] __attribute__((aligned(0x20)));
    static void *pFrames[DISPLAY_NUM_FRAMES];
    for (int i = 0; i < DISPLAY_NUM_FRAMES; i++) {
        pFrames[i] = aligned_alloc(0x20, p->size_frame_bytes);
    }
    
    
    // initialize display control
    if (DisplayInitialize(&p->dispCtrl, XPAR_AXIVDMA_0_DEVICE_ID, XPAR_VTC_0_DEVICE_ID, XPAR_HDMI_AXI_DYNCLK_0_BASEADDR, pFrames, width*sizeof(u32)) != XST_SUCCESS) {
        printf("Failed to initialize display\n");
        return false;
    }

	// Start with the first frame buffer (of two)
	if (DisplayChangeFrame(&p->dispCtrl, 0) != XST_SUCCESS) {
        printf("Failed to change frame\n");
        return false;
    }

    // set resolution
    if (DisplaySetMode(&p->dispCtrl, (VideoMode *)size) != XST_SUCCESS) {
        printf("Failed to set display mode\n");
        return false;
    }

	// Enable video output
	if (DisplayStart(&p->dispCtrl) != XST_SUCCESS) {
        printf("Failed to start display\n");
        return false;
    }

    // memset(p, 0, sizeof *p); den katalavenw giati ginete gia afto pros to paron comment
    printf("HDMI output enabled\n");
    printf("Current Resolution: %s\n", p->dispCtrl.vMode.label);
    printf("Pixel Clock Frequency: %.3fMHz\n", p->dispCtrl.pxlFreq);

    // initialize the keyboard conection
    XUartPs_Config* config = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
    if (config == NULL) {
        printf("Failed to lookupConfig");
        return false;
    }

    s32 Status = XUartPs_CfgInitialize(&p->uart, config, config->BaseAddress);
    if (Status != XST_SUCCESS) {
        printf("Failed initialize cfg");
        return false;
    }
    
    // Set baud rate to 115200
    XUartPs_SetBaudRate(&p->uart, 115200);

    // set times
    p->prev_frame = 0;
    XTime_GetTime(&p->freq_frame);


    // start run
    p->running = true;

    // 1‑ms sleep resolution for smoother pacing
    //timeBeginPeriod(1);
    return true;
}

void Platform_PumpEvents(Platform *p){
    //Clear Input events 
    memset(p->keys_pressed, 0, 256);
    memset(p->keys_released, 0, 256);

    // check event
    if(XUartPs_IsReceiveData(p->uart.Config.BaseAddress)){
        u8 keyCode = (u8)XUartPs_ReadReg(p->uart.Config.BaseAddress, XUARTPS_FIFO_OFFSET);
        if (p->keys[keyCode] == 0){
            p->keys_pressed[keyCode] = 1;  
        }
        p->keys[keyCode] = 1; 
    }else{
        // decides whether it will be a prestd or unpresd event
        memset(p->keys, 0, 256);
    }
    
}

float Platform_GetDeltaTime(Platform *p){
    p->prev_frame = p->freq_frame;
    XTime_GetTime(&p->freq_frame);
    
    // Convert to microseconds (assuming 333MHz timer)
    float dt = (float)(p->freq_frame - p->prev_frame) / (float)((XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / 1000000.0));
    return dt;
}

void Platform_BlitBuffer(Platform *p, const uint32_t *src){
    if (!p || !src) return;

    // Switch the frame we're modifying to be the back buffer (1 to 0, or 0 to 1)
    p->frame = (u32 *)p->dispCtrl.framePtr[!p->dispCtrl.curFrame];

    // //draw
	memcpy(p->frame, src, p->size_frame_bytes);

	// Flush everything out to DDR from the cache
	Xil_DCacheFlush();

	// Switch active frame to the back buffer (will take place during next vertical blanking period)
	DisplayChangeFrame(&p->dispCtrl, !p->dispCtrl.curFrame);

	// Wait for the frame to switch before continuing (so after current frame has been drawn)
	DisplayWaitForSync(&p->dispCtrl);
}   

void Platform_Shutdown(Platform *p){ // have not platform shutdown on board
    // DeleteObject(p->hBitmap);
    //timeEndPeriod(1);
}