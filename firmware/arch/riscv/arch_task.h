#ifndef _FIRMWARE_ARCH_TASK_H_
#define _FIRMWARE_ARCH_TASK_H_

#include "stdint.h"

struct regs
{
    uintptr_t ra;
    uintptr_t sp;
    uintptr_t tp;
    uintptr_t s0;
    uintptr_t s1;
    uintptr_t s2;
    uintptr_t s3;
    uintptr_t s4;
    uintptr_t s5;
    uintptr_t s6;
    uintptr_t s7;
    uintptr_t s8;
    uintptr_t s9;
    uintptr_t s10;
    uintptr_t s11;
};

#define STACK_REG sp
#define RETURN_ADDR_REG ra
#define THREAD_POINTER_REG tp

static inline struct task *get_current()
{
    register uintptr_t tp asm("tp");
    return (struct task *)tp;
}

static inline void set_current(struct task *task)
{
    asm volatile ("mv tp, %0"
                  :
                  : "r"(task));
}

#endif
