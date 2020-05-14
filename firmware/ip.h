#ifndef _FIRMWARE_IP_H_
#define _FIRMWARE_IP_H_

#include "stdbool.h"
#include "stdint.h"

typedef union
{
    uint32_t u32;
    uint8_t u8[4];
} ipv4_addr_t;

typedef union
{
    uint64_t u64[2];
    uint8_t u8[16];
} ipv6_addr_t;

// L3 protocols

#define IPV4_VERSION 0x45
#define IPV6_VERSION 0x60

#define IPV4_DF_BIT 0x4000
#define IPV4_MF_BIT 0x2000
#define IPV4_NEXT_HEADER_ICMP 1
#define IPV4_NEXT_HEADER_IGMP 2
#define IPV6_MF_BIT 0x0001
#define IPV6_NEXT_HEADER_ICMP 58
#define IPV6_NEXT_HEADER_FRAGMENT 44
#define IP_NEXT_HEADER_TCP 6
#define IP_NEXT_HEADER_UDP 17
#define DEFAULT_HOP_LIMIT 255

typedef struct
{
    uint8_t version_header_len;
    uint8_t dscp_ecn;
    uint16_t total_len;
    uint16_t id;
    uint16_t flags;
    uint8_t hop_limit;
    uint8_t next_header;
    uint16_t checksum;
    ipv4_addr_t src;
    ipv4_addr_t dst;
} ipv4_header_t;

typedef struct
{
    uint32_t version_flow;
    uint16_t payload_len;
    uint8_t next_header;
    uint8_t hop_limit;
    ipv6_addr_t src;
    ipv6_addr_t dst;
} ipv6_header_t;

typedef struct
{
    uint8_t next_header;
    uint8_t reserved1;
    uint16_t offset_mf;
    uint32_t id;
} ipv6_fragment_header_t;

// For little-endian systems.
#define ARP_OP_REQUEST 0x0100
#define ARP_OP_REPLY 0x0200

#define ARP_HTYPE_ETHERNET  0x0100
#define ARP_PTYPE_IPV4      0x0008

#define ARP_HLEN_ETHERNET  6
#define ARP_PLEN_IPV4      4

typedef struct
{
    uint16_t htype;  // should be 0x0001 (Ethernet)
    uint16_t ptype;  // should be 0x0800 (IPv4)
    uint8_t hlen;  // should be 6
    uint8_t plen;  // should be 4
    uint16_t op;  // 1 for request, 2 for reply.
    uint8_t mac_saddr[6];
    uint8_t ip_saddr[4];
    uint8_t mac_daddr[6];
    uint8_t ip_daddr[4];
} arp_packet_t;

// L4 protocols

#define ICMPV4_TYPE_TTL 0x0b
#define ICMPV4_CODE_TTL 0x00
#define ICMPV6_TYPE_TTL 0x03
#define ICMPV6_CODE_TTL 0x00

#define ICMPV4_TYPE_DEFRAG 0x0b
#define ICMPV4_CODE_DEFRAG 0x01
#define ICMPV6_TYPE_DEFRAG 0x03
#define ICMPV6_CODE_DEFRAG 0x01

#define ICMPV4_TYPE_TOO_BIG 0x03
#define ICMPV4_CODE_TOO_BIG 0x04
#define ICMPV6_TYPE_TOO_BIG 0x02
#define ICMPV6_CODE_TOO_BIG 0x00

#define ICMPV4_TYPE_ECHO_REQUEST 0x08
#define ICMPV4_CODE_ECHO_REQUEST 0x00
#define ICMPV6_TYPE_ECHO_REQUEST 0x80
#define ICMPV6_CODE_ECHO_REQUEST 0x00

#define ICMPV4_TYPE_ECHO_REPLY 0x00
#define ICMPV4_CODE_ECHO_REPLY 0x00
#define ICMPV6_TYPE_ECHO_REPLY 0x81
#define ICMPV6_CODE_ECHO_REPLY 0x00

#define ICMPV4_TYPE_NETWORK_UNREACHABLE 0x03
#define ICMPV4_CODE_NETWORK_UNREACHABLE 0x00
#define ICMPV6_TYPE_NETWORK_UNREACHABLE 0x01
#define ICMPV6_CODE_NETWORK_UNREACHABLE 0x00

#define ICMPV4_TYPE_ADDRESS_UNREACHABLE 0x03
#define ICMPV4_CODE_ADDRESS_UNREACHABLE 0x01
#define ICMPV6_TYPE_ADDRESS_UNREACHABLE 0x01
#define ICMPV6_CODE_ADDRESS_UNREACHABLE 0x03

#define ICMPV4_TYPE_PORT_UNREACHABLE 0x03
#define ICMPV4_CODE_PORT_UNREACHABLE 0x03
#define ICMPV6_TYPE_PORT_UNREACHABLE 0x01
#define ICMPV6_CODE_PORT_UNREACHABLE 0x04

