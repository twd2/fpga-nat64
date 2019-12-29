#include "ip.h"
#include "error.h"
#include "printf.h"
#include "utils.h"
#include "ethernet.h"
#include "eth.h"
#include "amc.h"
#include "fib.h"
#include "arc.h"
#include "task.h"
#include "string.h"
#include "4to6.h"
#include "6to4.h"
#include "ippool.h"

const uint64_t MAC_BROADCAST = 0xffffffffffff;

interface_info_t iface_info[MAX_NUM_INTERFACES + 1];

ipv6_addr_t ipv4_converted_prefix;
ipv6_addr_t ipv4_translatable_prefix;
ipv4_addr_t ipv6_converted_prefix;
ipv4_addr_t ipv6_converted_mask;
ipv4_addr_t ipv4_pool_prefix;
ipv4_addr_t ipv4_pool_mask;

void init_ip()
{
    // Cache eth configurations.
    for (int i = 0; i < eth_num_iface(); ++i)
    {
        iface_info[i].config = eth_get_config(i);
        iface_info[i].mtu = eth_get_mtu(i);
        iface_info[i].mac = eth_get_mac(i);
    }

    ipv4_converted_prefix = eth_get_ipv4_converted_prefix();
    ipv4_translatable_prefix = eth_get_ipv4_translatable_prefix();
    ipv6_converted_prefix = eth_get_ipv6_converted_prefix();
    ipv6_converted_mask = eth_get_ipv6_converted_mask();
    ipv4_pool_prefix = eth_get_ipv4_pool_prefix();
    ipv4_pool_mask = eth_get_ipv4_pool_mask();

    // TODO
    iface_info[0].ipv4 = make_ipv4(0x0101010a);
    iface_info[0].ipv4_prefixlen = 24;
    iface_info[0].ipv6 = make_ipv6(0x0100000000000020, 0x01ul << 56);
    iface_info[0].ipv6_prefixlen = 64;
    iface_info[1].ipv4 = make_ipv4(0x0102010a);
    iface_info[1].ipv4_prefixlen = 24;
    iface_info[1].ipv6 = make_ipv6(0x0200000000000020, 0x01ul << 56);
    iface_info[1].ipv6_prefixlen = 64;
    iface_info[2].ipv4 = make_ipv4(0x0103010a);
    iface_info[2].ipv4_prefixlen = 24;
    iface_info[2].ipv6 = make_ipv6(0x0300000000000020, 0x01ul << 56);
    iface_info[2].ipv6_prefixlen = 64;
    iface_info[3].ipv4 = make_ipv4(0x0104010a);
    iface_info[3].ipv4_prefixlen = 24;
    iface_info[3].ipv6 = make_ipv6(0x0400000000000020, 0x01ul << 56);
    iface_info[3].ipv6_prefixlen = 64;
    iface_info[IFACE_LOOPBACK].ipv4 = make_ipv4(0x0105010a);
    iface_info[IFACE_LOOPBACK].ipv6 = make_ipv6(0x0500000000000020, 0x01ul << 56);

    for (int i = 0; i < eth_num_iface(); ++i)
    {
        interface_info_t *ifinfo = &iface_info[i];
        ifinfo->ipv6_multicast[0] = ipv6_all_nodes();
        ifinfo->ipv6_multicast[1] = ipv6_all_routers();
        ifinfo->ipv6_multicast[2] = ipv6_rip_routers();
        ifinfo->ipv6_multicast[3] = ipv6_solicited_node(ifinfo->ipv6);

        // Add onlink routes.
        ifinfo->nexthop_id = fib_alloc_nexthop();
        fib_nexthop[ifinfo->nexthop_id].interface = i;
        fib_nexthop[ifinfo->nexthop_id].onlink = 1;

        fib_update(ifinfo->ipv6, ifinfo->ipv6_prefixlen, ifinfo->nexthop_id, true);
        fib_update(ipv4_compatible(ifinfo->ipv4), 96 + ifinfo->ipv4_prefixlen,
                   ifinfo->nexthop_id, true);
    }

    // Loopback routes.
    interface_info_t *ifinfo = &iface_info[IFACE_LOOPBACK];
    ifinfo->nexthop_id = fib_alloc_nexthop();
    fib_nexthop[ifinfo->nexthop_id].interface = -1;
    fib_nexthop[ifinfo->nexthop_id].onlink = 0;
    // We hope that ARC can miss...
    fib_nexthop[ifinfo->nexthop_id].addr = 0;
    fib_nexthop[ifinfo->nexthop_id].addr_hi = 0;

    fib_update(ifinfo->ipv6, 128, ifinfo->nexthop_id, true);
    fib_update(ipv4_compatible(ifinfo->ipv4), 128, ifinfo->nexthop_id, true);

    ippool_create();
}

