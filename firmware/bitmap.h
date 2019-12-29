#ifndef _FIRMWARE_BITMAP_H_
#define _FIRMWARE_BITMAP_H_

#include "stdbool.h"
#include "stdint.h"

typedef struct
{
    uint64_t size;
    uint64_t block_size;
    uint64_t next;
    uint64_t used;
    uint64_t bits[];
} bitmap_t;

void bitmap_create(bitmap_t *bm, size_t size);
ssize_t bitmap_alloc(bitmap_t *bm);

static inline bool bitmap_is_in_use(bitmap_t *bm, size_t n)
{
    size_t index = n >> 6;
    uint64_t mask = 1ul << (n & 63);
    return bm->bits[index] & mask;
}

void bitmap_free(bitmap_t *bm, size_t n);

#endif