#define ICMPV6_TYPE_RS 0x85
#define ICMPV6_TYPE_RA 0x86
#define ICMPV6_TYPE_NS 0x87
#define ICMPV6_TYPE_NA 0x88
#define ICMPV6_CODE_RS 0x00
#define ICMPV6_CODE_RA 0x00
#define ICMPV6_CODE_NS 0x00
#define ICMPV6_CODE_NA 0x00

#define ICMPV6_TYPE_MLD_QUERY 0x82
#define ICMPV6_TYPE_MLD_REPORT 0x83
#define ICMPV6_TYPE_MLD_DONE 0x84

// For little-endian systems.
#define ICMPV4_TYPE_CODE_TTL 0x000b
#define ICMPV6_TYPE_CODE_TTL 0x0003

#define ICMPV4_TYPE_CODE_DEFRAG 0x010b
#define ICMPV6_TYPE_CODE_DEFRAG 0x0103

#define ICMPV4_TYPE_CODE_TOO_BIG 0x0403
#define ICMPV6_TYPE_CODE_TOO_BIG 0x0002

#define ICMPV4_TYPE_CODE_ECHO_REQUEST 0x0008
#define ICMPV6_TYPE_CODE_ECHO_REQUEST 0x0080

#define ICMPV4_TYPE_CODE_ECHO_REPLY 0x0000
#define ICMPV6_TYPE_CODE_ECHO_REPLY 0x0081

#define ICMPV4_TYPE_CODE_NETWORK_UNREACHABLE 0x0003
#define ICMPV6_TYPE_CODE_NETWORK_UNREACHABLE 0x0001

#define ICMPV4_TYPE_CODE_ADDRESS_UNREACHABLE 0x0103
#define ICMPV6_TYPE_CODE_ADDRESS_UNREACHABLE 0x0301

#define ICMPV4_TYPE_CODE_PORT_UNREACHABLE 0x0303
#define ICMPV6_TYPE_CODE_PORT_UNREACHABLE 0x0401

#define ICMPV6_TYPE_CODE_RS 0x0085
#define ICMPV6_TYPE_CODE_RA 0x0086
#define ICMPV6_TYPE_CODE_NS 0x0087
#define ICMPV6_TYPE_CODE_NA 0x0088

#define ICMPV6_TYPE_CODE_MLD_QUERY 0x0082
#define ICMPV6_TYPE_CODE_MLD_REPORT 0x0083
#define ICMPV6_TYPE_CODE_MLD_DONE 0x0084

typedef struct
{
    union
    {
        struct
        {
            uint8_t type;
            uint8_t code;
        };
        uint16_t type_code;
    };
    uint16_t checksum;
    union
    {
        uint8_t rest_bytes[4];
        uint32_t rest;
        struct
        {
            uint16_t ununsed1;  // should be 0
            uint16_t mtu;
        };
        struct
        {
            uint16_t id;
            uint16_t seq;
        };
    };
} icmpv4_header_t;

typedef struct
{
    union
    {
        struct
        {
            uint8_t type;
            uint8_t code;
        };
        uint16_t type_code;
    };
    uint16_t checksum;
    union
    {
        uint8_t rest_bytes[4];
        uint32_t rest;
        uint32_t flags;
        uint32_t mtu;
        // for echo requests and responses
        struct
        {
            uint16_t id;
            uint16_t seq;
        };
        // for MLD messages
        struct
        {
            uint16_t max_response_delay;  // meaningful only in Query messages
            uint16_t reserved1;  // Initialized to zero by the sender; ignored by receivers.
        };
    };
} icmpv6_header_t;

#define ICMPV6_FLAGS_R 0x80
#define ICMPV6_FLAGS_S 0x40
#define ICMPV6_FLAGS_O 0x20

#define ICMPV6_OPTION_TYPE_SOURCE 1
#define ICMPV6_OPTION_TYPE_TARGET 2

#define MLD_HOP_LIMIT 1
#define NDP_HOP_LIMIT 255

typedef struct
{
    ipv6_addr_t addr;
} ndp_packet_t;

typedef struct
{
    uint8_t type;
    uint8_t len;  // should be 1 (means 8 bytes) for ethernet
    uint8_t mac_addr[6];
} ndp_option_t;

// The code field of the ICMPv6 header is initialized to zero by the sender,
// and ignored by receivers.
typedef struct
{
    ipv6_addr_t maddr;
} mld_packet_t;

#define IGMP_TYPE_QUERY 0x11
#define IGMP_TYPE_V2REPORT 0x16
#define IGMP_TYPE_LEAVE 0x17
#define IGMP_TYPE_V1REPORT 0x12