int arp_make_request(frame_t *frame, size_t buflen, int iface, ipv4_addr_t ip, uint64_t known_mac)
{
    if (buflen < sizeof(frame_t) + sizeof(arp_packet_t)) return -EOOB;
    arp_packet_t *arp = (arp_packet_t *)frame->payload;

    interface_info_t *ifinfo = &iface_info[iface];

    frame->meta.interface = iface;
    frame->meta.limit = sizeof(eth_header_t) + sizeof(arp_packet_t) - 1;

    memcpy(frame->dst_mac, &known_mac, 6);
    memcpy(frame->src_mac, &ifinfo->mac, 6);
    frame->ethertype = ETH_TYPE_ARP;

    arp->htype = ARP_HTYPE_ETHERNET;
    arp->ptype = ARP_PTYPE_IPV4;
    arp->hlen = 6;
    arp->plen = 4;
    arp->op = ARP_OP_REQUEST;
    memcpy(arp->mac_saddr, &ifinfo->mac, 6);
    memcpy(arp->ip_saddr, &ifinfo->ipv4, 4);
    memcpy(arp->mac_daddr, &known_mac, 6);
    memcpy(arp->ip_daddr, &ip, 4);
    return 0;
}

int handle_arp(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(arp_packet_t)) return -EOOB;
    arp_packet_t *arp = (arp_packet_t *)frame->payload;

    if (!(arp->htype == ARP_HTYPE_ETHERNET && arp->ptype == ARP_PTYPE_IPV4
          && arp->hlen == 6 && arp->plen == 4)) return -EBADPKT;

    if (arp->op != ARP_OP_REQUEST && arp->op != ARP_OP_REPLY) return -EBADPKT;

    int iface = frame->meta.interface;
    interface_info_t *ifinfo = &iface_info[iface];

    uint64_t src_mac = 0;
    memcpy(&src_mac, arp->mac_saddr, 6);
    ipv4_addr_t src_ip;
    memcpy(&src_ip, arp->ip_saddr, 4);

    bool is_to_me = memcmp(arp->ip_daddr, &ifinfo->ipv4, 4) == 0;

    // update ARP table
    arc_update(ipv4_compatible(src_ip), src_mac, is_to_me /* upsert when to me */);

    // reply ARP request
    if (arp->op == ARP_OP_REQUEST && is_to_me)
    {
        memcpy(frame->dst_mac, &src_mac, 6);
        memcpy(frame->src_mac, &ifinfo->mac, 6);
        frame->ethertype = ETH_TYPE_ARP;

        arp->op = ARP_OP_REPLY;
        memcpy(arp->mac_saddr, &ifinfo->mac, 6);
        memcpy(arp->ip_saddr, &ifinfo->ipv4, 4);
        memcpy(arp->mac_daddr, &src_mac, 6);
        memcpy(arp->ip_daddr, &src_ip, 4);

        eth_begin_send_frame(frame);
        wait(WAIT_ETH_SEND);
    }

    return 0;
}

int ip_query_route(ipv6_addr_t addr, uint8_t *iface, ipv6_addr_t *nexthop)
{
    int ptr = fib_query(addr);
    if (ptr < 0) return ptr;
    nexthop_info_t *ni = fib_nexthop + ptr;
    *iface = ni->interface;
    if (ni->onlink)
    {
        *nexthop = addr;
    }
    else
    {
        *nexthop = make_ipv6(ni->addr, ni->addr_hi);
    }
    return 0;
}

int ip_query_mac(uint8_t iface, ipv6_addr_t addr, uint64_t *mac)
{
    // FIXME: interface?
    return arc_query(addr, mac, false);
}

int ip_send(frame_t *frame, uint8_t iface, ipv6_addr_t nexthop)
{
    int ret;
    uint64_t mac;
    if ((ret = ip_query_mac(iface, nexthop, &mac)) < 0)
    {
        /*
            TODO: save this packet, and send an ARP request or a NDP solicitation.
        */
        bool is_v4 = is_ipv4(nexthop);
        int ret;
        if (is_v4)
        {
            ret = arp_make_request(frame, 4096 /* FIXME */, iface, extract_ipv4(nexthop), -1);
            if (ret < 0) return ret;
        }
        else
        {
            ret = ip_make_ndp(frame, 4096 /* FIXME */, iface, nexthop, -1, false, false, 0);
            if (ret < 0) return ret;
        }
        eth_begin_send_frame(frame);
        wait(WAIT_ETH_SEND);
        return 0;
    }
    return ip_send_with_mac(frame, iface, mac);
}

