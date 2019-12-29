`timescale 1ns / 1ps

module forwarding_table(
    input eth_coreclk,
    input reset,

    input [127:0] s0_daddr,

    output reg s32_nexthop_valid,
    output reg [127:0] s32_nexthop,
    output reg [7:0] s32_interface,
    output reg [47:0] s32_nexthop_mac,

    input [15:0] default_nexthop_id,

    input [3:0] axi_awid,
    input [31:0] axi_awaddr,
    input [7:0] axi_awlen,
    input [2:0] axi_awsize,
    input [1:0] axi_awburst,
    input axi_awlock,
    input [3:0] axi_awcache,
    input [2:0] axi_awprot,
    input [3:0] axi_awregion,
    input [3:0] axi_awqos,
    input axi_awvalid,
    output wire axi_awready,
    input [63:0] axi_wdata,
    input [7:0] axi_wstrb,
    input axi_wlast,
    input axi_wvalid,
    output wire axi_wready,
    output wire [3:0] axi_bid,
    output wire [1:0] axi_bresp,
    output wire axi_bvalid,
    input axi_bready,
    input [3:0] axi_arid,
    input [31:0] axi_araddr,
    input [7:0] axi_arlen,
    input [2:0] axi_arsize,
    input [1:0] axi_arburst,
    input axi_arlock,
    input [3:0] axi_arcache,
    input [2:0] axi_arprot,
    input [3:0] axi_arregion,
    input [3:0] axi_arqos,
    input axi_arvalid,
    output wire axi_arready,
    output wire [3:0] axi_rid,
    output wire [63:0] axi_rdata,
    output wire [1:0] axi_rresp,
    output wire axi_rlast,
    output wire axi_rvalid,
    input axi_rready
    );

    function [127:0] msb2lsb;
        input [127:0] x;
        integer i, j;
    begin
        msb2lsb = 0;
        for (i = 0; i < 16; i = i + 1)
        begin
            for (j = 0; j < 8; j = j + 1)
            begin
                msb2lsb[i * 8 + j] = x[i * 8 + (7 - j)];
            end
        end
    end
    endfunction

    function [3:0] msb2lsb4;
        input [3:0] x;
    begin
        msb2lsb4 = {x[0], x[1], x[2], x[3]};
    end
    endfunction

    function [11:0] msb2lsb12;
        input [11:0] x;
    begin
        msb2lsb12 = {x[0], x[1], x[2], x[3],
                     x[4], x[5], x[6], x[7],
                     x[8], x[9], x[10], x[11]};
    end
    endfunction

    localparam BAD_PTR = 15'h7fff;

    wire [15:0] selected_nextptr [1:30];
    wire [15:0] nexthop_id [1:30];

    wire [7:0] bram_web [0:31];
    wire [11:0] bram_addrb [0:31];
    wire [63:0] bram_dinb [0:31], bram_doutb [0:31];

    reg [127:0] s_addr [0:31];
    reg s_nexthop_done [0:31];
    reg s_nexthop_valid [0:31];
    reg [15:0] s_nexthop_id [0:31];

    /*
        struct trie_node0
        {
            uint16_t nextptr[4096];
        };
    */
    wire [11:0] s0_bram_addra;
    wire [15:0] s1_bram_douta;
    blk_mem_gen_level0 blk_mem_gen_level0_i(
        .clka(eth_coreclk),
        .wea(0),
        .addra(s0_bram_addra),
        .dina(0),
        .douta(s1_bram_douta),
        .clkb(eth_coreclk),
        .web(bram_web[0]),
        .addrb(bram_addrb[0]),
        .dinb(bram_dinb[0]),
        .doutb(bram_doutb[0])
    );

    assign s0_bram_addra = msb2lsb12(s_addr[0][11:0]);
    assign selected_nextptr[1] = s1_bram_douta;

    wire [9:0] bram_addra [1:29];
    wire [255:0] bram_douta [2:30];
    genvar i, j;
    generate
        for (i = 1; i <= 29; i = i + 1)
        begin
            /*
                struct trie_node
                {
                    uint16_t nextptr[16];
                };
            */
            blk_mem_gen_level12 blk_mem_gen_level12_i(
                .clka(eth_coreclk),
                .wea(0),
                .addra(bram_addra[i]),
                .dina(0),
                .douta(bram_douta[i + 1]),
                .clkb(eth_coreclk),
                .web(bram_web[i]),
                .addrb(bram_addrb[i]),
                .dinb(bram_dinb[i]),
                .doutb(bram_doutb[i])
            );
            wire [15:0] bram_nextptr [0:15];
            assign bram_addra[i] = selected_nextptr[i];
            for (j = 0; j < 16; j = j + 1)
            begin
                // 15 14            0
                // |h|ppppppppppppppp|
                // |o|ttttttttttttttt|
                // |p|rrrrrrrrrrrrrrr|
                assign bram_nextptr[j] = bram_douta[i + 1][j * 16 +: 15];
                assign nexthop_id[i + 1][j] = bram_douta[i + 1][j * 16 + 15];
            end
            assign selected_nextptr[i + 1] =
                bram_nextptr[msb2lsb4(s_addr[i + 1][12 + (i - 1) * 4 +: 4])];
        end
    endgenerate

    // special case for the last level
    reg s30_nexthop_valid_1;
    reg [15:0] s30_nexthop_id_1;
    always @ (*)
    begin
        if (!s_nexthop_done[30] && selected_nextptr[30][14:0] != BAD_PTR)
        begin
            s30_nexthop_valid_1 = 1'b1;
            s30_nexthop_id_1 = selected_nextptr[30];
        end
        else if (!s_nexthop_done[30] && nexthop_id[30][14:0] != BAD_PTR)
        begin
            s30_nexthop_valid_1 = 1'b1;
            s30_nexthop_id_1 = nexthop_id[30];
        end
        else
        begin
            s30_nexthop_valid_1 = s_nexthop_valid[30];
            s30_nexthop_id_1 = s_nexthop_id[30];
        end
    end

    /*
        struct nexthop_info
        {
            uint8_t interface;
            uint8_t onlink;
            uint8_t reserved[2];
            uint32_t ref; // reference count
            uint64_t mac;
            uint64_t addr;
            uint64_t addr_hi;
        };
    */
    wire [255:0] s31_nexthop_info;
    blk_mem_gen_level12 blk_mem_gen_nexthop_i(
        .clka(eth_coreclk),
        .wea(0),
        .addra(s30_nexthop_id_1),
        .dina(0),
        .douta(s31_nexthop_info),
        .clkb(eth_coreclk),
        .web(bram_web[30]),
        .addrb(bram_addrb[30]),
        .dinb(bram_dinb[30]),
        .doutb(bram_doutb[30])
    );
    wire [127:0] s31_nexthop = s31_nexthop_info[128 +: 128];
    wire [7:0] s31_interface = s31_nexthop_info[0 +: 8];
    wire s31_onlink = s31_nexthop_info[8];
    wire [47:0] s31_nexthop_mac = s31_nexthop_info[64 +: 48];

    always @ (*)
    begin
        s_addr[0] = msb2lsb(s0_daddr);
        s_nexthop_done[0] = 0;
        s_nexthop_valid[0] = default_nexthop_id[14:0] != BAD_PTR;
        s_nexthop_id[0] = default_nexthop_id;
    end
    assign nexthop_id[1] = s_nexthop_id[1];

    always @ (posedge eth_coreclk or posedge reset)
    begin : lookup_blk
        integer i;
        if (reset)
        begin
            for (i = 1; i <= 31; i = i + 1)
            begin
                s_addr[i] <= 0;
                s_nexthop_done[i] <= 0;
                s_nexthop_valid[i] <= 0;
                s_nexthop_id[i] <= 0;
            end
            s32_nexthop_valid <= 1'b0;
            s32_nexthop <= 0;
            s32_interface <= 0;
            s32_nexthop_mac <= 0;
        end
        else
        begin
            for (i = 0; i <= 30; i = i + 1)
            begin
                s_addr[i + 1] <= s_addr[i];
            end

            s_nexthop_done[1] <= s_nexthop_done[0];
            s_nexthop_valid[1] <= s_nexthop_valid[0];
            s_nexthop_id[1] <= s_nexthop_id[0];
            for (i = 1; i <= 29; i = i + 1)
            begin
                if (!s_nexthop_done[i] && nexthop_id[i][14:0] != BAD_PTR)
                begin
                    s_nexthop_valid[i + 1] <= 1'b1;
                    s_nexthop_id[i + 1] <= nexthop_id[i];
                end
                else
                begin
                    s_nexthop_valid[i + 1] <= s_nexthop_valid[i];
                    s_nexthop_id[i + 1] <= s_nexthop_id[i];
                end
                s_nexthop_done[i + 1] <= s_nexthop_done[i] || selected_nextptr[i][14:0] == BAD_PTR;
            end
            s_nexthop_done[31] <= s_nexthop_done[30];
            s_nexthop_valid[31] <= s30_nexthop_valid_1;
            s_nexthop_id[31] <= s30_nexthop_id_1;

            s32_nexthop_valid <= s_nexthop_valid[31];
            s32_nexthop <= s31_onlink ? msb2lsb(s_addr[31]) : s31_nexthop;
            s32_interface <= s31_interface;
            s32_nexthop_mac <= s31_nexthop_mac;
        end
    end

    // cpu interface
    wire s0_ramiface_en;
    wire [7:0] s0_ramiface_we;
    wire [16:0] s0_ramiface_addr;
    wire [63:0] s0_ramiface_din;

    reg s1_ramiface_en;
    reg [7:0] s1_ramiface_we;
    reg [4:0] s1_ramiface_chip;
    reg [11:0] s1_ramiface_chipaddr;
    reg [63:0] s1_ramiface_din;

    reg [31:0] s2_ramiface_cs;
    reg [63:0] s2_ramiface_dout;

    always @ (posedge eth_coreclk or posedge reset)
    begin : bram_pipeline
        integer i;
        if (reset)
        begin
            s1_ramiface_en <= 1'b0;
            s1_ramiface_we <= 0;
            s1_ramiface_chip <= 0;
            s1_ramiface_chipaddr <= 0;
            s1_ramiface_din <= 0;
            s2_ramiface_cs <= 0;
        end
        else
        begin
            s1_ramiface_en <= s0_ramiface_en;
            s1_ramiface_we <= s0_ramiface_we;
            s1_ramiface_din <= s0_ramiface_din;
            s1_ramiface_chip <= s0_ramiface_addr[16:12];
            s1_ramiface_chipaddr <= s0_ramiface_addr[11:0];
            s2_ramiface_cs <= 0;
            for (i = 0; i <= 30; i = i + 1)
            begin
                s2_ramiface_cs[i] <= i == s1_ramiface_chip;
            end
        end
    end
    generate
        for (i = 0; i <= 30; i = i + 1)
        begin
            assign bram_web[i] = (s1_ramiface_en && i == s1_ramiface_chip) ? s1_ramiface_we : 0;
            assign bram_addrb[i] = s1_ramiface_chipaddr;
            assign bram_dinb[i] = s1_ramiface_din;
        end
    endgenerate
    always @ (*)
    begin : dout_selector
        integer i;
        s2_ramiface_dout = 0;
        for (i = 0; i <= 30; i = i + 1)
        begin
            if (s2_ramiface_cs[i])
            begin
                s2_ramiface_dout = bram_doutb[i];
            end
        end
    end

    wire [2:0] offset;
    axi_bram_ctrl_0 axi_bram_ctrl_0_i(
        .s_axi_aclk(eth_coreclk),        // input wire s_axi_aclk
        .s_axi_aresetn(~reset),  // input wire s_axi_aresetn
        .s_axi_awid(axi_awid),        // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(axi_awaddr),    // input wire [19 : 0] s_axi_awaddr
        .s_axi_awlen(axi_awlen),      // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(axi_awsize),    // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(axi_awburst),  // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(axi_awlock),    // input wire s_axi_awlock
        .s_axi_awcache(axi_awcache),  // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(axi_awprot),    // input wire [2 : 0] s_axi_awprot
        .s_axi_awvalid(axi_awvalid),  // input wire s_axi_awvalid
        .s_axi_awready(axi_awready),  // output wire s_axi_awready
        .s_axi_wdata(axi_wdata),      // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(axi_wstrb),      // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(axi_wlast),      // input wire s_axi_wlast
        .s_axi_wvalid(axi_wvalid),    // input wire s_axi_wvalid
        .s_axi_wready(axi_wready),    // output wire s_axi_wready
        .s_axi_bid(axi_bid),          // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(axi_bresp),      // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(axi_bvalid),    // output wire s_axi_bvalid
        .s_axi_bready(axi_bready),    // input wire s_axi_bready
        .s_axi_arid(axi_arid),        // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(axi_araddr),    // input wire [19 : 0] s_axi_araddr
        .s_axi_arlen(axi_arlen),      // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(axi_arsize),    // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(axi_arburst),  // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(axi_arlock),    // input wire s_axi_arlock
        .s_axi_arcache(axi_arcache),  // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(axi_arprot),    // input wire [2 : 0] s_axi_arprot
        .s_axi_arvalid(axi_arvalid),  // input wire s_axi_arvalid
        .s_axi_arready(axi_arready),  // output wire s_axi_arready
        .s_axi_rid(axi_rid),          // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(axi_rdata),      // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(axi_rresp),      // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(axi_rlast),      // output wire s_axi_rlast
        .s_axi_rvalid(axi_rvalid),    // output wire s_axi_rvalid
        .s_axi_rready(axi_rready),    // input wire s_axi_rready
        .bram_rst_a(),        // output wire bram_rst_a
        .bram_clk_a(),        // output wire bram_clk_a
        .bram_en_a(s0_ramiface_en),          // output wire bram_en_a
        .bram_we_a(s0_ramiface_we),          // output wire [7 : 0] bram_we_a
        .bram_addr_a({s0_ramiface_addr, offset}),      // output wire [19 : 0] bram_addr_a
        .bram_wrdata_a(s0_ramiface_din),  // output wire [63 : 0] bram_wrdata_a
        .bram_rddata_a(s2_ramiface_dout)  // input wire [63 : 0] bram_rddata_a
    );
endmodule
