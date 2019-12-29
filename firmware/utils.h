#ifndef _FIRMWARE_UTILS_H_
#define _FIRMWARE_UTILS_H_

#include "stdint.h"
#include "ethernet.h"

void puts(char *s);
void getline(char *buf, size_t len);

void print_mem(void *data, size_t len, char delim, int newline);
void print_mac(uint8_t *data);
void print_ipv6(uint8_t *data);
void print_reason(uint8_t reason);
void print_frame(frame_t *frame);

static inline size_t bits_find_zero(uint64_t b)
{
    b = ~b;
    b = b & -b;  // to one-hot
    size_t i = 0;
    if (b & 0xffffffff00000000) i += 32;
    if (b & 0xffff0000ffff0000) i += 16;
    if (b & 0xff00ff00ff00ff00) i += 8;
    if (b & 0xf0f0f0f0f0f0f0f0) i += 4;
    if (b & 0xcccccccccccccccc) i += 2;
    if (b & 0xaaaaaaaaaaaaaaaa) i += 1;
    return i;
}

#endif
