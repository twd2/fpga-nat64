#ifndef _FIRMWARE_ARCH_TASK_H_
#define _FIRMWARE_ARCH_TASK_H_

#include "stdint.h"

struct regs
{
    uintptr_t rbx;
    uintptr_t rsp;
    uintptr_t rbp;
    uintptr_t r12;
    uintptr_t r13;
    uintptr_t r14;
    uintptr_t r15;
    uintptr_t rip;
    uintptr_t tp; // unused
};

#define STACK_REG rsp
#define RETURN_ADDR_REG rip
#define THREAD_POINTER_REG tp

extern struct task *_current;

static inline struct task *get_current()
{
    return _current;
}

static inline void set_current(struct task *task)
{
    _current = task;
}

#endif
