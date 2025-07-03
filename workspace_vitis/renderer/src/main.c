#include <string.h>
#include <stdio.h>
#include "platform_vitis/platform_vitis.h"
#include "rasterizer/draw.h"

#define width 1280
#define height 720

int main(void) {
    //initialization
    Platform p;  // Create actual Platform object, not pointer

    if (!Platform_Init(&p, &VMODE_1280x720)) {
        printf("Failed to initialize platform\n");
        return -1;
    }

	u32 frame[width * height];  // Actual frame buffer, not array of pointers

    printf("Starting animation loop...\n");
    
    // int x = 0;
    // int y = 0;
    // int right = 1;
    // int down = 1;

	while (1) {
            // memset(frame, 0xFF, width * height * sizeof(u32));


			// Clear the entire frame to white (inefficient, but it works)

			// draw moving line
            // drawLine(x, y, 640, 360, frame, width, height);

            // // Simple bouncing animation
            // if (right) {
            //     x++;
            //     if (x >= width - 100) right = 0;
            // } else {
            //     x--;
            //     if (x <= 0) right = 1;
            // }
            
            // if (down) {
            //     y++;
            //     if (y >= height - 100) down = 0;
            // } else {
            //     y--;
            //     if (y <= 0) down = 1;
            // }

            // present the buffer
            Platform_BlitBuffer(&p, frame);
            // memset(frame, 0xFF, width * height * sizeof(u32));

	}

	return 0;
}
