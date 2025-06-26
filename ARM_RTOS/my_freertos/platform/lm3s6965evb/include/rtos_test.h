#ifndef RTOS_TEST_H
#define RTOS_TEST_H


#include "FreeRTOS.h"
#include "task.h"
#include <stdint.h>

extern volatile uint32_t g_tickCount_start;
extern volatile uint32_t g_tickCount_end;
extern TaskHandle_t xIsrMeasureTask;
extern void rtos_test_entry(void);  // 統一進入點



extern void vIsrMeasureTask(void *pvParameters);
extern void vIsrMeasureTriggerTask(void *pvParameters);
extern void enable_dwt(void);
extern void dwt_init(void);
//===================timer===========================

extern void timer_init(void);
extern void test_timer_counting(void);
extern void systick_init(uint32_t ticks);


#endif