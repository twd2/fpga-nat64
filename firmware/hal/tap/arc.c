#include "arc.h"
#include "asm.h"
#include "printf.h"
#include "utils.h"
#include "error.h"

int arc_query(uint64_t addr_lo, uint64_t addr_hi, uint64_t *mac)
{
    return -ENOIMPL;
}

// Add address map: `addr` -> `mac`
// upsert: insert when not found
void arc_update(uint64_t addr_lo, uint64_t addr_hi, uint64_t mac, bool upsert)
{

}

void arc_remove(uint64_t addr_lo, uint64_t addr_hi)
{

}

void arc_timer_row(uint32_t row)
{

}

void arc_timer()
{

}

// Print ARC entry at `row`
void arc_print_row(uint32_t row)
{

}

// Print ARC table
void arc_print()
{

}
