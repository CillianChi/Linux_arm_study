#ifndef UART_H
#define UART_H

void uart_putc(char c);
void uart_puts(const char *str);
void uart_puti(int num);
void uart_puthex(uint32_t val);
#endif