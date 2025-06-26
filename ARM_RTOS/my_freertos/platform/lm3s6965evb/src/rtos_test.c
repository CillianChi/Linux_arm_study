#include "FreeRTOS.h"
#include "task.h"
#include "uart.h"
#include "queue.h"
#include "semphr.h"
#include "rtos_test.h"


//================Queue===================
static TaskHandle_t xProducerHandle = NULL;
static TaskHandle_t xConsumerHandle = NULL;
static QueueHandle_t xQueue = NULL;

//==============Semaphore 同步機制===================
SemaphoreHandle_t xBinarySemaphore = NULL;
//================Task Notification===================

static TaskHandle_t xNotifyWaitTaskHandle = NULL;
//======================ISR===========================

uint32_t SystemCoreClock = 50000000;
static TaskHandle_t xSystickNotifyTask = NULL;
#define SYSTICK_CTRL  (*(volatile uint32_t *)0xE000E010)
#define SYSTICK_LOAD  (*(volatile uint32_t *)0xE000E014)
#define SYSTICK_VAL   (*(volatile uint32_t *)0xE000E018)
// 任務 handle
TaskHandle_t xUserInterruptTask = NULL;
TaskHandle_t xDualIRQTaskHandle = NULL;
// 直接設定 Pending bit（更簡單）
#define NVIC_ISPR0    (*(volatile uint32_t *)0xE000E200)
//===== 觸發中斷用 Function =====
#define NVIC_ISER0     (*(volatile uint32_t *)0xE000E100)
#define NVIC_ISPR0     (*(volatile uint32_t *)0xE000E200)

//======================ISR===========================

#define DEMCR       (*(volatile uint32_t *)0xE000EDFC)
#define DWT_CTRL    (*(volatile uint32_t *)0xE0001000)
#define DWT_CYCCNT  (*(volatile uint32_t *)0xE0001004)
volatile uint32_t g_startCycle = 0;
volatile uint32_t g_tickCount_start = 0;
volatile uint32_t g_tickCount_end = 0;
TaskHandle_t xIsrMeasureTask = NULL;
//============timer=========================
#define TIMER0_BASE      0x40000000
#define TIMER0_LOAD      (*(volatile uint32_t *)(TIMER0_BASE + 0x00))
#define TIMER0_VALUE     (*(volatile uint32_t *)(TIMER0_BASE + 0x04))
#define TIMER0_CONTROL   (*(volatile uint32_t *)(TIMER0_BASE + 0x08))
#define TIMER0_ENABLE    (1 << 7)
#define TIMER0_PERIODIC  (1 << 6)
#define TIMER0_32BIT     (1 << 1)


