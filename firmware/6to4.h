#ifndef _FIRMWARE_6TO4_H_
#define _FIRMWARE_6TO4_H_

#include "stdint.h"
#include "ip.h"

ssize_t v6_to_v4(ipv4_header_t *v4pkt, size_t v4len, const ipv6_header_t *v6pkt, size_t v6len,
                 size_t copy_len);

ssize_t v6_to_v4_icmp(icmpv4_header_t *v4pkt, size_t v4len,
                      const icmpv6_header_t *v6pkt, size_t v6len,
                      const uint8_t *src_bytes, const uint8_t *dst_bytes,
                      uint16_t payload_len, int only_header);

void v6_to_v4_udp_header(udp_header_t *v4pkt, const udp_header_t *v6pkt,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes);

void v6_to_v4_tcp_header(tcp_header_t *v4pkt, const tcp_header_t *v6pkt,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes);

#endif
