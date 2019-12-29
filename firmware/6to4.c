#include "6to4.h"
#include "string.h"
#include "ip.h"
#include "amc.h"
#include "printf.h"

ssize_t v6_to_v4(ipv4_header_t *v4pkt, size_t v4len, const ipv6_header_t *v6pkt, size_t v6len,
                 size_t copy_len)
{
    if (v6len < sizeof(ipv6_header_t)) return -5;
    if (v4len < sizeof(ipv4_header_t)) return -6;
    uint16_t payload_len = ntohs(v6pkt->payload_len);
    int is_fragment = 0;
    if (v6pkt->next_header == IPV6_NEXT_HEADER_FRAGMENT)
    {
         if (v6len < sizeof(ipv6_header_t) + sizeof(ipv6_fragment_header_t)) return -600;
         payload_len -= sizeof(ipv6_fragment_header_t);
         is_fragment = 1;
    }
    if (payload_len < copy_len) copy_len = payload_len;
    if (is_fragment)
    {
        if (v6len < sizeof(ipv6_header_t) + sizeof(ipv6_fragment_header_t) + copy_len) return -71;
    }
    else
    {
        if (v6len < sizeof(ipv6_header_t) + copy_len) return -72;
    }
    if (v4len < sizeof(ipv4_header_t) + copy_len) return -8;

    const void *v6payload = v6pkt + 1;
    size_t v6payload_len = v6len - sizeof(ipv6_header_t);
    void *v4payload = v4pkt + 1;
    size_t v4payload_len = v4len - sizeof(ipv4_header_t);

    // Check fragmentation.
    size_t fragment_offset = 0;
    uint32_t fragment_mf = 0;
    const ipv6_fragment_header_t *frag_header = (const ipv6_fragment_header_t *)v6payload;
    if (is_fragment)
    {
        is_fragment = 1;
        fragment_offset = ntohs(frag_header->offset_mf) >> 3;
        fragment_mf = ntohs(frag_header->offset_mf) & IPV6_MF_BIT;
        v6payload = frag_header + 1;
        v6payload_len -= sizeof(ipv6_fragment_header_t);
    }

    uint8_t next_header = is_fragment ? frag_header->next_header : v6pkt->next_header;

    // Translate the header and handle fragmentation.
    v4pkt->version_header_len = 0x45;
    v4pkt->dscp_ecn = 0;
    v4pkt->total_len = htons(sizeof(ipv4_header_t) + payload_len);
    v4pkt->id = is_fragment ? htons(ntohl(frag_header->id) & 0xffff) : 0;
    v4pkt->flags = is_fragment ? htons(fragment_offset | (fragment_mf << 13)) : htons(IPV4_DF_BIT);
    v4pkt->hop_limit = v6pkt->hop_limit;
    v4pkt->next_header = next_header;
    v4pkt->checksum = 0;

    // Translate addresses.
    if (ipv6_is_ipv4_translatable(v6pkt->src) || ipv6_is_ipv4_converted(v6pkt->src))
    {
        v4pkt->src = extract_ipv4(v6pkt->src);
    }
    else
    {
        ipv6_addr_t new_src;
        int ret = amc_query(v6pkt->src, &new_src, true);
        if (ret < 0) return ret;
        v4pkt->src = extract_ipv4(new_src);
    }

    if (ipv6_is_ipv4_translatable(v6pkt->dst) || ipv6_is_ipv4_converted(v6pkt->dst))
    {
        v4pkt->dst = extract_ipv4(v6pkt->dst);
    }
    else
    {
        ipv6_addr_t new_dst;
        int ret = amc_query(v6pkt->dst, &new_dst, true);
        if (ret < 0) return ret;
        v4pkt->dst = extract_ipv4(new_dst);
    }

    // Translate upper-layer protocol data.
    if (fragment_offset == 0 &&
        copy_len >= sizeof(icmpv4_header_t) && next_header == IPV6_NEXT_HEADER_ICMP)
    {
        // We are going to copy all of the payload, but this is an ICMP packet,
        // so we should translate it first.
#ifdef VERBOSE
        printf("  This is an ICMP packet.\n");
#endif
        int only_header = copy_len != payload_len;
        int ret = v6_to_v4_icmp((icmpv4_header_t *)v4payload, v4payload_len,
                                (const icmpv6_header_t *)v6payload, v6payload_len,
                                v6pkt->src.u8, v6pkt->dst.u8, payload_len, only_header);
        if (ret <= 0) return ret;
        copy_len = ret;
        if (!only_header)
        {
            payload_len = ret;
            v4pkt->total_len = htons(sizeof(ipv4_header_t) + payload_len);
        }
        v4pkt->next_header = IPV4_NEXT_HEADER_ICMP;
    }
#ifdef TRANSLATE_UDP
    else if (fragment_offset == 0 &&
             copy_len >= sizeof(udp_header_t) && next_header == IP_NEXT_HEADER_UDP)
    {
        // Copy the payload.
        memcpy(v4payload, v6payload, copy_len);
        // Adjust the UDP header.
        v6_to_v4_udp_header((udp_header_t *)v4payload, (const udp_header_t *)v6payload,
                            v6pkt->src.u8, v6pkt->dst.u8, v4pkt->src.u8, v4pkt->dst.u8);
    }
#endif
#ifdef TRANSLATE_TCP
    else if (fragment_offset == 0 &&
             copy_len >= sizeof(tcp_header_t) && next_header == IP_NEXT_HEADER_TCP)
    {
        // Copy the payload.
        memcpy(v4payload, v6payload, copy_len);
        // Adjust the TCP header.
        v6_to_v4_tcp_header((tcp_header_t *)v4payload, (const tcp_header_t *)v6payload,
                            v6pkt->src.u8, v6pkt->dst.u8, v4pkt->src.u8, v4pkt->dst.u8);
    }
#endif
    else
    {
        // Just copy the payload.
        memcpy(v4payload, v6payload, copy_len);
    }

    // Calculate IPv4 header checksum.
    v4pkt->checksum = ip_checksum_final(ip_checksum_partial(v4pkt, sizeof(ipv4_header_t)));
    return sizeof(ipv4_header_t) + copy_len;
}

