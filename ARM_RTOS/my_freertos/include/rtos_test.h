#ifndef RTOS_TEST_H
#define RTOS_TEST_H


#include "FreeRTOS.h"
#include "task.h"
#include <stdint.h>

extern volatile uint32_t g_tickCount_start;
extern volatile uint32_t g_tickCount_end;
extern TaskHandle_t xIsrMeasureTask;
extern void rtos_test_entry(void);  // 統一進入點

#endif