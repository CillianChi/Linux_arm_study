#include "FreeRTOS.h"
#include "task.h"
#include "stdio.h"
#include "stdint.h"

extern void uart_puts(const char *str);

// 任務用 handle
static TaskHandle_t xISRNotifyTaskHandle = NULL;

// ISRNotifyTask 任務
static void vISRNotifyTask(void *pvParameters)
{
    uart_puts("[TASK] ISRNotifyTask started\r\n");

    // 儲存自己任務的 handle 供 ISR 使用
    xISRNotifyTaskHandle = xTaskGetCurrentTaskHandle();

    for (;;)
    {
        uart_puts("[TASK] Waiting notify...\r\n");
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);  // 等待 ISR 通知
        uart_puts("[ISR TASK] Notified from ISR!\r\n");
    }
}

// 由 main_full() 呼叫
void vStartMyISRNotifyTest(void)
{
    uart_puts("[TEST] vStartMyISRNotifyTest init\r\n");

    BaseType_t ret = xTaskCreate(
        vISRNotifyTask,            // 任務函式
        "ISRNotifyTask",           // 任務名稱
        256,                       // 堆疊大小
        NULL,                      // 任務參數
        tskIDLE_PRIORITY + 2,      // 優先權
        NULL);                     // 傳回的任務 handle

    if (ret == pdPASS)
    {
        uart_puts("[TEST] ISRNotifyTask created\r\n");
    }
    else
    {
        uart_puts("[TEST] Failed to create ISRNotifyTask\r\n");
    }
}

// Tick Hook，在每次 Tick 時觸發（模擬 ISR）
void vApplicationTickHook(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    if (xISRNotifyTaskHandle != NULL)
    {
        vTaskNotifyGiveFromISR(xISRNotifyTaskHandle, &xHigherPriorityTaskWoken);
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}