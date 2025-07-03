/**
 * Example of using the Digilent display drivers for Zybo Z7 HDMI output, with animation
 * Russell Joyce, 11/03/2019
 */

#include <stdio.h>
#include <stdint.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "zybo_z7_hdmi/display_ctrl.h"

#include "rasterizer/draw.h"


// Frame size (based on 1440x900 resolution, 32 bits per pixel)
#define MAX_FRAME (1440*900)
#define FRAME_STRIDE (1440*4)

DisplayCtrl dispCtrl; // Display driver struct
uint32_t frameBuf[DISPLAY_NUM_FRAMES][MAX_FRAME]; // Frame buffers for video data
void *pFrames[DISPLAY_NUM_FRAMES]; // Array of pointers to the frame buffers

int main(void) {
	// Initialise an array of pointers to the 2 frame buffers
	int i;
	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
		pFrames[i] = frameBuf[i];

	// Initialise the display controller
	DisplayInitialize(&dispCtrl, XPAR_AXIVDMA_0_DEVICE_ID, XPAR_VTC_0_DEVICE_ID, XPAR_HDMI_AXI_DYNCLK_0_BASEADDR, pFrames, FRAME_STRIDE);

	// Start with the first frame buffer (of two)
	DisplayChangeFrame(&dispCtrl, 0);

	// Set the display resolution
	DisplaySetMode(&dispCtrl, &VMODE_1440x900);

	// Enable video output
	DisplayStart(&dispCtrl);

	printf("\n\r");
	printf("HDMI output enabled\n\r");
	printf("Current Resolution: %s\n\r", dispCtrl.vMode.label);
	printf("Pixel Clock Frequency: %.3fMHz\n\r", dispCtrl.pxlFreq);
	printf("Starting animation loop...\n\r");

	// Get parameters from display controller struct
	int x = 0;
    int y = 0;
    int back = 0;
	u32 stride = dispCtrl.stride / 4;
	u32 width = dispCtrl.vMode.width;
	u32 height = dispCtrl.vMode.height;

	u32 *frame;
	int right = 1;
	int down = 1;
	int xpos = 0;
	int ypos = 0;
	u32 buff = dispCtrl.curFrame;

	while (1) {
			// Switch the frame we're modifying to be the back buffer (1 to 0, or 0 to 1)
			buff = !buff;
			frame = (u32 *)dispCtrl.framePtr[buff];

			// Clear the entire frame to white (inefficient, but it works)
			memset(frame, 0xFF, MAX_FRAME*4);

			// Adjust the position of the square
            drawLine(x, y, 400, 300, frame, width, height); // Move the end point, not the start
            if (!back && x < width) {
                x+=5;
                if (y < height && x == width){
                    y+=5;
                    x-=5;
                } else if (y == height){
                    back = 1;
                }
            }
            else if (back && x > 0){
                x-=5;
                if (y > 0 && x == 0){
                    y-=5;
                    x+=5;
                }else if (y == 0){
                    back = 0;
                }
            }



			// Flush everything out to DDR from the cache
			Xil_DCacheFlush();

			// Switch active frame to the back buffer (will take place during next vertical blanking period)
			DisplayChangeFrame(&dispCtrl, buff);

			// Wait for the frame to switch before continuing (so after current frame has been drawn)
			DisplayWaitForSync(&dispCtrl);
	}

	return 0;
}