int ip_send_with_mac(frame_t *frame, uint8_t iface, uint64_t mac)
{
    memcpy(frame->src_mac, &iface_info[iface].mac, sizeof(frame->src_mac));
    memcpy(frame->dst_mac, &mac, sizeof(frame->dst_mac));
    frame->meta.interface = iface;
    eth_begin_send_frame(frame);
    wait(WAIT_ETH_SEND);
    return 0;
}

uint16_t ipv6_l4_checksum(ipv6_header_t *ipv6)
{
    uint32_t checksum = 0;
    checksum += ip_checksum_partial(ipv6->src.u8, sizeof(ipv6->src.u8));
    checksum += ip_checksum_partial(ipv6->dst.u8, sizeof(ipv6->dst.u8));
    checksum += ipv6->payload_len;
    checksum += (uint16_t)ipv6->next_header << 8;
    checksum += ip_checksum_partial(ipv6 + 1, ntohs(ipv6->payload_len));
    return ip_checksum_final(checksum);
}

int ip_make_icmpv4_error(void *buf, size_t buflen, uint16_t type_code,
                         void *pkt, size_t pktlen, uint16_t mtu)
{
    return -ENOIMPL;
}

int ip_make_icmpv6_error(void *buf, size_t buflen, uint16_t type_code,
                         void *pkt, size_t pktlen, uint16_t mtu)
{
    return -ENOIMPL;
}

int ip_make_mld_report(frame_t *frame, size_t buflen, int iface, ipv6_addr_t maddr)
{
    if (buflen < sizeof(frame_t) + sizeof(ipv6_header_t)
                 + sizeof(icmpv6_header_t) + sizeof(mld_packet_t))
    {
        return -EOOB;
    }

    interface_info_t *ifinfo = &iface_info[iface];

    uint64_t dst_mac = ipv6_multicast_mac(maddr);

    frame->meta.limit = sizeof(eth_header_t) + sizeof(ipv6_header_t)
                        + sizeof(icmpv6_header_t) + sizeof(mld_packet_t) - 1;
    frame->meta.interface = iface;
    memcpy(frame->dst_mac, &dst_mac, 6);
    memcpy(frame->src_mac, &ifinfo->mac, 6);
    frame->ethertype = ETH_TYPE_IPV6;

    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    ipv6->version_flow = IPV6_VERSION;
    ipv6->payload_len = htons(sizeof(icmpv6_header_t) + sizeof(mld_packet_t));
    ipv6->next_header = IPV6_NEXT_HEADER_ICMP;
    ipv6->hop_limit = MLD_HOP_LIMIT;
    ipv6->src = ipv6_from_mac(ifinfo->mac);
    ipv6->dst = maddr;

    icmpv6_header_t *icmp = (icmpv6_header_t *)(ipv6 + 1);
    icmp->type_code = ICMPV6_TYPE_CODE_MLD_REPORT;
    icmp->checksum = 0;
    icmp->max_response_delay = 0;
    icmp->reserved1 = 0;

    mld_packet_t *mld = (mld_packet_t *)(icmp + 1);
    mld->maddr = maddr;

    icmp->checksum = ipv6_l4_checksum(ipv6);
    return 0;
}

