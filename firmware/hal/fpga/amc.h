#ifndef _FIRMWARE_AMC_H_
#define _FIRMWARE_AMC_H_

#include "stdbool.h"
#include "stdint.h"
#include "ip.h"

// Address Mapping Cache

#define NUM_AMC_WAYS 4
#define NUM_AMC_ROWS 1024

#define AMC_ATIME_SHIFT 4

#define AMC_VALID_MASK 0x1
#define AMC_TAG_MASK 0x2
#define AMC_VALUE_MASK 0x4
#define AMC_ATIME_MASK 0x8
#define AMC_MASK_ALL 0xf

#define AMC_TIME_TO_LIVE 60

int amc_query(ipv6_addr_t addr, ipv6_addr_t *naddr, bool update_atime);
void amc_update(ipv6_addr_t addr, ipv6_addr_t naddr, bool upsert);
void amc_remove(ipv6_addr_t addr);
void amc_timer_row(uint32_t row);
void amc_timer();
void amc_print_row(uint32_t row);
void amc_print();

#endif