static inline int v6_to_v4_icmp_type_code(uint16_t type_code)
{
#define DO_TYPE_CODE(name) \
case ICMPV6_TYPE_CODE_##name: \
    return ICMPV4_TYPE_CODE_##name;
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

static inline ssize_t v6_to_v4_icmp_ip_payload(icmpv4_header_t *v4pkt, size_t v4len,
                                               const icmpv6_header_t *v6pkt, size_t v6len)
{
    int ret;
    if ((ret = v6_to_v4((ipv4_header_t *)(v4pkt + 1), v4len - sizeof(icmpv4_header_t),
                        (ipv6_header_t *)(v6pkt + 1), v6len - sizeof(icmpv6_header_t), 8)) <= 0)
    {
        return ret;
    }
    size_t len = sizeof(icmpv4_header_t) + ret;
    v4pkt->checksum = ip_checksum_final(ip_checksum_partial(v4pkt, len));
    return len;
}

static inline ssize_t v6_to_v4_icmp_data_payload(icmpv4_header_t *v4pkt, size_t v4len,
                                                 const icmpv6_header_t *v6pkt, size_t v6len,
                                                 const uint8_t *src_bytes, const uint8_t *dst_bytes,
                                                 uint16_t payload_len, int only_header)
{
    if (!only_header)
    {
        if (v4len < sizeof(icmpv4_header_t) + v6len - sizeof(icmpv6_header_t)) return -13;
        memcpy(v4pkt + 1, v6pkt + 1, v6len - sizeof(icmpv6_header_t));
    }
    // Incrementally update the checksum.
    uint32_t checksum = ~v6pkt->checksum & 0xffff;
    // src, dst -> 0
    checksum += ip_checksum_neg_partial(src_bytes, 16);
    checksum += ip_checksum_neg_partial(dst_bytes, 16);
    // type, code changed
    checksum += ~v6pkt->type_code & 0xffff;
    checksum += v4pkt->type_code;
    // payload length -> 0
    checksum += ~htons(payload_len) & 0xffff;
    // next header -> 0
    checksum += ~(IPV6_NEXT_HEADER_ICMP << 8) & 0xffff;
    v4pkt->checksum = ip_checksum_final(checksum);
    if (!only_header)
    {
        return sizeof(icmpv4_header_t) + v6len - sizeof(icmpv6_header_t);
    }
    else
    {
        return sizeof(icmpv4_header_t);
    }
}

ssize_t v6_to_v4_icmp(icmpv4_header_t *v4pkt, size_t v4len,
                      const icmpv6_header_t *v6pkt, size_t v6len,
                      const uint8_t *src_bytes, const uint8_t *dst_bytes,
                      uint16_t payload_len, int only_header)
{
    if (v6len < sizeof(icmpv6_header_t)) return -10;
    if (v4len < sizeof(icmpv4_header_t)) return -11;
    int new_type_code = v6_to_v4_icmp_type_code(v6pkt->type_code);
    if (new_type_code >= 0)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (generic error type %d code %d).\n",
               v6pkt->type, v6pkt->code);
#endif
        v4pkt->type_code = new_type_code & 0xffff;
        v4pkt->checksum = 0;
        v4pkt->rest = 0;
        return v6_to_v4_icmp_ip_payload(v4pkt, v4len, v6pkt, v6len);
    }
    if (v6pkt->type_code == ICMPV6_TYPE_CODE_TOO_BIG)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (too big).\n");
