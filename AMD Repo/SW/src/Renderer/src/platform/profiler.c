/*#include "profiler.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <limits.h>


#ifndef PROF_EVENTS_CAP
#define PROF_EVENTS_CAP 8388608
#endif

ProfilerEvent g_profEvents[PROF_EVENTS_CAP];
uint32_t      g_profCount = 0;




// ===== Helpers =====
static inline uint64_t ProfNowTicks() {
  XTime t;
  XTime_GetTime(&t);
  return (uint64_t)t;
}

static inline void ProfAddRaw(const char *name, uint8_t isBegin, uint64_t ts) {
  uint32_t i = g_profCount;

  if (i < PROF_EVENTS_CAP) {
    g_profEvents[i].funcName  = name;
    g_profEvents[i].isBegin   = isBegin;
    g_profEvents[i].timestamp = ts;
    g_profCount = i + 1;
  }
}


// ticks -> microseconds
static inline uint64_t ticks_to_us(uint64_t ticks) {
#if defined(__SIZEOF_INT128__)
  __int128 num = (__int128)ticks * 1000000 + (__int128)(COUNTS_PER_SECOND / 2);
  return (uint64_t)(num / (__int128)COUNTS_PER_SECOND);
#else
  double us = (1e6 * (double)ticks) / (double)COUNTS_PER_SECOND;
  return (uint64_t)(us + 0.5);
#endif
}

// Fast u64 -> decimal (no %llu needed)
static inline char* u64_to_dec(char *out, uint64_t v) {
  char tmp[21]; int n = 0;
  do { tmp[n++] = (char)('0' + (v % 10)); v /= 10; } while (v);
  for (int i=n-1, j=0; i>=0; --i, ++j) out[j] = tmp[i];
  out[n] = '\0';
  return out;
}





// Post-Process timer events
#define MAX_PROFILED_FUNCS 32

typedef struct {
    const char* funcName;
    uint32_t    calls;
    uint64_t    totalDuration;
    uint64_t    maxDuration;
    uint64_t    minDuration;
} ProfFuncStat;

// Pair structure for stack
typedef struct {
    const char *funcName;
    uint64_t    startTimestamp;
} ProfStackEntry;



static void PostProcessStats(const ProfilerEvent *events, uint32_t count) {
    ProfFuncStat stats[MAX_PROFILED_FUNCS] = {0};
    uint32_t statsCount = 0;
    ProfStackEntry stack[32]; // support up to 32 nested calls
    int stackTop = -1;

    for (uint32_t i = 0; i < count; ++i) {
        const ProfilerEvent *ev = &events[i];
        if (ev->isBegin) {
            // Push to stack
            ++stackTop;
            stack[stackTop].funcName = ev->funcName;
            stack[stackTop].startTimestamp = ev->timestamp;
        } else {
            // Find corresponding begin in stack (last opened with same name)
            int foundIdx = -1;
            for (int j = stackTop; j >= 0; --j) {
                if (stack[j].funcName == ev->funcName) {
                    foundIdx = j;
                    break;
                }
            }
            if (foundIdx == -1) continue; // no matching begin; skip (shouldn't happen)
            uint64_t duration = ev->timestamp - stack[foundIdx].startTimestamp;

            // Remove from stack
            for (int j = foundIdx; j < stackTop; ++j) {
                stack[j] = stack[j+1];
            }
            --stackTop;

            // Find or add stat entry
            int statIdx = -1;
            for (uint32_t j = 0; j < statsCount; ++j) {
                if (stats[j].funcName == ev->funcName) {
                    statIdx = j;
                    break;
                }
            }
            if (statIdx == -1 && statsCount < MAX_PROFILED_FUNCS) {
                statIdx = statsCount++;
                stats[statIdx].funcName = ev->funcName;
                stats[statIdx].minDuration = UINT64_MAX;
                stats[statIdx].maxDuration = 0;
                stats[statIdx].totalDuration = 0;
                stats[statIdx].calls = 0;
            }
            if (statIdx != -1) {
                stats[statIdx].calls++;
                stats[statIdx].totalDuration += duration;
                if (duration < stats[statIdx].minDuration) stats[statIdx].minDuration = duration;
                if (duration > stats[statIdx].maxDuration) stats[statIdx].maxDuration = duration;
            }
        }
    }

    // Print results
    printf("Function           Calls   Total(us)   Mean(us)   Max(us)   Min(us)\n");
    for (uint32_t i = 0; i < statsCount; ++i) {
        uint64_t mean = (stats[i].calls) ? stats[i].totalDuration / stats[i].calls : 0;
        printf("%-16s %5u %12llu %9llu %9llu %9llu\n", stats[i].funcName, stats[i].calls, stats[i].totalDuration, mean, stats[i].maxDuration, stats[i].minDuration);
    }
}





// ===== Public API (function form) =====
void _PROF_BEGIN(const char *funcName) { ProfAddRaw(funcName, 1, ProfNowTicks()); }
void _PROF_END  (const char *funcName) { ProfAddRaw(funcName, 0, ProfNowTicks()); }


void ProfDumpCSV_UART(int with_header){
  if (with_header) xil_printf("\n\n func,isBegin,timestamp_us\r\n\n");

  for (uint32_t i = 0; i < g_profCount; ++i) {
    char num[24];
    u64_to_dec(num, ticks_to_us(g_profEvents[i].timestamp));
    xil_printf("%s,%u,%s\r\n", g_profEvents[i].funcName, (unsigned)g_profEvents[i].isBegin, num);
  }
}

void ProfShowStats_UART(){
	PostProcessStats(g_profEvents, g_profCount);
}



*/






