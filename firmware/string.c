#include "string.h"

int strcmp(const char *a, const char *b)
{
    while (*a && *b)
    {
        if (*a != *b) return 1;
        ++a;
        ++b;
    }
    return !(*a == 0 && *b == 0);
}

void memset(void *dst, uint8_t b, size_t len)
{
    uint8_t *u8 = (uint8_t *)dst;
    for (size_t i = 0; i < len; ++i) u8[i] = b;
}

int memcmp(const void *a, const void *b, size_t len)
{
    uint8_t *u8a = (uint8_t *)a, *u8b = (uint8_t *)b;
    for (size_t i = 0; i < len; ++i) if (u8a[i] != u8b[i]) return 1;
    return 0;
}

void memcpy(void *dst, const void *src, size_t len)
{
    uint8_t *dst8 = (uint8_t *)dst, *src8 = (uint8_t *)src;
    for (size_t i = 0; i < len; ++i) *dst8++ = *src8++;
}
