`timescale 1ns / 1ps

module test_fib();
    reg eth_coreclk;
    reg reset;
    reg [127:0] s0_daddr;
    wire s32_nexthop_valid;
    wire [127:0] s32_nexthop;
    wire [7:0] s32_interface;
    wire [47:0] s32_nexthop_mac;

    wire [3:0] fib_axi_awid = 0;
    wire [31:0] fib_axi_awaddr = 0;
    wire [7:0] fib_axi_awlen = 0;
    wire [2:0] fib_axi_awsize = 0;
    wire [1:0] fib_axi_awburst = 0;
    wire fib_axi_awlock = 0;
    wire [3:0] fib_axi_awcache = 0;
    wire [2:0] fib_axi_awprot = 0;
    wire [3:0] fib_axi_awregion = 0;
    wire [3:0] fib_axi_awqos = 0;
    wire fib_axi_awvalid = 0;
    wire fib_axi_awready;
    wire [63:0] fib_axi_wdata = 0;
    wire [7:0] fib_axi_wstrb = 0;
    wire fib_axi_wlast = 0;
    wire fib_axi_wvalid = 0;
    wire fib_axi_wready;
    wire [3:0] fib_axi_bid;
    wire [1:0] fib_axi_bresp;
    wire fib_axi_bvalid;
    wire fib_axi_bready = 0;
    wire [3:0] fib_axi_arid = 0;
    wire [31:0] fib_axi_araddr = 0;
    wire [7:0] fib_axi_arlen = 0;
    wire [2:0] fib_axi_arsize = 0;
    wire [1:0] fib_axi_arburst = 0;
    wire fib_axi_arlock = 0;
    wire [3:0] fib_axi_arcache = 0;
    wire [2:0] fib_axi_arprot = 0;
    wire [3:0] fib_axi_arregion = 0;
    wire [3:0] fib_axi_arqos = 0;
    wire fib_axi_arvalid = 0;
    wire fib_axi_arready;
    wire [3:0] fib_axi_rid;
    wire [63:0] fib_axi_rdata;
    wire [1:0] fib_axi_rresp;
    wire fib_axi_rlast;
    wire fib_axi_rvalid;
    wire fib_axi_rready = 0;

    forwarding_table dut(
        .eth_coreclk(eth_coreclk),
        .reset(reset),

        .s0_daddr(s0_daddr),

        .s32_nexthop_valid(s32_nexthop_valid),
        .s32_nexthop(s32_nexthop),
        .s32_interface(s32_interface),
        .s32_nexthop_mac(s32_nexthop_mac),

        .default_nexthop_id(15'h7fff),

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

    initial
    begin
        reset = 1;
        #11.5;
        reset = 0;
    end

    always
    begin
        eth_coreclk = 1;
        #1;
        eth_coreclk = 0;
        #1;
    end

    integer state;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            s0_daddr <= 0;
            state <= 0;
        end
        else
        begin
            case (state)
            0:
            begin
                // 2000::1
                s0_daddr <= 128'h01000000000000000000000000000020;
                state <= state + 1;
            end
            1:
            begin
                // 2000::2
                s0_daddr <= 128'h02000000000000000000000000000020;
                state <= state + 1;
            end
            2:
            begin
                // 2001::1
                s0_daddr <= 128'h01000000000000000000000000000120;
                state <= state + 1;
            end
            3:
            begin
                // 2002::1
                s0_daddr <= 128'h01000000000000000000000000000220;
                state <= state + 1;
            end
            4:
            begin
                // 2001:1000::1
                s0_daddr <= 128'h01000000000000000000000000100120;
                state <= state + 1;
            end
            5:
            begin
                // 2001:1100::1
                s0_daddr <= 128'h01000000000000000000000000110120;
                state <= state + 1;
            end
            6:
            begin
                // 3000::1
                s0_daddr <= 128'h01000000000000000000000000000030;
                state <= state + 1;
            end
            7:
            begin
                // 3000::2
                s0_daddr <= 128'h02000000000000000000000000000030;
                state <= state + 1;
            end
            default:
                state <= 0;
            endcase
        end
    end
endmodule
