`timescale 1ns / 1ps

module packet_pipeline(
    input eth_coreclk,
    input reset,

    input sin_valid,
    input [1023:0] sin_packet,
    input [1023:0] sin_meta,

    output wire sout_valid,
    output wire [1023:0] sout_packet,
    output wire [1023:0] sout_meta,

    input axi_lite_awvalid,
    output axi_lite_awready,
    input [31:0] axi_lite_awaddr,
    input [2:0] axi_lite_awprot,
    input axi_lite_wvalid,
    output axi_lite_wready,
    input [63:0] axi_lite_wdata,
    input [7:0] axi_lite_wstrb,
    output [1:0] axi_lite_bresp,
    output axi_lite_bvalid,
    input axi_lite_bready,
    input axi_lite_arvalid,
    output axi_lite_arready,
    input [31:0] axi_lite_araddr,
    input [2:0] axi_lite_arprot,
    output axi_lite_rvalid,
    input axi_lite_rready,
    output [63:0] axi_lite_rdata,
    output [1:0] axi_lite_rresp,

    input [3:0] fib_axi_awid,
    input [31:0] fib_axi_awaddr,
    input [7:0] fib_axi_awlen,
    input [2:0] fib_axi_awsize,
    input [1:0] fib_axi_awburst,
    input fib_axi_awlock,
    input [3:0] fib_axi_awcache,
    input [2:0] fib_axi_awprot,
    input [3:0] fib_axi_awregion,
    input [3:0] fib_axi_awqos,
    input fib_axi_awvalid,
    output wire fib_axi_awready,
    input [63:0] fib_axi_wdata,
    input [7:0] fib_axi_wstrb,
    input fib_axi_wlast,
    input fib_axi_wvalid,
    output wire fib_axi_wready,
    output wire [3:0] fib_axi_bid,
    output wire [1:0] fib_axi_bresp,
    output wire fib_axi_bvalid,
    input fib_axi_bready,
    input [3:0] fib_axi_arid,
    input [31:0] fib_axi_araddr,
    input [7:0] fib_axi_arlen,
    input [2:0] fib_axi_arsize,
    input [1:0] fib_axi_arburst,
    input fib_axi_arlock,
    input [3:0] fib_axi_arcache,
    input [2:0] fib_axi_arprot,
    input [3:0] fib_axi_arregion,
    input [3:0] fib_axi_arqos,
    input fib_axi_arvalid,
    output wire fib_axi_arready,
    output wire [3:0] fib_axi_rid,
    output wire [63:0] fib_axi_rdata,
    output wire [1:0] fib_axi_rresp,
    output wire fib_axi_rlast,
    output wire fib_axi_rvalid,
    input fib_axi_rready
    );

    localparam TYPE_A20 = 3'b000; // add 20 bytes
    localparam TYPE_A28 = 3'b001; // add 28 bytes
    localparam TYPE_R20 = 3'b010; // remove 20 bytes
    localparam TYPE_R28 = 3'b011; // remove 28 bytes
    localparam TYPE_ORIG = 3'b100;
    localparam MTU = 1500;
    localparam CPU_PORT_ID = 3'd4;

    localparam CONFIG_EN = 0;
    localparam CONFIG_PROMISCUOUS = 1;
    localparam CONFIG_ALL_TO_CPU = 2;

    localparam REASON_ICMP = 0;
    localparam REASON_ARP = 1;
    localparam REASON_HOP_LIMIT_REACHED = 2;
    localparam REASON_TOO_BIG = 3;
    localparam REASON_AMC_MISS = 4; // address mapping cache miss
    localparam REASON_FIB_MISS = 5; // forwarding information base miss
    localparam REASON_ARC_MISS = 6; // address resolution cache miss
    localparam REASON_DEST_IS_CPU = 7; // destination is cpu

    function [15:0] ntohs;
        input [15:0] x;
    begin
        ntohs = {x[0 +: 8], x[8 +: 8]};
    end
    endfunction

    function [31:0] ntohl;
        input [31:0] x;
    begin
        ntohl = {x[0 +: 8], x[8 +: 8], x[16 +: 8], x[24 +: 8]};
    end
    endfunction

    function [127:0] ntoh16;
        input [127:0] x;
    begin
        ntoh16 = {x[0 +: 8], x[8 +: 8], x[16 +: 8], x[24 +: 8],
                  x[32 +: 8], x[40 +: 8], x[48 +: 8], x[56 +: 8],
                  x[64 +: 8], x[72 +: 8], x[80 +: 8], x[88 +: 8],
                  x[96 +: 8], x[104 +: 8], x[112 +: 8], x[120 +: 8]};
    end
    endfunction

    function [15:0] ip_add;
        input [15:0] x;
        input [15:0] y;
        reg [15:0] sum;
        reg c;
    begin
        {c, sum} = ntohs(x) + ntohs(y);
        ip_add = ntohs(sum + c);
    end
    endfunction

    function [159:0] make_ipv4_header;
        input [15:0] payload_len_plus_20;
        input is_frag;
        input [15:0] frag_id;
        input frag_more;
        input frag_dont;
        input [12:0] frag_offset;
        input [7:0] hop_limit;
        input [7:0] next_header;
        input [15:0] checksum;
        input [31:0] saddr;
        input [31:0] daddr;
    begin
        make_ipv4_header = 160'h45;
        make_ipv4_header[2 * 8 +: 16] = payload_len_plus_20;
        make_ipv4_header[6 * 8 + 6] = frag_dont;
        if (is_frag)
        begin
            make_ipv4_header[4 * 8 +: 16] = frag_id;
            make_ipv4_header[6 * 8 + 5] = frag_more;
            {make_ipv4_header[6 * 8 +: 5], make_ipv4_header[7 * 8 +: 8]} = frag_offset;
        end
        make_ipv4_header[8 * 8 +: 8] = hop_limit;
        make_ipv4_header[9 * 8 +: 8] = next_header;
        make_ipv4_header[10 * 8 +: 16] = checksum;
        make_ipv4_header[12 * 8 +: 32] = saddr;
        make_ipv4_header[16 * 8 +: 32] = daddr;
    end
    endfunction

    function [319:0] make_ipv6_header;
        input [15:0] payload_len;
        input [7:0] hop_limit;
        input [7:0] next_header;
        input [127:0] saddr;
        input [127:0] daddr;
    begin
        make_ipv6_header = 320'h60;
        make_ipv6_header[4 * 8 +: 16] = payload_len;
        make_ipv6_header[6 * 8 +: 8] = next_header;
        make_ipv6_header[7 * 8 +: 8] = hop_limit;
        make_ipv6_header[8 * 8 +: 128] = saddr;
        make_ipv6_header[24 * 8 +: 128] = daddr;
    end
    endfunction

    function [383:0] make_ipv6_header_with_frag;
        input [15:0] payload_len_plus_8;
        input [7:0] hop_limit;
        input [7:0] next_header;
        input [127:0] saddr;
        input [127:0] daddr;
        input [31:0] frag_id;
        input frag_more;
        input [12:0] frag_offset;
    begin
        make_ipv6_header_with_frag = 384'h60;
        make_ipv6_header_with_frag[4 * 8 +: 16] = payload_len_plus_8;
        make_ipv6_header_with_frag[6 * 8 +: 8] = 44;
        make_ipv6_header_with_frag[7 * 8 +: 8] = hop_limit;
        make_ipv6_header_with_frag[8 * 8 +: 128] = saddr;
        make_ipv6_header_with_frag[24 * 8 +: 128] = daddr;
        make_ipv6_header_with_frag[(40 + 4) * 8 +: 32] = frag_id;
        make_ipv6_header_with_frag[(40 + 3) * 8 + 0] = frag_more;
        {make_ipv6_header_with_frag[(40 + 2) * 8 +: 8],
         make_ipv6_header_with_frag[(40 + 3) * 8 + 7 -: 5]} = frag_offset;
        make_ipv6_header_with_frag[(40 + 0) * 8 +: 8] = next_header;
    end
    endfunction

    wire [15:0] atime_counter;
    wire [47:0] mac_addr [0:3];
    wire [15:0] mtu [0:3];
    wire [63:0] conf [0:3];
    wire [95:0] ipv4_converted_prefix;
    wire [95:0] ipv4_translatable_prefix;
    wire [31:0] ipv6_converted_prefix;
    wire [31:0] ipv6_converted_mask;
    wire [31:0] ipv4_pool_prefix;
    wire [31:0] ipv4_pool_mask;
    wire [15:0] default_nexthop_id;

    wire amc_ready;
    wire amc_valid;
    wire [4 * 4 - 1:0] amc_write_en;
    wire [127:0] amc_addr;
    wire amc_hash_en;
    wire [3:0] amc_entry_valid_i;
    wire [128 * 4 - 1 : 0] amc_entry_tag_i;
    wire [128 * 4 - 1 : 0] amc_entry_value_i;
    wire [16 * 4 - 1 : 0] amc_entry_atime_i;
    wire [3:0] amc_entry_valid_o;
    wire [128 * 4 - 1 : 0] amc_entry_tag_o;
    wire [128 * 4 - 1 : 0] amc_entry_value_o;
    wire [16 * 4 - 1 : 0] amc_entry_atime_o;
    wire [4 - 1 : 0] amc_entry_match_o;

    wire arc_ready;
    wire arc_valid;
    wire [4 * 4 - 1:0] arc_write_en;
    wire [127:0] arc_addr;
    wire arc_hash_en;
    wire [3:0] arc_entry_valid_i;
    wire [128 * 4 - 1 : 0] arc_entry_tag_i;
    wire [48 * 4 - 1 : 0] arc_entry_value_i;
    wire [16 * 4 - 1 : 0] arc_entry_atime_i;
    wire [3:0] arc_entry_valid_o;
    wire [128 * 4 - 1 : 0] arc_entry_tag_o;
    wire [48 * 4 - 1 : 0] arc_entry_value_o;
    wire [16 * 4 - 1 : 0] arc_entry_atime_o;
    wire [4 - 1 : 0] arc_entry_match_o;
    packet_pipeline_registers packet_pipeline_registers_i(
        .eth_coreclk(eth_coreclk),
        .reset(reset),

        .axi_lite_awvalid(axi_lite_awvalid),
        .axi_lite_awready(axi_lite_awready),
        .axi_lite_awaddr(axi_lite_awaddr),
        .axi_lite_awprot(axi_lite_awprot),
        .axi_lite_wvalid(axi_lite_wvalid),
        .axi_lite_wready(axi_lite_wready),
        .axi_lite_wdata(axi_lite_wdata),
        .axi_lite_wstrb(axi_lite_wstrb),
        .axi_lite_bresp(axi_lite_bresp),
        .axi_lite_bvalid(axi_lite_bvalid),
        .axi_lite_bready(axi_lite_bready),
        .axi_lite_arvalid(axi_lite_arvalid),
        .axi_lite_arready(axi_lite_arready),
        .axi_lite_araddr(axi_lite_araddr),
        .axi_lite_arprot(axi_lite_arprot),
        .axi_lite_rvalid(axi_lite_rvalid),
        .axi_lite_rready(axi_lite_rready),
        .axi_lite_rdata(axi_lite_rdata),
        .axi_lite_rresp(axi_lite_rresp),

        .atime_counter(atime_counter),
        .mac_addr({mac_addr[3], mac_addr[2], mac_addr[1], mac_addr[0]}),
        .mtu({mtu[3], mtu[2], mtu[1], mtu[0]}),
        .conf({conf[3], conf[2], conf[1], conf[0]}),
        .ipv4_converted_prefix(ipv4_converted_prefix),
        .ipv4_translatable_prefix(ipv4_translatable_prefix),
        .ipv6_converted_prefix(ipv6_converted_prefix),
        .ipv6_converted_mask(ipv6_converted_mask),
        .ipv4_pool_prefix(ipv4_pool_prefix),
        .ipv4_pool_mask(ipv4_pool_mask),
        .default_nexthop_id(default_nexthop_id),

        .amc_ready(amc_ready),
        .amc_valid(amc_valid),
        .amc_write_en(amc_write_en),
        .amc_addr(amc_addr),
        .amc_hash_en(amc_hash_en),
        .amc_entry_valid_i(amc_entry_valid_i),
        .amc_entry_tag_i(amc_entry_tag_i),
        .amc_entry_value_i(amc_entry_value_i),
        .amc_entry_atime_i(amc_entry_atime_i),
        .amc_entry_valid_o(amc_entry_valid_o),
        .amc_entry_tag_o(amc_entry_tag_o),
        .amc_entry_value_o(amc_entry_value_o),
        .amc_entry_atime_o(amc_entry_atime_o),
        .amc_entry_match_o(amc_entry_match_o),

        .arc_ready(arc_ready),
        .arc_valid(arc_valid),
        .arc_write_en(arc_write_en),
        .arc_addr(arc_addr),
        .arc_hash_en(arc_hash_en),
        .arc_entry_valid_i(arc_entry_valid_i),
        .arc_entry_tag_i(arc_entry_tag_i),
        .arc_entry_value_i(arc_entry_value_i),
        .arc_entry_atime_i(arc_entry_atime_i),
        .arc_entry_valid_o(arc_entry_valid_o),
        .arc_entry_tag_o(arc_entry_tag_o),
        .arc_entry_value_o(arc_entry_value_o),
        .arc_entry_atime_o(arc_entry_atime_o),
        .arc_entry_match_o(arc_entry_match_o)
    );

    wire s0_valid = sin_valid;
    wire [1023:0] s0_packet = sin_packet;
    wire [1023:0] s0_meta = sin_meta;

    // L2
    wire [7:0] s0_interface = s0_meta[3 * 8 +: 8];
    wire [15:0] s0_ethertype = s0_packet[12 * 8 +: 16];
    wire [47:0] s0_mac_saddr = s0_packet[6 * 8 +: 48];
    wire [47:0] s0_mac_daddr = s0_packet[0 * 8 +: 48];
    // L3
    wire s0_is_ipv6 = s0_ethertype == 16'hdd86;
    wire s0_is_ipv4 = s0_ethertype == 16'h0008;
    wire s0_is_ip = s0_is_ipv6 || s0_is_ipv4;
    wire s0_is_arp = s0_ethertype == 16'h0608;
    wire [127:0] s0_ip_saddr =
        s0_is_ipv6 ?
            s0_packet[(14 + 8) * 8 +: 128]
            : (s0_is_ipv4 ? {s0_packet[(14 + 12) * 8 +: 32], 96'b0} : {s0_packet[(14 + 14) * 8 +: 32], 96'b0});
    wire [127:0] s0_ip_daddr = s0_is_ipv6 ? s0_packet[(14 + 24) * 8 +: 128] : {s0_packet[(14 + 16) * 8 +: 32], 96'b0};
    wire [7:0] s0_ipv6_next_header_0 = s0_packet[(14 + 6) * 8 +: 8];
    wire s0_is_ipv6_frag = s0_ipv6_next_header_0 == 44;
    wire [7:0] s0_ipv6_next_header = !s0_is_ipv6_frag ? s0_ipv6_next_header_0 : s0_packet[(14 + 40) * 8 +: 8];
    wire [7:0] s0_ipv4_next_header = s0_packet[(14 + 9) * 8 +: 8];
    wire [7:0] s0_ipv6_hop_limit = s0_packet[(14 + 7) * 8 +: 8];
    wire [7:0] s0_ipv4_hop_limit = s0_packet[(14 + 8) * 8 +: 8];
    wire [7:0] s0_next_header = s0_is_ipv6 ? s0_ipv6_next_header : s0_ipv4_next_header;
    wire [7:0] s0_hop_limit = s0_is_ipv6 ? s0_ipv6_hop_limit : s0_ipv4_hop_limit;
    // L3 fragment
    wire [12:0] s0_frag_offset =
        s0_is_ipv6 ?
            {s0_packet[(14 + 40 + 2) * 8 +: 8], s0_packet[(14 + 40 + 3) * 8 + 7 -: 5]}
            : {s0_packet[(14 + 6) * 8 +: 5], s0_packet[(14 + 7) * 8 +: 8]};
    wire s0_frag_more =
        s0_is_ipv6 ?
            s0_packet[(14 + 40 + 3) * 8 + 0]
            : s0_packet[(14 + 6) * 8 + 5];
    wire [31:0] s0_frag_id =
        s0_is_ipv6 ?
            s0_packet[(14 + 40 + 4) * 8 +: 32]
            : {s0_packet[(14 + 4) * 8 +: 16], 16'b0};
    wire s0_is_frag = (s0_is_ipv6 && s0_is_ipv6_frag) || (s0_is_ipv4 && (s0_frag_offset != 0 || s0_frag_more));
    wire s0_frag_dont = s0_is_ipv6 ? !s0_is_frag : s0_packet[(14 + 6) * 8 + 6];
    wire s0_frag_is_first = s0_frag_offset == 0;
    wire [15:0] s0_len_in_header = s0_is_ipv6 ? ntohs(s0_packet[(14 + 4) * 8 +: 16]) : ntohs(s0_packet[(14 + 2) * 8 +: 16]);
    // L4
    wire s0_is_tcp = s0_is_ip && s0_next_header == 6;
    wire s0_is_udp = s0_is_ip && s0_next_header == 17;
    wire s0_is_icmp = s0_is_ip && (s0_next_header == 58 || s0_next_header == 1);
    wire [1023:0] s0_payload =
        s0_is_ipv6 ?
            (s0_is_ipv6_frag ? s0_packet[1023:(14 + 48) * 8] : s0_packet[1023:(14 + 40) * 8])
            : s0_packet[1023:(14 + 20) * 8];
    wire [15:0] s0_tcp_checksum = s0_payload[16 * 8 +: 16];
    wire [15:0] s0_udp_checksum = s0_payload[6 * 8 +: 16];

    // stage 1 decode
    reg s1_valid;
    reg [1023:0] s1_packet, s1_meta;
    reg [7:0] s1_interface;
    reg [47:0] s1_mac_saddr, s1_mac_daddr;
    reg [127:0] s1_ip_saddr, s1_ip_daddr;
    reg s1_is_ip, s1_is_ipv6, s1_is_ipv4, s1_is_arp;
    reg s1_is_tcp, s1_is_udp, s1_is_icmp;
    reg [7:0] s1_hop_limit;
    reg [7:0] s1_next_header;
    reg [12:0] s1_frag_offset;
    reg s1_frag_more;
    reg [31:0] s1_frag_id;
    reg s1_frag_dont;
    reg s1_is_frag;
    reg s1_frag_is_first;
    reg [15:0] s1_len_in_header;
    reg [15:0] s1_tcp_checksum, s1_udp_checksum;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s1_valid <= 0;
            s1_packet <= 0;
            s1_meta <= 0;

            s1_interface <= 0;
            s1_mac_saddr <= 0;
            s1_mac_daddr <= 0;
            s1_ip_saddr <= 0;
            s1_ip_daddr <= 0;
            s1_is_ip <= 0;
            s1_is_ipv6 <= 0;
            s1_is_ipv4 <= 0;
            s1_is_arp <= 0;
            s1_is_tcp <= 0;
            s1_is_udp <= 0;
            s1_is_icmp <= 0;
            s1_hop_limit <= 0;
            s1_next_header <= 0;
            s1_frag_offset <= 0;
            s1_frag_more <= 0;
            s1_frag_id <= 0;
            s1_frag_dont <= 0;
            s1_is_frag <= 0;
            s1_frag_is_first <= 0;
            s1_len_in_header <= 0;
            s1_tcp_checksum <= 0;
            s1_udp_checksum <= 0;
        end
        else
        begin
            s1_valid <= s0_valid;
            s1_packet <= s0_packet;
            s1_meta <= s0_meta;

            s1_interface <= s0_interface;
            s1_mac_saddr <= s0_mac_saddr;
            s1_mac_daddr <= s0_mac_daddr;
            s1_ip_saddr <= s0_ip_saddr;
            s1_ip_daddr <= s0_ip_daddr;
            s1_is_ip <= s0_is_ip;
            s1_is_ipv6 <= s0_is_ipv6;
            s1_is_ipv4 <= s0_is_ipv4;
            s1_is_arp <= s0_is_arp;
            s1_is_tcp <= s0_is_tcp;
            s1_is_udp <= s0_is_udp;
            s1_is_icmp <= s0_is_icmp;
            s1_hop_limit <= s0_hop_limit;
            s1_next_header <= s0_next_header;
            s1_frag_offset <= s0_frag_offset;
            s1_frag_more <= s0_frag_more;
            s1_frag_id <= s0_frag_id;
            s1_frag_dont <= s0_frag_dont;
            s1_is_frag <= s0_is_frag;
            s1_frag_is_first <= s0_frag_is_first;
            s1_len_in_header <= s0_len_in_header;
            s1_tcp_checksum <= s0_tcp_checksum;
            s1_udp_checksum <= s0_udp_checksum;
        end
    end

    // stage 2 address match
    wire s1_hop_limit_reached = s1_hop_limit <= 1;
    reg s2_valid;
    reg [1023:0] s2_packet, s2_meta;
    reg s2_mac_is_to_me;  // to me or broadcast
    reg [63:0] s2_mac_config;
    reg [127:0] s2_ip_saddr, s2_ip_daddr;
    reg s2_saddr_is_illegal;
    reg s2_saddr_is_ipv4_converted, s2_saddr_is_ipv4_translatable;
    reg s2_saddr_is_ipv6_converted, s2_saddr_is_ipv4_pool;
    reg s2_daddr_is_illegal;
    reg s2_daddr_is_ipv4_converted, s2_daddr_is_ipv4_translatable;
    reg s2_daddr_is_ipv6_converted, s2_daddr_is_ipv4_pool;
    reg s2_is_ip, s2_is_ipv6, s2_is_ipv4, s2_is_arp;
    reg s2_is_tcp, s2_is_udp, s2_is_icmp;
    reg [7:0] s2_hop_limit;
    reg [7:0] s2_next_header;
    reg [12:0] s2_frag_offset;
    reg s2_frag_more;
    reg [31:0] s2_frag_id;
    reg s2_frag_dont;
    reg s2_is_frag;
    reg s2_frag_is_first;
    reg [15:0] s2_len_in_header;
    reg [15:0] s2_tcpudp_checksum;
    reg s2_from_cpu, s2_to_cpu, s2_drop;
    reg [7:0] s2_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s2_valid <= 0;
            s2_packet <= 0;
            s2_meta <= 0;

            s2_mac_is_to_me <= 0;
            s2_mac_config <= 0;
            s2_ip_saddr <= 0;
            s2_ip_daddr <= 0;
            s2_saddr_is_illegal <= 0;
            s2_saddr_is_ipv4_converted <= 0;
            s2_saddr_is_ipv4_translatable <= 0;
            s2_saddr_is_ipv6_converted <= 0;
            s2_saddr_is_ipv4_pool <= 0;
            s2_daddr_is_illegal <= 0;
            s2_daddr_is_ipv4_converted <= 0;
            s2_daddr_is_ipv4_translatable <= 0;
            s2_daddr_is_ipv6_converted <= 0;
            s2_daddr_is_ipv4_pool <= 0;
            s2_is_ip <= 0;
            s2_is_ipv6 <= 0;
            s2_is_ipv4 <= 0;
            s2_is_arp <= 0;
            s2_is_tcp <= 0;
            s2_is_udp <= 0;
            s2_is_icmp <= 0;
            s2_hop_limit <= 0;
            s2_next_header <= 0;
            s2_frag_offset <= 0;
            s2_frag_more <= 0;
            s2_frag_id <= 0;
            s2_frag_dont <= 0;
            s2_is_frag <= 0;
            s2_frag_is_first <= 0;
            s2_len_in_header <= 0;
            s2_tcpudp_checksum <= 0;
            s2_from_cpu <= 0;
            s2_to_cpu <= 0;
            s2_drop <= 0;
            s2_to_cpu_reason <= 0;
        end
        else
        begin
            s2_valid <= s1_valid;
            s2_packet <= s1_packet;
            s2_meta <= s1_meta;

            s2_mac_is_to_me <= s1_mac_daddr == mac_addr[s1_interface] || s1_mac_daddr[0] == 1'b1;
            s2_mac_config <= conf[s1_interface];
            s2_ip_saddr <= s1_ip_saddr;
            s2_ip_daddr <= s1_ip_daddr;
            s2_saddr_is_illegal <=
                (s1_is_ipv6
                 && (s1_ip_saddr == 128'h01000000000000000000000000000000))
                || (s1_is_ipv4
                    && (s1_ip_saddr[96 +: 8] == 8'd127));
            s2_saddr_is_ipv4_converted <= s1_is_ipv6 && s1_ip_saddr[95:0] == ipv4_converted_prefix;
            s2_saddr_is_ipv4_translatable <= s1_is_ipv6 && s1_ip_saddr[95:0] == ipv4_translatable_prefix;
            s2_saddr_is_ipv6_converted <=
                s1_is_ipv4
                && (((s1_ip_saddr[96 +: 32] ^ ipv6_converted_prefix) & ipv6_converted_mask) == 32'd0);
            s2_saddr_is_ipv4_pool <=
                s1_is_ipv4
                && (((s1_ip_saddr[96 +: 32] ^ ipv4_pool_prefix) & ipv4_pool_mask) == 32'd0);
            s2_daddr_is_illegal <=
                (s1_is_ipv6
                 && (s1_ip_daddr == 128'd0 || s1_ip_daddr == 128'h01000000000000000000000000000000))
                || (s1_is_ipv4
                    && (s1_ip_daddr[96 +: 32] == 32'd0 || s1_ip_daddr[96 +: 8] == 8'd127));
            s2_daddr_is_ipv4_converted <= s1_is_ipv6 && s1_ip_daddr[95:0] == ipv4_converted_prefix;
            s2_daddr_is_ipv4_translatable <= s1_is_ipv6 && s1_ip_daddr[95:0] == ipv4_translatable_prefix;
            s2_daddr_is_ipv6_converted <=
                s1_is_ipv4
                && (((s1_ip_daddr[96 +: 32] ^ ipv6_converted_prefix) & ipv6_converted_mask) == 32'd0);
            s2_daddr_is_ipv4_pool <=
                s1_is_ipv4
                && (((s1_ip_daddr[96 +: 32] ^ ipv4_pool_prefix) & ipv4_pool_mask) == 32'd0);
            s2_is_ip <= s1_is_ip;
            s2_is_ipv6 <= s1_is_ipv6;
            s2_is_ipv4 <= s1_is_ipv4;
            s2_is_arp <= s1_is_arp;
            s2_is_tcp <= s1_is_tcp;
            s2_is_udp <= s1_is_udp;
            s2_is_icmp <= s1_is_icmp;
            s2_hop_limit <= s1_hop_limit - 1;
            s2_next_header <= s1_next_header;
            s2_frag_offset <= s1_frag_offset;
            s2_frag_more <= s1_frag_more;
            s2_frag_id <= s1_frag_id;
            s2_frag_dont <= s1_frag_dont;
            s2_is_frag <= s1_is_frag;
            s2_frag_is_first <= s1_frag_is_first;
            s2_len_in_header <= s1_len_in_header;
            s2_tcpudp_checksum <= s1_is_tcp ? s1_tcp_checksum : s1_udp_checksum;
            s2_from_cpu <= s1_meta[3 * 8 +: 3] == CPU_PORT_ID;
            s2_to_cpu <= s1_is_arp || (s1_is_ip && s1_hop_limit_reached);
            s2_drop <= !s1_is_ip && !s1_is_arp;
            s2_to_cpu_reason <= 0;
            s2_to_cpu_reason[REASON_ARP] <= s1_is_arp;
            s2_to_cpu_reason[REASON_HOP_LIMIT_REACHED] <= s1_is_ip && s1_hop_limit_reached;
        end
    end

    // stage 3
    wire s2_to_ipv6 = (s2_is_ipv6 && !s2_daddr_is_ipv4_converted)
                      || (s2_is_ipv4 && s2_daddr_is_ipv6_converted)
                      || (s2_is_ipv4 && s2_daddr_is_ipv4_pool);
    wire s2_to_ipv4 = (s2_is_ipv6 && s2_daddr_is_ipv4_converted)
                      || (s2_is_ipv4 && !s2_daddr_is_ipv6_converted && !s2_daddr_is_ipv4_pool);
    reg s3_valid;
    reg [1023:0] s3_packet, s3_meta;
    reg [127:0] s3_ip_saddr, s3_ip_daddr;
    reg [127:0] s3_new_ip_saddr_direct, s3_new_ip_daddr_direct;
    reg s3_saddr_need_amc, s3_daddr_need_amc;
    reg s3_is_ip, s3_is_ipv6, s3_is_ipv4;
    reg s3_is_tcp, s3_is_udp, s3_is_icmp;
    reg [7:0] s3_hop_limit;
    reg [7:0] s3_next_header;
    reg [12:0] s3_frag_offset;
    reg s3_frag_more;
    reg [31:0] s3_frag_id;
    reg s3_frag_dont;
    reg s3_is_frag;
    reg s3_frag_is_first;
    reg [15:0] s3_len_in_header;
    reg [15:0] s3_tcpudp_checksum;
    reg s3_to_ipv6, s3_to_ipv4;
    reg s3_from_cpu, s3_to_cpu, s3_drop;
    reg [7:0] s3_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s3_valid <= 0;
            s3_packet <= 0;
            s3_meta <= 0;

            s3_ip_saddr <= 0;
            s3_ip_daddr <= 0;
            s3_new_ip_saddr_direct <= 0;
            s3_new_ip_daddr_direct <= 0;
            s3_saddr_need_amc <= 0;
            s3_daddr_need_amc <= 0;
            s3_is_ip <= 0;
            s3_is_ipv6 <= 0;
            s3_is_ipv4 <= 0;
            s3_is_tcp <= 0;
            s3_is_udp <= 0;
            s3_is_icmp <= 0;
            s3_hop_limit <= 0;
            s3_next_header <= 0;
            s3_frag_offset <= 0;
            s3_frag_more <= 0;
            s3_frag_id <= 0;
            s3_frag_dont <= 0;
            s3_is_frag <= 0;
            s3_frag_is_first <= 0;
            s3_len_in_header <= 0;
            s3_tcpudp_checksum <= 0;
            s3_to_ipv6 <= 0;
            s3_to_ipv4 <= 0;
            s3_from_cpu <= 0;
            s3_to_cpu <= 0;
            s3_drop <= 0;
            s3_to_cpu_reason <= 0;
        end
        else
        begin
            s3_valid <= s2_valid;
            s3_packet <= s2_packet;
            s3_meta <= s2_meta;

            s3_ip_saddr <= s2_ip_saddr;
            s3_ip_daddr <= s2_ip_daddr;
            s3_is_ip <= s2_is_ip;
            s3_is_ipv6 <= s2_is_ipv6;
            s3_is_ipv4 <= s2_is_ipv4;
            s3_is_tcp <= s2_is_tcp;
            s3_is_udp <= s2_is_udp;
            s3_is_icmp <= s2_is_icmp;
            s3_hop_limit <= s2_hop_limit;
            s3_next_header <= s2_next_header;
            s3_frag_offset <= s2_frag_offset;
            s3_frag_more <= s2_frag_more;
            s3_frag_id <= s2_frag_id;
            s3_frag_dont <= s2_frag_dont;
            s3_is_frag <= s2_is_frag;
            s3_frag_is_first <= s2_frag_is_first;
            s3_len_in_header <= s2_len_in_header;
            s3_tcpudp_checksum <= s2_tcpudp_checksum;
            s3_to_ipv6 <= s2_to_ipv6;
            s3_to_ipv4 <= s2_to_ipv4;
            s3_from_cpu <= s2_from_cpu;
            s3_to_cpu <= s2_to_cpu || !s2_mac_is_to_me || s2_mac_config[CONFIG_ALL_TO_CPU];
            s3_drop <= s2_drop || (!s2_mac_config[CONFIG_PROMISCUOUS] && !s2_mac_is_to_me)
                       || !s2_mac_config[CONFIG_EN]
                       || (s2_mac_is_to_me && !s2_mac_config[CONFIG_ALL_TO_CPU]
                           && (s2_saddr_is_ipv4_converted
                               || s2_saddr_is_ipv6_converted || s2_saddr_is_ipv4_pool))
                       || s2_saddr_is_illegal || s2_daddr_is_illegal;
            s3_to_cpu_reason <= s2_to_cpu_reason;

            s3_new_ip_saddr_direct <= s2_ip_saddr;
            s3_new_ip_daddr_direct <= s2_ip_daddr;
            s3_saddr_need_amc <= 0;
            s3_daddr_need_amc <= 0;
            if (s2_is_ipv6 && s2_to_ipv4)
            begin
                if (s2_saddr_is_ipv4_translatable)
                begin
                    s3_new_ip_saddr_direct <= {s2_ip_saddr[96 +: 32], 96'd0};
                end
                else
                begin
                    s3_saddr_need_amc <= 1'b1;
                end
                s3_new_ip_daddr_direct <= {s2_ip_daddr[96 +: 32], 96'd0};
            end
            if (s2_is_ipv4 && s2_to_ipv6)
            begin
                s3_new_ip_saddr_direct <= {s2_ip_saddr[96 +: 32], ipv4_converted_prefix};
                if (s2_daddr_is_ipv6_converted)
                begin
                    s3_new_ip_daddr_direct <= {s2_ip_daddr[96 +: 32], ipv4_translatable_prefix};
                end
                else
                begin
                    s3_daddr_need_amc <= 1'b1;
                end
            end
        end
    end

    // stage 4
    wire [127:0] s3_ip_addr_amc = s3_saddr_need_amc ? s3_ip_saddr : s3_ip_daddr;
    wire [15:0] s3_payload_maxlen =
        s3_is_ipv6 ?
            (s3_is_frag ?
                ({5'd0, s3_meta[10:0]} + 1 - (14 + 40 + 8))
                : ({5'd0, s3_meta[10:0]} + 1 - (14 + 40)))
            : ({5'd0, s3_meta[10:0]} + 1 - (14 + 20));
    reg s4_valid;
    reg [1023:0] s4_packet, s4_meta;
    reg [127:0] s4_ip_saddr, s4_ip_daddr;
    reg [127:0] s4_ip_addr_amc;
    reg s4_saddr_need_amc;
    reg s4_daddr_need_amc;
    reg [127:0] s4_new_ip_saddr_direct;
    reg [127:0] s4_new_ip_daddr_direct;
    reg s4_is_ip, s4_is_ipv6, s4_is_ipv4;
    reg s4_is_tcp, s4_is_udp;
    reg [15:0] s4_payload_len, s4_payload_maxlen;
    reg [7:0] s4_hop_limit;
    reg [7:0] s4_next_header;
    reg [12:0] s4_frag_offset;
    reg s4_frag_more;
    reg [31:0] s4_frag_id;
    reg s4_frag_dont;
    reg s4_is_frag;
    reg s4_frag_is_first;
    reg [15:0] s4_tcpudp_checksum;
    reg s4_to_ipv6, s4_to_ipv4;
    reg s4_from_cpu, s4_to_cpu, s4_drop;
    reg [7:0] s4_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s4_valid <= 1'b0;
            s4_packet <= 0;
            s4_meta <= 0;
            s4_is_ip <= 0;
            s4_is_ipv6 <= 0;
            s4_is_ipv4 <= 0;
            s4_is_tcp <= 0;
            s4_is_udp <= 0;
            s4_ip_saddr <= 0;
            s4_ip_daddr <= 0;
            s4_ip_addr_amc <= 0;
            s4_saddr_need_amc <= 0;
            s4_daddr_need_amc <= 0;
            s4_new_ip_saddr_direct <= 0;
            s4_new_ip_daddr_direct <= 0;
            s4_next_header <= 0;
            s4_frag_offset <= 0;
            s4_frag_more <= 0;
            s4_frag_id <= 0;
            s4_frag_dont <= 0;
            s4_is_frag <= 0;
            s4_frag_is_first <= 0;
            s4_payload_len <= 0;
            s4_payload_maxlen <= 0;
            s4_hop_limit <= 0;
            s4_tcpudp_checksum <= 0;
            s4_to_ipv6 <= 0;
            s4_to_ipv4 <= 0;
            s4_from_cpu <= 0;
            s4_to_cpu <= 0;
            s4_drop <= 0;
            s4_to_cpu_reason <= 0;
        end
        else
        begin
            s4_valid <= s3_valid;
            s4_packet <= s3_packet;
            s4_meta <= s3_meta;
            s4_is_ip <= s3_is_ip;
            s4_is_ipv6 <= s3_is_ipv6;
            s4_is_ipv4 <= s3_is_ipv4;
            s4_is_tcp <= s3_is_tcp;
            s4_is_udp <= s3_is_udp;
            s4_ip_saddr <= s3_ip_saddr;
            s4_ip_daddr <= s3_ip_daddr;
            s4_ip_addr_amc <= s3_ip_addr_amc;
            s4_saddr_need_amc <= s3_saddr_need_amc;
            s4_daddr_need_amc <= s3_daddr_need_amc;
            s4_new_ip_saddr_direct <= s3_new_ip_saddr_direct;
            s4_new_ip_daddr_direct <= s3_new_ip_daddr_direct;
            s4_next_header <= s3_next_header;
            s4_frag_offset <= s3_frag_offset;
            s4_frag_more <= s3_frag_more;
            s4_frag_id <= s3_frag_id;
            s4_frag_dont <= s3_frag_dont;
            s4_is_frag <= s3_is_frag;
            s4_frag_is_first <= s3_frag_is_first;
            if (s3_is_ipv6)
            begin
                if (s3_is_frag)
                begin
                    s4_payload_len <= s3_len_in_header - 8;
                end
                else
                begin
                    s4_payload_len <= s3_len_in_header;
                end
            end
            else
            begin
                s4_payload_len <= s3_len_in_header - 20;
            end
            s4_payload_maxlen <= s3_payload_maxlen;
            s4_hop_limit <= s3_hop_limit;
            s4_tcpudp_checksum <= s3_tcpudp_checksum;
            s4_to_ipv6 <= s3_to_ipv6;
            s4_to_ipv4 <= s3_to_ipv4;
            s4_from_cpu <= s3_from_cpu;
            s4_to_cpu <= s3_to_cpu;
            s4_drop <= s3_drop;
            s4_to_cpu_reason <= s3_to_cpu_reason;
            if (s3_is_icmp && ((s3_is_ipv4 && s3_to_ipv6) || (s3_is_ipv6 && s3_to_ipv4)))
            begin
                s4_to_cpu <= 1'b1;
                s4_to_cpu_reason[REASON_ICMP] <= 1'b1;
            end
        end
    end

    // stage 5
    reg s5_valid;
    reg [1023:0] s5_packet, s5_meta;
    reg [127:0] s5_ip_saddr, s5_ip_daddr;
    reg [127:0] s5_ip_addr_amc;
    reg s5_saddr_need_amc;
    reg s5_daddr_need_amc;
    reg [127:0] s5_new_ip_saddr_direct;
    reg [127:0] s5_new_ip_daddr_direct;
    reg s5_is_ip, s5_is_ipv6, s5_is_ipv4;
    reg s5_is_tcp, s5_is_udp;
    reg [7:0] s5_hop_limit;
    reg [7:0] s5_next_header;
    reg [12:0] s5_frag_offset;
    reg s5_frag_more;
    reg [31:0] s5_frag_id;
    reg s5_frag_dont;
    reg s5_is_frag;
    reg s5_frag_is_first;
    reg [15:0] s5_payload_len;
    reg [15:0] s5_tcpudp_checksum;
    reg s5_to_ipv6, s5_to_ipv4;
    reg s5_from_cpu, s5_to_cpu, s5_drop;
    reg [7:0] s5_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s5_valid <= 1'b0;
            s5_packet <= 0;
            s5_meta <= 0;
            s5_ip_saddr <= 0;
            s5_ip_daddr <= 0;
            s5_ip_addr_amc <= 0;
            s5_saddr_need_amc <= 0;
            s5_daddr_need_amc <= 0;
            s5_new_ip_saddr_direct <= 0;
            s5_new_ip_daddr_direct <= 0;
            s5_is_ip <= 0;
            s5_is_ipv6 <= 0;
            s5_is_ipv4 <= 0;
            s5_is_tcp <= 0;
            s5_is_udp <= 0;
            s5_hop_limit <= 0;
            s5_next_header <= 0;
            s5_frag_offset <= 0;
            s5_frag_more <= 0;
            s5_frag_id <= 0;
            s5_frag_dont <= 0;
            s5_is_frag <= 0;
            s5_frag_is_first <= 0;
            s5_payload_len <= 0;
            s5_tcpudp_checksum <= 0;
            s5_to_ipv6 <= 0;
            s5_to_ipv4 <= 0;
            s5_from_cpu <= 0;
            s5_to_cpu <= 0;
            s5_drop <= 0;
            s5_to_cpu_reason <= 0;
        end
        else
        begin
            s5_valid <= s4_valid;
            s5_packet <= s4_packet;
            s5_meta <= s4_meta;
            s5_ip_saddr <= s4_ip_saddr;
            s5_ip_daddr <= s4_ip_daddr;
            s5_ip_addr_amc <= s4_ip_addr_amc;
            s5_saddr_need_amc <= s4_saddr_need_amc;
            s5_daddr_need_amc <= s4_daddr_need_amc;
            s5_new_ip_saddr_direct <= s4_new_ip_saddr_direct;
            s5_new_ip_daddr_direct <= s4_new_ip_daddr_direct;
            s5_is_ip <= s4_is_ip;
            s5_is_ipv6 <= s4_is_ipv6;
            s5_is_ipv4 <= s4_is_ipv4;
            s5_is_tcp <= s4_is_tcp;
            s5_is_udp <= s4_is_udp;
            s5_hop_limit <= s4_hop_limit;
            s5_next_header <= s4_next_header;
            s5_frag_offset <= s4_frag_offset;
            s5_frag_more <= s4_frag_more;
            s5_frag_id <= s4_frag_id;
            s5_frag_dont <= s4_frag_dont;
            s5_is_frag <= s4_is_frag;
            s5_frag_is_first <= s4_frag_is_first;
            if (s4_payload_len > s4_payload_maxlen)
            begin
                s5_payload_len <= s4_payload_maxlen;
            end
            else
            begin
                s5_payload_len <= s4_payload_len;
            end
            s5_tcpudp_checksum <= s4_tcpudp_checksum;
            s5_to_ipv6 <= s4_to_ipv6;
            s5_to_ipv4 <= s4_to_ipv4;
            s5_from_cpu <= s4_from_cpu;
            s5_to_cpu <= s4_to_cpu;
            s5_drop <= s4_drop;
            s5_to_cpu_reason <= s4_to_cpu_reason;
        end
    end

    // ipv4 checksum pipeline
    wire [159:0] s3_ipv4_header = s3_packet[14 * 8 +: 20 * 8];
    wire [159:0] s4_ipv4_header = s4_packet[14 * 8 +: 20 * 8];
    reg [15:0] s4_ipv4_checksum_1, s4_ipv4_checksum_2;
    wire [15:0] s4_ipv4_checksum =
        ~ip_add(ip_add(s4_ipv4_checksum_1, s4_ipv4_checksum_2),
                ip_add(s4_ipv4_header[16 * 8 +: 16], s4_ipv4_header[18 * 8 +: 16]));
    reg s5_ipv4_checksum_valid;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s4_ipv4_checksum_1 <= 0;
            s4_ipv4_checksum_2 <= 0;
            s5_ipv4_checksum_valid <= 0;
        end
        else
        begin
            s4_ipv4_checksum_1 <=
                ip_add(ip_add(s3_ipv4_header[0 * 8 +: 16], s3_ipv4_header[2 * 8 +: 16]),
                       ip_add(s3_ipv4_header[4 * 8 +: 16], s3_ipv4_header[6 * 8 +: 16]));
            s4_ipv4_checksum_2 <=
                ip_add(ip_add(s3_ipv4_header[8 * 8 +: 16], s3_ipv4_header[10 * 8 +: 16]),
                       ip_add(s3_ipv4_header[12 * 8 +: 16], s3_ipv4_header[14 * 8 +: 16]));
            s5_ipv4_checksum_valid <= s4_ipv4_checksum == 0;
        end
    end

    // old addresses checksum pipeline, for incrementally updating checksum in UDP and TCP headers
    reg [15:0] s4_addr_checksum_1, s4_addr_checksum_2, s4_addr_checksum_3, s4_addr_checksum_4;
    reg [15:0] s5_addr_checksum;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s4_addr_checksum_1 <= 0;
            s4_addr_checksum_2 <= 0;
            s4_addr_checksum_3 <= 0;
            s4_addr_checksum_4 <= 0;
            s5_addr_checksum <= 0;
        end
        else
        begin
            s4_addr_checksum_1 <=
                ip_add(ip_add(~s3_ip_saddr[0 * 8 +: 16], ~s3_ip_saddr[2 * 8 +: 16]),
                       ip_add(~s3_ip_saddr[4 * 8 +: 16], ~s3_ip_saddr[6 * 8 +: 16]));
            s4_addr_checksum_2 <=
                ip_add(ip_add(~s3_ip_saddr[8 * 8 +: 16], ~s3_ip_saddr[10 * 8 +: 16]),
                       ip_add(~s3_ip_saddr[12 * 8 +: 16], ~s3_ip_saddr[14 * 8 +: 16]));
            s4_addr_checksum_3 <=
                ip_add(ip_add(~s3_ip_daddr[0 * 8 +: 16], ~s3_ip_daddr[2 * 8 +: 16]),
                       ip_add(~s3_ip_daddr[4 * 8 +: 16], ~s3_ip_daddr[6 * 8 +: 16]));
            s4_addr_checksum_4 <=
                ip_add(ip_add(~s3_ip_daddr[8 * 8 +: 16], ~s3_ip_daddr[10 * 8 +: 16]),
                       ip_add(~s3_ip_daddr[12 * 8 +: 16], ~s3_ip_daddr[14 * 8 +: 16]));
            s5_addr_checksum <=
                ip_add(ip_add(s4_addr_checksum_1, s4_addr_checksum_2),
                       ip_add(s4_addr_checksum_3, s4_addr_checksum_4));
        end
    end

    // stage 6
    wire [15:0] s5_new_frame_len =
        s5_to_ipv6 ?
            (s5_is_frag ?
                (s5_payload_len + (40 + 8))
                : (s5_payload_len + 40))
            : (s5_payload_len + 20);
    reg s6_valid;
    reg [1023:0] s6_packet, s6_meta;
    reg [127:0] s6_ip_saddr, s6_ip_daddr;
    reg [127:0] s6_ip_addr_amc;
    reg s6_saddr_need_amc;
    reg s6_daddr_need_amc;
    reg [127:0] s6_new_ip_saddr_direct;
    reg [127:0] s6_new_ip_daddr_direct;
    reg s6_is_ip, s6_is_ipv6, s6_is_ipv4;
    reg s6_is_tcp, s6_is_udp;
    reg [7:0] s6_hop_limit;
    reg [7:0] s6_next_header;
    reg [12:0] s6_frag_offset;
    reg s6_frag_more;
    reg [31:0] s6_frag_id;
    reg s6_frag_dont;
    reg s6_is_frag;
    reg s6_frag_is_first;
    reg [15:0] s6_payload_len, s6_payload_len_plus_20;
    reg [15:0] s6_new_frame_len;
    reg s6_too_big;
    reg [15:0] s6_tcpudp_checksum;
    reg [15:0] s6_addr_checksum;
    reg s6_to_ipv6, s6_to_ipv4;
    reg s6_from_cpu, s6_to_cpu, s6_drop;
    reg [7:0] s6_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s6_valid <= 1'b0;
            s6_packet <= 0;
            s6_meta <= 0;
            s6_ip_saddr <= 0;
            s6_ip_daddr <= 0;
            s6_ip_addr_amc <= 0;
            s6_saddr_need_amc <= 0;
            s6_daddr_need_amc <= 0;
            s6_new_ip_saddr_direct <= 0;
            s6_new_ip_daddr_direct <= 0;
            s6_is_ip <= 0;
            s6_is_ipv6 <= 0;
            s6_is_ipv4 <= 0;
            s6_is_tcp <= 0;
            s6_is_udp <= 0;
            s6_hop_limit <= 0;
            s6_next_header <= 0;
            s6_frag_offset <= 0;
            s6_frag_more <= 0;
            s6_frag_id <= 0;
            s6_frag_dont <= 0;
            s6_is_frag <= 0;
            s6_frag_is_first <= 0;
            s6_payload_len <= 0;
            s6_payload_len_plus_20 <= 0;
            s6_new_frame_len <= 0;
            s6_too_big <= 0;
            s6_tcpudp_checksum <= 0;
            s6_addr_checksum <= 0;
            s6_to_ipv6 <= 0;
            s6_to_ipv4 <= 0;
            s6_from_cpu <= 0;
            s6_to_cpu <= 0;
            s6_drop <= 0;
            s6_to_cpu_reason <= 0;
        end
        else
        begin
            s6_valid <= s5_valid;
            s6_packet <= s5_packet;
            s6_meta <= s5_meta;
            s6_ip_saddr <= s5_ip_saddr;
            s6_ip_daddr <= s5_ip_daddr;
            s6_ip_addr_amc <= s5_ip_addr_amc;
            s6_saddr_need_amc <= s5_saddr_need_amc;
            s6_daddr_need_amc <= s5_daddr_need_amc;
            s6_new_ip_saddr_direct <= s5_new_ip_saddr_direct;
            s6_new_ip_daddr_direct <= s5_new_ip_daddr_direct;
            s6_is_ip <= s5_is_ip;
            s6_is_ipv6 <= s5_is_ipv6;
            s6_is_ipv4 <= s5_is_ipv4;
            s6_is_tcp <= s5_is_tcp;
            s6_is_udp <= s5_is_udp;
            s6_hop_limit <= s5_hop_limit;
            s6_next_header <= s5_next_header;
            s6_frag_offset <= s5_frag_offset;
            s6_frag_more <= s5_frag_more;
            s6_frag_id <= s5_frag_id;
            s6_frag_dont <= s5_frag_dont;
            s6_is_frag <= s5_is_frag;
            s6_frag_is_first <= s5_frag_is_first;
            s6_payload_len <= s5_payload_len;
            s6_payload_len_plus_20 <= s5_payload_len + 20;
            s6_new_frame_len <= s5_new_frame_len;
            s6_too_big <= s5_new_frame_len > MTU;
            s6_tcpudp_checksum <= s5_tcpudp_checksum;
            s6_addr_checksum <= s5_addr_checksum;
            s6_to_ipv6 <= s5_to_ipv6;
            s6_to_ipv4 <= s5_to_ipv4;
            s6_from_cpu <= s5_from_cpu;
            s6_to_cpu <= s5_to_cpu;
            s6_drop <= s5_drop || (s5_is_ipv4 && !s5_ipv4_checksum_valid);
            s6_to_cpu_reason <= s5_to_cpu_reason;
        end
    end

    wire s6_to_cpu_1 = s6_to_cpu || s6_too_big;
    // update atime in address mapping cache?
    wire s6_is_normal = s6_valid && !(s6_from_cpu || s6_to_cpu_1 || s6_drop);

    wire [127:0] s6_new_ip_addr_amc;
    wire [15:0] s6_new_ip_atime;
    wire s6_new_ip_valid;

    wire s6_update_amc = s6_is_normal && (s6_saddr_need_amc || s6_daddr_need_amc) && s6_new_ip_valid
                         && s6_new_ip_atime != atime_counter;

    address_mapping_cache address_mapping_cache_i(
        .eth_coreclk(eth_coreclk),
        .reset(reset),
        .atime_counter(atime_counter),

        .s0_addrs(s3_ip_addr_amc),
        .s3_new_addrs(s6_new_ip_addr_amc),
        .s3_new_addr_valids(s6_new_ip_valid),
        .s3_new_addr_atimes(s6_new_ip_atime),

        .update_addr_i(s6_ip_addr_amc),
        .update_valid_i(s6_update_amc),

        .ready(amc_ready),
        .valid(amc_valid),
        .write_en(amc_write_en),
        .addr(amc_addr),
        .hash_en(amc_hash_en),
        .entry_valid_i(amc_entry_valid_i),
        .entry_tag_i(amc_entry_tag_i),
        .entry_value_i(amc_entry_value_i),
        .entry_atime_i(amc_entry_atime_i),
        .entry_valid_o(amc_entry_valid_o),
        .entry_tag_o(amc_entry_tag_o),
        .entry_value_o(amc_entry_value_o),
        .entry_atime_o(amc_entry_atime_o),
        .entry_match_o(amc_entry_match_o)
    );
    wire [127:0] s6_new_ip_saddr = s6_saddr_need_amc ? s6_new_ip_addr_amc : s6_new_ip_saddr_direct,
                 s6_new_ip_daddr = s6_daddr_need_amc ? s6_new_ip_addr_amc : s6_new_ip_daddr_direct;
    wire s6_new_ip_not_valid = (s6_saddr_need_amc || s6_daddr_need_amc) && !s6_new_ip_valid;

    // new addresses checksum pipeline, for incrementally updating checksum in UDP and TCP headers
    reg [15:0] s7_addr_checksum_1, s7_addr_checksum_2, s7_addr_checksum_3, s7_addr_checksum_4;
    reg [15:0] s8_new_addr_checksum;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s7_addr_checksum_1 <= 0;
            s7_addr_checksum_2 <= 0;
            s7_addr_checksum_3 <= 0;
            s7_addr_checksum_4 <= 0;
            s8_new_addr_checksum <= 0;
        end
        else
        begin
            s7_addr_checksum_1 <=
                ip_add(ip_add(s6_new_ip_saddr[0 * 8 +: 16], s6_new_ip_saddr[2 * 8 +: 16]),
                       ip_add(s6_new_ip_saddr[4 * 8 +: 16], s6_new_ip_saddr[6 * 8 +: 16]));
            s7_addr_checksum_2 <=
                ip_add(ip_add(s6_new_ip_saddr[8 * 8 +: 16], s6_new_ip_saddr[10 * 8 +: 16]),
                       ip_add(s6_new_ip_saddr[12 * 8 +: 16], s6_new_ip_saddr[14 * 8 +: 16]));
            s7_addr_checksum_3 <=
                ip_add(ip_add(s6_new_ip_daddr[0 * 8 +: 16], s6_new_ip_daddr[2 * 8 +: 16]),
                       ip_add(s6_new_ip_daddr[4 * 8 +: 16], s6_new_ip_daddr[6 * 8 +: 16]));
            s7_addr_checksum_4 <=
                ip_add(ip_add(s6_new_ip_daddr[8 * 8 +: 16], s6_new_ip_daddr[10 * 8 +: 16]),
                       ip_add(s6_new_ip_daddr[12 * 8 +: 16], s6_new_ip_daddr[14 * 8 +: 16]));
            s8_new_addr_checksum <=
                ip_add(ip_add(s7_addr_checksum_1, s7_addr_checksum_2),
                       ip_add(s7_addr_checksum_3, s7_addr_checksum_4));
        end
    end

    // new ipv4 checksum pipeline
    wire [159:0] s6_ipv4_header = make_ipv4_header(ntohs(s6_payload_len_plus_20),
                                                   s6_is_frag,
                                                   s6_frag_id[16 +: 16],
                                                   s6_frag_more,
                                                   s6_frag_dont,
                                                   s6_frag_offset,
                                                   s6_hop_limit,
                                                   s6_next_header,
                                                   16'd0, // checksum is set to 0 when calculating checksum
                                                   s6_new_ip_saddr[96 +: 32],
                                                   s6_new_ip_daddr[96 +: 32]);
    reg [159:0] s7_ipv4_header;
    reg [15:0] s7_ipv4_checksum_1, s7_ipv4_checksum_2;
    reg [15:0] s8_ipv4_checksum;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s7_ipv4_header <= 0;
            s7_ipv4_checksum_1 <= 0;
            s7_ipv4_checksum_2 <= 0;
            s8_ipv4_checksum <= 0;
        end
        else
        begin
            s7_ipv4_header <= s6_ipv4_header;
            s7_ipv4_checksum_1 <=
                ip_add(ip_add(s6_ipv4_header[0 * 8 +: 16], s6_ipv4_header[2 * 8 +: 16]),
                       ip_add(s6_ipv4_header[4 * 8 +: 16], s6_ipv4_header[6 * 8 +: 16]));
            s7_ipv4_checksum_2 <=
                ip_add(ip_add(s6_ipv4_header[8 * 8 +: 16], s6_ipv4_header[10 * 8 +: 16]),
                       ip_add(s6_ipv4_header[12 * 8 +: 16], s6_ipv4_header[14 * 8 +: 16]));
            s8_ipv4_checksum <=
                ~ip_add(ip_add(s7_ipv4_checksum_1, s7_ipv4_checksum_2),
                        ip_add(s7_ipv4_header[16 * 8 +: 16], s7_ipv4_header[18 * 8 +: 16]));
        end
    end

    wire s38_nexthop_valid;
    wire [127:0] s38_nexthop;
    wire [7:0] s38_interface;
    wire [47:0] s38_nexthop_mac; // unused, TODO
    forwarding_table forwarding_table_i(
        .eth_coreclk(eth_coreclk),
        .reset(reset),

        .s0_daddr(s6_new_ip_daddr),

        .s32_nexthop_valid(s38_nexthop_valid),
        .s32_nexthop(s38_nexthop),
        .s32_interface(s38_interface),
        .s32_nexthop_mac(s38_nexthop_mac),

        .default_nexthop_id(default_nexthop_id),

        .axi_awid(fib_axi_awid),
        .axi_awaddr(fib_axi_awaddr),
        .axi_awlen(fib_axi_awlen),
        .axi_awsize(fib_axi_awsize),
        .axi_awburst(fib_axi_awburst),
        .axi_awlock(fib_axi_awlock),
        .axi_awcache(fib_axi_awcache),
        .axi_awprot(fib_axi_awprot),
        .axi_awregion(fib_axi_awregion),
        .axi_awqos(fib_axi_awqos),
        .axi_awvalid(fib_axi_awvalid),
        .axi_awready(fib_axi_awready),
        .axi_wdata(fib_axi_wdata),
        .axi_wstrb(fib_axi_wstrb),
        .axi_wlast(fib_axi_wlast),
        .axi_wvalid(fib_axi_wvalid),
        .axi_wready(fib_axi_wready),
        .axi_bid(fib_axi_bid),
        .axi_bresp(fib_axi_bresp),
        .axi_bvalid(fib_axi_bvalid),
        .axi_bready(fib_axi_bready),
        .axi_arid(fib_axi_arid),
        .axi_araddr(fib_axi_araddr),
        .axi_arlen(fib_axi_arlen),
        .axi_arsize(fib_axi_arsize),
        .axi_arburst(fib_axi_arburst),
        .axi_arlock(fib_axi_arlock),
        .axi_arcache(fib_axi_arcache),
        .axi_arprot(fib_axi_arprot),
        .axi_arregion(fib_axi_arregion),
        .axi_arqos(fib_axi_arqos),
        .axi_arvalid(fib_axi_arvalid),
        .axi_arready(fib_axi_arready),
        .axi_rid(fib_axi_rid),
        .axi_rdata(fib_axi_rdata),
        .axi_rresp(fib_axi_rresp),
        .axi_rlast(fib_axi_rlast),
        .axi_rvalid(fib_axi_rvalid),
        .axi_rready(fib_axi_rready)
    );

    // stage 7
    reg s7_valid;
    reg [1023:0] s7_packet, s7_meta;
    reg [127:0] s7_new_ip_saddr, s7_new_ip_daddr;
    reg s7_is_ip, s7_is_ipv6, s7_is_ipv4;
    reg s7_is_tcp, s7_is_udp;
    reg [7:0] s7_hop_limit;
    reg [7:0] s7_next_header;
    reg [12:0] s7_frag_offset;
    reg s7_frag_more;
    reg [31:0] s7_frag_id;
    reg s7_frag_dont;
    reg s7_is_frag;
    reg s7_frag_is_first;
    reg [15:0] s7_payload_len;
    reg [15:0] s7_new_frame_len;
    reg [15:0] s7_tcpudp_checksum, s7_addr_checksum;
    reg s7_to_ipv6, s7_to_ipv4;
    reg s7_from_cpu, s7_to_cpu, s7_drop;
    reg [7:0] s7_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s7_valid <= 1'b0;
            s7_packet <= 0;
            s7_meta <= 0;
            s7_new_ip_saddr <= 0;
            s7_new_ip_daddr <= 0;
            s7_is_ip <= 0;
            s7_is_ipv6 <= 0;
            s7_is_ipv4 <= 0;
            s7_is_tcp <= 0;
            s7_is_udp <= 0;
            s7_hop_limit <= 0;
            s7_next_header <= 0;
            s7_frag_offset <= 0;
            s7_frag_more <= 0;
            s7_frag_id <= 0;
            s7_frag_dont <= 0;
            s7_is_frag <= 0;
            s7_frag_is_first <= 0;
            s7_payload_len <= 0;
            s7_new_frame_len <= 0;
            s7_to_ipv6 <= 0;
            s7_to_ipv4 <= 0;
            s7_tcpudp_checksum <= 0;
            s7_addr_checksum <= 0;
            s7_from_cpu <= 0;
            s7_to_cpu <= 0;
            s7_drop <= 0;
            s7_to_cpu_reason <= 0;
        end
        else
        begin
            s7_valid <= s6_valid;
            s7_packet <= s6_packet;
            s7_meta <= s6_meta;
            s7_new_ip_saddr <= s6_new_ip_saddr;
            s7_new_ip_daddr <= s6_new_ip_daddr;
            s7_is_ip <= s6_is_ip;
            s7_is_ipv6 <= s6_is_ipv6;
            s7_is_ipv4 <= s6_is_ipv4;
            s7_is_tcp <= s6_is_tcp;
            s7_is_udp <= s6_is_udp;
            s7_hop_limit <= s6_hop_limit;
            s7_next_header <= s6_next_header;
            s7_frag_offset <= s6_frag_offset;
            s7_frag_more <= s6_frag_more;
            s7_frag_id <= s6_frag_id;
            s7_frag_dont <= s6_frag_dont;
            s7_is_frag <= s6_is_frag;
            s7_frag_is_first <= s6_frag_is_first;
            s7_payload_len <= s6_payload_len;
            s7_new_frame_len <= s6_new_frame_len;
            s7_to_ipv6 <= s6_to_ipv6;
            s7_to_ipv4 <= s6_to_ipv4;
            s7_tcpudp_checksum <= s6_tcpudp_checksum;
            s7_addr_checksum <= s6_addr_checksum;
            s7_from_cpu <= s6_from_cpu;
            s7_to_cpu <= s6_to_cpu_1 || s6_new_ip_not_valid;
            s7_drop <= s6_drop;
            s7_to_cpu_reason <= s6_to_cpu_reason;
            s7_to_cpu_reason[REASON_TOO_BIG] <= s6_too_big;
            s7_to_cpu_reason[REASON_AMC_MISS] <= s6_new_ip_not_valid;
        end
    end

    // stage 8
    reg s8_valid;
    reg [1023:0] s8_packet, s8_meta;
    reg [127:0] s8_new_ip_saddr, s8_new_ip_daddr;
    reg s8_is_ip, s8_is_ipv6, s8_is_ipv4;
    reg s8_is_tcp, s8_is_udp;
    reg [7:0] s8_hop_limit;
    reg [7:0] s8_next_header;
    reg [12:0] s8_frag_offset;
    reg s8_frag_more;
    reg [31:0] s8_frag_id;
    reg s8_frag_dont;
    reg s8_is_frag;
    reg s8_frag_is_first;
    reg [15:0] s8_payload_len;
    reg [15:0] s8_new_frame_len;
    reg s8_to_ipv6, s8_to_ipv4;
    reg [15:0] s8_tcpudp_checksum, s8_addr_checksum;
    reg s8_from_cpu, s8_to_cpu, s8_drop;
    reg [7:0] s8_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s8_valid <= 1'b0;
            s8_packet <= 0;
            s8_meta <= 0;
            s8_new_ip_saddr <= 0;
            s8_new_ip_daddr <= 0;
            s8_is_ip <= 0;
            s8_is_ipv6 <= 0;
            s8_is_ipv4 <= 0;
            s8_is_tcp <= 0;
            s8_is_udp <= 0;
            s8_hop_limit <= 0;
            s8_next_header <= 0;
            s8_frag_offset <= 0;
            s8_frag_more <= 0;
            s8_frag_id <= 0;
            s8_frag_dont <= 0;
            s8_is_frag <= 0;
            s8_frag_is_first <= 0;
            s8_payload_len <= 0;
            s8_new_frame_len <= 0;
            s8_to_ipv6 <= 0;
            s8_to_ipv4 <= 0;
            s8_tcpudp_checksum <= 0;
            s8_addr_checksum <= 0;
            s8_from_cpu <= 0;
            s8_to_cpu <= 0;
            s8_drop <= 0;
            s8_to_cpu_reason <= 0;
        end
        else
        begin
            s8_valid <= s7_valid;
            s8_packet <= s7_packet;
            s8_meta <= s7_meta;
            s8_new_ip_saddr <= s7_new_ip_saddr;
            s8_new_ip_daddr <= s7_new_ip_daddr;
            s8_is_ip <= s7_is_ip;
            s8_is_ipv6 <= s7_is_ipv6;
            s8_is_ipv4 <= s7_is_ipv4;
            s8_is_tcp <= s7_is_tcp;
            s8_is_udp <= s7_is_udp;
            s8_hop_limit <= s7_hop_limit;
            s8_next_header <= s7_next_header;
            s8_frag_offset <= s7_frag_offset;
            s8_frag_more <= s7_frag_more;
            s8_frag_id <= s7_frag_id;
            s8_frag_dont <= s7_frag_dont;
            s8_is_frag <= s7_is_frag;
            s8_frag_is_first <= s7_frag_is_first;
            s8_payload_len <= s7_payload_len;
            s8_new_frame_len <= s7_new_frame_len;
            s8_to_ipv6 <= s7_to_ipv6;
            s8_to_ipv4 <= s7_to_ipv4;
            s8_tcpudp_checksum <= s7_tcpudp_checksum;
            s8_addr_checksum <= s7_addr_checksum;
            s8_from_cpu <= s7_from_cpu;
            s8_to_cpu <= s7_to_cpu;
            s8_drop <= s7_drop;
            s8_to_cpu_reason <= s7_to_cpu_reason;
        end
    end

    // stage 9
    wire [15:0] s8_tcpudp_checksum_1 =
        ~ip_add(ip_add(s8_addr_checksum, s8_new_addr_checksum),
                ~s8_tcpudp_checksum);
    reg s9_valid;
    reg [1023:0] s9_packet, s9_meta;
    reg [127:0] s9_new_ip_saddr, s9_new_ip_daddr;
    reg s9_is_ip, s9_is_ipv6, s9_is_ipv4;
    reg s9_is_tcp, s9_is_udp;
    reg [7:0] s9_hop_limit;
    reg [7:0] s9_next_header;
    reg [12:0] s9_frag_offset;
    reg s9_frag_more;
    reg [31:0] s9_frag_id;
    reg s9_frag_dont;
    reg s9_is_frag;
    reg s9_frag_is_first;
    reg [15:0] s9_payload_len;
    reg [15:0] s9_new_frame_len;
    reg s9_to_ipv6, s9_to_ipv4;
    reg [15:0] s9_ipv4_checksum, s9_tcpudp_checksum;
    reg s9_from_cpu, s9_to_cpu, s9_drop;
    reg [7:0] s9_to_cpu_reason;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s9_valid <= 1'b0;
            s9_packet <= 0;
            s9_meta <= 0;
            s9_new_ip_saddr <= 0;
            s9_new_ip_daddr <= 0;
            s9_is_ip <= 0;
            s9_is_ipv6 <= 0;
            s9_is_ipv4 <= 0;
            s9_is_tcp <= 0;
            s9_is_udp <= 0;
            s9_hop_limit <= 0;
            s9_next_header <= 0;
            s9_frag_offset <= 0;
            s9_frag_more <= 0;
            s9_frag_id <= 0;
            s9_frag_dont <= 0;
            s9_is_frag <= 0;
            s9_frag_is_first <= 0;
            s9_payload_len <= 0;
            s9_new_frame_len <= 0;
            s9_to_ipv6 <= 0;
            s9_to_ipv4 <= 0;
            s9_ipv4_checksum <= 0;
            s9_tcpudp_checksum <= 0;
            s9_from_cpu <= 0;
            s9_to_cpu <= 0;
            s9_drop <= 0;
            s9_to_cpu_reason <= 0;
        end
        else
        begin
            s9_valid <= s8_valid;
            s9_packet <= s8_packet;
            s9_meta <= s8_meta;
            s9_new_ip_saddr <= s8_new_ip_saddr;
            s9_new_ip_daddr <= s8_new_ip_daddr;
            s9_is_ip <= s8_is_ip;
            s9_is_ipv6 <= s8_is_ipv6;
            s9_is_ipv4 <= s8_is_ipv4;
            s9_is_tcp <= s8_is_tcp;
            s9_is_udp <= s8_is_udp;
            s9_hop_limit <= s8_hop_limit;
            s9_next_header <= s8_next_header;
            s9_frag_offset <= s8_frag_offset;
            s9_frag_more <= s8_frag_more;
            s9_frag_id <= s8_frag_id;
            s9_frag_dont <= s8_frag_dont;
            s9_is_frag <= s8_is_frag;
            s9_frag_is_first <= s8_frag_is_first;
            s9_payload_len <= s8_payload_len;
            s9_new_frame_len <= s8_new_frame_len;
            s9_to_ipv6 <= s8_to_ipv6;
            s9_to_ipv4 <= s8_to_ipv4;
            s9_ipv4_checksum <= s8_ipv4_checksum;
            s9_tcpudp_checksum <= s8_tcpudp_checksum_1;
            s9_from_cpu <= s8_from_cpu;
            s9_to_cpu <= s8_to_cpu;
            s9_drop <= s8_drop;
            s9_to_cpu_reason <= s8_to_cpu_reason;
        end
    end

    // stage 9+ (s9p): 9 ~ 38
    // delay to stage 38
    localparam NUM_STAGES = 32 + 6 - 9;
    reg s9p_valid [0:NUM_STAGES];
    reg [1023:0] s9p_packet [0:NUM_STAGES], s9p_meta [0:NUM_STAGES];
    reg [127:0] s9p_new_ip_saddr [0:NUM_STAGES], s9p_new_ip_daddr [0:NUM_STAGES];
    reg s9p_is_ip [0:NUM_STAGES], s9p_is_ipv6 [0:NUM_STAGES], s9p_is_ipv4 [0:NUM_STAGES];
    reg s9p_is_tcp [0:NUM_STAGES], s9p_is_udp [0:NUM_STAGES];
    reg [7:0] s9p_hop_limit [0:NUM_STAGES];
    reg [7:0] s9p_next_header [0:NUM_STAGES];
    reg [12:0] s9p_frag_offset [0:NUM_STAGES];
    reg s9p_frag_more [0:NUM_STAGES];
    reg [31:0] s9p_frag_id [0:NUM_STAGES];
    reg s9p_frag_dont [0:NUM_STAGES];
    reg s9p_is_frag [0:NUM_STAGES];
    reg s9p_frag_is_first [0:NUM_STAGES];
    reg [15:0] s9p_payload_len [0:NUM_STAGES];
    reg [15:0] s9p_new_frame_len [0:NUM_STAGES];
    reg s9p_to_ipv6 [0:NUM_STAGES], s9p_to_ipv4 [0:NUM_STAGES];
    reg [15:0] s9p_ipv4_checksum [0:NUM_STAGES], s9p_tcpudp_checksum [0:NUM_STAGES];
    reg s9p_from_cpu [0:NUM_STAGES], s9p_to_cpu [0:NUM_STAGES], s9p_drop [0:NUM_STAGES];
    reg [7:0] s9p_to_cpu_reason [0:NUM_STAGES];

    always @ (*)
    begin
        s9p_valid[0] = s9_valid;
        s9p_packet[0] = s9_packet;
        s9p_meta[0] = s9_meta;
        s9p_new_ip_saddr[0] = s9_new_ip_saddr;
        s9p_new_ip_daddr[0] = s9_new_ip_daddr;
        s9p_is_ip[0] = s9_is_ip;
        s9p_is_ipv6[0] = s9_is_ipv6;
        s9p_is_ipv4[0] = s9_is_ipv4;
        s9p_is_tcp[0] = s9_is_tcp;
        s9p_is_udp[0] = s9_is_udp;
        s9p_hop_limit[0] = s9_hop_limit;
        s9p_next_header[0] = s9_next_header;
        s9p_frag_offset[0] = s9_frag_offset;
        s9p_frag_more[0] = s9_frag_more;
        s9p_frag_id[0] = s9_frag_id;
        s9p_frag_dont[0] = s9_frag_dont;
        s9p_is_frag[0] = s9_is_frag;
        s9p_frag_is_first[0] = s9_frag_is_first;
        s9p_payload_len[0] = s9_payload_len;
        s9p_new_frame_len[0] = s9_new_frame_len;
        s9p_to_ipv6[0] = s9_to_ipv6;
        s9p_to_ipv4[0] = s9_to_ipv4;
        s9p_ipv4_checksum[0] = s9_ipv4_checksum;
        s9p_tcpudp_checksum[0] = s9_tcpudp_checksum;
        s9p_from_cpu[0] = s9_from_cpu;
        s9p_to_cpu[0] = s9_to_cpu;
        s9p_drop[0] = s9_drop;
        s9p_to_cpu_reason[0] = s9_to_cpu_reason;
    end

    always @ (posedge eth_coreclk or posedge reset)
    begin : delay_blk
        integer i;
        if (reset)
        begin
            for (i = 1; i <= NUM_STAGES; i = i + 1)
            begin
                s9p_valid[i] <= 1'b0;
                s9p_packet[i] <= 0;
                s9p_meta[i] <= 0;
                s9p_new_ip_saddr[i] <= 0;
                s9p_new_ip_daddr[i] <= 0;
                s9p_is_ip[i] <= 0;
                s9p_is_ipv6[i] <= 0;
                s9p_is_ipv4[i] <= 0;
                s9p_is_tcp[i] <= 0;
                s9p_is_udp[i] <= 0;
                s9p_hop_limit[i] <= 0;
                s9p_next_header[i] <= 0;
                s9p_frag_offset[i] <= 0;
                s9p_frag_more[i] <= 0;
                s9p_frag_id[i] <= 0;
                s9p_frag_dont[i] <= 0;
                s9p_is_frag[i] <= 0;
                s9p_frag_is_first[i] <= 0;
                s9p_payload_len[i] <= 0;
                s9p_new_frame_len[i] <= 0;
                s9p_to_ipv6[i] <= 0;
                s9p_to_ipv4[i] <= 0;
                s9p_ipv4_checksum[i] <= 0;
                s9p_tcpudp_checksum[i] <= 0;
                s9p_from_cpu[i] <= 0;
                s9p_to_cpu[i] <= 0;
                s9p_drop[i] <= 0;
                s9p_to_cpu_reason[i] <= 0;
            end
        end
        else
        begin
            for (i = 1; i <= NUM_STAGES; i = i + 1)
            begin
                s9p_valid[i] <= s9p_valid[i - 1];
                s9p_packet[i] <= s9p_packet[i - 1];
                s9p_meta[i] <= s9p_meta[i - 1];
                s9p_new_ip_saddr[i] <= s9p_new_ip_saddr[i - 1];
                s9p_new_ip_daddr[i] <= s9p_new_ip_daddr[i - 1];
                s9p_is_ip[i] <= s9p_is_ip[i - 1];
                s9p_is_ipv6[i] <= s9p_is_ipv6[i - 1];
                s9p_is_ipv4[i] <= s9p_is_ipv4[i - 1];
                s9p_is_tcp[i] <= s9p_is_tcp[i - 1];
                s9p_is_udp[i] <= s9p_is_udp[i - 1];
                s9p_hop_limit[i] <= s9p_hop_limit[i - 1];
                s9p_next_header[i] <= s9p_next_header[i - 1];
                s9p_frag_offset[i] <= s9p_frag_offset[i - 1];
                s9p_frag_more[i] <= s9p_frag_more[i - 1];
                s9p_frag_id[i] <= s9p_frag_id[i - 1];
                s9p_frag_dont[i] <= s9p_frag_dont[i - 1];
                s9p_is_frag[i] <= s9p_is_frag[i - 1];
                s9p_frag_is_first[i] <= s9p_frag_is_first[i - 1];
                s9p_payload_len[i] <= s9p_payload_len[i - 1];
                s9p_new_frame_len[i] <= s9p_new_frame_len[i - 1];
                s9p_to_ipv6[i] <= s9p_to_ipv6[i - 1];
                s9p_to_ipv4[i] <= s9p_to_ipv4[i - 1];
                s9p_ipv4_checksum[i] <= s9p_ipv4_checksum[i - 1];
                s9p_tcpudp_checksum[i] <= s9p_tcpudp_checksum[i - 1];
                s9p_from_cpu[i] <= s9p_from_cpu[i - 1];
                s9p_to_cpu[i] <= s9p_to_cpu[i - 1];
                s9p_drop[i] <= s9p_drop[i - 1];
                s9p_to_cpu_reason[i] <= s9p_to_cpu_reason[i - 1];
            end
        end
    end

    // stage 38
    wire s38_valid = s9p_valid[NUM_STAGES];
    wire [1023:0] s38_packet = s9p_packet[NUM_STAGES], s38_meta = s9p_meta[NUM_STAGES];
    wire [127:0] s38_new_ip_saddr = s9p_new_ip_saddr[NUM_STAGES], s38_new_ip_daddr = s9p_new_ip_daddr[NUM_STAGES];
    wire s38_is_ip = s9p_is_ip[NUM_STAGES], s38_is_ipv6 = s9p_is_ipv6[NUM_STAGES], s38_is_ipv4 = s9p_is_ipv4[NUM_STAGES];
    wire s38_is_tcp = s9p_is_tcp[NUM_STAGES], s38_is_udp = s9p_is_udp[NUM_STAGES];
    wire [7:0] s38_hop_limit = s9p_hop_limit[NUM_STAGES];
    wire [7:0] s38_next_header = s9p_next_header[NUM_STAGES];
    wire [12:0] s38_frag_offset = s9p_frag_offset[NUM_STAGES];
    wire s38_frag_more = s9p_frag_more[NUM_STAGES];
    wire [31:0] s38_frag_id = s9p_frag_id[NUM_STAGES];
    wire s38_frag_dont = s9p_frag_dont[NUM_STAGES];
    wire s38_is_frag = s9p_is_frag[NUM_STAGES];
    wire s38_frag_is_first = s9p_frag_is_first[NUM_STAGES];
    wire [15:0] s38_payload_len = s9p_payload_len[NUM_STAGES];
    wire [15:0] s38_new_frame_len = s9p_new_frame_len[NUM_STAGES];
    wire s38_to_ipv6 = s9p_to_ipv6[NUM_STAGES], s38_to_ipv4 = s9p_to_ipv4[NUM_STAGES];
    wire [15:0] s38_ipv4_checksum = s9p_ipv4_checksum[NUM_STAGES], s38_tcpudp_checksum = s9p_tcpudp_checksum[NUM_STAGES];
    wire s38_from_cpu = s9p_from_cpu[NUM_STAGES], s38_to_cpu = s9p_to_cpu[NUM_STAGES], s38_drop = s9p_drop[NUM_STAGES];
    wire [7:0] s38_to_cpu_reason = s9p_to_cpu_reason[NUM_STAGES];

    wire [47:0] s41_mac_daddr;
    wire s41_mac_daddr_valid;
    address_resolution_cache address_resolution_cache_i(
        .eth_coreclk(eth_coreclk),
        .reset(reset),
        .atime_counter(atime_counter),

        .s0_addrs(s38_nexthop),
        .s3_new_addrs(s41_mac_daddr),
        .s3_new_addr_valids(s41_mac_daddr_valid),
        .s3_new_addr_atimes(),

        .ready(arc_ready),
        .valid(arc_valid),
        .write_en(arc_write_en),
        .addr(arc_addr),
        .hash_en(arc_hash_en),
        .entry_valid_i(arc_entry_valid_i),
        .entry_tag_i(arc_entry_tag_i),
        .entry_value_i(arc_entry_value_i),
        .entry_atime_i(arc_entry_atime_i),
        .entry_valid_o(arc_entry_valid_o),
        .entry_tag_o(arc_entry_tag_o),
        .entry_value_o(arc_entry_value_o),
        .entry_atime_o(arc_entry_atime_o),
        .entry_match_o(arc_entry_match_o)
    );

    // stage 39
    reg s39_valid;
    reg [1023:0] s39_packet, s39_meta;
    reg [127:0] s39_new_ip_saddr, s39_new_ip_daddr;
    reg s39_is_ip, s39_is_ipv6, s39_is_ipv4;
    reg s39_is_tcp, s39_is_udp;
    reg [7:0] s39_hop_limit;
    reg [7:0] s39_next_header;
    reg [12:0] s39_frag_offset;
    reg s39_frag_more;
    reg [31:0] s39_frag_id;
    reg s39_frag_dont;
    reg s39_is_frag;
    reg s39_frag_is_first;
    reg [15:0] s39_payload_len;
    reg [15:0] s39_new_frame_len, s39_mtu;
    reg s39_to_ipv6, s39_to_ipv4;
    reg [15:0] s39_ipv4_checksum, s39_tcpudp_checksum;
    reg s39_from_cpu, s39_to_cpu, s39_drop;
    reg [7:0] s39_to_cpu_reason;
    reg [7:0] s39_interface;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s39_valid <= 1'b0;
            s39_packet <= 0;
            s39_meta <= 0;
            s39_new_ip_saddr <= 0;
            s39_new_ip_daddr <= 0;
            s39_is_ip <= 0;
            s39_is_ipv6 <= 0;
            s39_is_ipv4 <= 0;
            s39_is_tcp <= 0;
            s39_is_udp <= 0;
            s39_hop_limit <= 0;
            s39_next_header <= 0;
            s39_frag_offset <= 0;
            s39_frag_more <= 0;
            s39_frag_id <= 0;
            s39_frag_dont <= 0;
            s39_is_frag <= 0;
            s39_frag_is_first <= 0;
            s39_payload_len <= 0;
            s39_new_frame_len <= 0;
            s39_mtu <= 0;
            s39_to_ipv6 <= 0;
            s39_to_ipv4 <= 0;
            s39_ipv4_checksum <= 0;
            s39_tcpudp_checksum <= 0;
            s39_from_cpu <= 0;
            s39_to_cpu <= 0;
            s39_drop <= 0;
            s39_to_cpu_reason <= 0;
            s39_interface <= 0;
        end
        else
        begin
            s39_valid <= s38_valid;
            s39_packet <= s38_packet;
            s39_meta <= s38_meta;
            s39_new_ip_saddr <= s38_new_ip_saddr;
            s39_new_ip_daddr <= s38_new_ip_daddr;
            s39_is_ip <= s38_is_ip;
            s39_is_ipv6 <= s38_is_ipv6;
            s39_is_ipv4 <= s38_is_ipv4;
            s39_is_tcp <= s38_is_tcp;
            s39_is_udp <= s38_is_udp;
            s39_hop_limit <= s38_hop_limit;
            s39_next_header <= s38_next_header;
            s39_frag_offset <= s38_frag_offset;
            s39_frag_more <= s38_frag_more;
            s39_frag_id <= s38_frag_id;
            s39_frag_dont <= s38_frag_dont;
            s39_is_frag <= s38_is_frag;
            s39_frag_is_first <= s38_frag_is_first;
            s39_payload_len <= s38_payload_len;
            s39_new_frame_len <= s38_new_frame_len;
            s39_mtu <= mtu[s38_interface];
            s39_to_ipv6 <= s38_to_ipv6;
            s39_to_ipv4 <= s38_to_ipv4;
            s39_ipv4_checksum <= s38_ipv4_checksum;
            s39_tcpudp_checksum <= s38_tcpudp_checksum;
            s39_from_cpu <= s38_from_cpu;
            s39_to_cpu <= s38_to_cpu || !s38_nexthop_valid;
            s39_drop <= s38_drop;
            s39_to_cpu_reason <= s38_to_cpu_reason;
            s39_to_cpu_reason[REASON_FIB_MISS] <= !s38_nexthop_valid;
            s39_interface <= s38_interface;
        end
    end

    // stage 40
    reg s40_valid;
    reg [1023:0] s40_packet, s40_meta;
    reg [127:0] s40_new_ip_saddr, s40_new_ip_daddr;
    reg s40_is_ip, s40_is_ipv6, s40_is_ipv4;
    reg s40_is_tcp, s40_is_udp;
    reg [7:0] s40_hop_limit;
    reg [7:0] s40_next_header;
    reg [12:0] s40_frag_offset;
    reg s40_frag_more;
    reg [31:0] s40_frag_id;
    reg s40_frag_dont;
    reg s40_is_frag;
    reg s40_frag_is_first;
    reg [15:0] s40_payload_len, s40_payload_len_plus_20, s40_payload_len_plus_8;
    reg [15:0] s40_new_frame_len;
    reg s40_to_ipv6, s40_to_ipv4;
    reg [15:0] s40_ipv4_checksum, s40_tcpudp_checksum;
    reg s40_from_cpu, s40_to_cpu, s40_drop;
    reg [7:0] s40_to_cpu_reason;
    reg [7:0] s40_interface;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s40_valid <= 1'b0;
            s40_packet <= 0;
            s40_meta <= 0;
            s40_new_ip_saddr <= 0;
            s40_new_ip_daddr <= 0;
            s40_is_ip <= 0;
            s40_is_ipv6 <= 0;
            s40_is_ipv4 <= 0;
            s40_is_tcp <= 0;
            s40_is_udp <= 0;
            s40_hop_limit <= 0;
            s40_next_header <= 0;
            s40_frag_offset <= 0;
            s40_frag_more <= 0;
            s40_frag_id <= 0;
            s40_frag_dont <= 0;
            s40_is_frag <= 0;
            s40_frag_is_first <= 0;
            s40_payload_len <= 0;
            s40_payload_len_plus_20 <= 0;
            s40_payload_len_plus_8 <= 0;
            s40_new_frame_len <= 0;
            s40_to_ipv6 <= 0;
            s40_to_ipv4 <= 0;
            s40_ipv4_checksum <= 0;
            s40_tcpudp_checksum <= 0;
            s40_from_cpu <= 0;
            s40_to_cpu <= 0;
            s40_drop <= 0;
            s40_to_cpu_reason <= 0;
            s40_interface <= 0;
        end
        else
        begin
            s40_valid <= s39_valid;
            s40_packet <= s39_packet;
            s40_meta <= s39_meta;
            s40_new_ip_saddr <= s39_new_ip_saddr;
            s40_new_ip_daddr <= s39_new_ip_daddr;
            s40_is_ip <= s39_is_ip;
            s40_is_ipv6 <= s39_is_ipv6;
            s40_is_ipv4 <= s39_is_ipv4;
            s40_is_tcp <= s39_is_tcp;
            s40_is_udp <= s39_is_udp;
            s40_hop_limit <= s39_hop_limit;
            s40_next_header <= s39_next_header;
            s40_frag_offset <= s39_frag_offset;
            s40_frag_more <= s39_frag_more;
            s40_frag_id <= s39_frag_id;
            s40_frag_dont <= s39_frag_dont;
            s40_is_frag <= s39_is_frag;
            s40_frag_is_first <= s39_frag_is_first;
            s40_payload_len <= s39_payload_len;
            s40_payload_len_plus_20 <= s39_payload_len + 20;
            s40_payload_len_plus_8 <= s39_payload_len + 8;
            s40_new_frame_len <= s39_new_frame_len;
            s40_to_ipv6 <= s39_to_ipv6;
            s40_to_ipv4 <= s39_to_ipv4;
            s40_ipv4_checksum <= s39_ipv4_checksum;
            s40_tcpudp_checksum <= s39_tcpudp_checksum;
            s40_from_cpu <= s39_from_cpu;
            s40_to_cpu <= s39_to_cpu;
            s40_drop <= s39_drop;
            s40_to_cpu_reason <= s39_to_cpu_reason;
            if (s39_new_frame_len > s39_mtu)
            begin
                s40_to_cpu <= 1'b1;
                s40_to_cpu_reason[REASON_TOO_BIG] <= 1'b1;
            end
            s40_interface <= s39_interface;
        end
    end

    wire [1023:0] s40_payload =
        s40_is_ipv6 ?
            (s40_is_frag ? s40_packet[1023:(14 + 48) * 8] : s40_packet[1023:(14 + 40) * 8])
            : s40_packet[1023:(14 + 20) * 8];
    wire [159:0] s40_ipv4_header = make_ipv4_header(ntohs(s40_payload_len_plus_20),
                                                   s40_is_frag,
                                                   s40_frag_id[16 +: 16],
                                                   s40_frag_more,
                                                   s40_frag_dont,
                                                   s40_frag_offset,
                                                   s40_hop_limit,
                                                   s40_next_header,
                                                   s40_ipv4_checksum,
                                                   s40_new_ip_saddr[96 +: 32],
                                                   s40_new_ip_daddr[96 +: 32]);
    wire [319:0] s40_ipv6_header = make_ipv6_header(ntohs(s40_payload_len),
                                                   s40_hop_limit,
                                                   s40_next_header,
                                                   s40_new_ip_saddr,
                                                   s40_new_ip_daddr);
    wire [383:0] s40_ipv6_header_with_frag = make_ipv6_header_with_frag(ntohs(s40_payload_len_plus_8),
                                                                       s40_hop_limit,
                                                                       s40_next_header,
                                                                       s40_new_ip_saddr,
                                                                       s40_new_ip_daddr,
                                                                       s40_frag_id,
                                                                       s40_frag_more,
                                                                       s40_frag_offset);

    // stage 41
    reg s41_valid;
    reg [1023:0] s41_packet, s41_meta;
    reg [47:0] s41_mac_saddr;
    reg s41_is_ip, s41_is_ipv6, s41_is_ipv4;
    reg s41_is_tcp, s41_is_udp;
    reg s41_is_frag;
    reg [383:0] s41_header;
    reg [1023:0] s41_payload;
    reg [15:0] s41_new_frame_len;
    reg s41_to_ipv6, s41_to_ipv4;
    reg s41_from_cpu, s41_to_cpu, s41_drop;
    reg [7:0] s41_to_cpu_reason;
    reg [7:0] s41_interface;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s41_valid <= 1'b0;
            s41_packet <= 0;
            s41_meta <= 0;
            s41_mac_saddr <= 0;
            s41_is_ip <= 0;
            s41_is_ipv6 <= 0;
            s41_is_ipv4 <= 0;
            s41_is_tcp <= 0;
            s41_is_udp <= 0;
            s41_is_frag <= 0;
            s41_header <= 0;
            s41_payload <= 0;
            s41_new_frame_len <= 0;
            s41_to_ipv6 <= 0;
            s41_to_ipv4 <= 0;
            s41_from_cpu <= 0;
            s41_to_cpu <= 0;
            s41_drop <= 0;
            s41_to_cpu_reason <= 0;
            s41_interface <= 0;
        end
        else
        begin
            s41_valid <= s40_valid;
            s41_packet <= s40_packet;
            s41_meta <= s40_meta;
            s41_mac_saddr <= mac_addr[s40_interface];
            s41_is_ip <= s40_is_ip;
            s41_is_ipv6 <= s40_is_ipv6;
            s41_is_ipv4 <= s40_is_ipv4;
            s41_is_tcp <= s40_is_tcp;
            s41_is_udp <= s40_is_udp;
            s41_is_frag <= s40_is_frag;
            s41_header <= s40_ipv6_header_with_frag;
            if (s40_to_ipv6 && !s40_is_frag)
            begin
                s41_header[319:0] <= s40_ipv6_header;
            end
            if (s40_to_ipv4)
            begin
                s41_header[159:0] <= s40_ipv4_header;
            end
            s41_payload <= s40_payload;
            s41_new_frame_len <= s40_new_frame_len;
            s41_to_ipv6 <= s40_to_ipv6;
            s41_to_ipv4 <= s40_to_ipv4;
            if (!s40_is_frag || s40_frag_is_first)
            begin
                // update TCP/UDP checksum
                if (s40_is_tcp)
                begin
                    s41_payload[16 * 8 +: 16] <= s40_tcpudp_checksum;
                end
                if (s40_is_udp)
                begin
                    s41_payload[6 * 8 +: 16] <= s40_tcpudp_checksum;
                end
            end
            s41_from_cpu <= s40_from_cpu;
            s41_to_cpu <= s40_to_cpu;
            s41_drop <= s40_drop;
            s41_to_cpu_reason <= s40_to_cpu_reason;
            s41_interface <= s40_interface;
        end
    end

    wire s41_to_cpu_1 = s41_to_cpu || !s41_mac_daddr_valid;
    reg [7:0] s41_to_cpu_reason_1;
    always @ (*)
    begin
        s41_to_cpu_reason_1 = s41_to_cpu_reason;
        s41_to_cpu_reason_1[REASON_ARC_MISS] = !s41_mac_daddr_valid;
    end

    // stage 42
    reg s42_valid;
    reg [1023:0] s42_packet, s42_meta;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s42_valid <= 1'b0;
            s42_packet <= 0;
            s42_meta <= 0;
        end
        else
        begin
            s42_valid <= s41_valid;
            s42_packet <= s41_packet;
            s42_meta <= s41_meta;
            s42_meta[16] <= s41_drop && !s41_from_cpu;
            s42_meta[34:32] <= TYPE_ORIG;
            if (s41_from_cpu)
            begin
                s42_meta[34:32] <= TYPE_R20;
                s42_meta[3 * 8 +: 8] <= s41_packet[3 * 8 +: 8];
                s42_packet[863:0] <= s41_packet[1023:160];
            end
            else if (s41_to_cpu_1)
            begin
                s42_meta[34:32] <= TYPE_A20;
                s42_meta[3 * 8 +: 8] <= CPU_PORT_ID;
                s42_meta[959:800] <= s41_meta[159:0];
                s42_meta[800 + 5 * 8 +: 8] <= s41_to_cpu_reason_1;
            end
            else if (!s41_from_cpu && !s41_to_cpu_1)
            begin
                s42_meta[3 * 8 +: 8] <= s41_interface;
                if (s41_to_ipv6)
                begin
                    if (s41_is_ipv4)
                    begin
                        if (s41_is_frag)
                        begin
                            s42_meta[34:32] <= TYPE_A28;
                            s42_meta[1023:800] <= {s41_header[111:0], 16'hdd86, s41_mac_saddr, s41_mac_daddr};
                            s42_packet <= {s41_payload[751:0], s41_header[383:112]};
                        end
                        else
                        begin
                            s42_meta[34:32] <= TYPE_A20;
                            s42_meta[959:800] <= {s41_header[47:0], 16'hdd86, s41_mac_saddr, s41_mac_daddr};
                            s42_packet <= {s41_payload[751:0], s41_header[319:48]};
                        end
                    end
                    if (s41_is_ipv6)
                    begin
                        if (s41_is_frag)
                        begin
                            s42_packet <= {s41_payload[527:0], s41_header[383:0], 16'hdd86, s41_mac_saddr, s41_mac_daddr};
                        end
                        else
                        begin
                            s42_packet <= {s41_payload[591:0], s41_header[319:0], 16'hdd86, s41_mac_saddr, s41_mac_daddr};
                        end
                    end
                end
                if (s41_to_ipv4)
                begin
                    if (s41_is_ipv6)
                    begin
                        if (s41_is_frag)
                        begin
                            s42_meta[34:32] <= TYPE_R28;
                            s42_packet[799:0] <= {s41_payload[527:0], s41_header[159:0], 16'h0008, s41_mac_saddr, s41_mac_daddr};
                        end
                        else
                        begin
                            s42_meta[34:32] <= TYPE_R20;
                            s42_packet[863:0] <= {s41_payload[591:0], s41_header[159:0], 16'h0008, s41_mac_saddr, s41_mac_daddr};
                        end
                    end
                    if (s41_is_ipv4)
                    begin
                        s42_packet <= {s41_payload[751:0], s41_header[159:0], 16'h0008, s41_mac_saddr, s41_mac_daddr};
                    end
                end
            end
        end
    end

    assign sout_valid = s42_valid;
    assign sout_packet = s42_packet;
    assign sout_meta = s42_meta;
endmodule
