#include "serial.h"
#include <unistd.h>

void init_serial()
{
}

void putchar(uint8_t c)
{
    write(1, &c, 1);
}

uint8_t getchar()
{
    return -1;
}

// for printf.h
void _putchar(char ch) __attribute__((alias("putchar")));