typedef struct
{
    uint8_t type;
    uint8_t max_response_delay;
    uint16_t checksum;
    ipv4_addr_t maddr;
} igmp_packet_t;

typedef struct
{
    uint32_t header0[4];
    uint16_t checksum;
    uint16_t header1;
} tcp_header_t;

typedef struct
{
    uint16_t src_port;
    uint16_t dst_port;
    uint16_t len;
    uint16_t checksum;
} udp_header_t;

// L5

#define RIP_PORT 520
#define RIPNG_PORT 521

#define RIP_CMD_REQUEST 1
#define RIP_CMD_RESPONSE 2
#define RIPNG_CMD_REQUEST 1
#define RIPNG_CMD_RESPONSE 2

typedef struct
{
    uint16_t af;
    uint16_t tag;
    ipv4_addr_t prefix;
    uint32_t mask;
    uint32_t nexthop;
    uint32_t metric;
} __attribute__((packed)) rip_entry_t;

typedef struct
{
    uint8_t cmd;
    uint8_t ver;  // 1 or 2
    uint16_t zero;
    rip_entry_t entries[];
} __attribute__((packed)) rip_packet_t;

typedef struct
{
    ipv6_addr_t prefix;
    uint16_t tag;
    uint8_t prefixlen;
    uint8_t metric;
} __attribute__((packed)) ripng_entry_t;

typedef struct
{
    uint8_t cmd;
    uint8_t ver;  // 1
    uint16_t zero;
    ripng_entry_t entries[];
} __attribute__((packed)) ripng_packet_t;

static inline uint16_t ntohs(uint16_t x)
{
    return ((x << 8) & 0xff00) | ((x >> 8) & 0xff);
}

static inline uint16_t htons(uint16_t x)
{
    return ntohs(x);
}

static inline uint32_t ntohl(uint32_t x)
{
    return ((x << 24) & 0xff000000)
           | ((x << 8) & 0x00ff0000)
           | ((x >> 8) & 0x0000ff00)
           | ((x >> 24) & 0x000000ff);
}

static inline uint32_t htonl(uint32_t x)
{
    return ntohl(x);
}

static inline uint8_t ip_version(void *pkt)
{
    ipv4_header_t *v4pkt = (ipv4_header_t *)pkt;
    return v4pkt->version_header_len >> 4;
}

static inline uint32_t ip_checksum_partial(const void *buff, size_t len)
{
    uint32_t checksum = 0;
    const uint16_t *buff16 = (const uint16_t *)buff;
    for (int i = 0; i < len / sizeof(uint16_t); ++i)
    {
        checksum += buff16[i];
    }
    if (len & 1) checksum += (uint16_t)((const uint8_t *)buff)[len - 1];
    return checksum;
}

static inline uint32_t ip_checksum_neg_partial(const void *buff, size_t len)
{
    uint32_t checksum = 0;
    const uint16_t *buff16 = (const uint16_t *)buff;
    for (int i = 0; i < len / sizeof(uint16_t); ++i)
    {
        checksum += ~buff16[i] & 0xffff;
    }
    if (len & 1) checksum += ~((uint16_t)((const uint8_t *)buff)[len - 1]) & 0xffff;
    return checksum;
}

static inline uint16_t ip_checksum_final(uint32_t checksum)
{
    checksum = (checksum & 0xffff) + (checksum >> 16);
    checksum = (checksum & 0xffff) + (checksum >> 16);
    return ~(checksum & 0xffff);
}

static inline uint16_t ip_checksum(const void *buff, size_t len)
{
    return ip_checksum_final(ip_checksum_partial(buff, len));
}

static inline ipv4_addr_t make_ipv4(uint32_t addr)
{
    ipv4_addr_t ip;
    ip.u32 = addr;
    return ip;
}

static inline ipv6_addr_t make_ipv6(uint64_t lo, uint64_t hi)
{
    ipv6_addr_t ip;
    ip.u64[0] = lo;
    ip.u64[1] = hi;
    return ip;
}

static inline bool is_ipv4(ipv6_addr_t a)
{
    return a.u64[0] == 0 && (a.u64[1] & 0xffffffff) == 0;
}

static inline bool is_ipv6(ipv6_addr_t a)
{
    return !is_ipv4(a);
}

static inline uint64_t ipv6_multicast_mac(ipv6_addr_t a)
{
    return ((a.u64[1] >> 16) & 0xffffffff0000) | 0x3333;
}

static inline ipv6_addr_t ipv6_from_mac(uint64_t mac)
{
    return make_ipv6(0x80fe,
                     ((mac & 0xffffff) | ((mac << 16) & 0xffffff0000000000))
                     ^ 0x000000feff000002);
}

static inline ipv6_addr_t ipv6_all_nodes()
{
    return make_ipv6(0x02ff, 0x01ul << 56);
}

