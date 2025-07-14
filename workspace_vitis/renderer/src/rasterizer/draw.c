
#include "draw.h"

#include <stdlib.h>

void drawLine(int x1, int y1, int x2, int y2, uint32_t* buffer, int width, int height){

    if (x1 < 0) x1 = 0;
    if (y1 < 0) y1 = 0;
    if (x2 < 0) x2 = 0;
    if (y2 < 0) y2 = 0;
    
    if (x1 >= width)  x1 = width -1;
    if (y1 >= height) y1 = height-1;
    if (x2 >= width)  x2 = width -1;
    if (y2 >= height) y2 = height-1;

    uint32_t defaultColor = 0x00000000;

    // difrencese
    int dx = abs(x2 - x1);
    int dy = -abs(y2 - y1);

    // navigation of line
    int sx = x1 < x2 ? 1 : -1; 
    int sy = y1 < y2 ? 1 : -1;

    int error = dx + dy;

    while (1){
        buffer[y1 * width + x1] = defaultColor;

        int e2 = 2 * error;
        if (e2 >= dy){
            if (x1 == x2) break;
            error = error + dy;
            x1 = x1 + sx; // move
        }
        if (e2 <= dx){
            if (y1 == y2) break;
            error = error + dx;
            y1 = y1 + sy;
        }
    }

}