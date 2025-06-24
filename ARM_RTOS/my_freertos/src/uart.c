#include <stdint.h>
#include "uart.h"
#define UART0_DR   (*(volatile uint32_t *)0x4000C000)
#define UART0_FR   (*(volatile uint32_t *)0x4000C018)

#define UART_FR_TXFF 0x20  // Transmit FIFO Full

void uart_putc(char c)
{
    // 等待 TX FIFO 有空間
    while (UART0_FR & UART_FR_TXFF);
    UART0_DR = c;
}

void uart_puts(const char *s)
{
    while (*s)
    {
        if (*s == '\n') uart_putc('\r');  // 換行自動補 CR
        uart_putc(*s++);
    }
}


void uart_puti(int num)
{
    char buf[12]; // 可容納最大 32-bit 整數
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
    for (int i = 7; i >= 0; i--) {
        uint8_t nibble = (val >> (i * 4)) & 0xF;
        if (nibble < 10)
            uart_putc('0' + nibble);
        else
            uart_putc('A' + (nibble - 10));
    }
}