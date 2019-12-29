#ifndef _FIRMWARE_ARC_H_
#define _FIRMWARE_ARC_H_

#include "stdbool.h"
#include "stdint.h"
#include "ip.h"

// Address Resolution Cache

#define NUM_ARC_WAYS 4
#define NUM_ARC_ROWS 1024

#define ARC_ATIME_SHIFT 4

#define ARC_VALID_MASK 0x1
#define ARC_TAG_MASK 0x2
#define ARC_VALUE_MASK 0x4
#define ARC_ATIME_MASK 0x8
#define ARC_MASK_ALL 0xf

#define ARC_TIME_TO_LIVE 300
#define ARC_TIME_SEND_BROADCAST_REQUEST (ARC_TIME_TO_LIVE - 3 * 5 - 1)
#define ARC_TIME_SEND_UNICAST_REQUEST_END 240
#define ARC_TIME_SEND_UNICAST_REQUEST (ARC_TIME_SEND_UNICAST_REQUEST_END - 3 * 5 - 1)

typedef struct
{
    int iface;
    bool unicast;
    uint64_t mac;
    ipv6_addr_t addr;
} arc_request_t;
typedef void (*arc_request_handler_t)(arc_request_t *req);

int arc_query(ipv6_addr_t addr, uint64_t *mac, bool update_atime);
void arc_update(ipv6_addr_t addr, uint64_t mac, bool upsert);
void arc_remove(ipv6_addr_t addr);
void arc_timer_row(uint32_t row, arc_request_handler_t func);
void arc_timer(arc_request_handler_t func);
void arc_print_row(uint32_t row);
void arc_print();

#endif
