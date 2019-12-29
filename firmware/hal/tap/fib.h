#ifndef _FIRMWARE_FIB_H_
#define _FIRMWARE_FIB_H_

#include "stdbool.h"
#include "stdint.h"
#include "ip.h"

// Forwarding Information Base
#define FIB_NUM_LEVELS 29
#define FIB_LAST_LEVEL (FIB_NUM_LEVELS - 1)

#define FIB_INVALID_NEXTPTR 0x7fff

typedef volatile struct
{
    uint16_t nextptr[4096];
} fib_node0_t;

typedef volatile struct
{
    uint16_t _data[16];
} fib_node_t;

static inline uint16_t get_nexthop_id(fib_node_t *n)
{
    uint16_t id = 0;
    for (int i = 0; i < 16; ++i)
    {
        id |= (n->_data[i] & 0x8000) >> (15 - i);
    }
    return id;
}

static inline void set_nexthop_id(fib_node_t *n, uint16_t id)
{
    for (int i = 0; i < 16; ++i)
    {
        n->_data[i] = (n->_data[i] & 0x7fff) | ((id << (15 - i)) & 0x8000);
    }
}

static inline uint16_t get_nextptr(fib_node_t *n, size_t i)
{
    return n->_data[i] & 0x7fff;
}

static inline void set_nextptr(fib_node_t *n, size_t i, uint16_t ptr)
{
    n->_data[i] = (n->_data[i] & 0x8000) | (ptr & 0x7fff);
}

typedef volatile struct
{
    uint8_t interface;
    uint8_t onlink;
    uint8_t reserved[2];
    uint32_t ref;  // reference count
    uint64_t mac;
    uint64_t addr;
    uint64_t addr_hi;
} nexthop_info_t;

extern nexthop_info_t *const fib_nexthop;

void init_fib();
ssize_t fib_alloc_nexthop();
void fib_free_nexthop(size_t n);
int fib_query(ipv6_addr_t *addr);
int fib_update(ipv6_addr_t *prefix, uint8_t prefixlen, uint16_t nexthop_id, bool upsert);
int fib_remove(ipv6_addr_t *prefix, uint8_t prefixlen);
void fib_print_nexthop(uint16_t ptr);
void fib_print_nexthops();
void fib_print_node(uint16_t ptr, size_t level);
void fib_print();

#endif
