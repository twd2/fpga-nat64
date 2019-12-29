#include "asm.h"
#include "serial.h"
#include "eth.h"
#include "ethernet.h"
#include "task.h"
#include "string.h"
#include "printf.h"
#include "utils.h"
#include "amc.h"
#include "fib.h"
#include "arc.h"
#include "ip.h"

extern void enter_bootloader();
__attribute__ ((aligned (16))) uint8_t dma_buff[4096];

void init_bss()
{
    extern uint8_t _bss_begin[];
    extern uint8_t _bss_end[];
    memset(_bss_begin, 0, (uintptr_t)_bss_end - (uintptr_t)_bss_begin);
}

__attribute__ ((aligned (16))) uint8_t arc_timer_buff[128];

__attribute__ ((aligned (16))) uint8_t timer_1_stack[1024];
static struct task timer_1_task;
void timer_1_entry()
{
    while (1)
    {
        puts("timer 1\r\n");
        //ip_send_init_packets_all((frame_t *)(arc_timer_buff + ALIGN_OFFSET),
        //                         sizeof(arc_timer_buff) - ALIGN_OFFSET);
        sleep(1 * TICKS_PER_SECOND);
    }
}

__attribute__ ((aligned (16))) uint8_t timer_30_stack[1024];
static struct task timer_30_task;
void timer_30_entry()
{
    while (1)
    {
        puts("timer 30\r\n");
        //arc_print();
        //amc_print();
        /*
            TODO: Reap expired mappings, put back addresses to the pool.
        */
        sleep(30 * TICKS_PER_SECOND);
    }
}

void arc_request_handler(arc_request_t *req)
{
    printf("arc_request_handler(0x%016lx)\r\n", (uint64_t)req);
    frame_t *frame = (frame_t *)(arc_timer_buff + ALIGN_OFFSET);
    for (int iface = 0; iface < 4; ++iface)
    {
        // FIXME: use req->iface!
        if (is_ipv4(req->addr))
        {
            if (arp_make_request(frame, sizeof(arc_timer_buff) - ALIGN_OFFSET,
                                 iface, extract_ipv4(req->addr),
                                 req->unicast ? req->mac : -1ul) == 0)
            {
                eth_begin_send_frame(frame);
                wait(WAIT_ETH_SEND);
            }
        }
        else
        {
            if (ip_make_ndp(frame, sizeof(arc_timer_buff) - ALIGN_OFFSET,
                            iface, req->addr, req->mac, false, req->unicast, 0) == 0)
            {
                eth_begin_send_frame(frame);
                wait(WAIT_ETH_SEND);
            }
        }
    }
}

__attribute__ ((aligned (16))) uint8_t arc_timer_stack[1024];
static struct task arc_timer_task;
void arc_timer_entry()
{
    while (1)
    {
        puts("arc timer\r\n");
        ip_send_init_packets_all((frame_t *)(arc_timer_buff + ALIGN_OFFSET),
                                 sizeof(arc_timer_buff) - ALIGN_OFFSET);
        arc_timer(arc_request_handler);
        sleep(5 * TICKS_PER_SECOND);
    }
}

__attribute__ ((aligned (16))) uint8_t eth_stack[1024];
static struct task eth_task;
void eth_entry()
{
    puts("Start processing frames/packets.\r\n");
    while (1)
    {
        eth_begin_dma_recv(dma_buff + ALIGN_OFFSET, sizeof(dma_buff) - ALIGN_OFFSET);
        wait(WAIT_ETH_RECV);

        frame_t *frame = (frame_t *)(dma_buff + ALIGN_OFFSET);
        if (frame->meta.limit + 1 > 1514)
        {
            // bad frame
            continue;
        }

        handle_frame(frame);
    }
}

void start(int hartid, void *dtb)
{
    fence();
    fence_i();

    init_bss();
    init_serial();
    init_eth();
    init_task();
    init_fib();
    init_ip();
    puts("Initialization finished.\r\n");

    printf("Vendor: 0x%016lx\r\n", eth_get_vendor());
    printf("System Clock: 0x%lx\r\n", eth_get_clock());

    // fib test:
    eth_set_default_nexthop_id(FIB_INVALID_NEXTPTR);
    fib_print_nexthops();
    fib_print();

    /*ETH_CONFIG[0] = CONFIG_ALL_TO_CPU | CONFIG_EN;
    ETH_CONFIG[1] = CONFIG_ALL_TO_CPU | CONFIG_EN;
    ETH_CONFIG[2] = CONFIG_ALL_TO_CPU | CONFIG_EN;
    ETH_CONFIG[3] = CONFIG_ALL_TO_CPU | CONFIG_EN;*/

    create_task(&timer_1_task, (uintptr_t)timer_1_stack + sizeof(timer_1_stack) + STACK_OFFSET, timer_1_entry);
    create_task(&timer_30_task, (uintptr_t)timer_30_stack + sizeof(timer_30_stack) + STACK_OFFSET, timer_30_entry);
    create_task(&arc_timer_task, (uintptr_t)arc_timer_stack + sizeof(arc_timer_stack) + STACK_OFFSET, arc_timer_entry);
    create_task(&eth_task, (uintptr_t)eth_stack + sizeof(eth_stack) + STACK_OFFSET, eth_entry);
    idle_entry();
    enter_bootloader();
}
