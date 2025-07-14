#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

#include "platform_vitis/platform_vitis.h"

#include "rasterizer/draw.h"

#include "xil_cache.h"
#include "xaxidma.h"




// void drawFucn(int* p_x, int* p_y, int* p_back, int width, int height, uint32_t* buffer){
// 	int x = *p_x;
// 	int y = *p_y;
// 	int back = *p_back;
// 	if (!back && x < width) {
// 		x++;
// 		if (y < height && x >= width){
// 			y++;
// 			x = width -1;
// 		} else if (y >= height){
// 			back = 1;
// 		}
// 	}
// 	else if (back && x > 0){
// 		x--;
// 		if (y > 0 && x == 0){
// 			y = height - 1;
// 			x++;
// 		}else if (y == 0){
// 			back = 0;
// 		}
// 	}
// 	drawLine(x, y, width/2, height/2, buffer, width, height);
// 	*p_x = x;
// 	*p_y = y;
// 	*p_back = back;
// }

void print_float(int* item, int size){
	for (int i = 0; i < size; i++)
		printf("matrix pos: %d, num: %d\n", i, item[i]);
}



int main(void) {
	// // initialize platform for output
	// Platform p; 
	// Platform_Init(&p, sizeType1280x720());
	// // initialize frame
    // static uint32_t setFrame[1280*720];


    // int x = 0;
    // int y = 0;
    // int back = 0;

	// test dma with my matrix
	printf("\nStart::::::\n");
	printf("Looking for DMA device ID: %d\n", XPAR_AXIDMA_0_DEVICE_ID);
	
	// For 256-bit transfer: 256 bits = 32 bytes = 8 integers (4 bytes each)
	int transfer_size = 32; // 256 bits = 32 bytes
	int num_ints = transfer_size / sizeof(int); // 8 integers
	
	printf("Transfer size: %d bytes (%d bits), Number of integers: %d\n", 
		transfer_size, transfer_size * 8, num_ints);
	
	// Allocate 32-byte aligned memory (required for 256-bit DMA without unaligned transfer support)
	int* item  = (int*)memalign(32, transfer_size);
	int* item2 = (int*)memalign(32, transfer_size);
	
	if (item == NULL || item2 == NULL) {
		printf("Error: Failed to allocate aligned memory\n");
		return 1;
	}
	
	printf("Memory alignment check:\n");
	printf("item  address: 0x%08X (aligned to 32 bytes: %s)\n", 
		(unsigned int)item, ((unsigned int)item % 32) == 0 ? "YES" : "NO");
	printf("item2 address: 0x%08X (aligned to 32 bytes: %s)\n", 
		(unsigned int)item2, ((unsigned int)item2 % 32) == 0 ? "YES" : "NO");
	
	// Initialize with test data
	memset(item, 0, transfer_size);
	memset(item2, 0, transfer_size);
	
	// Set some test values
	for (int i = 0; i < num_ints; i++) {
		item[i] = i + 1; // 1, 2, 3, 4, 5, 6, 7, 8
	}
	
	printf("Input data:\n");
	print_float(item, num_ints);// test

	XAxiDma_Config* config = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (config == NULL) {
		printf("Error: Could not find DMA device with ID %d\n", XPAR_AXIDMA_0_DEVICE_ID);
		return 1;
	}
	
	XAxiDma dma;
	if (XAxiDma_CfgInitialize(&dma, config) != XST_SUCCESS){
		printf("Error Initialize dma\n");
		return 1;
	}

	// Prepare buffers for DMA transfer
	// For INPUT buffer: Only FLUSH (write cache to memory), do NOT invalidate
	Xil_DCacheFlushRange((UINTPTR)item, transfer_size);
	
	// For OUTPUT buffer: Both flush and invalidate to ensure clean state
	Xil_DCacheFlushRange((UINTPTR)item2, transfer_size);

	printf("Input data after cache flush (before transfer):\n");
	print_float(item, num_ints);
		
	// Start MM2S transfer first (to send data)
	printf("Starting MM2S transfer (%d bytes)...\n", transfer_size);
	if (XAxiDma_SimpleTransfer(&dma, (UINTPTR)item, transfer_size, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS){
		printf("Error starting MM2S transfer\n");
		return 1;
	}
	
	// Start S2MM transfer (to receive data)
	printf("Starting S2MM transfer (%d bytes)...\n", transfer_size);
	if (XAxiDma_SimpleTransfer(&dma, (UINTPTR)item2, transfer_size, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS){
		printf("Error starting S2MM transfer\n");
		return 1;
	}

	
	printf("Waiting for MM2S to complete...\n");
	while (XAxiDma_Busy(&dma, XAXIDMA_DEVICE_TO_DMA));
	printf("MM2S completed\n");

	printf("Waiting for S2MM to complete...\n");
	while (XAxiDma_Busy(&dma, XAXIDMA_DMA_TO_DEVICE));
	printf("S2MM completed\n");
	
	printf("Input data after transfers (should still have original values):\n");
	print_float(item, num_ints);
	
	// Invalidate cache for output buffer before reading
	Xil_DCacheInvalidateRange((UINTPTR)item2, transfer_size);
	
	printf("Output data:\n");
	print_float(item2, num_ints);
	
	// Check if any data came through
	int data_received = 0;
	for (int i = 0; i < num_ints; i++) {
		if (item2[i] != 0) {
			data_received = 1;
			break;
		}
	}
	
	if (!data_received) {
		printf("\nDiagnosis: No data received in output buffer\n");
		printf("Possible causes:\n");
		printf("1. Matrix multiplier IP is not enabled/started\n");
		printf("2. Matrix multiplier IP requires additional configuration\n");
		printf("3. AXI4-Stream handshaking issue between DMA and IP\n");
		printf("4. Matrix multiplier IP is waiting for more data or control signals\n");
		printf("5. Clock domain crossing issue\n");
		
		printf("\nRecommendation: Check if matrix multiplier IP has:\n");
		printf("- Control registers that need to be set\n");
		printf("- Enable/start signals\n");
		printf("- Status registers showing readiness\n");
		printf("- Expected data format (endianness, packing)\n");
	} else {
		printf("\nData was received and processed by matrix multiplier\n");
	}
	
	// Free allocated memory
	free(item);
	free(item2);





// 	while (p.running) {

// 			// Clear the entire frame to white (inefficient, but it works)
// 			memset(setFrame, 0xFF, p.size_frame_bytes);

// 			// draw test
// 			drawFucn(&x, &y, &back, p.dispCtrl.vMode.width, p.dispCtrl.vMode.height, setFrame);
			
			
// 			// test key inputs
// 			Platform_PumpEvents(&p);
// 			if (IsKeyPressed(&p, 'a') || IsKeyPressed(&p, 'A')){
// 				x -= 10;
// 			}
// 			if (IsKeyPressed(&p, 'd') || IsKeyPressed(&p, 'd')){
// 				x += 10;
// 			}
// 			if (IsKeyPressed(&p, 'w') || IsKeyPressed(&p, 'W')){
// 				y -= 10;
// 			}
// 			if (IsKeyPressed(&p, 's') || IsKeyPressed(&p, 'S')){
// 				y += 10;
// 			}


// 			// fps test
// //			printf("%f \n", 1 / (Platform_GetDeltaTime(&p) / 1000000));
			
// 			// update buffer and present
//             Platform_BlitBuffer(&p, setFrame);
// 	}

	return 0;
}
