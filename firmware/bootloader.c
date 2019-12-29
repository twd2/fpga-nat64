#include "asm.h"

// The bootloader should be a standalone object.

#define UART_BASE 0x60000000
#define UART_RX (*(volatile uint32_t *)(UART_BASE + 0x0))
#define UART_TX (*(volatile uint32_t *)(UART_BASE + 0x4))
#define UART_STAT (*(volatile uint32_t *)(UART_BASE + 0x8))
#define UART_CTRL (*(volatile uint32_t *)(UART_BASE + 0xc))

#define UART_TX_FIFO_FULL 8
#define UART_RX_FIFO_VALID 1

#define BL_CODE __attribute__ ((section (".text.bootloader")))
#define BL_DATA __attribute__ ((section (".data.bootloader")))

#define ACK           0xAA4B4341
#define E_CHECKSUM    0x4D555343
#define E_UNKNOWN_CMD 0x444D4355

#define CMD_ENTER_BOOTLOADER 0x00
#define CMD_READ             0x01
#define CMD_WRITE            0x02
#define CMD_JUMP             0x03

BL_CODE static inline void putu8(uint8_t c)
{
    while (UART_STAT & UART_TX_FIFO_FULL);
    UART_TX = c;
}

BL_CODE static void putu32(uint32_t x)
{
    putu8(x & 0xff);
    x >>= 8; putu8(x & 0xff);
    x >>= 8; putu8(x & 0xff);
    x >>= 8; putu8(x & 0xff);
}

BL_CODE static inline uint8_t getu8()
{
    while (!(UART_STAT & UART_RX_FIFO_VALID));
    return UART_RX;
}

BL_CODE static uint32_t getu32()
{   
    uint32_t u32 = getu8();
    u32 |= getu8() << 8;
    u32 |= getu8() << 16;
    u32 |= getu8() << 24;
    return u32;
}

BL_CODE static inline uint32_t cs_add(uint32_t a, uint32_t b)
{
    return (uint32_t)(a + b) + (uint32_t)(((uint64_t)a + (uint64_t)b) >> 32);
}

BL_CODE static inline void do_read(uint32_t addr)
{
    addr &= ~3;
    putu32(ACK);
    uint32_t count = getu32();
    uint32_t checksum = getu32();
    if (count != checksum)
    {
        putu32(E_CHECKSUM);
        return;
    }
    putu32(ACK);
    count = (count + 3) >> 2;
    checksum = 0;
    uint32_t *end = (uint32_t *)(uint64_t)addr + count;
    for (uint32_t *ptr = (uint32_t *)(uint64_t)addr; ptr != end; ++ptr)
    {
        uint32_t data = *ptr;
        checksum = cs_add(checksum, data);
        putu32(data);
    }
    putu32(checksum);
}

BL_CODE static inline void do_write(uint32_t addr)
{
    addr &= ~3;
    putu32(ACK);
    uint32_t count = getu32();
    uint32_t checksum = getu32();
    if (count != checksum)
    {
        putu32(E_CHECKSUM);
        return;
    }
    putu32(ACK);
    count = (count + 3) >> 2;
    checksum = 0;
    uint32_t *end = (uint32_t *)(uint64_t)addr + count;
    for (uint32_t *ptr = (uint32_t *)(uint64_t)addr; ptr != end; ++ptr)
    {
        uint32_t data = getu32();
        *ptr = data;
        checksum = cs_add(checksum, data);
    }
    uint32_t expected_checksum = getu32();
    if (checksum != expected_checksum)
    {
        putu32(E_CHECKSUM);
    }
    else
    {
        putu32(ACK);
    }
}

BL_CODE void bootloader()
{
    while (1)
    {
        uint32_t cmd = getu32();
        uint32_t arg = getu32();
        uint32_t checksum = getu32();
        if (cs_add(cmd, arg) != checksum)
        {
            putu32(E_CHECKSUM);
            continue;
        }
        switch (cmd)
        {
        case CMD_ENTER_BOOTLOADER:
            putu32(ACK);
            break;
        case CMD_READ:
            do_read(arg);
            break;
        case CMD_WRITE:
            do_write(arg);
            break;
        case CMD_JUMP:
            putu32(ACK);
            fence();
            fence_i();
            ((void (*)())(uint64_t)arg)();
            break;
        default:
            putu32(E_UNKNOWN_CMD);
            break;
        }
    }
}
