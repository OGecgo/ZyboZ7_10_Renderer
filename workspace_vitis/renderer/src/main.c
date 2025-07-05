/**
 * Example of using the Digilent display drivers for Zybo Z7 HDMI output, with animation
 * Russell Joyce, 11/03/2019
 */

#include <stdio.h>

#include "platform_vitis/platform_vitis.h"

#include "rasterizer/draw.h"




void drawFucn(int* p_x, int* p_y, int* p_back, int width, int height, uint32_t* buffer){
	int x = *p_x;
	int y = *p_y;
	int back = *p_back;
	if (!back && x < width) {
		x++;
		if (y < height && x >= width){
			y++;
			x = width -1;
		} else if (y >= height){
			back = 1;
		}
	}
	else if (back && x > 0){
		x--;
		if (y > 0 && x == 0){
			y = height - 1;
			x++;
		}else if (y == 0){
			back = 0;
		}
	}
	drawLine(x, y, width/2, height/2, buffer, width, height);
	*p_x = x;
	*p_y = y;
	*p_back = back;
}





int main(void) {
	// initialize platform for output
	Platform p; 
	Platform_Init(&p, sizeType1280x720());
	// initialize frame
    static uint32_t setFrame[1280*720];


    int x = 0;
    int y = 0;
    int back = 0;

	while (p.running) {

			// Clear the entire frame to white (inefficient, but it works)
			memset(setFrame, 0xFF, p.size_frame_bytes);

			drawFucn(&x, &y, &back, p.dispCtrl.vMode.width, p.dispCtrl.vMode.height, setFrame);
			
			// test key inputs
			if(XUartPs_IsReceiveData(p.uart.Config.BaseAddress)){
				switch (XUartPs_ReadReg(p.uart.Config.BaseAddress, XUARTPS_FIFO_OFFSET))
				{
				case 'A':
				case 'a':
					x = 0;
					break;
				
				case 'D':
				case 'd':
					x += 50;
					break;
				}
			} 
			// update buffer and present
            Platform_BlitBuffer(&p, setFrame);
	}

	return 0;
}