#include <stdint.h>
#include <string.h>
#include <limits.h>
#include "xil_printf.h"
#include "xtime_l.h"

// ---------- Configuration ----------
#ifndef PROF_MAX_FUNCS
#define PROF_MAX_FUNCS 32
#endif

#ifndef PROF_MAX_STACK
#define PROF_MAX_STACK 128
#endif

#ifndef PROF_COMPARE_BY_POINTER
#define PROF_COMPARE_BY_POINTER 1
#endif

#ifndef PROF_STRICT_LIFO
#define PROF_STRICT_LIFO 1
#endif


// ---------- Time helpers ----------
static inline uint64_t GetTicksNow() {
    XTime t;
    XTime_GetTime(&t);
    return (uint64_t)t;
}

// ticks -> microseconds (rounded)
static inline uint64_t ticks_to_us(uint64_t ticks) {
    const uint64_t cps = (uint64_t)COUNTS_PER_SECOND;
    double us = (1e6 * (double)ticks) / (double)cps;
    return (uint64_t)(us + 0.5);
}

// Fast u64 -> decimal string (avoid %llu portability issues)
static inline char* u64_to_dec(char *out, uint64_t v) {
    char tmp[21]; int n = 0;
    do { tmp[n++] = (char)('0' + (v % 10)); v /= 10; } while (v);
    for (int i=n-1, j=0; i>=0; --i, ++j) out[j] = tmp[i];
    out[n] = '\0';
    return out;
}



// ---------- Aggregator state ----------
typedef struct {
    const char* name;       // key
    uint32_t    calls;      // number of completed calls
    uint64_t    totalTicks; // sum of durations in ticks
} ProfStat;

typedef struct {
    int         statIdx;    // index into g_profStats for this frame
    uint64_t    startTicks; // begin timestamp in ticks
} ProfStack;

static ProfStat  g_profStats[PROF_MAX_FUNCS];
static uint32_t  g_profStatsCount = 0;

static ProfStack g_profStack[PROF_MAX_STACK];
static int       g_profSp = 0;

// Diagnostics
static uint32_t  g_profMismatchedEnds = 0;
static uint32_t  g_profStackOverflows = 0;
static uint32_t  g_profStatsOverflows = 0;


// ---------- Helpers ----------
static inline int ProfNameEquals(const char* a, const char* b) {
#if PROF_COMPARE_BY_POINTER
    return a == b;
#else
    return a && b && (strcmp(a, b) == 0);
#endif
}

// Linear search add/find
static int ProfFindOrAdd(const char* name) {
    for (uint32_t i = 0; i < g_profStatsCount; ++i) {
        if (ProfNameEquals(g_profStats[i].name, name)) return (int)i;
    }
    if (g_profStatsCount >= PROF_MAX_FUNCS) {
        g_profStatsOverflows++;
        return -1;
    }
    uint32_t i = g_profStatsCount++;
    g_profStats[i].name       = name;
    g_profStats[i].calls      = 0;
    g_profStats[i].totalTicks = 0;
    return (int)i;
}



// ---------- Public API (convenience, name-based) ----------
void PROF_BEGIN(const char *name) {
    if (g_profSp >= PROF_MAX_STACK) { g_profStackOverflows++; return; }
    int idx = ProfFindOrAdd(name);
    if (idx < 0) return;
    g_profStack[g_profSp].statIdx    = idx;
    g_profStack[g_profSp].startTicks = GetTicksNow();
    g_profSp++;
}

void PROF_END(const char *name) {
    if (g_profSp <= 0) { g_profMismatchedEnds++; return; }
    int idxTop = g_profStack[g_profSp - 1].statIdx;

#if PROF_STRICT_LIFO
    if (!ProfNameEquals(g_profStats[idxTop].name, name)) { g_profMismatchedEnds++; return; }
#else
    // recovery mode
    if (!ProfNameEquals(g_profStats[idxTop].name, name)) {
        int j = g_profSp - 1;
        while (j >= 0 && !ProfNameEquals(g_profStats[g_profStack[j].statIdx].name, name)) j--;
        if (j < 0) { g_profMismatchedEnds++; return; }
        g_profSp = j + 1;
        idxTop   = g_profStack[g_profSp - 1].statIdx;
    }
#endif

    uint64_t dt = GetTicksNow() - g_profStack[--g_profSp].startTicks;
    g_profStats[idxTop].calls++;
    g_profStats[idxTop].totalTicks += dt;
}









