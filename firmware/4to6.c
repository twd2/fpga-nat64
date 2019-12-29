#include "4to6.h"
#include "string.h"
#include "ip.h"
#include "amc.h"
#include "printf.h"

ssize_t v4_to_v6(ipv6_header_t *v6pkt, size_t v6len, const ipv4_header_t *v4pkt, size_t v4len,
                 size_t copy_len)
{
    if (v4len < sizeof(ipv4_header_t)) return -1;
    if (v6len < sizeof(ipv6_header_t)) return -2;
    size_t v4header_len = 4 * (v4pkt->version_header_len & 0xf);
    uint16_t payload_len = ntohs(v4pkt->total_len) - v4header_len;
    if (payload_len < copy_len) copy_len = payload_len;
    if (v4len < v4header_len + copy_len) return -3;
    if (v6len < sizeof(ipv6_header_t) + copy_len) return -4;

    const void *v4payload = (const uint8_t *)v4pkt + v4header_len;
    size_t v4payload_len = v4len - v4header_len;
    void *v6payload = v6pkt + 1;
    size_t v6payload_len = v6len - sizeof(ipv6_header_t);

    // Check fragmentation.
    size_t fragment_offset = ntohs(v4pkt->flags) & 0x1fff;
    uint32_t fragment_mf = ntohs(v4pkt->flags) & IPV4_MF_BIT;
    size_t fragment_header_len = 0;
    int is_fragment = fragment_mf || (fragment_offset != 0);
    if (is_fragment)
    {
        if (v6len < sizeof(ipv6_header_t) + sizeof(ipv6_fragment_header_t) + copy_len) return -400;
        fragment_header_len = sizeof(ipv6_fragment_header_t);
    }

    // Translate the header.
    v6pkt->version_flow = 0x60;
    v6pkt->payload_len = htons(fragment_header_len + payload_len);
    v6pkt->next_header = is_fragment ? IPV6_NEXT_HEADER_FRAGMENT : v4pkt->next_header;
    v6pkt->hop_limit = v4pkt->hop_limit;

    // Translate addresses.
    if (ipv4_is_ipv6_converted(v4pkt->src))
    {
        v6pkt->src = ipv4_translatable(v4pkt->src);
    }
    else if (ipv4_is_ipv4_pool(v4pkt->src))
    {
        int ret = amc_query(ipv4_compatible(v4pkt->src), &v6pkt->src, true);
        if (ret < 0) return ret;
    }
    else
    {
        v6pkt->src = ipv4_converted(v4pkt->src);
    }

    if (ipv4_is_ipv6_converted(v4pkt->dst))
    {
        v6pkt->dst = ipv4_translatable(v4pkt->dst);
    }
    else if (ipv4_is_ipv4_pool(v4pkt->dst))
    {
        int ret = amc_query(ipv4_compatible(v4pkt->dst), &v6pkt->dst, true);
        if (ret < 0) return ret;
    }
    else
    {
        v6pkt->dst = ipv4_converted(v4pkt->dst);
    }

    // Handle fragmentation.
    if (is_fragment)
    {
        ipv6_fragment_header_t *frag_header = (ipv6_fragment_header_t *)v6payload;
        v6payload = frag_header + 1;
        v6payload_len -= sizeof(ipv6_fragment_header_t);
        frag_header->next_header = v4pkt->next_header;
        frag_header->reserved1 = 0;
        frag_header->offset_mf = htons((fragment_offset << 3) | (fragment_mf >> 13));
        frag_header->id = htonl(ntohs(v4pkt->id));
    }

    // Translate upper-layer protocol data.
    if (fragment_offset == 0 &&
        copy_len >= sizeof(icmpv6_header_t) && v4pkt->next_header == IPV4_NEXT_HEADER_ICMP)
    {
        // We are going to copy all of the payload, but this is an ICMP packet,
        // so we should translate it.
#ifdef VERBOSE
        printf("  This is an ICMP packet.\n");
#endif
        int only_header = copy_len != payload_len || copy_len == sizeof(icmpv6_header_t);
        int ret = v4_to_v6_icmp((icmpv6_header_t *)v6payload, v6payload_len,
                                (const icmpv4_header_t *)v4payload, v4payload_len,
                                v6pkt->src.u8, v6pkt->dst.u8,
                                payload_len, only_header);
        if (ret <= 0) return ret;
        copy_len = ret;
        if (!only_header)
        {
            payload_len = ret;
            v6pkt->payload_len = htons(payload_len);
        }
        v6pkt->next_header = IPV6_NEXT_HEADER_ICMP;
    }
#ifdef TRANSLATE_UDP
    else if (fragment_offset == 0 &&
             copy_len >= sizeof(udp_header_t) && v4pkt->next_header == IP_NEXT_HEADER_UDP)
    {
        // Copy the payload.
        memcpy(v6payload, v4payload, copy_len);
        // Adjust the UDP header.
        v4_to_v6_udp_header((udp_header_t *)v6payload, (const udp_header_t *)v4payload,
                            v4pkt->src.u8, v4pkt->dst.u8,
                            v6pkt->src.u8, v6pkt->dst.u8);
    }
#endif
#ifdef TRANSLATE_TCP
    else if (fragment_offset == 0 &&
             copy_len >= sizeof(tcp_header_t) && v4pkt->next_header == IP_NEXT_HEADER_TCP)
    {
        // Copy the payload.
        memcpy(v6payload, v4payload, copy_len);
        // Adjust the TCP header.
        v4_to_v6_tcp_header((tcp_header_t *)v6payload, (const tcp_header_t *)v4payload,
                            v4pkt->src.u8, v4pkt->dst.u8,
                            v6pkt->src.u8, v6pkt->dst.u8);
    }
#endif
    else
    {
        // Just copy the payload.
        memcpy(v6payload, v4payload, copy_len);
    }

    return sizeof(ipv6_header_t) + fragment_header_len + copy_len;
}