#endif
        v4pkt->type_code = ICMPV4_TYPE_CODE_TOO_BIG;
        v4pkt->checksum = 0;
        v4pkt->ununsed1 = 0;
        // Adjust MTU overhead.
        // FIXME: integer overflow?
        v4pkt->mtu = htons(ntohl(v6pkt->mtu) - sizeof(ipv6_header_t) + sizeof(ipv4_header_t));
        return v6_to_v4_icmp_ip_payload(v4pkt, v4len, v6pkt, v6len);
    }
    if (v6pkt->type_code == ICMPV6_TYPE_CODE_ECHO_REQUEST)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (echo request).\n");
#endif
        v4pkt->type_code = ICMPV4_TYPE_CODE_ECHO_REQUEST;
        v4pkt->checksum = 0;
        v4pkt->id = v6pkt->id;
        v4pkt->seq = v6pkt->seq;
        return v6_to_v4_icmp_data_payload(v4pkt, v4len, v6pkt, v6len, src_bytes, dst_bytes,
                                          payload_len, only_header);
    }
    if (v6pkt->type_code == ICMPV6_TYPE_CODE_ECHO_REPLY)
    {
#ifdef VERBOSE
        printf("  This is an ICMP packet (echo reply).\n");
#endif
        v4pkt->type_code = ICMPV4_TYPE_CODE_ECHO_REPLY;
        v4pkt->checksum = 0;
        v4pkt->id = v6pkt->id;
        v4pkt->seq = v6pkt->seq;
        return v6_to_v4_icmp_data_payload(v4pkt, v4len, v6pkt, v6len, src_bytes, dst_bytes,
                                          payload_len, only_header);
    }
#if defined(VERBOSE) || defined(LOG_ERROR)
    printf("Unknown ICMP type %d code %d.\n", v6pkt->type, v6pkt->code);
#endif
    return -12;
}

void v6_to_v4_udp_header(udp_header_t *v4pkt, const udp_header_t *v6pkt,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes)
{
    // Incrementally update the checksum.
    uint32_t checksum = ~v6pkt->checksum & 0xffff;
    checksum += ip_checksum_neg_partial(v6src_bytes, 16) + ip_checksum_neg_partial(v6dst_bytes, 16);
    checksum += ip_checksum_partial(v4src_bytes, 4) + ip_checksum_partial(v4dst_bytes, 4);
    v4pkt->checksum = ip_checksum_final(checksum);
}

void v6_to_v4_tcp_header(tcp_header_t *v4pkt, const tcp_header_t *v6pkt,
                         const uint8_t *v6src_bytes, const uint8_t *v6dst_bytes,
                         const uint8_t *v4src_bytes, const uint8_t *v4dst_bytes)
{
    // Incrementally update the checksum.
    uint32_t checksum = ~v6pkt->checksum & 0xffff;
    checksum += ip_checksum_neg_partial(v6src_bytes, 16) + ip_checksum_neg_partial(v6dst_bytes, 16);
    checksum += ip_checksum_partial(v4src_bytes, 4) + ip_checksum_partial(v4dst_bytes, 4);
    v4pkt->checksum = ip_checksum_final(checksum);
}
