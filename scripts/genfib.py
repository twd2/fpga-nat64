import struct

with open('fib0.bin', 'wb') as f:
    for i in range(4096):
        if i == 0x200:
            f.write(struct.pack('<H', 0))
        elif i == 0x300:
            f.write(struct.pack('<H', 1))
        else:
            f.write(struct.pack('<H', 0xffff))

def write_item(f, nexthop_id, nextptr):
    data = [0] * 16
    for i in range(16):
        data[i] = (nextptr[i] & 0x7fff) | ((nexthop_id << (15 - i)) & 0x8000)
        print(hex(data[i]))
    f.write(struct.pack('<HHHHHHHHHHHHHHHH', *data))
    print()

with open('fib.bin', 'wb') as f:
    for i in range(1024):
        if i == 0: # 2000::/12
            write_item(f, 0x101, [-1, 2, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        elif i == 1: # 3000::/12
            write_item(f, 0x102, [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        elif i == 2: # 2001::/16
            write_item(f, 0x103, [-1, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        elif i == 3: # 2002::/16
            write_item(f, 0x104, [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        elif i == 4: # 2001:1000::/20
            write_item(f, 0x105, [-1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        elif i == 5: # 2001:1100::/24
            write_item(f, 0x106, [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
        else:
            f.write(struct.pack('<QQQQ', i & 0xff, i, i, i))
