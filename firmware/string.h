#ifndef _FIRMWARE_STRING_H_
#define _FIRMWARE_STRING_H_

#include "stdint.h"

int strcmp(const char *a, const char *b);
void memset(void *dst, uint8_t b, size_t len);
int memcmp(const void *a, const void *b, size_t len);
void memcpy(void *dst, const void *src, size_t len);

#endif
