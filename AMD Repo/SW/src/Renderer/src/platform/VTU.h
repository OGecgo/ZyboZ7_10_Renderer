#pragma once
#include <stdint.h>
#include <stddef.h>
#include "../fixed32.h"



int  VTU_Init();
void VTU_SetMatrix(fixed32* mtx);
int  VTU_DispatchStream(fixed32* src, float* dst, uint32_t bytes);