int ip_make_ndp(frame_t *frame, size_t buflen, int iface,
                ipv6_addr_t addr, uint64_t mac,
                bool adv, bool unicast, uint32_t flags)
{
    if (buflen < sizeof(frame_t) + sizeof(ipv6_header_t)
                 + sizeof(icmpv6_header_t) + sizeof(ndp_packet_t) + sizeof(ndp_option_t))
    {
        return -EOOB;
    }

    interface_info_t *ifinfo = &iface_info[iface];

    ipv6_addr_t dst_ip;
    uint64_t dst_mac;
    if (unicast)
    {
        dst_ip = addr;
        dst_mac = mac;
    }
    else
    {
        if (!adv)
        {
            dst_ip = ipv6_solicited_node(addr);
        }
        else
        {
            dst_ip = ipv6_all_nodes();
        }
        dst_mac = ipv6_multicast_mac(dst_ip);
    }

    frame->meta.limit = sizeof(eth_header_t) + sizeof(ipv6_header_t)
                        + sizeof(icmpv6_header_t) + sizeof(ndp_packet_t) + sizeof(ndp_option_t) - 1;
    frame->meta.interface = iface;
    memcpy(frame->dst_mac, &dst_mac, 6);
    memcpy(frame->src_mac, &ifinfo->mac, 6);
    frame->ethertype = ETH_TYPE_IPV6;

    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    ipv6->version_flow = IPV6_VERSION;
    ipv6->payload_len = htons(sizeof(icmpv6_header_t) + sizeof(ndp_packet_t) + sizeof(ndp_option_t));
    ipv6->next_header = IPV6_NEXT_HEADER_ICMP;
    ipv6->hop_limit = NDP_HOP_LIMIT;
    ipv6->src = ifinfo->ipv6;
    ipv6->dst = dst_ip;

    icmpv6_header_t *icmp = (icmpv6_header_t *)(ipv6 + 1);
    icmp->type_code = !adv ? ICMPV6_TYPE_CODE_NS : ICMPV6_TYPE_CODE_NA;
    icmp->checksum = 0;
    icmp->flags = adv ? (ICMPV6_FLAGS_R | flags) : 0;

    ndp_packet_t *ndp = (ndp_packet_t *)(icmp + 1);
    if (!adv)
    {
        ndp->addr = addr;
    }
    else
    {
        ndp->addr = ifinfo->ipv6;
    }

    ndp_option_t *option = (ndp_option_t *)(ndp + 1);
    option->type = !adv ? ICMPV6_OPTION_TYPE_SOURCE : ICMPV6_OPTION_TYPE_TARGET;
    option->len = 1;
    memcpy(option->mac_addr, &ifinfo->mac, 6);

    icmp->checksum = ipv6_l4_checksum(ipv6);
    return 0;
}

void ip_send_init_packets(frame_t *frame, size_t buflen, int iface)
{
    /*
        System starts.
        Send a gratuitous ARP packet.
        Join ff02::1 multicast group, since this is a node.
        Join ff02::2 multicast group, since this is also a router.
        Join Solicited-Node multicast group.
        Send unsolicited NDP node advertisement packet.
        Ref: https://tools.ietf.org/html/rfc4291#page-16
    */
    interface_info_t *ifinfo = &iface_info[iface];

    if (arp_make_request(frame, buflen, iface, ifinfo->ipv4, -1) == 0)
    {
        eth_begin_send_frame(frame);
        wait(WAIT_ETH_SEND);
    }
    for (int i = 0; i < 4; ++i)
    {
        if (ip_make_mld_report(frame, buflen, iface, ifinfo->ipv6_multicast[i]) == 0)
        {
            eth_begin_send_frame(frame);
            wait(WAIT_ETH_SEND);
        }
    }
    if (ip_make_ndp(frame, buflen, iface, make_ipv6(0, 0), -1, true, false, ICMPV6_FLAGS_O) == 0)
    {
        eth_begin_send_frame(frame);
        wait(WAIT_ETH_SEND);
    }
}

void ip_send_init_packets_all(frame_t *frame, size_t buflen)
{
    for (int i = 0; i < eth_num_iface(); ++i)
    {
        ip_send_init_packets(frame, buflen, i);
    }
}

int handle_frame(frame_t *frame)
{
    /*
        Now we get a new frame.
        o If this frame contains an IP packet or an ARP packet:
            o If the packet is going to be forwarded and its hop limit is 1,
              send an ICMP error message (time exceeded).
            o If the packet that is an IPv6 packet or has DF bit set is going
              to be translated and forwarded, and it would be too big after
              translation, send an ICMP error message (packet too big).
            o If the packet is to this host:
                o If it is an ARP request or a NDP solicitation, send an ARP
                  response or a NDP advertisement.
                o If it is an ARP response or a NDP advertisement, update address
                  resolution cache.
                o If it is an ICMP echo request, send an ICMP echo response.
                o Otherwise, drop the packet.
            o Otherwise, this packet is a so complex packet that the pipeline
              cannot handle, help the pipeline to translate and/or forward.
        o Otherwise, the packet should have already been dropped by the pipeline.

        When some cache misses:
            1. If AMC misses, take an IPv4 address from the pool, create a mapping,
               and fill AMC.
            2. If FIB misses, send an ICMP error message (destination unreachable).
            3. If ARC misses, store this packet to a buffer, send corresponding
               ARP request or NDP solicitation, wait for a response, and then try
               to send this packet again.
    */

    int iface = frame->meta.interface;
    interface_info_t *ifinfo = &iface_info[iface];

    bool is_to_me = !(ifinfo->config & CONFIG_PROMISCUOUS)
                    || (frame->dst_mac[0] & 0x01)
                    || (memcmp(frame->dst_mac, &ifinfo->mac, 6) == 0);
    if (!is_to_me) return 0;

    switch (frame->ethertype)
    {
    case ETH_TYPE_ARP:
        return handle_arp(frame);
        break;
    case ETH_TYPE_IPV4:
        return handle_ipv4(frame);
        break;
    case ETH_TYPE_IPV6:
        return handle_ipv6(frame);
        break;
    default:
        return -ENOIMPL;
        break;
    }
}

