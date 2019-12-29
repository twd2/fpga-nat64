#ifndef _FIRMWARE_ARC_H_
#define _FIRMWARE_ARC_H_

#include "stdbool.h"
#include "stdint.h"

// Address Resolution Cache

#define ARC_TIME_TO_LIVE 300
#define ARC_TIME_SEND_REQUEST 150

int arc_query(uint64_t addr_lo, uint64_t addr_hi, uint64_t *mac);
void arc_update(uint64_t addr_lo, uint64_t addr_hi, uint64_t mac, bool upsert);
void arc_remove(uint64_t addr_lo, uint64_t addr_hi);
void arc_timer_row(uint32_t row);
void arc_timer();
void arc_print_row(uint32_t row);
void arc_print();

#endif
