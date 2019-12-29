#include "bitmap.h"
#include "error.h"
#include "utils.h"

void bitmap_create(bitmap_t *bm, size_t size)
{
    bm->size = size;
    bm->block_size = size >> 6;
    bm->next = 0;
    bm->used = 0;
}

ssize_t bitmap_alloc(bitmap_t *bm)
{
    if (bm->used == bm->size)
    {
        return -ENOMEM;
    }
    size_t index = bm->next;
    for (size_t i = 0; i < bm->block_size; ++i)
    {
        if (bm->bits[index] != -1ul)
        {
            size_t offset = bits_find_zero(bm->bits[index]);
            bm->bits[index] |= 1 << offset;
            bm->next = index;
            ++bm->used;
            return (index << 6) | offset;
        }
        if (index == bm->block_size - 1) index = 0;
        else ++index;
    }
    return -ENOMEM;
}

void bitmap_free(bitmap_t *bm, size_t n)
{
    size_t index = n >> 6;
    uint64_t mask = 1ul << (n & 63);
    if (!(bm->bits[index] & mask))
    {
        // TODO: freeing a non-allocated block???
    }
    bm->bits[index] &= ~mask;
    --bm->used;
}