__attribute__ ((aligned (16))) uint8_t xlate_buff[4096];

int do_translate_4to6(frame_t *frame, frame_t **new_frame)
{
    ipv4_header_t *ipv4 = (ipv4_header_t *)frame->payload;
    *new_frame = (frame_t *)(xlate_buff + ALIGN_OFFSET);
    ipv6_header_t *ipv6 = (ipv6_header_t *)(*new_frame)->payload;
    ssize_t ret = v4_to_v6(ipv6, sizeof(xlate_buff) - ALIGN_OFFSET - sizeof(frame_t),
                           ipv4, frame->meta.limit + 1 - sizeof(eth_header_t), -1);
    if (ret < 0) return ret;
    (*new_frame)->meta.limit = sizeof(eth_header_t) + ret - 1;
    (*new_frame)->ethertype = ETH_TYPE_IPV6;
    return 0;
}

int do_forward_ipv4(frame_t *frame)
{
    ipv4_header_t *ipv4 = (ipv4_header_t *)frame->payload;

    if (ipv4_is_multicast(ipv4->dst)) return -ENOIMPL;  // We don't support multicast routing.
    if (ipv4_is_ipv6_converted(ipv4->src)) return -EBADSADDR;
    if (ipv4_is_ipv4_pool(ipv4->src)) return -EBADSADDR;

    // Adjust hop limit.
    if (ipv4->hop_limit <= 1)
    {
        // TODO: send ICMP error message (hop limit execeeded).
        return 0;
    }
    --ipv4->hop_limit;
    uint32_t new_checksum = (uint32_t)ipv4->checksum + 1;
    ipv4->checksum = (new_checksum & 0xffff) + (new_checksum >> 16);

    // Decide whether to forward or to translate.
    bool dst_is_ipv6_converted = ipv4_is_ipv6_converted(ipv4->dst);
    bool dst_is_ipv4_pool = ipv4_is_ipv4_pool(ipv4->dst);
    bool to_be_translated = dst_is_ipv6_converted || dst_is_ipv4_pool;

    ipv6_addr_t new_dst;
    uint64_t mtu_adj = 0;
    if (to_be_translated)
    {
        // Translate dst addr for routing.
        if (dst_is_ipv6_converted)
        {
            new_dst = ipv4_translatable(ipv4->dst);
        }
        else if (dst_is_ipv4_pool)
        {
            int ret = amc_query(ipv4_compatible(ipv4->dst), &new_dst, false);
            if (ret < 0) return ret;
        }
        mtu_adj = sizeof(ipv4_header_t) - sizeof(ipv6_header_t);
    }
    else
    {
        new_dst = ipv4_compatible(ipv4->dst);
    }

    int ret;
    uint8_t iface;
    ipv6_addr_t nexthop;
    if ((ret = ip_query_route(new_dst, &iface, &nexthop)) < 0)
    {
        // TODO: send ICMP error message (destination unreachable).
        return ret;
    }

    interface_info_t *ifinfo = &iface_info[iface];

    uint64_t mtu = ifinfo->mtu + mtu_adj;
    if (frame->meta.limit + 1 > mtu + sizeof(eth_header_t))
    {
        // TODO: do fragment (DF=0) or send ICMP error message (too big) (DF=1).
        return 0;
    }

    if (to_be_translated)
    {
        frame_t *new_frame;
        if ((ret = do_translate_4to6(frame, &new_frame)) < 0) return ret;
        frame = new_frame;
    }

    return ip_send(frame, iface, nexthop);
}