static inline ipv6_addr_t ipv6_all_routers()
{
    return make_ipv6(0x02ff, 0x02ul << 56);
}

static inline ipv6_addr_t ipv6_rip_routers()
{
    return make_ipv6(0x02ff, 0x09ul << 56);
}

static inline ipv6_addr_t ipv6_solicited_node(ipv6_addr_t a)
{
    return make_ipv6(0x02ff, (a.u64[1] & 0xffffff0000000000) | 0xff01000000);
}

static inline ipv6_addr_t ipv4_compatible(ipv4_addr_t a)
{
    return make_ipv6(0, (uint64_t)a.u32 << 32);
}

static inline ipv4_addr_t extract_ipv4(ipv6_addr_t a)
{
    return make_ipv4(a.u64[1] >> 32);
}

static inline bool ipv4_eq(ipv4_addr_t a, ipv4_addr_t b)
{
    return a.u32 == b.u32;
}

static inline bool ipv6_eq(ipv6_addr_t a, ipv6_addr_t b)
{
    return a.u64[0] == b.u64[0] && a.u64[1] == b.u64[1];
}

static inline bool ipv4_is_multicast(ipv4_addr_t a)
{
    return (a.u8[0] >> 4) == 0xe;
}

static inline bool ipv6_is_multicast(ipv6_addr_t a)
{
    return a.u8[0] == 0xff;
}

static inline bool ipv6_is_unspecified(ipv6_addr_t a)
{
    return a.u64[0] == 0 && a.u64[1] == 0;
}

extern ipv6_addr_t ipv4_converted_prefix;
extern ipv6_addr_t ipv4_translatable_prefix;
extern ipv4_addr_t ipv6_converted_prefix;
extern ipv4_addr_t ipv6_converted_mask;
extern ipv4_addr_t ipv4_pool_prefix;
extern ipv4_addr_t ipv4_pool_mask;

static inline ipv6_addr_t ipv4_embed(ipv6_addr_t p, ipv4_addr_t a)
{
    return make_ipv6(p.u64[0], p.u64[1] | ((uint64_t)a.u32 << 32));
}

static inline bool ipv6_is_in_net96(ipv6_addr_t p, ipv6_addr_t a)
{
    return p.u64[0] == a.u64[0] && ((p.u64[1] ^ a.u64[1]) & 0xfffffffful) == 0;
}

static inline bool ipv4_is_in_net(ipv4_addr_t p, ipv4_addr_t m, ipv4_addr_t a)
{
    return ((p.u32 ^ a.u32) & m.u32) == 0;
}

static inline ipv6_addr_t ipv4_converted(ipv4_addr_t a)
{
    return ipv4_embed(ipv4_converted_prefix, a);
}

static inline bool ipv6_is_ipv4_converted(ipv6_addr_t a)
{
    return ipv6_is_in_net96(ipv4_converted_prefix, a);
}

static inline ipv6_addr_t ipv4_translatable(ipv4_addr_t a)
{
    return ipv4_embed(ipv4_translatable_prefix, a);
}

static inline bool ipv6_is_ipv4_translatable(ipv6_addr_t a)
{
    return ipv6_is_in_net96(ipv4_translatable_prefix, a);
}

static inline bool ipv4_is_ipv6_converted(ipv4_addr_t a)
{
    return ipv4_is_in_net(ipv6_converted_prefix, ipv6_converted_mask, a);
}

static inline bool ipv4_is_ipv4_pool(ipv4_addr_t a)
{
    return ipv4_is_in_net(ipv4_pool_prefix, ipv4_pool_mask, a);
}

#include "ethernet.h"

void init_ip();
int arp_make_request(frame_t *frame, size_t buflen, int iface, ipv4_addr_t ip, uint64_t known_mac);
int ip_make_ndp(frame_t *frame, size_t buflen, int iface,
                ipv6_addr_t addr, uint64_t mac,
                bool adv, bool unicast, uint32_t flags);
void ip_send_init_packets_all(frame_t *frame, size_t buflen);
int handle_frame(frame_t *frame);
int handle_arp(frame_t *frame);
int handle_ipv4(frame_t *frame);
int handle_ipv6(frame_t *frame);
int ip_send_with_mac(frame_t *frame, uint8_t iface, uint64_t mac);

extern const uint64_t MAC_BROADCAST;

typedef struct
{
    uint64_t config;
    uint64_t mtu;
    uint64_t mac;
    uint16_t nexthop_id;  // onlink nexthop info. id
    uint8_t ipv4_prefixlen, ipv6_prefixlen;
    ipv4_addr_t ipv4;
    ipv4_addr_t ipv4_multicast[4];
    ipv6_addr_t ipv6;
    ipv6_addr_t ipv6_multicast[4];
} interface_info_t;

extern interface_info_t iface_info[];

#endif
