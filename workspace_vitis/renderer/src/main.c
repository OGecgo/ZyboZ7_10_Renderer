/**
 * Example of using the Digilent display drivers for Zybo Z7 HDMI output, with animation
 * Russell Joyce, 11/03/2019
 */

#include <stdio.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "zybo_z7_hdmi/display_ctrl.h"

#include "platform_vitis/platform_vitis.h"

// Frame size (based on 1440x900 resolution, 32 bits per pixel)
#define MAX_FRAME (1440*900)
#define FRAME_STRIDE (1440*4)

Platform p; // Display driver struct
u32 frameBuf[DISPLAY_NUM_FRAMES][MAX_FRAME] __attribute__((aligned(0x20))); // Frame buffers for video data
void *pFrames[DISPLAY_NUM_FRAMES]; // Array of pointers to the frame buffers

int main(void) {
	Platform_Init(&p, &VMODE_1280x720);


	// Get parameters from display controller struct
	int x, y;
	u32 stride = p.dispCtrl.stride / 4;
    static u32 setFrame[MAX_FRAME];
	int right = 1;
	int down = 1;
	int xpos = 0;
	int ypos = 0;

	while (1) {

			// // Clear the entire frame to white (inefficient, but it works)
			memset(setFrame, 0xFF, MAX_FRAME*4);

			// Adjust the position of the square
			if (right) {
				xpos++;
				if (xpos == p.width-64)
					right = 0;
			}
			else {
				xpos--;
				if (xpos == 0)
					right = 1;
			}
			if (down) {
				ypos++;
				if (ypos == p.height-64) {
					down = 0;
				}
			}
			else {
				ypos--;
				if (ypos == 0) {
					down = 1;
				}
			}

			// Draw black square on the screen
			for (x = xpos; x < xpos+64; x++) {
				for (y = ypos; y < ypos+64; y++) {
					setFrame[y*stride + x] = 0;
				}
			}

            // Switch the frame we're modifying to be the back buffer (1 to 0, or 0 to 1)
            // frame = (u32 *)p.dispCtrl.framePtr[!p.dispCtrl.curFrame];

            // memset(frame, 0xFF, MAX_FRAME * 4);
            // memcpy(frame, setFrame, MAX_FRAME*4);


            Platform_BlitBuffer(&p, setFrame);
	}

	return 0;
}
