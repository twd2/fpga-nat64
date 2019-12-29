#ifndef _FIRMWARE_ETH_H_
#define _FIRMWARE_ETH_H_

#include "stdint.h"
#include "config_regs.h"

#define DMA_BASE 0x60100000
#define DMA_MM2S_DMACR (*(volatile uint32_t *)(DMA_BASE + 0x0))
#define DMA_MM2S_DMASR (*(volatile uint32_t *)(DMA_BASE + 0x4))
#define DMA_MM2S_SA (*(volatile uint32_t *)(DMA_BASE + 0x18))
#define DMA_MM2S_SA_MSB (*(volatile uint32_t *)(DMA_BASE + 0x1c))
#define DMA_MM2S_LENGTH (*(volatile uint32_t *)(DMA_BASE + 0x28))
#define DMA_S2MM_DMACR (*(volatile uint32_t *)(DMA_BASE + 0x30))
#define DMA_S2MM_DMASR (*(volatile uint32_t *)(DMA_BASE + 0x34))
#define DMA_S2MM_DA (*(volatile uint32_t *)(DMA_BASE + 0x48))
#define DMA_S2MM_DA_MSB (*(volatile uint32_t *)(DMA_BASE + 0x4c))
#define DMA_S2MM_LENGTH (*(volatile uint32_t *)(DMA_BASE + 0x58))

#define DMA_DMACR_RS 1
#define DMA_DMASR_HALTED 1
#define DMA_DMASR_IDLE 2

void init_eth();

void eth_begin_dma_recv(void *data, uint32_t len);
void eth_begin_dma_send(void *data, uint32_t len);

static inline int eth_poll_recv()
{
    return DMA_S2MM_DMASR & DMA_DMASR_IDLE;
}

extern int eth_send_not_begin;

static inline int eth_poll_send()
{
    return eth_send_not_begin || (DMA_MM2S_DMASR & DMA_DMASR_IDLE);
}

static inline int eth_num_iface()
{
    return 4;
}

static inline uint64_t eth_get_clock()
{
    return ETH_CLOCK;
}

static inline uint64_t eth_get_vendor()
{
    return ETH_VENDOR;
}

static inline uint16_t eth_get_default_nexthop_id()
{
    return ETH_DEFAULT_NEXTHOP_ID;
}

static inline void eth_set_default_nexthop_id(uint16_t nexthop_id)
{
    ETH_DEFAULT_NEXTHOP_ID = nexthop_id;
}

static inline uint64_t eth_get_mac(int i)
{
    return ETH_MAC[i];
}

static inline void eth_set_mac(int i, uint64_t mac)
{
    ETH_MAC[i] = mac;
}

static inline uint16_t eth_get_mtu(int i)
{
    return ETH_MTU[i];
}

static inline void eth_set_mtu(int i, uint16_t mtu)
{
    ETH_MTU[i] = mtu;
}

static inline uint64_t eth_get_config(int i)
{
    return ETH_CONFIG[i];
}

static inline void eth_set_config(int i, uint64_t config)
{
    ETH_CONFIG[i] = config;
}

#include "ip.h"

static inline ipv6_addr_t eth_get_ipv4_converted_prefix()
{
    return make_ipv6(ETH_IPV4_CONVERTED_PREFIX, ETH_IPV4_CONVERTED_PREFIX_HI);
}

static inline ipv6_addr_t eth_get_ipv4_translatable_prefix()
{
    return make_ipv6(ETH_IPV4_TRANSLATABLE_PREFIX, ETH_IPV4_TRANSLATABLE_PREFIX_HI);
}

static inline ipv4_addr_t eth_get_ipv6_converted_prefix()
{
    return make_ipv4(ETH_IPV6_CONVERTED_PREFIX);
}

static inline ipv4_addr_t eth_get_ipv6_converted_mask()
{
    return make_ipv4(ETH_IPV6_CONVERTED_MASK);
}

static inline ipv4_addr_t eth_get_ipv4_pool_prefix()
{
    return make_ipv4(ETH_IPV4_POOL_PREFIX);
}

static inline ipv4_addr_t eth_get_ipv4_pool_mask()
{
    return make_ipv4(ETH_IPV4_POOL_MASK);
}

#endif
