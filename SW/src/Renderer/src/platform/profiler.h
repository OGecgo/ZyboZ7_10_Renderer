#pragma once
#include <stdint.h>
#include <stddef.h>
#include "xtime_l.h"    // XTime_GetTime(), COUNTS_PER_SECOND
#include "xil_printf.h" // xil_printf (for UART dump)


typedef struct {
  const char* funcName;
  uint8_t     isBegin;      // 1 = begin, 0 = end
  uint64_t    timestamp;    // global-timer ticks at event time
} ProfilerEvent;




void PROF_BEGIN(const char *funcName);
void PROF_END  (const char *funcName);



#define _PROF_BEGIN(FN_NAME)  PROF_BEGIN(FN_NAME)  //((void)0)
#define _PROF_END(FN_NAME)    PROF_END(FN_NAME)    //((void)0)



void ProfDumpCSV_UART(int with_header);
void ProfShowStats_UART();
