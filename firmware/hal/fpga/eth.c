#include "eth.h"
#include "asm.h"
#include "serial.h"
#include "utils.h"

int eth_send_not_begin = 1;

void init_eth()
{
    puts("Initializing ethernet... ");

    DMA_S2MM_DMACR = 0;
    DMA_S2MM_DMACR |= DMA_DMACR_RS;
    while (DMA_S2MM_DMASR & DMA_DMASR_HALTED);
    DMA_MM2S_DMACR = 0;
    DMA_MM2S_DMACR |= DMA_DMACR_RS;
    while (DMA_MM2S_DMASR & DMA_DMASR_HALTED);
    puts("OK\r\n");
}

void eth_begin_dma_recv(void *data, uint32_t len)
{
    uintptr_t ptr = (uintptr_t)data;
    DMA_S2MM_DA = (uint32_t)(ptr & 0xffffffff);
    DMA_S2MM_DA_MSB = (uint32_t)((ptr >> 32) & 0xffffffff);
    fence();
    DMA_S2MM_LENGTH = len;
    fence();
}

void eth_begin_dma_send(void *data, uint32_t len)
{
    eth_send_not_begin = 0;
    uintptr_t ptr = (uintptr_t)data;
    DMA_MM2S_SA = (uint32_t)(ptr & 0xffffffff);
    DMA_MM2S_SA_MSB = (uint32_t)((ptr >> 32) & 0xffffffff);
    fence();
    DMA_MM2S_LENGTH = len;
    fence();
}