void ProfShowStats_UART(void) {
    // Build index array
    uint32_t n = g_profStatsCount;
    uint32_t idx[PROF_MAX_FUNCS];
    for (uint32_t i = 0; i < n; ++i) idx[i] = i;

    // Insertion sort by totalTicks (descending)
    for (uint32_t i = 1; i < n; ++i) {
        uint32_t key = idx[i];
        uint64_t keyTicks = g_profStats[key].totalTicks;
        int j = (int)i - 1;
        while (j >= 0 && g_profStats[idx[j]].totalTicks < keyTicks) {
            idx[j + 1] = idx[j];
            --j;
        }
        idx[j + 1] = key;
    }

    // Find "Main" total (by string compare). If not found or zero, we don't print percentages.
    uint64_t mainTicks = 0;
    for (uint32_t i = 0; i < n; ++i) {
        const char* nm = g_profStats[i].name;
        if (nm && strcmp(nm, "Main") == 0) { mainTicks = g_profStats[i].totalTicks; break; }
    }

    // Find global Draw Call count from "DrawMesh"
    uint64_t drawCalls = 0;
    for (uint32_t i = 0; i < n; ++i) {
        const char* nm = g_profStats[i].name;
        if (nm && strcmp(nm, "DrawMesh") == 0) { drawCalls = (uint64_t)g_profStats[i].calls; break; }
    }

    // Header (+ %Main + us/Draw)
    xil_printf("\r\n%-28s %10s %16s %12s %7s %10s\r\n",
               "Function", "Calls", "Total_us", "Mean_us", "us/Draw","%Main");
    xil_printf("%-28s %10s %16s %12s %10s %7s\r\n",
               "----------------------------", "----------", "----------------", "------------", "----------", "-------");

    // Rows
    for (uint32_t k = 0; k < n; ++k) {
        const ProfStat* s = &g_profStats[idx[k]];

        // Total in microseconds
        uint64_t total_us = ticks_to_us(s->totalTicks);

        // Mean: round in ticks, then convert to µs
        uint64_t mean_us = 0;
        if (s->calls) {
            uint64_t mean_ticks = (s->totalTicks + (uint64_t)(s->calls / 2)) / (uint64_t)s->calls;
            mean_us = ticks_to_us(mean_ticks);
        }

        // us per Draw Call (Draw Call == number of times DrawMesh was called, globally)
        char bPerDraw[24];
        if (drawCalls) {
            uint64_t per_draw_ticks = (s->totalTicks + (uint64_t)(drawCalls / 2)) / (uint64_t)drawCalls;
            uint64_t per_draw_us    = ticks_to_us(per_draw_ticks);
            u64_to_dec(bPerDraw, per_draw_us);
        } else {
            bPerDraw[0] = '-'; bPerDraw[1] = '\0';
        }

        // Build strings (avoid %llu)
        char bCalls[24], bTot[24], bMean[24];
        u64_to_dec(bCalls, (uint64_t)s->calls);
        u64_to_dec(bTot,   total_us);
        u64_to_dec(bMean,  mean_us);

        // % of Main (XX.YY) or "-"
        char bPct[16];
        if (mainTicks > 0) {
            uint64_t pct_x100 = (10000ull * s->totalTicks) / mainTicks; // x100
            char bi[24];
            uint64_t pi = pct_x100 / 100, pd = pct_x100 % 100;
            u64_to_dec(bi, pi);
            int m = 0; for (; bi[m]; ++m) bPct[m] = bi[m];
            bPct[m++] = '.';
            bPct[m++] = (char)('0' + (int)(pd / 10));
            bPct[m++] = (char)('0' + (int)(pd % 10));
            bPct[m]   = '\0';
        } else {
            bPct[0] = '-'; bPct[1] = '\0';
        }

        xil_printf("%-28s %10s %16s %12s %10s %7s\r\n",
                   s->name, bCalls, bTot, bMean, bPerDraw, bPct);
    }

    // Footer / diagnostics
    if (g_profMismatchedEnds || g_profStackOverflows || g_profStatsOverflows || g_profSp) {
        xil_printf("diag: mismatchedEnds=%u, stackOverflows=%u, statsOverflows=%u, unclosed=%d\r\n",
                   g_profMismatchedEnds, g_profStackOverflows, g_profStatsOverflows, g_profSp);
    }
}


