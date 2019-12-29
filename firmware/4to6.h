#ifndef _FIRMWARE_4TO6_H_
#define _FIRMWARE_4TO6_H_

#include "stdint.h"
#include "ip.h"

ssize_t v4_to_v6(ipv6_header_t *v6pkt, size_t v6len, const ipv4_header_t *v4pkt, size_t v4len,
                 size_t copy_len);

ssize_t v4_to_v6_icmp(icmpv6_header_t *v6pkt, size_t v6len,
                      const icmpv4_header_t *v4pkt, size_t v4len,
                      const uint8_t *src_bytes, const uint8_t *dst_bytes,
                      uint16_t payload_len, int only_header);

void v4_to_v6_udp_header(udp_header_t *v6pkt, const udp_header_t *v4pkt,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes);

void v4_to_v6_tcp_header(tcp_header_t *v6pkt, const tcp_header_t *v4pkt,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes);

#endif
