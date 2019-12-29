#ifndef _FIRMWARE_ASM_H_
#define _FIRMWARE_ASM_H_

#include "stdint.h"

static inline void fence()
{
    asm volatile ("fence");
}

static inline void fence_i()
{
    asm volatile ("fence.i");
}

static inline uint64_t mtval()
{
    uint64_t v;
    asm volatile ("csrr %0, mtval" : "=r"(v));
    return v;
}

static inline uint64_t mcause()
{
    uint64_t v;
    asm volatile ("csrr %0, mcause" : "=r"(v));
    return v;
}

static inline uint64_t mepc()
{
    uint64_t v;
    asm volatile ("csrr %0, mepc" : "=r"(v));
    return v;
}

#define STACK_OFFSET (0)

#endif