//================blinky===================
static void task_hello(void *pvParameters)
{
    (void)pvParameters;
    for (;;)
    {
        uart_puts("Hello from task_hello\n");
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
static void task_blink(void *pvParameters)
{
    (void)pvParameters;
    for (;;)
    {
        uart_puts("Blink from task_blink\n");
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}
//================Queue===================
static void vProducerTask(void *pvParameters)
{
    (void)pvParameters;
    int count = 0;

    for (;;)
    {
        if (xQueueSend(xQueue, &count, 0) == pdPASS)
        {
            uart_puts("Producer: sent ");
            uart_puti(count);
            uart_puts("\n");
            count++;
        }
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
static void vConsumerTask(void *pvParameters)
{
    (void)pvParameters;
    int received;

    for (;;)
    {
        if (xQueueReceive(xQueue, &received, portMAX_DELAY) == pdPASS)
        {
            uart_puts("Consumer: received ");
            uart_puti(received);
            uart_puts("\n");
        }
    }
}
//==============Semaphore 同步機制===================
static void vWaitTask(void *pvParameters)
{
    for (;;)
    {
        if (xSemaphoreTake(xBinarySemaphore, portMAX_DELAY) == pdTRUE)
        {
            uart_puts("WaitTask: Received signal!\n");
        }
    }
}

static void vTriggerTask(void *pvParameters)
{
    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(3000)); // 每 3 秒觸發
        uart_puts("TriggerTask: Sending signal\n");
        xSemaphoreGive(xBinarySemaphore);
    }
}
//================Task Notification===================
void vNotifyWaitTask(void *pvParameters)
{
     uart_puts("vNotifyWaitTask Start!\n");
    for (;;)
    {
        // 等待通知（阻塞直到收到通知）
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        uart_puts("NotifyWaitTask: Received task notification!\n");
    }
}
void vNotifyTriggerTask(void *pvParameters)
{
     uart_puts("vNotifyTriggerTask Start!\n");

    for (;;)
    {
        vTaskDelay(pdMS_TO_TICKS(4000));
        uart_puts("NotifyTriggerTask: Sending task notification\n");
        xTaskNotifyGive(xNotifyWaitTaskHandle);
    }
}
//======================ISR==========================
// SysTick 初始化函式

/*
void SysTick_Handler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    vTaskNotifyGiveFromISR(xSystickNotifyTask, &xHigherPriorityTaskWoken);
    xPortSysTickHandler();
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
*/
static void trigger_interrupt_by_software_irq6(void)
{
    NVIC_ISPR0 |= (1 << 6);  // 設定 IRQ6 為 pending
}

static void trigger_interrupt_by_software_irq7(void)
{
    NVIC_ISPR0 |= (1 << 7);  // 設定 IRQ7 為 pending
}

//=====  Function =====
void EXTI0_IRQHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    g_startCycle = TIMER0_VALUE;  // ← 移到這裡，進入中斷再記錄時間點
    vTaskNotifyGiveFromISR(xIsrMeasureTask, &xHigherPriorityTaskWoken);

    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
void EXTI1_IRQHandler(void)  // IRQ7
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    vTaskNotifyGiveFromISR(xDualIRQTaskHandle, &xHigherPriorityTaskWoken);
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
static void vUserInterruptTask(void *pvParameters)
{
    uart_puts("vUserInterruptTask ready and waiting...\n");
    for (;;)
    {
        // 等待中斷通知
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        uart_puts("vUserInterruptTask received interrupt notify!\n");
    }
}
static void vDualIRQTask(void *pvParameters)
{
    uart_puts("vDualIRQTask ready...\n");
    for (;;)
    {
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        uart_puts("vDualIRQTask: Notified by an IRQ!\n");
    }
}
//======ISR latency + Task Notification 結合效能觀察==================
static void vIsrMeasureTask(void *pvParameters)
{
    uart_puts("vIsrMeasureTask running...\n");

    for (;;)
    {
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY);  // 阻塞直到收到中斷通知

        g_tickCount_end = xTaskGetTickCount();
        uint32_t latency = g_tickCount_end - g_tickCount_start;

        uart_puts("SysTick → Task latency = ");
        uart_puti(latency);
        uart_puts(" ticks\n");
    }
}
static void enable_dwt(void)
{
    DEMCR |= (1 << 24);        // TRCENA
    DWT_CTRL |= (1 << 0);      // CYCCNTENA
    DWT_CYCCNT = 0;            // Reset counter
}
static void dwt_init(void)
{
    enable_dwt();
    uart_puts("DWT_CYCCNT Test:\n");

    for (volatile int i = 0; i < 1000000; i++);  // 延遲
    uint32_t t1 = DWT_CYCCNT;
    for (volatile int i = 0; i < 1000000; i++);  // 再延遲
    uint32_t t2 = DWT_CYCCNT;

    uart_puthex(t1);
    uart_puts("\n");
    uart_puthex(t2);
    uart_puts("\n");
}
//===================timer===========================

static void timer_init(void)
{
    TIMER0_CONTROL = 0; // Disable timer before config
    TIMER0_LOAD = 0xFFFFFFFF;
    TIMER0_CONTROL = TIMER0_ENABLE | TIMER0_32BIT; // Free-running mode
}
void test_timer_counting(void)
{
    uart_puts("Timer Counting Test:\n");

    timer_init();

    for (int i = 0; i < 5; i++)
    {
        uart_puthex(TIMER0_VALUE);
        uart_puts("\n");
        for (volatile int j = 0; j < 100000; j++); // 等一下
    }
}
void systick_init(uint32_t ticks)
{
    SYSTICK_LOAD = ticks - 1;
    SYSTICK_VAL = 0;
    SYSTICK_CTRL = 0x07; // Enable SysTick, Interrupt, Processor Clock
}

//=================================================


// 統一進入點
void rtos_test_entry(void)
{
    uart_puts("RTOS test start222\n");
/*
    //===========================blinky======================
    xTaskCreate(task_hello, "HELLO", 256, NULL, 1, NULL);
    xTaskCreate(task_blink, "BLINK", 256, NULL, 1, NULL);
    //=========================Semaphore======================

    xBinarySemaphore = xSemaphoreCreateBinary();
    if (xBinarySemaphore != NULL)
    {
        xTaskCreate(vWaitTask, "WaitTask", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
        xTaskCreate(vTriggerTask, "TriggerTask", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
    }
    //===========================Queue======================
    // 建立 Queue (容量 5，元素大小為 int)
    xQueue = xQueueCreate(5, sizeof(int));
    if (xQueue != NULL)
    {
        xTaskCreate(vProducerTask, "Producer", configMINIMAL_STACK_SIZE, NULL, 2, &xProducerHandle);
        xTaskCreate(vConsumerTask, "Consumer", configMINIMAL_STACK_SIZE, NULL, 2, &xConsumerHandle);
    }
    else
    {
        uart_puts("Queue creation failed!\n");
    }

    //===========================Notify======================

    xTaskCreate(vNotifyWaitTask, "NotifyWait", configMINIMAL_STACK_SIZE, NULL, 2, &xNotifyWaitTaskHandle);
    xTaskCreate(vNotifyTriggerTask, "NotifyTrig", configMINIMAL_STACK_SIZE, NULL, 2, NULL);

    //===========================ISR======================
    // 建立 SysTick 任務
    xTaskCreate(vDualIRQTask, "DualIRQ", configMINIMAL_STACK_SIZE, NULL, 2, &xDualIRQTaskHandle);
    // 開啟 IRQ6 與 IRQ7
    NVIC_ISER0 = (1 << 6) | (1 << 7);
    // 等待一點時間再觸發
    for (volatile int i = 0; i < 1000000; i++);
    uart_puts("Trigger IRQ6...\n");
    trigger_interrupt_by_software_irq6();
    for (volatile int i = 0; i < 1000000; i++);
    uart_puts("Trigger IRQ7...\n");
    trigger_interrupt_by_software_irq7();
    // 初始化 SysTick（每秒觸發）
    //SysTick_Config(SystemCoreClock / 1);  // 1Hz, 1秒中斷一次
  
    //========================ISR latency + Task Notification=========================
  
 // 建立任務
xTaskCreate(vIsrMeasureTask, "ISRMeasure", configMINIMAL_STACK_SIZE, NULL, 3, &xIsrMeasureTask);

// 啟用 SysTick，每 10ms（假設系統時脈為 50MHz）
systick_init(SystemCoreClock / 100);  // 10ms 中斷一次

    // 修改中斷處理器讓它通知 xIsrMeasureTask
    // 已在 EXTI0_IRQHandler 改成通知 xIsrMeasureTask
    // 啟用並觸發 IRQ6
    NVIC_ISER0 = (1 << 6);   // Enable IRQ6
    NVIC_ISPR0 = (1 << 6);   // Trigger IRQ6
      */
}

