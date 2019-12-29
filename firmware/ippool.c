#include "ippool.h"
#include "error.h"
#include "bitmap.h"
#include "ip.h"

__attribute__ ((aligned (16)))
static uint8_t _pool_data[sizeof(bitmap_t) + IPPOOL_SIZE / 8];
static bitmap_t *pool_bm = (bitmap_t *)_pool_data;

void ippool_create()
{
    size_t pool_size = ntohl(~ipv4_pool_mask.u32);
    if (IPPOOL_SIZE < pool_size) pool_size = IPPOOL_SIZE;
    bitmap_create(pool_bm, pool_size);
}

int ippool_alloc(ipv4_addr_t *a)
{
    ssize_t ret = bitmap_alloc(pool_bm);
    if (ret < 0) return ret;
    a->u32 = ipv4_pool_prefix.u32 | htonl(ret);
    return 0;
}

void ippool_free(ipv4_addr_t a)
{
    size_t n = ntohl(a.u32 & ~ipv4_pool_mask.u32);
    bitmap_free(pool_bm, n);
}
