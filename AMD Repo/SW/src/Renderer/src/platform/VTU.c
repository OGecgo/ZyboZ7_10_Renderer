#include "VTU.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_cache.h"
#include "xaxidma.h"
#include <stdint.h>
#include "../fixed32.h"


#define VTU_MATRIX_BASEADDR  XPAR_VERTEX_TRANSFORM_UNIT_0_BASEADDR
#define DMA_DEV_ID           XPAR_AXIDMA_0_DEVICE_ID


static XAxiDma dma;
static int     dmaInited = 0;


int VTU_Init(){
    XAxiDma_Config* cfg = XAxiDma_LookupConfig(DMA_DEV_ID);
    if(!cfg) return XST_FAILURE;

    int s = XAxiDma_CfgInitialize(&dma, cfg);
    if(s != XST_SUCCESS) return s;

    // Ensure no Scatter/Gather
    if(XAxiDma_HasSg(&dma)) return XST_FAILURE;


    XAxiDma_Reset(&dma);
    // spin until reset finished or timed out
    for(volatile int i = 0; i < 1000000; ++i) {
        if (XAxiDma_ResetIsDone(&dma)) break;
        if (i == 999999) return XST_FAILURE;
    }

    dmaInited = 1;
    return XST_SUCCESS;
}



void VTU_SetMatrix(fixed32* mtx){
    for (int i = 0; i < 16; ++i)
        Xil_Out32(VTU_MATRIX_BASEADDR + (i<<2), mtx[i]);
}

static inline int dma_busy(){
    return XAxiDma_Busy(&dma, XAXIDMA_DMA_TO_DEVICE) ||
           XAxiDma_Busy(&dma, XAXIDMA_DEVICE_TO_DMA);
}

// NOTE:
//   - Flush SRC before MM2S reads
//   - Invalidate DST AFTER the transfer completes (caller should do this)
// We deliberately do NOT invalidate here because this call is async.
//Xil_DCacheFlushRange((UINTPTR)src, bytes);			// PS -> DMA reads latest data
//Xil_DCacheInvalidateRange((UINTPTR)dst, bytes);


int VTU_DispatchStream(fixed32* src, float* dst, uint32_t bytes){
    if(!dmaInited) return XST_DEVICE_NOT_FOUND;
    if(bytes == 0) return XST_INVALID_PARAM;

    //if(dma_busy()) return XST_DEVICE_BUSY;


    // Start S2MM
    int s = XAxiDma_SimpleTransfer(&dma, (UINTPTR)dst, bytes, XAXIDMA_DEVICE_TO_DMA);
    if (s != XST_SUCCESS) return s;

    // Then start MM2S to feed the VTU
    s = XAxiDma_SimpleTransfer(&dma, (UINTPTR)src, bytes, XAXIDMA_DMA_TO_DEVICE);
    if (s != XST_SUCCESS) return s;

    // Poll for completion (both directions)
    while(XAxiDma_Busy(&dma, XAXIDMA_DMA_TO_DEVICE)) {}
    while(XAxiDma_Busy(&dma, XAXIDMA_DEVICE_TO_DMA)) {}


    return XST_SUCCESS;
}




