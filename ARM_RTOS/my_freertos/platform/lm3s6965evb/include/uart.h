#ifndef UART_H
#define UART_H

#include <stdint.h>

void uart_init(void);               // 初始化 UART（一定要先叫）
void uart_putc(char c);            // 傳送單一字元
void uart_puts(const char *s);     // 傳送字串
void uart_puti(int num);           // 傳送整數（十進位）
void uart_puthex(uint32_t val);    // 傳送十六進位數字（含 0x）

#endif