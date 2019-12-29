#include "amc.h"
#include "config_regs.h"
#include "asm.h"
#include "printf.h"
#include "utils.h"
#include "error.h"
#include "ip.h"

static inline uint64_t way_mask(uint64_t mask, int way)
{
    return mask << (way << 2);
}

int amc_query(ipv6_addr_t addr, ipv6_addr_t *naddr, bool update_atime)
{
    ETH_AMC_ADDR = addr.u64[0];
    ETH_AMC_ADDR_HI = addr.u64[1];
    ETH_AMC_HASH_EN = 1;
    fence();
    ETH_AMC_WRITE_EN = 0;
    fence();

    int way = 0;
    uint64_t match = ETH_AMC_MATCH;
    if (match & 0x1) way = 0;
    else if (match & 0x2) way = 1;
    else if (match & 0x4) way = 2;
    else if (match & 0x8) way = 3;
    else return -ENOFOUND;

    if (naddr)
    {
        *naddr = make_ipv6(ETH_AMC_VALUE[way], ETH_AMC_VALUE_HI[way]);
    }

    if (update_atime)
    {
        ETH_AMC_ATIME[way] = ETH_CLOCK >> AMC_ATIME_SHIFT;
        fence();
        ETH_AMC_WRITE_EN = way_mask(AMC_ATIME_MASK, way);
        fence();
    }
    return 0;
}

// Add address map: `tag` -> `value`
// upsert: insert when not found
void amc_update(ipv6_addr_t addr, ipv6_addr_t naddr, bool upsert)
{
    // Read the corresponding row.
    ETH_AMC_ADDR = addr.u64[0];
    ETH_AMC_ADDR_HI = addr.u64[1];
    ETH_AMC_HASH_EN = 1;
    fence();
    ETH_AMC_WRITE_EN = 0;
    fence();

    // Choose a way
    int way = 0;
    uint64_t match = ETH_AMC_MATCH;
    uint64_t valid = ETH_AMC_VALID;
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
        uint16_t min_atime = ETH_AMC_ATIME[0];
        way = 0;
        for (int i = 1; i < NUM_AMC_WAYS; ++i)
        {
            uint16_t atime = ETH_AMC_ATIME[i];
            if (atime < min_atime)
            {
                way = i;
                min_atime = atime;
            }
        }
        // TODO: put back victim addresses to the pool.
    }

    // Update.
    ETH_AMC_VALID = 1 << way;
    ETH_AMC_TAG[way] = addr.u64[0];
    ETH_AMC_TAG_HI[way] = addr.u64[1];
    ETH_AMC_VALUE[way] = naddr.u64[0];
    ETH_AMC_VALUE_HI[way] = naddr.u64[1];
    ETH_AMC_ATIME[way] = ETH_CLOCK >> AMC_ATIME_SHIFT;
    fence();
    ETH_AMC_WRITE_EN = way_mask(AMC_MASK_ALL, way);
    fence();
}

void amc_remove(ipv6_addr_t addr)
{
    ETH_AMC_ADDR = addr.u64[0];
    ETH_AMC_ADDR_HI = addr.u64[1];
    ETH_AMC_HASH_EN = 1;
    fence();
    ETH_AMC_WRITE_EN = 0;
    fence();

    // If match, then clear valid bit.
    ETH_AMC_VALID &= ~ETH_AMC_MATCH;
    fence();
    // Write valid bit for each way.
    ETH_AMC_WRITE_EN = way_mask(AMC_VALID_MASK, 0) | way_mask(AMC_VALID_MASK, 1)
                       | way_mask(AMC_VALID_MASK, 2) | way_mask(AMC_VALID_MASK, 3);
    fence();
}

void amc_timer_row(uint32_t row)
{
    // Read this row.
    ETH_AMC_ADDR = row;
    ETH_AMC_ADDR_HI = 0;
    ETH_AMC_HASH_EN = 0;
    fence();
    ETH_AMC_WRITE_EN = 0;
    fence();

    uint64_t now = ETH_CLOCK >> AMC_ATIME_SHIFT;
    uint64_t valid = ETH_AMC_VALID;
    uint64_t not_valid = 0;
    ipv4_addr_t to_free[NUM_AMC_WAYS * 2];
    int num_free = 0;
    for (int i = 0; i < NUM_AMC_WAYS; ++i)
    {
        uint64_t ratime = now - ETH_AMC_ATIME[i];
        if (ratime > AMC_TIME_TO_LIVE)
        {
            not_valid |= 1 << i;

            ipv6_addr_t addr = make_ipv6(ETH_AMC_TAG[i], ETH_AMC_TAG_HI[i]);
            if (is_ipv4(addr))
            {
                to_free[num_free] = extract_ipv4(addr);
                ++num_free;
            }
            addr = make_ipv6(ETH_AMC_VALUE[i], ETH_AMC_VALUE_HI[i]);
            if (is_ipv4(addr))
            {
                to_free[num_free] = extract_ipv4(addr);
                ++num_free;
            }
        }
    }

    if (valid & not_valid)
    {
        ETH_AMC_VALID = valid & ~not_valid;
        fence();
        // Write valid bit for each way.
        ETH_AMC_WRITE_EN = way_mask(AMC_VALID_MASK, 0) | way_mask(AMC_VALID_MASK, 1)
                           | way_mask(AMC_VALID_MASK, 2) | way_mask(AMC_VALID_MASK, 3);
        fence();
    }

    for (int i = 0; i < num_free; ++i)
    {
        // TODO: put back addresses to the pool.
    }
}

void amc_timer()
{
    for (int i = 0; i < NUM_AMC_ROWS; ++i)
    {
        amc_timer_row(i);
        // TODO: call sched_yield()
    }
}

// Print AMC entry at `row`
void amc_print_row(uint32_t row)
{
    // Read this row.
    ETH_AMC_ADDR = row;
    ETH_AMC_ADDR_HI = 0;
    ETH_AMC_HASH_EN = 0;
    fence();
    ETH_AMC_WRITE_EN = 0;
    fence();

    uint64_t valid = ETH_AMC_VALID;
    if (!valid) return;

    printf("row = %d\r\n", row);
    for (int i = 0; i < NUM_AMC_WAYS; ++i)
    {
        uint64_t buff[2];
        printf("  %x ", (valid >> i) & 1);
        buff[0] = ETH_AMC_TAG[i];
        buff[1] = ETH_AMC_TAG_HI[i];
        print_ipv6((uint8_t *)buff);
        puts(" ");
        buff[0] = ETH_AMC_VALUE[i];
        buff[1] = ETH_AMC_VALUE_HI[i];
        print_ipv6((uint8_t *)buff);
        printf(" %d\r\n", (uint16_t)ETH_AMC_ATIME[i]);
    }
}

// Print AMC table
void amc_print()
{
    puts("Address Mapping Cache:\r\n");
    for (int i = 0; i < NUM_AMC_ROWS; ++i) amc_print_row(i);
}
