/*
 * FreeRTOS Mutex 優先權反轉實驗程式
 * 測試目的：觀察 Priority Inversion 現象
 * 說明：建立三個任務（高、中、低優先權）共享同一個 mutex
 *        並透過任務間延遲與取得 mutex 的時機安排，模擬中斷優先權倒置的情境。
 */

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "uart.h" // 自定 UART 輸出

static SemaphoreHandle_t xMutex = NULL;

/* 低優先權任務：先取得 mutex，持有期間會被中斷，模擬佔用共享資源 */
static void vLowPriorityTask( void *pvParameters )
{
    for( ;; )
    {
        uart_puts("[Low ] Trying to take mutex\r\n");
        xSemaphoreTake( xMutex, portMAX_DELAY );
        uart_puts("[Low ] Got mutex, doing long job...\r\n");
        vTaskDelay( pdMS_TO_TICKS( 200 ) ); // 模擬長時間工作
        uart_puts("[Low ] Releasing mutex\r\n");
        xSemaphoreGive( xMutex );
        vTaskDelay( pdMS_TO_TICKS( 200 ) );
    }
}

/* 中優先權任務：不使用 mutex，週期性運行，模擬 CPU 資源爭用 */
static void vMidPriorityTask( void *pvParameters )
{
    for( ;; )
    {
        uart_puts("[Mid ] Doing work...\r\n");
        vTaskDelay( pdMS_TO_TICKS( 50 ) );
    }
}

/* 高優先權任務：需要 mutex，但會被低優先權任務阻擋 */
static void vHighPriorityTask( void *pvParameters )
{
    for( ;; )
    {
        vTaskDelay( pdMS_TO_TICKS( 100 ) ); // 等待 low task 搶先取得 mutex
        uart_puts("[High] Trying to take mutex\r\n");
        xSemaphoreTake( xMutex, portMAX_DELAY );
        uart_puts("[High] Got mutex!\r\n");
        xSemaphoreGive( xMutex );
    }
}

/* 初始化三個任務與 mutex 的函式，從 main_full() 呼叫 */
void vStartMyMutexTest( void )
{
    uart_puts("[TEST] vStartMyMutexTest init\r\n");

    xMutex = xSemaphoreCreateMutex();

    if (xMutex != NULL)
    {
        xTaskCreate( vLowPriorityTask,  "TaskLow",  configMINIMAL_STACK_SIZE, NULL, 1, NULL );
        xTaskCreate( vMidPriorityTask,  "TaskMid",  configMINIMAL_STACK_SIZE, NULL, 2, NULL );
        xTaskCreate( vHighPriorityTask, "TaskHigh", configMINIMAL_STACK_SIZE, NULL, 3, NULL );
    }
}