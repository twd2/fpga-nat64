import ipaddress
import struct

def iphash(ip):
    ip = ipaddress.IPv6Address(ip).packed
    words = struct.unpack('<HHHHHHHH', ip)

    sum1 = words[0] + words[1]
    sum2 = words[2] + words[3]
    sum3 = words[4] + words[5]
    sum4 = words[6] + words[7]

    sum5 = ((sum1 + sum2) & 0xffff) + ((sum1 >> 16) ^ (sum2 >> 16))
    sum6 = ((sum3 + sum4) & 0xffff) + ((sum3 >> 16) ^ (sum4 >> 16))

    s = ((sum5 ^ sum6) & 0xffff) ^ (sum5 >> 16) ^ (sum6 >> 16)
    s = ((s >> 10) ^ s) & 0x3ff
    return s

print(hex(iphash('::1.1.1.1')))
print(hex(iphash('::8.8.8.8')))
print(hex(iphash('::166.111.4.100')))
print()
print(hex(iphash('2402:f000:1:404:166:111:4:100')))
print(hex(iphash('ff02::1')))
print(hex(iphash('ff02::2')))
print(hex(iphash('ff02::3')))
print(hex(iphash('ff02::4')))
