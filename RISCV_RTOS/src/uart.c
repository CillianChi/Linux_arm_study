#include <stdint.h>
#include "uart.h"

#define UART0_BASE  0x10000000
#define UART_THR    0x00
#define UART_LSR    0x05
#define UART_LSR_THRE 0x20

static volatile uint8_t* const thr = (uint8_t*)(UART0_BASE + UART_THR);
static volatile uint8_t* const lsr = (uint8_t*)(UART0_BASE + UART_LSR);

void uart_init(void) {
    // 如果要初始化 UART，這裡可以設定波特率、格式等，QEMU 模擬可不設
}

void uart_putchar(char c) {
    while (!(*lsr & UART_LSR_THRE)) {
        ; // 等待發送暫存器空
    }
    *thr = (uint8_t)c;
}

void uart_puts(const char* str) {
    while (*str) {
        uart_putchar(*str++);
    }
}
void print_uint32(uint32_t value)
{
    char buf[12];
    int i = 10;
    buf[11] = '\0';
    if (value == 0) {
        uart_puts("0\r\n");
        return;
    }
    while (value && i > 0) {
        buf[i--] = '0' + (value % 10);
        value /= 10;
    }
    uart_puts(&buf[i + 1]);
    uart_puts("\r\n");
}