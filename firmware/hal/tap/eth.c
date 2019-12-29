#include "eth.h"
#include "asm.h"
#include "serial.h"
#include "printf.h"
#include "utils.h"
#include "string.h"

#define int8_t linux_int8_t
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/if.h>
#include <linux/if_tun.h>
#undef int8_t

uint16_t eth_default_nexthop_id = 0;
uint64_t eth_mac[1] = { 0x315f32445754 };
uint16_t eth_mtu[1] = { 1500 };

static int tap_fd = 1;
static void *last_recv_data;
static uint32_t last_recv_len;
static void *last_send_data;
static uint32_t last_send_len;

static int tun_alloc(const char *name, int flags)
{
    const char *clonedev = "/dev/net/tun";

    int fd;
    if ((fd = open(clonedev, O_RDWR)) < 0)
    {
        return fd;
    }

    struct ifreq ifr;
    memset(&ifr, 0, sizeof(ifr));
    if (name)
    {
        memcpy(ifr.ifr_name, name, IFNAMSIZ - 1);
        ifr.ifr_name[IFNAMSIZ - 1] = 0;
    }
    ifr.ifr_flags = flags;

    int err;
    if ((err = ioctl(fd, TUNSETIFF, (void *)&ifr)) < 0)
    {
        close(fd);
        return err;
    }

    return fd;
}

void init_eth()
{
    puts("Initializing ethernet... ");

    tap_fd = tun_alloc("tap-hal", IFF_TAP | IFF_NO_PI);
    setresuid(65534, 65534, 65534);
    setresgid(65534, 65534, 65534);
    fcntl(tap_fd, F_SETFL, fcntl(tap_fd, F_GETFL, 0) | O_NONBLOCK);

    puts("OK\r\n");
}

void eth_begin_dma_recv(void *data, uint32_t len)
{
    last_recv_data = data;
    last_recv_len = len;
}

void eth_begin_dma_send(void *data, uint32_t len)
{
    last_send_data = data;
    last_send_len = len;
}

int eth_poll_recv()
{
    if (last_recv_data)
    {
        int ret = read(tap_fd, (uint8_t *)last_recv_data + sizeof(frame_meta_t),
                       last_recv_len - sizeof(frame_meta_t));
        if (ret > 0)
        {
            frame_t *frame = (frame_t *)last_recv_data;
            frame->meta.limit = ret - 1;
            frame->meta.interface = 0;
            last_recv_data = 0;
        }
    }
    return !last_recv_data;
}

int eth_poll_send()
{
    if (last_send_data)
    {
        int ret = write(tap_fd, (uint8_t *)last_send_data + sizeof(frame_meta_t),
                        last_send_len - sizeof(frame_meta_t));
        if (ret > 0) last_send_data = 0;
    }
    return !last_send_data;
}
