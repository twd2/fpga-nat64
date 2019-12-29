import struct
import sys

with open(sys.argv[1], 'rb') as f:
    data = f.read()

padded_len = (len(data) + 1) & ~1
data = data.ljust(padded_len, b'\x00')

with open(sys.argv[2], 'w') as f:
    f.write('memory_initialization_radix = 16;\n')
    f.write('memory_initialization_vector =\n')
    for i in range(0, len(data), 2):
        f.write(hex(struct.unpack('<H', data[i:i + 2])[0])[2:].rjust(4, '0'))
        if i < len(data) - 2:
            f.write(',\n')
        else:
            f.write(';\n')