bool ipv4_is_to_me(int iface, ipv4_addr_t dst)
{
    for (int i = 0; i < eth_num_iface(); ++i)
    {
        if (ipv4_eq(dst, iface_info[i].ipv4)) return true;
    }
    if (ipv4_eq(dst, iface_info[IFACE_LOOPBACK].ipv4)) return true;
    return false;
}

int do_icmpv4_echo(frame_t *frame)
{
    // special path to send icmpv4 echo reply

    ipv4_header_t *ipv4 = (ipv4_header_t *)frame->payload;
    icmpv4_header_t *icmp = (icmpv4_header_t *)(ipv4 + 1);

    if (icmp->code != 0) return -EBADPKT;

    interface_info_t *ifinfo = &iface_info[frame->meta.interface];

    frame->meta.limit = sizeof(eth_header_t) + ntohs(ipv4->total_len) - 1;

    memcpy(frame->dst_mac, frame->src_mac, 6);
    memcpy(frame->src_mac, &ifinfo->mac, 6);

    ipv4->hop_limit = DEFAULT_HOP_LIMIT;

    ipv4_addr_t old_dst = ipv4->dst;
    ipv4->dst = ipv4->src;
    if (ipv4_is_multicast(old_dst))
    {
        ipv4->src = ifinfo->ipv4;
    }
    else
    {
        ipv4->src = old_dst;
    }

    ipv4->checksum = 0;
    ipv4->checksum = ip_checksum(ipv4, sizeof(ipv4_header_t));

    icmp->type = ICMPV4_TYPE_ECHO_REPLY;

    uint32_t checksum = ~icmp->checksum & 0xffff;
    checksum += (~ICMPV4_TYPE_ECHO_REQUEST & 0xffff) + ICMPV4_TYPE_ECHO_REPLY;
    icmp->checksum = ip_checksum_final(checksum);

    eth_begin_send_frame(frame);
    wait(WAIT_ETH_SEND);
    return 0;
}

int handle_icmpv4(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv4_header_t)
                                + sizeof(icmpv4_header_t)) return -EOOB;
    ipv4_header_t *ipv4 = (ipv4_header_t *)frame->payload;
    icmpv4_header_t *icmp = (icmpv4_header_t *)(ipv4 + 1);

    uint16_t checksum = ip_checksum(icmp, ntohs(ipv4->total_len) - sizeof(ipv4_header_t));
    if (checksum != 0) return -EBADPKT;

    switch (icmp->type)
    {
    case ICMPV4_TYPE_ECHO_REQUEST:
        return do_icmpv4_echo(frame);
        break;
    default:
        return -ENOIMPL;
        break;
    }
}

int handle_ipv4(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv4_header_t)) return -EOOB;

    ipv4_header_t *ipv4 = (ipv4_header_t *)frame->payload;
    if (ip_version(ipv4) != 4) return -EBADPKT;
    if ((ipv4->version_header_len & 0xf) != 0x5) return -ENOIMPL;

    uint16_t checksum = ip_checksum(ipv4, sizeof(ipv4_header_t));
    if (checksum != 0) return -EBADPKT;

    if (frame->meta.limit + 1 < sizeof(eth_header_t) + ntohs(ipv4->total_len)) return -EOOB;
    if (ntohs(ipv4->total_len) < sizeof(ipv4_header_t)) return -EBADPKT;
    frame->meta.limit = sizeof(eth_header_t) + ntohs(ipv4->total_len) - 1;

    bool is_to_me = ipv4_is_to_me(frame->meta.interface, ipv4->dst);
    if (!is_to_me) return do_forward_ipv4(frame);

    switch (ipv4->next_header)
    {
    case IPV4_NEXT_HEADER_ICMP:
        return handle_icmpv4(frame);
        break;
    default:
        return -ENOIMPL;
        break;
    }
}

int do_translate_6to4(frame_t *frame, frame_t **new_frame)
{
    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    *new_frame = (frame_t *)(xlate_buff + ALIGN_OFFSET);
    ipv4_header_t *ipv4 = (ipv4_header_t *)(*new_frame)->payload;
    ssize_t ret = v6_to_v4(ipv4, sizeof(xlate_buff) - ALIGN_OFFSET - sizeof(frame_t),
                           ipv6, frame->meta.limit + 1 - sizeof(eth_header_t), -1);
    if (ret < 0) return ret;
    (*new_frame)->meta.limit = sizeof(eth_header_t) + ret - 1;
    (*new_frame)->ethertype = ETH_TYPE_IPV4;
    return 0;
}

