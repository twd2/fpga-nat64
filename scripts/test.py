def send(p):
    p.show()
    sendp(p, iface='ens38')


ether = Ether(src='54:57:44:32:5f:30', dst='54:57:44:32:5f:31')

# IPv4 small packet
send(ether/IP(src='10.1.1.2', dst='10.1.1.3')/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv4 big packet (>128B)
send(ether/IP(src='10.1.1.2', dst='10.1.1.3')/UDP(sport=3333, dport=4444)/(b'0123456789abcdefghijklmnopqrstuvwxyzgggg' + 200 * b'-'))

# IPv4 fragments
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', flags=1, frag=0)/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', flags=1, frag=6, proto=17)/b'aaaaaaaa0123456789abcdefghijklmnopqrstuvwxyzgggg')
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', flags=0, frag=12, proto=17)/b'bbbbbbbb0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv4 big fragment (>128B)
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', flags=1, frag=0, id=999)/UDP(sport=3333, dport=4444)/(b'0123456789abcdefghijklmnopqrstuvwxyzgggg' + 200 * b'-'))

# IPv6 small packet
send(ether/IPv6(src='2000::1', dst='2000::2')/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv6 big packet
send(ether/IPv6(src='2000::1', dst='2000::2')/UDP(sport=3333, dport=4444)/(b'0123456789abcdefghijklmnopqrstuvwxyzgggg' + 200 * b'-'))

# IPv6 fragments
send(ether/IPv6(src='2000::1', dst='2000::2')/IPv6ExtHdrFragment(id=0x89abcdef, offset=0, m=1, nh=17)/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')
send(ether/IPv6(src='2000::1', dst='2000::2')/IPv6ExtHdrFragment(id=0x89abcdef, offset=6, m=1, nh=17)/b'aaaaaaaa0123456789abcdefghijklmnopqrstuvwxyzgggg')
send(ether/IPv6(src='2000::1', dst='2000::2')/IPv6ExtHdrFragment(id=0x89abcdef, offset=12, m=0, nh=17)/b'bbbbbbbb0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv6 big fragment
send(ether/IPv6(src='2000::1', dst='2000::2')/IPv6ExtHdrFragment(id=0x55aaaa55, offset=0, m=1, nh=17)/UDP(sport=3333, dport=4444)/(b'0123456789abcdefghijklmnopqrstuvwxyzgggg' + 200 * b'-'))

# IPv4 packet, hop limit = 1
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', ttl=1)/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv6 packet, hop limit = 1
send(ether/IPv6(src='2000::1', dst='2000::2', hlim=1)/UDP(sport=3333, dport=4444)/b'0123456789abcdefghijklmnopqrstuvwxyzgggg')

# IPv4 packet, wrong checksum
send(ether/IP(src='10.1.1.2', dst='10.1.1.3', chksum=0x8888)/UDP(sport=3333, dport=4444)/b'badbadbad')

# IPv6 packet, 1500B
send(ether/IPv6(src='2000::1', dst='2000::2')/UDP(sport=3333, dport=4444)/(b'abc' * 484))

# IPv4 packet, 1500B
send(ether/IP(src='10.1.1.2', dst='10.1.1.3')/UDP(sport=3333, dport=4444)/(b'def' * 490 + b'gg'))

# IPv4 packet, 1480B
send(ether/IP(src='10.1.1.2', dst='10.1.1.3')/UDP(sport=3333, dport=4444)/(b'def' * 484))

exit(0)
