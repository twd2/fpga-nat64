#include "arc.h"
#include "config_regs.h"
#include "asm.h"
#include "printf.h"
#include "utils.h"
#include "error.h"
#include "task.h"

static inline uint64_t way_mask(uint64_t mask, int way)
{
    return mask << (way << 2);
}

int arc_query(ipv6_addr_t addr, uint64_t *mac, bool update_atime)
{
    ETH_ARC_ADDR = addr.u64[0];
    ETH_ARC_ADDR_HI = addr.u64[1];
    ETH_ARC_HASH_EN = 1;
    fence();
    ETH_ARC_WRITE_EN = 0;
    fence();

    int way = 0;
    uint64_t match = ETH_ARC_MATCH;
    if (match & 0x1) way = 0;
    else if (match & 0x2) way = 1;
    else if (match & 0x4) way = 2;
    else if (match & 0x8) way = 3;
    else return -ENOFOUND;

    if (mac)
    {
        *mac = ETH_ARC_VALUE[way];
    }

    if (update_atime)
    {
        ETH_ARC_ATIME[way] = ETH_CLOCK >> ARC_ATIME_SHIFT;
        fence();
        ETH_ARC_WRITE_EN = way_mask(ARC_ATIME_MASK, way);
        fence();
    }
    return 0;
}

// Add address map: `addr` -> `mac`
// upsert: insert when not found
void arc_update(ipv6_addr_t addr, uint64_t mac, bool upsert)
{
    // Read the corresponding row.
    ETH_ARC_ADDR = addr.u64[0];
    ETH_ARC_ADDR_HI = addr.u64[1];
    ETH_ARC_HASH_EN = 1;
    fence();
    ETH_ARC_WRITE_EN = 0;
    fence();

    // Choose a way.
    int way = 0;
    uint64_t match = ETH_ARC_MATCH;
    uint64_t valid = ETH_ARC_VALID;
    if (!match && !upsert) return;
    if (match & 0x1) way = 0;
    else if (match & 0x2) way = 1;
    else if (match & 0x4) way = 2;
    else if (match & 0x8) way = 3;
    else if (!(valid & 0x1)) way = 0;
    else if (!(valid & 0x2)) way = 1;
    else if (!(valid & 0x4)) way = 2;
    else if (!(valid & 0x8)) way = 3;
    else
    {
        // LRU
        uint16_t min_atime = ETH_ARC_ATIME[0];
        way = 0;
        for (int i = 1; i < NUM_ARC_WAYS; ++i)
        {
            uint16_t atime = ETH_ARC_ATIME[i];
            if (atime < min_atime)
            {
                way = i;
                min_atime = atime;
            }
        }
    }

    // Update.
    ETH_ARC_VALID = 1 << way;
    ETH_ARC_TAG[way] = addr.u64[0];
    ETH_ARC_TAG_HI[way] = addr.u64[1];
    ETH_ARC_VALUE[way] = mac;
    ETH_ARC_ATIME[way] = ETH_CLOCK >> ARC_ATIME_SHIFT;
    fence();
    ETH_ARC_WRITE_EN = way_mask(ARC_MASK_ALL, way);
    fence();
}

void arc_remove(ipv6_addr_t addr)
{
    ETH_ARC_ADDR = addr.u64[0];
    ETH_ARC_ADDR_HI = addr.u64[1];
    ETH_ARC_HASH_EN = 1;
    fence();
    ETH_ARC_WRITE_EN = 0;
    fence();

    // If match, then clear valid bit.
    ETH_ARC_VALID &= ~ETH_ARC_MATCH;
    fence();
    // Write valid bit for each way.
    ETH_ARC_WRITE_EN = way_mask(ARC_VALID_MASK, 0) | way_mask(ARC_VALID_MASK, 1)
                       | way_mask(ARC_VALID_MASK, 2) | way_mask(ARC_VALID_MASK, 3);
    fence();
}