int do_forward_ipv6(frame_t *frame)
{
    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;

    if (ipv6_is_multicast(ipv6->dst)) return -ENOIMPL;  // We don't support multicast routing.
    if (ipv6_is_ipv4_converted(ipv6->src)) return -EBADSADDR;

    // Adjust hop limit.
    if (ipv6->hop_limit <= 1)
    {
        // TODO: send ICMP error message (hop limit execeeded).
        return 0;
    }
    --ipv6->hop_limit;

    // Decide whether to forward or to translate.
    bool to_be_translated = ipv6_is_ipv4_converted(ipv6->dst);

    ipv6_addr_t new_dst;
    if (to_be_translated)
    {
        // Translate dst addr for routing.
        new_dst = ipv4_compatible(extract_ipv4(ipv6->dst));
    }
    else
    {
        new_dst = ipv6->dst;
    }

    int ret;
    uint8_t iface;
    ipv6_addr_t nexthop;
    if ((ret = ip_query_route(new_dst, &iface, &nexthop)) < 0)
    {
        // TODO: send ICMP error message (destination unreachable).
        return ret;
    }

    interface_info_t *ifinfo = &iface_info[iface];

    // No need to fragment.
    uint64_t mtu = ifinfo->mtu;
    if (frame->meta.limit + 1 > mtu + sizeof(eth_header_t))
    {
        // TODO: send ICMP error message (too big).
        return 0;
    }

    if (to_be_translated)
    {
        if (!ipv6_is_ipv4_translatable(ipv6->src))
        {
            int ret = amc_query(ipv6->src, 0, false);
            if (ret < 0)
            {
                ipv4_addr_t new_src;
                int ret = ippool_alloc(&new_src);
                if (ret < 0) return ret;
                amc_update(ipv6->src, ipv4_compatible(new_src), true);
                amc_update(ipv4_compatible(new_src), ipv6->src, true);
            }
        }
        frame_t *new_frame;
        if ((ret = do_translate_6to4(frame, &new_frame)) < 0) return ret;
        frame = new_frame;
    }

    return ip_send(frame, iface, nexthop);
}

bool ipv6_is_to_me(int iface, ipv6_addr_t dst)
{
    for (int i = 0; i < eth_num_iface(); ++i)
    {
        if (ipv6_eq(dst, iface_info[i].ipv6)) return true;
    }
    if (ipv6_eq(dst, iface_info[IFACE_LOOPBACK].ipv6)) return true;
    for (int i = 0; i < 4; ++i)
    {
        if (ipv6_eq(dst, iface_info[iface].ipv6_multicast[i])) return true;
    }
    return false;
}

int handle_ndp(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv6_header_t)
                                + sizeof(icmpv6_header_t) + sizeof(ndp_packet_t)) return -EOOB;
    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    icmpv6_header_t *icmp = (icmpv6_header_t *)(ipv6 + 1);
    ndp_packet_t *ndp = (ndp_packet_t *)(icmp + 1);

    if (ipv6->hop_limit != NDP_HOP_LIMIT) return -EBADPKT;
    if (icmp->code != 0) return -EBADPKT;

    bool adv = icmp->type == ICMPV6_TYPE_NA;
    bool has_option = frame->meta.limit + 1 >= sizeof(eth_header_t) + sizeof(ipv6_header_t)
                      + sizeof(icmpv6_header_t) + sizeof(ndp_packet_t) + sizeof(ndp_option_t);
    uint64_t option_mac = 0;
    if (has_option)
    {
        ndp_option_t *option = (ndp_option_t *)(ndp + 1);
        has_option = option->len == 1 && option->type == (!adv ? ICMPV6_OPTION_TYPE_SOURCE
                                                               : ICMPV6_OPTION_TYPE_TARGET);
        if (has_option)
        {
            memcpy(&option_mac, option->mac_addr, 6);
        }
    }

    uint8_t iface = frame->meta.interface;

    interface_info_t *ifinfo = &iface_info[iface];

    uint64_t src_mac = 0;
    memcpy(&src_mac, frame->src_mac, 6);
    ipv6_addr_t src_ip = ipv6->src;
    ipv6_addr_t target_addr = ndp->addr;

    // TODO: what if has_option && src_mac != option_mac???
    // TODO: what if adv && src_ip != target_addr???

    if (!adv)
    {
        bool is_to_me = ipv6_eq(target_addr, ifinfo->ipv6);
        if (has_option && !ipv6_is_unspecified(src_ip))
        {
            arc_update(src_ip, option_mac, is_to_me /* upsert when to me */);
        }

        if (is_to_me)
        {
            int ret;
            if (!ipv6_is_unspecified(src_ip))
            {
                // FIXME: according to RFC 4861, we should either use the MAC address in ndp option,
                // or do Neighbor Discovery to figure out the MAC address of src_ip.
                // Don't use src_mac!
                ret = ip_make_ndp(frame, 4096, iface, src_ip, src_mac,
                                  true, true, ICMPV6_FLAGS_S | ICMPV6_FLAGS_O);
            }
            else
            {
                ret = ip_make_ndp(frame, 4096, iface, make_ipv6(0, 0), -1, true, false, ICMPV6_FLAGS_O);
            }

            if (ret == 0)
            {
                eth_begin_send_frame(frame);
                wait(WAIT_ETH_SEND);
            }
        }
    }
    else
    {
        if (has_option && (icmp->flags & (ICMPV6_FLAGS_S | ICMPV6_FLAGS_O)))
        {
            // FIXME: do not always create the ARC entry.
            // Only do that after some solicitation is sent.
            arc_update(target_addr, option_mac, true);
        }
        else
        {
            // Update ARC entry of target_addr without changing the MAC address.
            arc_query(target_addr, 0, true);
        }
    }
    return 0;
}

