#include "fib.h"
#include "asm.h"
#include "printf.h"
#include "utils.h"
#include "ip.h"
#include "bitmap.h"
#include "error.h"

static fib_node0_t _fib_level0;
fib_node0_t *const fib_level0 = &_fib_level0;

fib_node_t _fib_levels[29][1024];
fib_node_t *const fib_levels[29] = {
    _fib_levels[0], _fib_levels[1], _fib_levels[2], _fib_levels[3],
    _fib_levels[4], _fib_levels[5], _fib_levels[6], _fib_levels[7],
    _fib_levels[8], _fib_levels[9], _fib_levels[10], _fib_levels[11],
    _fib_levels[12], _fib_levels[13], _fib_levels[14], _fib_levels[15],
    _fib_levels[16], _fib_levels[17], _fib_levels[18], _fib_levels[19],
    _fib_levels[20], _fib_levels[21], _fib_levels[22], _fib_levels[23],
    _fib_levels[24], _fib_levels[25], _fib_levels[26], _fib_levels[27],
    _fib_levels[28]
};
static nexthop_info_t _fib_nexthop[1024];
nexthop_info_t *const fib_nexthop = &_fib_nexthop[0];

__attribute__ ((aligned (16)))
static uint8_t _bitmap_data[FIB_NUM_LEVELS + 1][sizeof(bitmap_t) + 1024 / 8];

static bitmap_t *fib_levels_bm[FIB_NUM_LEVELS];
static bitmap_t *fib_nexthop_bm;

void init_fib()
{
    for (int i = 0; i < FIB_NUM_LEVELS; ++i)
    {
        fib_levels_bm[i] = (bitmap_t *)_bitmap_data[i];
        bitmap_create(fib_levels_bm[i], 1024);
    }
    fib_nexthop_bm = (bitmap_t *)_bitmap_data[FIB_NUM_LEVELS];
    bitmap_create(fib_nexthop_bm, 1024);

    uint64_t *ptr = (uint64_t *)fib_level0;
    for (int i = 0; i < 1024; ++i) ptr[i] = -1;
    ptr = (uint64_t *)fib_levels[0];
    for (int i = 0; i < 29 * 4096; ++i) ptr[i] = -1;
    ptr = (uint64_t *)fib_nexthop;
    for (int i = 0; i < 4096; ++i) ptr[i] = -1;
}

static void fib_clear_node(fib_node_t *n)
{
    uint64_t *u64 = (uint64_t *)n;
    u64[0] = -1;
    u64[1] = -1;
    u64[2] = -1;
    u64[3] = -1;
}

static ssize_t fib_alloc_node(size_t level)
{
    ssize_t ptr = bitmap_alloc(fib_levels_bm[level]);
    if (ptr < 0) return ptr;
    fib_clear_node(fib_levels[level] + ptr);
    return ptr;
}

static void fib_free_node(size_t level, size_t n)
{
    bitmap_free(fib_levels_bm[level], n);
}

ssize_t fib_alloc_nexthop()
{
    return bitmap_alloc(fib_nexthop_bm);
}

void fib_free_nexthop(size_t n)
{
    bitmap_free(fib_nexthop_bm, n);
}

int fib_query(ipv6_addr_t *addr)
{
    uint16_t nexthop_id = eth_get_default_nexthop_id();

    uint64_t part =
        (((uint64_t)addr->u8[0] << 4) & 0xff0) | (((uint64_t)addr->u8[1] >> 4) & 0x00f);
    uint64_t ptr = fib_level0->nextptr[part];
    uint8_t usedlen = 12;

    for (int level = 0; level < FIB_NUM_LEVELS; ++level)
    {
        if (ptr >= FIB_INVALID_NEXTPTR)
        {
            goto query_ret;
        }

        uint16_t nexthop_id_candidate = get_nexthop_id(fib_levels[level] + ptr);
        if (nexthop_id_candidate < FIB_INVALID_NEXTPTR)
        {
            nexthop_id = nexthop_id_candidate;
        }

        part = (addr->u8[usedlen >> 3] >> (4 - (usedlen & 4))) & 0xf;
        // If usedlen % 8 == 0, use high 4 bits;
        // if usedlen % 8 == 4, use low 4 bits.
        ptr = get_nextptr(fib_levels[level] + ptr, part);
        usedlen += 4;
    }

    // The last level.
    if (ptr < FIB_INVALID_NEXTPTR)
    {
        nexthop_id = ptr;
    }

query_ret:
    if (nexthop_id < FIB_INVALID_NEXTPTR) return nexthop_id;
    return -ENOFOUND;
}

