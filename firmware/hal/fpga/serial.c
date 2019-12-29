#include "serial.h"

void init_serial()
{
}

void putchar(uint8_t c)
{
    while (!serial_poll_send());
    UART_TX = c;
}

uint8_t getchar()
{
    while (!serial_poll_recv());
    return UART_RX;
}

// for printf.h
void _putchar(char ch) __attribute__((alias("putchar")));
