#include "FreeRTOS.h"
#include "task.h"
#include "uart.h"
#include "timers.h"
#include "queue.h"
#include "portable.h"
#include "riscv-virt.h"
#include "portmacro.h"   // 確保定義了 BaseType_t 等型別
/* Standard includes. */
#include <stdio.h>
#include <string.h>

#define Memory_test 1
#define Timer_ISR_test 0



TimerHandle_t xTimer;
#define MONITOR_TASK_1   "LED_FAST"
#define MONITOR_TASK_2   "LED_SLOW"

static UBaseType_t maxUsage_FAST = 0;
static UBaseType_t maxUsage_SLOW = 0;
#if(Memory_test)
//=========memory test==================
void vStackUsageMonitorTask(void *pvParameters)
{
    (void) pvParameters;

    for (;;)
    {
        TaskHandle_t xFast = xTaskGetHandle("LED_1");
        TaskHandle_t xSlow = xTaskGetHandle("LED_2");

        if (xFast)
        {
            UBaseType_t remain = uxTaskGetStackHighWaterMark(xFast);
            UBaseType_t used = 256 - remain; // 假設你給這個任務 stack size 是 256

            if (used > maxUsage_FAST) maxUsage_FAST = used;

            printf("[STACK] LED_1 用量: %d words，最大用量: %d words\n", used, maxUsage_FAST);
        }

        if (xSlow)
        {
            UBaseType_t remain = uxTaskGetStackHighWaterMark(xSlow);
            UBaseType_t used = 256 - remain;

            if (used > maxUsage_SLOW) maxUsage_SLOW = used;

            printf("[STACK] LED_2 用量: %d words，最大用量: %d words\n", used, maxUsage_SLOW);
        }

        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void vMy_LED_Task1(void *pvParameters)
{
    const char *taskName = "LED_1";

    for (;;)
    {
        printf("%s blink!\n", taskName);

        UBaseType_t remaining = uxTaskGetStackHighWaterMark(NULL);
        printf("[STACK] %s 剩餘 stack: %d words\n", taskName, (int)remaining);

        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void vMy_LED_Task2(void *pvParameters)
{
    const char *taskName = "LED_2";

    for (;;)
    {
        printf("%s blink!\n", taskName);

        UBaseType_t remaining = uxTaskGetStackHighWaterMark(NULL);
        printf("[STACK] %s 剩餘 stack: %d words\n", taskName, (int)remaining);

        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
void vStackOverflowTask(void *pvParameters)
{
    volatile uint32_t dummy[300];  // 故意吃掉太多 stack

    for (int i = 0; i < 300; i++) {
        dummy[i] = i;
    }


    for (;;)
    {
        printf("Stack overflow candidate...\n");
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

void vFatWorker(void *pvParameters)
{
    const char *name = (const char *)pvParameters;
    uint32_t counter = 0;
    for (;;)
    {
        printf("[TASK %s] Running... (%lu)\n", name, counter++);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}


void vMassiveTaskCreator(void *pvParameters)
{
    (void)pvParameters;
    char nameBuf[16];
    int i = 0;

    for (;;)
    {
        snprintf(nameBuf, sizeof(nameBuf), "TASK_%02d", i);

        TaskHandle_t xHandle = NULL;
        BaseType_t result = xTaskCreate(
            vFatWorker,
            nameBuf,
            512,         // 很大的 stack（你可以調小觀察差異）
            (void *)nameBuf,
            1,
            &xHandle);

        if (result != pdPASS)
        {
            printf("❌ Failed to create task %s (Maybe no heap?)\n", nameBuf);
            break;
        }
        else
        {
            printf("✅ Created %s\n", nameBuf);
        }

        i++;
        vTaskDelay(pdMS_TO_TICKS(300));  // 每 300ms 建一個新任務
    }
}
void vHeapStressTestTask(void *pvParameters)
{
    (void)pvParameters;

    for (;;)
    {
        void *ptrs[10] = {0};

        // 嘗試配置 10 個 block，每個大小遞增
        for (int i = 0; i < 10; i++)
        {
            size_t size = 100 + (i * 50);  // 100、150、200... bytes
            ptrs[i] = pvPortMalloc(size);

            if (ptrs[i] == NULL)
            {
                printf("[HEAP] ❌ Malloc failed at index %d (size %d bytes)\n", i, (int)size);
            }
            else
            {
                printf("[HEAP] ✅ Alloc index %d, size %d bytes, addr = %x\n", i, (int)size, ptrs[i]);
            }
        }

        // 顯示 heap 使用狀態
        printf("[HEAP] Free: %u bytes, Min ever: %u bytes\n",
               (unsigned int)xPortGetFreeHeapSize(),
               (unsigned int)xPortGetMinimumEverFreeHeapSize());

        // 釋放所有已配置的區塊
        for (int i = 0; i < 10; i++)
        {
            if (ptrs[i] != NULL)
            {
                vPortFree(ptrs[i]);
                ptrs[i] = NULL;
            }
        }

        // 再等一下
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}
// 簡單的任務
static void vTaskLED(void *pvParameters) {
    const char *taskName = (const char *)pvParameters;
    for (;;) {
        printf("LED_TASK1 !\r\n", taskName);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

int main_task(void) {
    extern void freertos_vector_table(void);
    __asm__ volatile("csrw mtvec, %0" : : "r"( (uintptr_t)freertos_vector_table | 0x1 ));

    xTaskCreate(vMy_LED_Task1, "LED_1", 256, NULL, 1, NULL);
    xTaskCreate(vMy_LED_Task2, "LED_2", 256, NULL, 1, NULL);
    // xTaskCreate(vStackOverflowTask, "BAD_STACK", 128, NULL, 1, NULL);
    
    xTaskCreate(vMassiveTaskCreator, "Creator", 512, NULL, 1, NULL);
    xTaskCreate(vStackUsageMonitorTask, "Monitor", 512, NULL, 2, NULL);
    xTaskCreate(vHeapStressTestTask, "HeapTest", 256, NULL, 1, NULL);
    vTaskStartScheduler();

    return 0;
}
#endif







extern TaskHandle_t xNotifyTaskHandle;  // 確保你有正確 extern 宣告

static UBaseType_t maxUsage_ISR = 0;
void vStackUsageMonitorTask_isr(void *pvParameters)
{
 (void) pvParameters;

    for (;;)
    {
        if (xNotifyTaskHandle != NULL)
        {
            UBaseType_t remain = uxTaskGetStackHighWaterMark(xNotifyTaskHandle);
            UBaseType_t used = 256 - remain; // 根據 ISR 任務 stack 設定值調整這個數字

            if (used > maxUsage_ISR) maxUsage_ISR = used;

            printf("[STACK] ISR_NOTIFY 用量: %d words，最大用量: %d words\n", used, maxUsage_ISR);
        }
        else
        {
            printf("[STACK] ISR_NOTIFY 任務尚未建立\n");
        }

        vTaskDelay(pdMS_TO_TICKS(1000));  // 每 1 秒更新一次
    }
}





#if(Timer_ISR_test)
// 全域任務 handle
TaskHandle_t xNotifyTaskHandle = NULL;
#define xPortSysTickHandler freertos_risc_v_mtimer_interrupt_handler
void freertos_risc_v_mtimer_interrupt_handler(void);
// === CSR & CLINT Timer 寄存器 ===
#define CLINT_BASE      0x2000000UL
#define MTIME_ADDR      ((volatile uint64_t *)(CLINT_BASE + 0xBFF8))
#define MTIMECMP_ADDR   ((volatile uint64_t *)(CLINT_BASE + 0x4000))
#define TIMER_INTERVAL  (2500000) // QEMU 頻率下約 1 秒

static inline uint32_t read_csr_mcause(void)
{
    uint32_t value;
    asm volatile("csrr %0, mcause" : "=r"(value));
    return value;
}

// === 自定 trap_handler（重定向 vector.S 中 RQ_7）===
#ifdef CILLIAN_TEST
extern void xPortSysTickHandler(void); // FreeRTOS 時脈更新
void trap_handler(void)
{
    uint32_t mcause = read_csr_mcause();

    if ((mcause & 0x80000000) && ((mcause & 0xff) == 7)) // Machine Timer 中斷
    {
        //uart_puts("[ISR] Timer interrupt!\r\n");

        // 1. 更新 RTOS Tick（一定要）
        xPortSysTickHandler();
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        uart_puts("[ISR] Sending task notify start\r\n");
        xTaskNotifyFromISR(xNotifyTaskHandle, 1, eIncrement, &xHigherPriorityTaskWoken);
        uart_puts("[ISR] Sending task notify end\r\n");

        // 3. 重設 Timer，讓中斷週期性觸發
        *MTIMECMP_ADDR = *MTIME_ADDR + TIMER_INTERVAL;

        // 4. 若需 context switch，要求切換
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);

        if (xHigherPriorityTaskWoken == pdTRUE)
    uart_puts("[ISR] A context switch is required!\r\n");
else
    uart_puts("[ISR] No higher priority task ready.\r\n");
        
    }
}


#endif
//volatile uint32_t notifyCounter = 0;
// === 任務定義 ===
void vISRNotifyTask(void *pvParameters)
{
    uart_puts("[TASK] ISRNotifyTask started\n");
    for (;;)
    {
        uart_puts("[ISR TASK] waiting for notification...\n");
        uint32_t count = ulTaskNotifyTake(pdTRUE, portMAX_DELAY);

        char msg[64];
        snprintf(msg, sizeof(msg), "[ISR TASK] Notification received! count = %lu\n", count);
        uart_puts(msg);

        // 額外 delay 一下，避免佔用太多 UART
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

// === CLINT Timer 設定 ===
void setup_clint_timer(void)
{
    *MTIMECMP_ADDR = *MTIME_ADDR + TIMER_INTERVAL;
    asm volatile("csrs mie, %0" : : "r"(0x80));     // 啟用 M-Timer interrupt
    asm volatile("csrs mstatus, %0" : : "r"(0x8));  // 全域中斷
    uart_puts("[DEBUG] setup_clint_timer OK\r\n");
}

// === mtvec 設定 ===
extern void freertos_vector_table(void);

// === Stack Overflow Hook ===
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
    static BaseType_t xHigherPriorityTaskWoken;
    static int tickCount = 0;

    tickCount++;
    if (tickCount % 1000 == 0)
    {
        vTaskNotifyGiveFromISR(xNotifyTaskHandle, &xHigherPriorityTaskWoken);
    }
}

// === main() 任務入口 ===
int main_task_isr_my(void)
{
    // 直接設 mtvec 為你的 trap_handler（而非 freertos_vector_table）
__asm__ volatile("csrw mtvec, %0" : : "r"((uintptr_t)freertos_vector_table | 0x1));

    uart_puts("main_task_isr！\r\n");

    xTaskCreate(vISRNotifyTask, "NOTIFY", 256, NULL, 8, &xNotifyTaskHandle);

    // 移到 scheduler 啟動前
    setup_clint_timer();

    vTaskStartScheduler();

    while (1); // 永遠不會執行到
}
#endif