int fib_update(ipv6_addr_t *prefix, uint8_t prefixlen, uint16_t nexthop_id, bool upsert)
{
    if (prefixlen < 12)
    {
        // TODO
        return -ENOIMPL;
    }

    if ((prefixlen & 3) != 0)
    {
        // TODO
        return -ENOIMPL;
    }

    uint64_t last_part =
        (((uint64_t)prefix->u8[0] << 4) & 0xff0) | (((uint64_t)prefix->u8[1] >> 4) & 0x00f);
    uint64_t ptr = fib_level0->nextptr[last_part];
    uint64_t parent_ptr = FIB_INVALID_NEXTPTR;
    uint8_t usedlen = 12;
    for (int level = 0; level < FIB_NUM_LEVELS; ++level)
    {
        if (ptr >= FIB_INVALID_NEXTPTR)
        {
            if (!upsert) return 0;

            ssize_t ret = fib_alloc_node(level);
            if (ret < 0) return ret;
            ptr = ret;
            // Update parent.
            if (level == 0)
            {
                fib_level0->nextptr[last_part] = ptr;
            }
            else
            {
                set_nextptr(fib_levels[level - 1] + parent_ptr, last_part, ptr);
            }
        }

        if (usedlen == prefixlen)
        {
            set_nexthop_id(fib_levels[level] + ptr, nexthop_id);
            return 0;
        }

        parent_ptr = ptr;
        last_part = (prefix->u8[usedlen >> 3] >> (4 - (usedlen & 4))) & 0xf;
        // If usedlen % 8 == 0, use high 4 bits;
        // if usedlen % 8 == 4, use low 4 bits.
        ptr = get_nextptr(fib_levels[level] + ptr, last_part);
        usedlen += 4;
    }

    // The last level.
    set_nextptr(fib_levels[FIB_LAST_LEVEL] + parent_ptr, last_part, nexthop_id);
    return 0;
}

int fib_remove(ipv6_addr_t *prefix, uint8_t prefixlen)
{
    // TODO
    return -ENOIMPL;
}

void fib_print_nexthop(uint16_t ptr)
{
    if (!bitmap_is_in_use(fib_nexthop_bm, ptr)) return;

    nexthop_info_t *ni = fib_nexthop + ptr;
    printf("Nexthop Info. @ 0x%04x:\r\n", ptr);
    printf("  Interface: %d\r\n", ni->interface);
    if (!ni->onlink)
    {
        printf("  Nexthop: ");
        print_ipv6((uint8_t *)&ni->addr);
        printf("\r\n  MAC: ");
        print_mac((uint8_t *)&ni->mac);
        printf("\r\n");
    }
    else
    {
        printf("  Onlink.\r\n");
    }
}

void fib_print_nexthops()
{
    puts("Nexthop Information:\r\n");
    for (int i = 0; i < 1024; ++i)
    {
        fib_print_nexthop(i);
    }
}

void fib_print_node(uint16_t ptr, size_t level)
{
    fib_node_t *n = fib_levels[level] + ptr;
    uint16_t nexthop_id = get_nexthop_id(n);
    if (nexthop_id < FIB_INVALID_NEXTPTR)
    {
        for (int i = 0; i < level + 1; ++i)
        {
            printf("  ");
        }
        printf("Nexthop: 0x%04x\r\n", nexthop_id);
    }
    for (int i = 0; i < 16; ++i)
    {
        uint16_t nextptr = get_nextptr(n, i);
        if (nextptr < FIB_INVALID_NEXTPTR)
        {
            for (int i = 0; i < level + 1; ++i)
            {
                printf("  ");
            }
            if (level < FIB_LAST_LEVEL)
            {
                printf("%x @ 0x%04x:\r\n", i, nextptr);
                fib_print_node(nextptr, level + 1);
            }
            else if (level == FIB_LAST_LEVEL)
            {
                printf("%x: Nexthop: 0x%04x\r\n", i, nextptr);
            }
            else
            {
                // ???
            }
        }
    }
}

__attribute__ ((aligned (16))) uint8_t _big_stack[4096];
uint64_t _saved_sp;

void fib_print()
{
    // FIXME: magic!!!
    asm volatile
    (
        "mov %%rsp, %0\n\t"
        "lea %1, %%rsp\n\t"
        : "=m"(_saved_sp)
        : "m"(_big_stack[sizeof(_big_stack) + STACK_OFFSET])
    );
    printf("Default Route Nexthop: 0x%04x\r\n", eth_get_default_nexthop_id());
    puts("Forwarding Information Base:\r\n");
    for (int i = 0; i < 4096; ++i)
    {
        uint16_t nextptr = fib_level0->nextptr[i];
        if (nextptr < FIB_INVALID_NEXTPTR)
        {
            printf("%03x @ 0x%04x:\r\n", i, nextptr);
            fib_print_node(nextptr, 0);
        }
    }
    asm volatile
    (
        "mov %0, %%rsp\n\t"
        :
        : "m"(_saved_sp)
    );
}
