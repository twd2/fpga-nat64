#ifndef _FIRMWARE_SERIAL_H_
#define _FIRMWARE_SERIAL_H_

#include "stdint.h"

#define UART_BASE 0x60000000
#define UART_RX (*(volatile uint32_t *)(UART_BASE + 0x0))
#define UART_TX (*(volatile uint32_t *)(UART_BASE + 0x4))
#define UART_STAT (*(volatile uint32_t *)(UART_BASE + 0x8))
#define UART_CTRL (*(volatile uint32_t *)(UART_BASE + 0xc))

#define UART_TX_FIFO_FULL 8
#define UART_RX_FIFO_VALID 1

void init_serial();

void putchar(uint8_t c);
uint8_t getchar();
void _putchar(char ch);

static inline int serial_poll_recv()
{
    return UART_STAT & UART_RX_FIFO_VALID;
}

static inline int serial_poll_send()
{
    return !(UART_STAT & UART_TX_FIFO_FULL);
}

#endif