int do_icmpv6_echo(frame_t *frame)
{
    // special path to send icmpv6 echo reply

    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    icmpv6_header_t *icmp = (icmpv6_header_t *)(ipv6 + 1);

    if (icmp->code != 0) return -EBADPKT;

    interface_info_t *ifinfo = &iface_info[frame->meta.interface];

    frame->meta.limit = sizeof(eth_header_t) + sizeof(ipv6_header_t) + ntohs(ipv6->payload_len) - 1;

    memcpy(frame->dst_mac, frame->src_mac, 6);
    memcpy(frame->src_mac, &ifinfo->mac, 6);

    ipv6->hop_limit = DEFAULT_HOP_LIMIT;

    icmp->type = ICMPV6_TYPE_ECHO_REPLY;

    uint32_t checksum = ~icmp->checksum & 0xffff;
    ipv6_addr_t old_dst = ipv6->dst;
    ipv6->dst = ipv6->src;
    if (ipv6_is_multicast(old_dst))
    {
        ipv6->src = ifinfo->ipv6;
        checksum += ip_checksum_neg_partial(old_dst.u8, sizeof(old_dst.u8));
        checksum += ip_checksum_partial(ipv6->src.u8, sizeof(ipv6->src.u8));
    }
    else
    {
        ipv6->src = old_dst;
    }

    checksum += (~ICMPV6_TYPE_ECHO_REQUEST & 0xffff) + ICMPV6_TYPE_ECHO_REPLY;
    icmp->checksum = ip_checksum_final(checksum);

    eth_begin_send_frame(frame);
    wait(WAIT_ETH_SEND);
    return 0;
}

int handle_icmpv6(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv6_header_t)
                                + sizeof(icmpv6_header_t)) return -EOOB;
    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    icmpv6_header_t *icmp = (icmpv6_header_t *)(ipv6 + 1);

    if (ipv6_l4_checksum(ipv6) != 0) return -EBADPKT;

    switch (icmp->type)
    {
    case ICMPV6_TYPE_NS:
    case ICMPV6_TYPE_NA:
        return handle_ndp(frame);
        break;
    case ICMPV6_TYPE_ECHO_REQUEST:
        return do_icmpv6_echo(frame);
        break;
    default:
        return -ENOIMPL;
        break;
    }
}

int handle_ipv6(frame_t *frame)
{
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv6_header_t)) return -EOOB;
    ipv6_header_t *ipv6 = (ipv6_header_t *)frame->payload;
    if (ip_version(ipv6) != 6) return -EBADPKT;
    if (frame->meta.limit + 1 < sizeof(eth_header_t) + sizeof(ipv6_header_t)
                                + ntohs(ipv6->payload_len)) return -EOOB;
    frame->meta.limit = sizeof(eth_header_t) + sizeof(ipv6_header_t)
                        + ntohs(ipv6->payload_len) - 1;

    bool is_to_me = ipv6_is_to_me(frame->meta.interface, ipv6->dst);
    if (!is_to_me) return do_forward_ipv6(frame);

    switch (ipv6->next_header)
    {
    case IPV6_NEXT_HEADER_ICMP:
        return handle_icmpv6(frame);
        break;
    default:
        return -ENOIMPL;
        break;
    }
}
