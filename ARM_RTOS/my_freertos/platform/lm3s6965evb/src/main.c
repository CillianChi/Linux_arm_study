#include "FreeRTOS.h"
#include "task.h"
#include "uart.h"
#include "rtos_test.h"


void vTaskHello(void *pvParameters)
{
    (void) pvParameters;
    for (;;)
    {
        uart_puts("Hello from Task 1\n");
        vTaskDelay(pdMS_TO_TICKS(1000)); // 每 1000ms
    }
}

void vTaskBlink(void *pvParameters)
{
    (void) pvParameters;
    for (;;)
    {
        uart_puts("Blink from Task 2\n");
        vTaskDelay(pdMS_TO_TICKS(500));  // 每 500ms
    }
}

int main(void)
{
    uart_init();  // 初始化 UART
    uart_puts("RTOS Start222222\n");
    rtos_test_entry();
    for(;;);
}
static int tick_counter = 0;

void vApplicationTickHook(void)
{
    tick_counter++;
    if (tick_counter >= 10)
    {
        tick_counter = 0;
        g_tickCount_start = xTaskGetTickCount();

        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        vTaskNotifyGiveFromISR(xIsrMeasureTask, &xHigherPriorityTaskWoken);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}
// 堆疊溢位處理 Hook（configCHECK_FOR_STACK_OVERFLOW 啟用時會需要）
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
    (void)xTask;
    (void)pcTaskName;
    uart_puts("Stack Overflow!\n");
    while (1);
}

// 記憶體分配失敗處理 Hook（configUSE_MALLOC_FAILED_HOOK 啟用時會需要）
void vApplicationMallocFailedHook(void)
{
    uart_puts("Malloc Failed!\n");
    while (1);
}