void arc_timer_row(uint32_t row, arc_request_handler_t func)
{
    /*
        For each address resolution cache entry,
        if it is going to expire, send corresponding ARP request or NDP solicitation.
    */

    // Read this row.
    ETH_ARC_ADDR = row;
    ETH_ARC_ADDR_HI = 0;
    ETH_ARC_HASH_EN = 0;
    fence();
    ETH_ARC_WRITE_EN = 0;
    fence();

    uint64_t now = ETH_CLOCK >> ARC_ATIME_SHIFT;
    uint64_t valid = ETH_ARC_VALID;
    uint64_t not_valid = 0;
    arc_request_t request[NUM_ARC_WAYS];
    int num_requests = 0;
    for (int i = 0; i < NUM_ARC_WAYS; ++i)
    {
        if (!((valid >> i) & 1)) continue;
        uint64_t ratime = now - ETH_ARC_ATIME[i];
        if (ratime > ARC_TIME_TO_LIVE)
        {
            not_valid |= 1 << i;
        }
        else if (ratime > ARC_TIME_SEND_BROADCAST_REQUEST)
        {
            request[num_requests].iface = 0; // TODO: iface?
            request[num_requests].unicast = false;
            request[num_requests].addr = make_ipv6(ETH_ARC_TAG[i], ETH_ARC_TAG_HI[i]);
            ++num_requests;
        }
        else if (ratime > ARC_TIME_SEND_UNICAST_REQUEST_END)
        {
            // Do nothing.
        }
        else if (ratime > ARC_TIME_SEND_UNICAST_REQUEST)
        {
            request[num_requests].iface = 0; // TODO: iface?
            request[num_requests].unicast = true;
            request[num_requests].mac = ETH_ARC_VALUE[i];
            request[num_requests].addr = make_ipv6(ETH_ARC_TAG[i], ETH_ARC_TAG_HI[i]);
            ++num_requests;
        }
    }

    if (valid & not_valid)
    {
        ETH_ARC_VALID = valid & ~not_valid;
        fence();
        // Write valid bit for each way.
        ETH_ARC_WRITE_EN = way_mask(ARC_VALID_MASK, 0) | way_mask(ARC_VALID_MASK, 1)
                           | way_mask(ARC_VALID_MASK, 2) | way_mask(ARC_VALID_MASK, 3);
        fence();
    }

    for (int i = 0; i < num_requests; ++i)
    {
        if (func)
        {
            func(&request[i]);
        }
    }
}

void arc_timer(arc_request_handler_t func)
{
    for (int i = 0; i < NUM_ARC_ROWS; ++i)
    {
        arc_timer_row(i, func);
        if ((i & 0x7f) == 0x7f) sched_yield();
    }
}

// Print ARC entry at `row`
void arc_print_row(uint32_t row)
{
    // Read this row.
    ETH_ARC_ADDR = row;
    ETH_ARC_ADDR_HI = 0;
    ETH_ARC_HASH_EN = 0;
    fence();
    ETH_ARC_WRITE_EN = 0;
    fence();

    uint64_t valid = ETH_ARC_VALID;
    if (!valid) return;

    printf("row = %d\r\n", row);
    for (int i = 0; i < NUM_ARC_WAYS; ++i)
    {
        uint64_t buff[2];
        printf("  %x ", (valid >> i) & 1);
        buff[0] = ETH_ARC_TAG[i];
        buff[1] = ETH_ARC_TAG_HI[i];
        print_ipv6((uint8_t *)buff);
        puts(" ");
        buff[0] = ETH_ARC_VALUE[i];
        print_mac((uint8_t *)buff);
        printf(" %d\r\n", (uint16_t)ETH_ARC_ATIME[i]);
    }
}

// Print ARC table
void arc_print()
{
    puts("Address Resolution Cache:\r\n");
    for (int i = 0; i < NUM_ARC_ROWS; ++i) arc_print_row(i);
}
