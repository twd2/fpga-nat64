#ifndef _FIRMWARE_TIMER_H_
#define _FIRMWARE_TIMER_H_

#include "stdint.h"
#include "eth.h"

typedef struct
{
    uint64_t start;
    uint64_t delta;
    uint64_t timeout;
} timer_t;

static inline void set_timer(timer_t *t, uint64_t delta)
{
    t->start = eth_get_clock();
    t->delta = delta;
    t->timeout = 0;
}

static inline int poll_timer(timer_t *t)
{
    if (t->timeout) return 1;
    if ((eth_get_clock() - t->start) >= t->delta)
    {
        t->timeout = 1;
        return 1;
    }
    return 0;
}

#endif
