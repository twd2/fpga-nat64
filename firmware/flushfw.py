import binascii
import sys
import serial
import struct

ACK           = 0xAA4B4341
E_CHECKSUM    = 0x4D555343
E_UNKNOWN_CMD = 0x444D4355

CMD_ENTER_BOOTLOADER = 0x00
CMD_READ             = 0x01
CMD_WRITE            = 0x02
CMD_JUMP             = 0x03

ser = serial.Serial(sys.argv[1], 115200)
print('Serial opened.')

def getu32():
    return struct.unpack('<I', ser.read(4))[0]

def putu32(x):
    data = struct.pack('<I', x)
    ser.write(data)

def cs_add(a, b):
    return ((a + b) & 0xffffffff) + (((a + b) >> 32) & 0xffffffff)

def enter_bootloader():
    putu32(CMD_ENTER_BOOTLOADER)
    putu32(0)
    putu32(CMD_ENTER_BOOTLOADER)
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))

def read(addr, count):
    putu32(CMD_READ)
    putu32(addr)
    putu32(cs_add(CMD_READ, addr))
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))
    putu32(count)
    putu32(count)
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))
    data = []
    checksum = 0
    for i in range((count + 3) >> 2):
        d = getu32()
        data.append(struct.pack('<I', d))
        checksum = cs_add(checksum, d)
    expected_checksum = getu32()
    data = b''.join(data)
    if checksum != expected_checksum:
        raise Exception('Checksum mismatch')
    return data

def write(addr, data):
    putu32(CMD_WRITE)
    putu32(addr)
    putu32(cs_add(CMD_WRITE, addr))
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))
    putu32(len(data))
    putu32(len(data))
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))
    checksum = 0
    for i in range(0, len(data), 4):
        ser.write(data[i:i + 4])
        x = struct.unpack('<I', data[i:i + 4])[0]
        checksum = cs_add(checksum, x)
    putu32(checksum)
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))

def flush(filename):
    with open(filename, 'rb') as f:
        data = f.read()
    padded_len = (len(data) + 7) & ~7
    data = data.ljust(padded_len, b'\x00')
    for i in range(0x800, len(data), 1024):
        write(0x80000000 + i, data[i:i + 1024])
        print('\rFlushing new firmware... {:2.2%}    '.format(i / len(data)), end='')
        sys.stdout.flush()
    print('\rFlushing new firmware... 100.00%    ')

def jump(addr):
    putu32(CMD_JUMP)
    putu32(addr)
    putu32(cs_add(CMD_JUMP, addr))
    r = getu32()
    if r != ACK:
        raise Exception('Error code: {}'.format(hex(r)))

def is_in_bl_mode():
    ser.write(b'gggggggggggg')
    if ser.read(4) == b'CSUM':
        return True
    ser.write(b'\n')
    print(ser.readline())
    print(ser.readline())
    return False

def print_hex_data(data):
    buf = ''
    for i, d in enumerate(data):
        print('{:02x}'.format(d), end=' ')
        if 32 <= d <= 126:
            buf += chr(d)
        else:
            buf += '.'
        if i % 16 == 15:
            print(' |{}|'.format(buf))
            buf = ''
    print()

if not is_in_bl_mode():
    for i in range(2):
        ser.write(b'gg\n')
        print(ser.readline())
        print(ser.readline())
    ser.write(b'bootloader\n')
    print(ser.readline())
    print(ser.readline())
else:
    print('Already in bootloader mode.')
print('Checking bootloader mode... ', end='')
sys.stdout.flush()
enter_bootloader()
print('OK')
print('Testing reading... ', end='')
sys.stdout.flush()
data = read(0x80000000, 0x10)[:0x10]
print('OK')
print_hex_data(data)
print('Flushing new firmware... ', end='')
sys.stdout.flush()
flush('firmware.bin')
jump(0x80000000)
print('Done.')

while True:
    line = ser.readline().decode().rstrip()
    print('>>> ' + line)
    if 'finish' in line:
        break
'''
print('Testing reading... ', end='')
sys.stdout.flush()
data = read(0x80000b50, 0x100)[:0x100]
print('OK')
print_hex_data(data)
'''
