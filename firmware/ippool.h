#ifndef _FIRMWARE_IPPOOL_H_
#define _FIRMWARE_IPPOOL_H_

#include "stdbool.h"
#include "stdint.h"
#include "ip.h"

#define IPPOOL_SIZE 8192

void ippool_create();
int ippool_alloc(ipv4_addr_t *a);
void ippool_free(ipv4_addr_t a);

#endif
