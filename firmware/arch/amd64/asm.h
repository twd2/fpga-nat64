#ifndef _FIRMWARE_ASM_H_
#define _FIRMWARE_ASM_H_

#include "stdint.h"

static inline void fence()
{
    asm volatile ("");
}

static inline void fence_i()
{
    asm volatile ("");
}

#define STACK_OFFSET (-8)

#endif
