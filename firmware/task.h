#ifndef _FIRMWARE_TASK_H_
#define _FIRMWARE_TASK_H_

#include "stdint.h"
#include "arch_task.h"
#include "timer.h"

#define TICKS_PER_SECOND 16
#define NUM_TASKS 10

struct task
{
    struct regs regs;
    uint64_t wait;
    timer_t timer;
};

#define WAIT_SERIAL_RECV (1 << 0)
#define WAIT_SERIAL_SEND (1 << 1)
#define WAIT_ETH_RECV (1 << 2)
#define WAIT_ETH_SEND (1 << 3)

struct task *switch_to(struct task *curr, struct task *next);

static inline struct task *get_current();
static inline void set_current(struct task *task);
#define current (get_current())

extern struct task *const idle_task;

void init_task();
void create_task(struct task *task, uintptr_t stack, void *entry);
void add_task(struct task *task);
void idle_entry();

void sched_yield();
void wait(uint64_t w);
void sleep(uint64_t delta);

#endif
