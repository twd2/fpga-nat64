#ifndef _FIRMWARE_ETHERNET_H_
#define _FIRMWARE_ETHERNET_H_

#include "stdint.h"

typedef struct
{
    uint16_t limit;  // length - 1, ignored when sending
    uint8_t error;
    uint8_t interface;  // ingress interface when receiving, egress interface when sending
    uint8_t reserved1;
    uint8_t reason;
    uint8_t reserved2[14];
} __attribute__((packed)) frame_meta_t;

typedef struct
{
    frame_meta_t meta;
    uint8_t dst_mac[6];
    uint8_t src_mac[6];
    uint16_t ethertype;
    uint8_t payload[];
} __attribute__((packed)) frame_t;

typedef struct
{
    uint8_t dst_mac[6];
    uint8_t src_mac[6];
    uint16_t ethertype;
    uint8_t payload[];
} __attribute__((packed)) eth_header_t;

#define MAX_NUM_INTERFACES 4
#define IFACE_LOOPBACK MAX_NUM_INTERFACES

#define CONFIG_EN          (1 << 0)
#define CONFIG_PROMISCUOUS (1 << 1)
#define CONFIG_ALL_TO_CPU  (1 << 2)

#define REASON_ICMP              (1 << 0)
#define REASON_ARP               (1 << 1)
#define REASON_HOP_LIMIT_REACHED (1 << 2)
#define REASON_TOO_BIG           (1 << 3)
#define REASON_AMC_MISS          (1 << 4)
#define REASON_FIB_MISS          (1 << 5)
#define REASON_ARC_MISS          (1 << 6)
#define REASON_DEST_IS_CPU       (1 << 7)

#define ETH_TYPE_IPV4           0x0008
#define ETH_TYPE_IPV6           0xdd86
#define ETH_TYPE_ARP            0x0608

// Make payload (ip packet) 16-byte aligned.
#define ALIGN_OFFSET (((sizeof(frame_t) + 15) & ~15) - sizeof(frame_t))

#include "eth.h"
static inline void eth_begin_send_frame(frame_t *frame)
{
    eth_begin_dma_send(frame, frame->meta.limit + 1 + sizeof(frame_meta_t));
}

#endif
