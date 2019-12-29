import struct
import sys

with open(sys.argv[1], 'rb') as f:
    data = f.read()

padded_len = (len(data) + 31) & ~31
data = data.ljust(padded_len, b'\x00')

with open(sys.argv[2], 'w') as f:
    f.write('memory_initialization_radix = 16;\n')
    f.write('memory_initialization_vector =\n')
    for i in range(0, len(data), 32):
        f.write(hex(struct.unpack('<Q', data[i + 24:i + 32])[0])[2:].rjust(16, '0'))
        f.write(hex(struct.unpack('<Q', data[i + 16:i + 24])[0])[2:].rjust(16, '0'))
        f.write(hex(struct.unpack('<Q', data[i + 8:i + 16])[0])[2:].rjust(16, '0'))
        f.write(hex(struct.unpack('<Q', data[i + 0:i + 8])[0])[2:].rjust(16, '0'))
        if i < len(data) - 32:
            f.write(',\n')
        else:
            f.write(';\n')
