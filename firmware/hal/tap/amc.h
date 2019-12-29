#ifndef _FIRMWARE_AMC_H_
#define _FIRMWARE_AMC_H_

#include "stdbool.h"
#include "stdint.h"

// Address Mapping Cache

#define AMC_TIME_TO_LIVE 60

int amc_query(uint64_t addr_lo, uint64_t addr_hi, uint64_t *naddr_lo, uint64_t *naddr_hi);
void amc_update(uint64_t addr_lo, uint64_t addr_hi, uint64_t naddr_lo, uint64_t naddr_hi, bool upsert);
void amc_remove(uint64_t addr_lo, uint64_t addr_hi);
void amc_timer_row(uint32_t row);
void amc_timer();
void amc_print_row(uint32_t row);
void amc_print();

#endif
