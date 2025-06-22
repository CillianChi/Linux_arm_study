#include "ns16550.h"
#include <stdint.h>

#define UART_BASE  0x10000000UL  // QEMU-VIRT UART base

static inline uint8_t readb(uintptr_t addr) {
    return *((volatile uint8_t *)addr);
}

static inline void writeb(uint8_t val, uintptr_t addr) {
    *((volatile uint8_t *)addr) = val;
}

// 將單一字元送出
void ns16550_putchar(char c) {
    while (!(readb(UART_BASE + REG_LSR) & LSR_THRE));
    writeb(c, UART_BASE + REG_THR);
}

// 字串輸出（可在 FreeRTOS Task 中用）
void ns16550_puts(const char *s) {
    while (*s) {
        if (*s == '\n') {
            ns16550_putchar('\r'); // 為終端兼容性補 \r
        }
        ns16550_putchar(*s++);
    }
}

// UART 初始化，建議在 main() 或系統啟動時呼叫
void ns16550_init() {
    writeb(0x00, UART_BASE + REG_IER);              // Disable interrupts
    writeb(0x03, UART_BASE + REG_LCR);              // 8 bits, no parity, one stop bit
    writeb(0x01, UART_BASE + REG_FCR);              // Enable FIFO
    writeb(0x03, UART_BASE + REG_MCR);              // RTS, DTR set
}