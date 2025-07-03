#include "platform_vitis.h"
#include <string.h>
#include <stdio.h>
#include "xparameters.h"
#include "xstatus.h"

// for now no input

// Platform* platRef;

// static LRESULT CALLBACK MainWndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp){
//     switch (msg) {
//     case WM_CREATE:
//         return 0;

//     case WM_PAINT: {
//         PAINTSTRUCT ps;
//         BeginPaint(hwnd, &ps);
//         if(platRef) {
//             HDC mem = CreateCompatibleDC(ps.hdc);
//             SelectObject(mem, platRef->hBitmap);
//             BitBlt(ps.hdc, 0, 0, platRef->width, platRef->height, mem, 0, 0, SRCCOPY);
//             DeleteDC(mem);
//         }
            
//         EndPaint(hwnd, &ps);
//         return 0; }


//     case WM_KEYDOWN:
//     case WM_SYSKEYDOWN: {
//         if (platRef) {
//             uint8_t keyCode = (uint8_t)wp;

//             //lParam bit 30 == 0  -> first physical press
//             if ((lp & (1 << 30)) == 0) {
//                 platRef->keys_pressed[keyCode] = 1;
//             }
//             platRef->keys[keyCode] = 1;
//         }
//         return 0;
//     }

//     case WM_KEYUP:
//     case WM_SYSKEYUP: {
//         if (platRef) {
//             uint8_t keyCode = (uint8_t)wp;

//             platRef->keys[keyCode] = 0;  
//             platRef->keys_released[keyCode] = 1;
//         }
//         return 0;
//     }



//     case WM_DESTROY:
//         if(platRef){
//             platRef->running = false;
//         }
//         return 0;
//     }
//     return DefWindowProcW(hwnd, msg, wp, lp);
// }




//PUBLIC API
bool Platform_Init(Platform *p, const void* size){
    if (!p) return false;

    // Initialize frame buffers properly - need static allocation for alignment
    static u32 frameBuf[DISPLAY_NUM_FRAMES][1280*720] __attribute__((aligned(0x20)));
    static void *pFrames[DISPLAY_NUM_FRAMES];
    static DisplayCtrl dispCtrl;
    
    // Initialize array of pointers to frame buffers
    for (int i = 0; i < DISPLAY_NUM_FRAMES; i++) {
        pFrames[i] = frameBuf[i];
    }
    
    p->dispCtrl = &dispCtrl;
    
    // initialize display control
    if (DisplayInitialize(p->dispCtrl, XPAR_AXIVDMA_0_DEVICE_ID, XPAR_VTC_0_DEVICE_ID, XPAR_HDMI_AXI_DYNCLK_0_BASEADDR, pFrames, ((VideoMode *)size)->width*4) != XST_SUCCESS) {
        printf("Failed to initialize display\n");
        return false;
    }

	// Start with the first frame buffer (of two)
	if (DisplayChangeFrame(p->dispCtrl, 0) != XST_SUCCESS) {
        printf("Failed to change frame\n");
        return false;
    }

    // set resolution
    if (DisplaySetMode(p->dispCtrl, (VideoMode *)size) != XST_SUCCESS) {
        printf("Failed to set display mode\n");
        return false;
    }

	// Enable video output
	if (DisplayStart(p->dispCtrl) != XST_SUCCESS) {
        printf("Failed to start display\n");
        return false;
    }

    // memset(p, 0, sizeof *p); den katalavenw giati ginete gia afto pros to paron comment
    printf("HDMI output enabled\n");
    printf("Current Resolution: %s\n", p->dispCtrl->vMode.label);
    printf("Pixel Clock Frequency: %.3fMHz\n", p->dispCtrl->pxlFreq);


    p->width  = p->dispCtrl->vMode.width;
    p->height = p->dispCtrl->vMode.height;
    p->running = true;
    p->buff = p->dispCtrl->curFrame;

    // platRef = p;buff

    // for now timer dont exist
    // Attach high‑res timer
    // QueryPerformanceFrequency(&p->freq);
    // QueryPerformanceCounter(&p->prev);

    // 1‑ms sleep resolution for smoother pacing
    //timeBeginPeriod(1);
    return true;
}

void Platform_PumpEvents(Platform *p){
    //Clear Input
    // memset(p->keys_pressed, 0, 256);
    // memset(p->keys_released, 0, 256);


    // MSG msg;
    // while(PeekMessageW(&msg, NULL, 0, 0, PM_REMOVE)) {
    //     if (msg.message == WM_QUIT) p->running = false;
    //     TranslateMessage(&msg);
    //     DispatchMessageW(&msg);
    // }
}

float Platform_GetDeltaTime(Platform *p){
    // LARGE_INTEGER now;
    // QueryPerformanceCounter(&now);
    // float dt = (float)(now.QuadPart - p->prev.QuadPart) / (float)p->freq.QuadPart;
    // p->prev = now;
    // return dt;
    return 0.0f;
}


void Platform_BlitBuffer(Platform *p, const uint32_t *src){
    // // if (!p || !src) return;
    
    // // size_t bytes = (size_t)p->width * (size_t)p->height * sizeof(uint32_t);

    // // Switch to the next buffer (toggle between 0 and 1)
    // p->buff = !p->buff;
    // u32* frame = (u32 *)p->dispCtrl->framePtr[p->buff];
    
    // // Copy the source buffer to the frame buffer
    // // memset(pixels, 0xFF, 1280 * 720 * sizeof(u32));
    // // memcpy(pixels, src, bytes);



    // // for (int y = 0; y < 720; y++) {
	// // 	for (int x = 0; x < 1280; x++) {

	// // 		pixels[y*1280 + x] = (0xFFFFFFFF << BIT_DISPLAY_RED) | (0xFFFFFFFF << BIT_DISPLAY_GREEN) | (0xFFFFFFFF << BIT_DISPLAY_BLUE);
	// // 	}
	// // }
    // memset(frame, 0xFF, 720 * 1280*4);

	// // Flush everything out to DDR from the cache
	// Xil_DCacheFlush();
	// // Switch active frame to the back buffer (will take place during next vertical blanking period)
	// DisplayChangeFrame(p->dispCtrl, p->buff);
	// // Wait for the frame to switch before continuing (so after current frame has been drawn)
	// DisplayWaitForSync(p->dispCtrl);

    // Switch the frame we're modifying to be the back buffer (1 to 0, or 0 to 1)
	p->buff = !p->buff;
    DisplayCtrl d = *(p->dispCtrl);
	u32* frame = (u32 *)d.framePtr[p->buff];

	// Clear the entire frame to white (inefficient, but it works)
	memset(frame, 0xFF, 1280*720*4);


	// Flush everything out to DDR from the cache
	Xil_DCacheFlush();

	// Switch active frame to the back buffer (will take place during next vertical blanking period)
	DisplayChangeFrame(&d, p->buff);

	// Wait for the frame to switch before continuing (so after current frame has been drawn)
	DisplayWaitForSync(&d);
}

void Platform_Shutdown(Platform *p){
    // DeleteObject(p->hBitmap);
    //timeEndPeriod(1);
}