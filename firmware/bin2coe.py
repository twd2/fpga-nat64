import struct
import sys

with open(sys.argv[1], 'rb') as f:
    data = f.read()

#print(len(data))
padded_len = (len(data) + 7) & ~7
#print(padded_len)
data = data.ljust(padded_len, b'\x00')
#print(data)

with open(sys.argv[2], 'w') as f:
    f.write('memory_initialization_radix = 16;\n')
    f.write('memory_initialization_vector =\n')
    for i in range(0, len(data), 8):
        f.write(hex(struct.unpack('<Q', data[i:i + 8])[0])[2:].rjust(16, '0') + ',\n')
    f.write('0;\n')
