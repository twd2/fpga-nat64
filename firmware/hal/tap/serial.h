#ifndef _FIRMWARE_SERIAL_H_
#define _FIRMWARE_SERIAL_H_

#include "stdint.h"

void init_serial();

void putchar(uint8_t c);
uint8_t getchar();
void _putchar(char ch);

static inline int serial_poll_recv()
{
    return 0;
}

static inline int serial_poll_send()
{
    return 1;
}

#endif
