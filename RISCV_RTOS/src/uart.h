#ifndef UART_H
#define UART_H

void uart_init(void);
void uart_putchar(char c);
void uart_puts(const char* str);
void print_uint32(uint32_t value);
#endif // UART_H