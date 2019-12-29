#include "amc.h"
#include "asm.h"
#include "printf.h"
#include "utils.h"
#include "error.h"
#include "ip.h"

int amc_query(uint64_t addr_lo, uint64_t addr_hi, uint64_t *naddr_lo, uint64_t *naddr_hi)
{
    return -ENOIMPL;
}

// Add address map: `tag` -> `value`
// upsert: insert when not found
void amc_update(uint64_t addr_lo, uint64_t addr_hi, uint64_t naddr_lo, uint64_t naddr_hi, bool upsert)
{

}

void amc_remove(uint64_t addr_lo, uint64_t addr_hi)
{

}

void amc_timer_row(uint32_t row)
{

}

void amc_timer()
{

}

// Print AMC entry at `row`
void amc_print_row(uint32_t row)
{

}

// Print AMC table
void amc_print()
{

}
