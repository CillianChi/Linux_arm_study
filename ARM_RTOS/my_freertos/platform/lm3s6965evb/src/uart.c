#include <stdint.h>
#include "uart.h"

/* CMSDK UART0 寄存器定義（mps2-an385 使用） */
#define UART0_BASE       0x40004000
#define UART0_DR         (*(volatile uint32_t *)(UART0_BASE + 0x00))  // Data Register
#define UART0_STATE      (*(volatile uint32_t *)(UART0_BASE + 0x04))  // 狀態（TX FULL）
#define UART0_CTRL       (*(volatile uint32_t *)(UART0_BASE + 0x08))  // 控制暫存器
#define UART0_BAUDDIV    (*(volatile uint32_t *)(UART0_BASE + 0x10))  // 除頻值

#define UART_TX_FULL     (1 << 0)  // TX FIFO full flag

void uart_init(void)
{
    UART0_CTRL = 0x03;        // Enable TX (bit0) + RX (bit1)
    UART0_BAUDDIV = 16;       // 除頻值 16 ⇒ 50MHz / 16 ≒ 115200 baud
}

void uart_putc(char c)
{
    while (UART0_STATE & UART_TX_FULL);  // 等待 FIFO 不滿
    UART0_DR = c;
}

void uart_puts(const char *s)
{
    while (*s)
    {
        if (*s == '\n') uart_putc('\r');
        uart_putc(*s++);
    }
}

void uart_puti(int num)
{
    char buf[12];
    int i = 10;
    buf[11] = '\0';

    if (num == 0)
    {
        uart_putc('0');
        return;
    }

    int is_negative = (num < 0);
    if (is_negative) num = -num;

    while (num > 0 && i >= 0)
    {
        buf[i--] = '0' + (num % 10);
        num /= 10;
    }

    if (is_negative) buf[i--] = '-';

    uart_puts(&buf[i + 1]);
}

void uart_puthex(uint32_t val)
{
    uart_puts("0x");
    for (int i = 7; i >= 0; i--)
    {
        uint8_t nibble = (val >> (i * 4)) & 0xF;
        if (nibble < 10)
            uart_putc('0' + nibble);
        else
            uart_putc('A' + (nibble - 10));
    }
}