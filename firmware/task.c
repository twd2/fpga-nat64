#include "task.h"
#include "serial.h"
#include "eth.h"
#include "timer.h"

static struct task _idle_task;
struct task *const idle_task = &_idle_task;

static struct task *tasks[NUM_TASKS];
static size_t num_task = 0;
static size_t num_waiting_task = 0;

void init_task()
{
    create_task(idle_task, 0 /* don't care */, 0 /* don't care */);
    set_current(idle_task);
}

void create_task(struct task *task, uintptr_t stack, void *entry)
{
    task->regs.STACK_REG = stack;
    task->regs.RETURN_ADDR_REG = (uintptr_t)entry;
    task->regs.THREAD_POINTER_REG = (uintptr_t)task;
    task->timer.timeout = 1;
    add_task(task);
}

void add_task(struct task *task)
{
    tasks[num_task] = task;
    ++num_task;
}

static struct task *find_task_waiting_for(uint64_t wait)
{
    for (size_t i = 0; i < num_task; ++i)
    {
        if (tasks[i]->wait & wait)
        {
            return tasks[i];
        }
    }
    return 0;
}

static int switch_to_task_waiting_for(uint64_t wait)
{
    struct task *next = find_task_waiting_for(wait);
    if (!next) return 0;
    switch_to(current, next);
    return 1;
}

void idle_entry()
{
    size_t rr = 0;
    while (1)
    {
        if (serial_poll_recv()) return;/*switch_to_task_waiting_for(WAIT_SERIAL_RECV);*/ // FIXME!
        // if (serial_poll_send()) switch_to_task_waiting_for(WAIT_SERIAL_SEND);
        if (eth_poll_recv()) switch_to_task_waiting_for(WAIT_ETH_RECV);
        if (eth_poll_send()) switch_to_task_waiting_for(WAIT_ETH_SEND);
        if (num_waiting_task < num_task)
        {
            for (size_t i = 0; i < num_task; ++i)
            {
                struct task *task = tasks[rr];
                ++rr;
                if (rr == num_task) rr = 0;
                if (task != current && !task->wait && poll_timer(&task->timer))
                {
                    switch_to(current, task);
                    break;
                }
            }
        }
    }
}

void sched_yield()
{
    switch_to(current, idle_task);
}

void wait(uint64_t w)
{
    current->wait |= w;
    ++num_waiting_task;
    sched_yield();
    --num_waiting_task;
    current->wait &= ~w;
}

void sleep(uint64_t delta)
{
    set_timer(&current->timer, delta);
    sched_yield();
}