static inline int v4_to_v6_icmp_type_code(uint16_t type_code)
{
#define DO_TYPE_CODE(name) \
case ICMPV4_TYPE_CODE_##name: \
    return ICMPV6_TYPE_CODE_##name;
    switch (type_code)
    {
    DO_TYPE_CODE(TTL)
    DO_TYPE_CODE(DEFRAG)
    DO_TYPE_CODE(NETWORK_UNREACHABLE)
    DO_TYPE_CODE(ADDRESS_UNREACHABLE)
    DO_TYPE_CODE(PORT_UNREACHABLE)
    default:
        return -1;
    }
#undef DO_TYPE_CODE
}

static inline ssize_t v4_to_v6_icmp_ip_payload(icmpv6_header_t *v6pkt, size_t v6len,
                                               const icmpv4_header_t *v4pkt, size_t v4len,
                                               const uint8_t *src_bytes, const uint8_t *dst_bytes)
{
    int ret;
    if ((ret = v4_to_v6((ipv6_header_t *)(v6pkt + 1), v6len - sizeof(icmpv6_header_t),
                        (ipv4_header_t *)(v4pkt + 1), v4len - sizeof(icmpv4_header_t), 8)) <= 0)
    {
        return ret;
    }
    size_t len = sizeof(icmpv6_header_t) + ret;
    uint32_t checksum = ip_checksum_partial(src_bytes, 16) + ip_checksum_partial(dst_bytes, 16);
    checksum += htons(len >> 16) + htons(len & 0xffff);
    checksum += IPV6_NEXT_HEADER_ICMP << 8;
    checksum += ip_checksum_partial(v6pkt, len);
    v6pkt->checksum = ip_checksum_final(checksum);
    return len;
}

static inline ssize_t v4_to_v6_icmp_data_payload(icmpv6_header_t *v6pkt, size_t v6len,
                                                 const icmpv4_header_t *v4pkt, size_t v4len,
                                                 const uint8_t *src_bytes, const uint8_t *dst_bytes,
                                                 uint16_t payload_len, int only_header)
{
    if (!only_header)
    {
        if (v6len < sizeof(icmpv6_header_t) + v4len - sizeof(icmpv4_header_t)) return -17;
        memcpy(v6pkt + 1, v4pkt + 1, v4len - sizeof(icmpv4_header_t));
    }
    // Incrementally update the checksum.
    uint32_t checksum = ~v4pkt->checksum & 0xffff;
    // 0 -> src, dst
    checksum += ip_checksum_partial(src_bytes, 16);
    checksum += ip_checksum_partial(dst_bytes, 16);
    // type, code changed
    checksum += ~v4pkt->type_code & 0xffff;
    checksum += v6pkt->type_code;
    // 0 -> payload length
    checksum += htons(payload_len);
    // 0 -> next header
    checksum += IPV6_NEXT_HEADER_ICMP << 8;
    v6pkt->checksum = ip_checksum_final(checksum);
    if (!only_header)
    {
        return sizeof(icmpv6_header_t) + v4len - sizeof(icmpv4_header_t);
    }
    else
    {
        return sizeof(icmpv6_header_t);
    }
}

