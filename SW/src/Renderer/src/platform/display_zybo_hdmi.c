#include "display.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "../../zybo_z7_hdmi/display_ctrl.h"


typedef struct Display {
    DisplayCtrl dispCtrl;	//Digilent HDMI Controller

    // BUFFERS
    uint32_t* color_bufs[2];
    float*    zbuf;
    int       color_pitch;     // elements per row
    int       depth_pitch;     // elements per row
}Display;



// Map (w,h) to a VideoMode provided by the HDMI library
static const VideoMode* FindVideoMode(int w, int h) {
    if (w == 640  && h == 480)  return &VMODE_640x480;
    if (w == 800  && h == 600)  return &VMODE_800x600;
    if (w == 1280 && h == 720)  return &VMODE_1280x720;
    if (w == 1280 && h == 800)  return &VMODE_1280x800;
    if (w == 1280 && h == 1024) return &VMODE_1280x1024;
    if (w == 1440 && h == 900)  return &VMODE_1440x900;
    if (w == 1680 && h == 1050) return &VMODE_1680x1050;
    return NULL; // unsupported;
}

// Μap color pointer -> framebuffer index {0,1}
static inline int FrameIndexFromPtr(const Display* d, const uint32_t* p){
    return (p == d->color_bufs[0]) ? 0 : 1;
}




// PUBLIC API
Display* Display_Create(int width, int height) {
	const VideoMode* vMode = FindVideoMode(width, height);
    if (!vMode) {
        printf("Display_Create: unsupported mode %d x %d\n", width, height);
	    return NULL;
	}


    Display *d = calloc(1, sizeof(Display));
    if (!d) return NULL;

    // Allocate color buffers
    for(int i = 0; i < 2; ++i)
        d->color_bufs[i] = aligned_alloc(0x20, width*height*sizeof(uint32_t));

    // Allocate z-buffer
    d->zbuf = aligned_alloc(0x20, width*height*sizeof(float));


    // Initialize HDMI hardware
    void* framePtrs[2] = { d->color_bufs[0], d->color_bufs[1] };
    DisplayInitialize(&d->dispCtrl, XPAR_AXIVDMA_0_DEVICE_ID, XPAR_VTC_0_DEVICE_ID, XPAR_DYNCLK_0_S_AXI_LITE_BASEADDR, framePtrs, width*4);	// 4 bytes (rgba)
    DisplayChangeFrame(&d->dispCtrl, 0);	// Start with the first frame buffer
    DisplaySetMode(&d->dispCtrl, vMode);	// Set the display resolution
    DisplayStart(&d->dispCtrl);


    d->color_pitch = d->dispCtrl.vMode.width;	//pitch same as width
    d->depth_pitch = d->dispCtrl.vMode.width;
    printf("HDMI: %s @ %.3f MHz\n", d->dispCtrl.vMode.label, d->dispCtrl.pxlFreq);
    return d;
}


void Display_Destroy(Display *d) {
    if(!d) return;

    DisplayStop(&d->dispCtrl);	//Stop HDMI Output

    for(int i = 0; i < 2; ++i){
    	if (d->color_bufs[i]) free(d->color_bufs[i]);
    }

    if (d->zbuf) free(d->zbuf);
    free(d);
}

Framebuffer Display_AcquireFrame(Display *d) {
    int back = !d->dispCtrl.curFrame;  // use the back buffer

    return (Framebuffer) {
        .color = d->color_bufs[back],
        .depth = d->zbuf,
        .width = d->dispCtrl.vMode.width,
        .height = d->dispCtrl.vMode.height,
		.color_pitch = d->color_pitch,
		.depth_pitch = d->depth_pitch
    };
}


void Display_Present(Display* d, const Framebuffer* fb) {
    // Flush everything out to DDR from the cache
    //Xil_DCacheFlush();
    // Flush only the color region that VDMA scans out
    size_t bytes = (size_t)fb->color_pitch * fb->height * sizeof(uint32_t);
    Xil_DCacheFlushRange((INTPTR)fb->color, bytes);

    int back = !d->dispCtrl.curFrame; //FrameIndexFromPtr(d, fb->color);
    DisplayChangeFrame(&d->dispCtrl, back); // Switch active frame to the back buffer (will take place during next vertical blanking period)
    DisplayWaitForSync(&d->dispCtrl);	    // Wait for the frame to switch before continuing (so after current frame has been drawn)
}






void Display_GetResolution(const Display* d, int* outW, int* outH) {
    if(outW) *outW = d->dispCtrl.vMode.width;
    if(outH) *outH = d->dispCtrl.vMode.height;
}


