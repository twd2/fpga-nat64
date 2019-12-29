#ifndef _FIRMWARE_ETH_H_
#define _FIRMWARE_ETH_H_

#include "stdint.h"

#define _GNU_SOURCE
#include <unistd.h>
#include <sys/time.h>

void init_eth();

void eth_begin_dma_recv(void *data, uint32_t len);
void eth_begin_dma_send(void *data, uint32_t len);
int eth_poll_recv();
int eth_poll_send();

static inline int eth_num_iface()
{
    return 1;
}

#include "task.h"

static inline uint64_t eth_get_clock()
{
    struct timeval tv;
    gettimeofday(&tv, 0);
    return tv.tv_sec * TICKS_PER_SECOND + tv.tv_usec / (1000000 / TICKS_PER_SECOND);
}

static inline uint64_t eth_get_vendor()
{
    return 0x8686868686868686;
}

extern uint16_t eth_default_nexthop_id;

static inline uint16_t eth_get_default_nexthop_id()
{
    return eth_default_nexthop_id;
}

static inline void eth_set_default_nexthop_id(uint16_t nexthop_id)
{
    eth_default_nexthop_id = nexthop_id;
}

extern uint64_t eth_mac[];

static inline uint64_t eth_get_mac(int i)
{
    return eth_mac[i];
}

static inline void eth_set_mac(int i, uint64_t mac)
{
    eth_mac[i] = mac; 
}

extern uint16_t eth_mtu[];

static inline uint16_t eth_get_mtu(int i)
{
    return eth_mtu[i];
}

static inline void eth_set_mtu(int i, uint16_t mtu)
{
    eth_mtu[i] = mtu; 
}

#include "ethernet.h"

static inline uint64_t eth_get_config(int i)
{
    return CONFIG_EN;
}

static inline void eth_set_config(int i, uint64_t config)
{

}

#endif