ssize_t v4_to_v6_icmp(icmpv6_header_t *v6pkt, size_t v6len,
                      const icmpv4_header_t *v4pkt, size_t v4len,
                      const uint8_t *src_bytes, const uint8_t *dst_bytes,
                      uint16_t payload_len, int only_header)
{
    if (v4len < sizeof(icmpv4_header_t)) return -14;
    if (v6len < sizeof(icmpv6_header_t)) return -15;
    int new_type_code = v4_to_v6_icmp_type_code(v4pkt->type_code);
    if (new_type_code >= 0)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (generic error type %d code %d).\n",
               v4pkt->type, v4pkt->code);
#endif
        v6pkt->type_code = new_type_code & 0xffff;
        v6pkt->checksum = 0;
        v6pkt->rest = 0;
        return v4_to_v6_icmp_ip_payload(v6pkt, v6len, v4pkt, v4len, src_bytes, dst_bytes);
    }
    if (v4pkt->type_code == ICMPV4_TYPE_CODE_TOO_BIG)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (too big).\n");
#endif
        v6pkt->type_code = ICMPV6_TYPE_CODE_TOO_BIG;
        v6pkt->checksum = 0;
        // Adjust MTU overhead.
        v6pkt->mtu = htonl(ntohs(v4pkt->mtu) - sizeof(ipv4_header_t) + sizeof(ipv6_header_t));
        return v4_to_v6_icmp_ip_payload(v6pkt, v6len, v4pkt, v4len, src_bytes, dst_bytes);
    }
    if (v4pkt->type_code == ICMPV4_TYPE_CODE_ECHO_REQUEST)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (echo request).\n");
#endif
        v6pkt->type_code = ICMPV6_TYPE_CODE_ECHO_REQUEST;
        v6pkt->checksum = 0;
        v6pkt->id = v4pkt->id;
        v6pkt->seq = v4pkt->seq;
        return v4_to_v6_icmp_data_payload(v6pkt, v6len, v4pkt, v4len, src_bytes, dst_bytes,
                                          payload_len, only_header);
    }
    if (v4pkt->type_code == ICMPV4_TYPE_CODE_ECHO_REPLY)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (echo reply).\n");
#endif
        v6pkt->type_code = ICMPV6_TYPE_CODE_ECHO_REPLY;
        v6pkt->checksum = 0;
        v6pkt->id = v4pkt->id;
        v6pkt->seq = v4pkt->seq;
        return v4_to_v6_icmp_data_payload(v6pkt, v6len, v4pkt, v4len, src_bytes, dst_bytes,
                                          payload_len, only_header);
    }
#if defined(VERBOSE) || defined(LOG_ERROR)
    printf("Unknown ICMP type %d code %d.\n", v4pkt->type, v4pkt->code);
#endif
    return -16;
}

void v4_to_v6_udp_header(udp_header_t *v6pkt, const udp_header_t *v4pkt,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes)
{
    // Incrementally update the checksum.
    uint32_t checksum = ~v4pkt->checksum & 0xffff;
    checksum += ip_checksum_neg_partial(v4src_bytes, 4) + ip_checksum_neg_partial(v4dst_bytes, 4);
    checksum += ip_checksum_partial(v6src_bytes, 16) + ip_checksum_partial(v6dst_bytes, 16);
    v6pkt->checksum = ip_checksum_final(checksum);
}

void v4_to_v6_tcp_header(tcp_header_t *v6pkt, const tcp_header_t *v4pkt,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes)
{
    // Incrementally update the checksum.
    uint32_t checksum = ~v4pkt->checksum & 0xffff;
    checksum += ip_checksum_neg_partial(v4src_bytes, 4) + ip_checksum_neg_partial(v4dst_bytes, 4);
    checksum += ip_checksum_partial(v6src_bytes, 16) + ip_checksum_partial(v6dst_bytes, 16);
    v6pkt->checksum = ip_checksum_final(checksum);
}
