`timescale 1ns / 1ps

module cpu(
    input CLK,
    input nRST,

    output wire UART_TX,
    input UART_RX,

    output [63:0] eth_tx_data,
    output [7:0] eth_tx_keep,
    output eth_tx_valid,
    input eth_tx_ready,
    output eth_tx_last,

    input [63:0] eth_rx_data,
    input [7:0] eth_rx_keep,
    input eth_rx_valid,
    output eth_rx_ready,
    input eth_rx_last,

    output eth_axi_lite_awvalid,
    input eth_axi_lite_awready,
    output [31:0] eth_axi_lite_awaddr,
    output [2:0] eth_axi_lite_awprot,
    output eth_axi_lite_wvalid,
    input eth_axi_lite_wready,
    output [63:0] eth_axi_lite_wdata,
    output [7:0] eth_axi_lite_wstrb,
    input [1:0] eth_axi_lite_bresp,
    input eth_axi_lite_bvalid,
    output eth_axi_lite_bready,
    output eth_axi_lite_arvalid,
    input eth_axi_lite_arready,
    output [31:0] eth_axi_lite_araddr,
    output [2:0] eth_axi_lite_arprot,
    input eth_axi_lite_rvalid,
    output eth_axi_lite_rready,
    input [63:0] eth_axi_lite_rdata,
    input [1:0] eth_axi_lite_rresp,

    output wire [3:0] fib_axi_awid,
    output wire [31:0] fib_axi_awaddr,
    output wire [7:0] fib_axi_awlen,
    output wire [2:0] fib_axi_awsize,
    output wire [1:0] fib_axi_awburst,
    output wire fib_axi_awlock,
    output wire [3:0] fib_axi_awcache,
    output wire [2:0] fib_axi_awprot,
    output wire [3:0] fib_axi_awregion,
    output wire [3:0] fib_axi_awqos,
    output wire fib_axi_awvalid,
    input fib_axi_awready,
    output wire [63:0] fib_axi_wdata,
    output wire [7:0] fib_axi_wstrb,
    output wire fib_axi_wlast,
    output wire fib_axi_wvalid,
    input fib_axi_wready,
    input [3:0] fib_axi_bid,
    input [1:0] fib_axi_bresp,
    input fib_axi_bvalid,
    output wire fib_axi_bready,
    output wire [3:0] fib_axi_arid,
    output wire [31:0] fib_axi_araddr,
    output wire [7:0] fib_axi_arlen,
    output wire [2:0] fib_axi_arsize,
    output wire [1:0] fib_axi_arburst,
    output wire fib_axi_arlock,
    output wire [3:0] fib_axi_arcache,
    output wire [2:0] fib_axi_arprot,
    output wire [3:0] fib_axi_arregion,
    output wire [3:0] fib_axi_arqos,
    output wire fib_axi_arvalid,
    input fib_axi_arready,
    input [3:0] fib_axi_rid,
    input [63:0] fib_axi_rdata,
    input [1:0] fib_axi_rresp,
    input fib_axi_rlast,
    input fib_axi_rvalid,
    output wire fib_axi_rready
    );

    wire reset = ~nRST;

    wire [7:0] mem_axi_awid;
    wire [31:0] mem_axi_awaddr;
    wire [7:0] mem_axi_awlen;
    wire [2:0] mem_axi_awsize;
    wire [1:0] mem_axi_awburst;
    wire mem_axi_awvalid;
    wire mem_axi_awready;
    wire [63:0] mem_axi_wdata;
    wire [7:0] mem_axi_wstrb;
    wire mem_axi_wlast;
    wire mem_axi_wvalid;
    wire mem_axi_wready;
    wire [7:0] mem_axi_bid;
    wire [1:0] mem_axi_bresp;
    wire mem_axi_bvalid;
    wire mem_axi_bready;
    wire [7:0] mem_axi_arid;
    wire [31:0] mem_axi_araddr;
    wire [7:0] mem_axi_arlen;
    wire [2:0] mem_axi_arsize;
    wire [1:0] mem_axi_arburst;
    wire mem_axi_arvalid;
    wire mem_axi_arready;
    wire [7:0] mem_axi_rid;
    wire [63:0] mem_axi_rdata;
    wire [1:0] mem_axi_rresp;
    wire mem_axi_rlast;
    wire mem_axi_rvalid;
    wire mem_axi_rready;

    wire core_mmio_axi4_0_aw_ready;
    wire core_mmio_axi4_0_aw_valid;
    wire [3:0] core_mmio_axi4_0_aw_bits_id;
    wire [30:0] core_mmio_axi4_0_aw_bits_addr;
    wire [7:0] core_mmio_axi4_0_aw_bits_len;
    wire [2:0] core_mmio_axi4_0_aw_bits_size;
    wire [1:0] core_mmio_axi4_0_aw_bits_burst;
    wire core_mmio_axi4_0_aw_bits_lock;
    wire [3:0] core_mmio_axi4_0_aw_bits_cache;
    wire [2:0] core_mmio_axi4_0_aw_bits_prot;
    wire [3:0] core_mmio_axi4_0_aw_bits_qos;
    wire core_mmio_axi4_0_w_ready;
    wire core_mmio_axi4_0_w_valid;
    wire [63:0] core_mmio_axi4_0_w_bits_data;
    wire [7:0] core_mmio_axi4_0_w_bits_strb;
    wire core_mmio_axi4_0_w_bits_last;
    wire core_mmio_axi4_0_b_ready;
    wire core_mmio_axi4_0_b_valid;
    wire [3:0] core_mmio_axi4_0_b_bits_id;
    wire [1:0] core_mmio_axi4_0_b_bits_resp;
    wire core_mmio_axi4_0_ar_ready;
    wire core_mmio_axi4_0_ar_valid;
    wire [3:0] core_mmio_axi4_0_ar_bits_id;
    wire [30:0] core_mmio_axi4_0_ar_bits_addr;
    wire [7:0] core_mmio_axi4_0_ar_bits_len;
    wire [2:0] core_mmio_axi4_0_ar_bits_size;
    wire [1:0] core_mmio_axi4_0_ar_bits_burst;
    wire core_mmio_axi4_0_ar_bits_lock;
    wire [3:0] core_mmio_axi4_0_ar_bits_cache;
    wire [2:0] core_mmio_axi4_0_ar_bits_prot;
    wire [3:0] core_mmio_axi4_0_ar_bits_qos;
    wire core_mmio_axi4_0_r_ready;
    wire core_mmio_axi4_0_r_valid;
    wire [3:0] core_mmio_axi4_0_r_bits_id;
    wire [63:0] core_mmio_axi4_0_r_bits_data;
    wire [1:0] core_mmio_axi4_0_r_bits_resp;
    wire core_mmio_axi4_0_r_bits_last;

    wire [31:0] dma_axi_mm2s_araddr;
    wire [7:0] dma_axi_mm2s_arlen;
    wire [2:0] dma_axi_mm2s_arsize;
    wire [1:0] dma_axi_mm2s_arburst;
    wire [2:0] dma_axi_mm2s_arprot;
    wire [3:0] dma_axi_mm2s_arcache;
    wire dma_axi_mm2s_arvalid;
    wire dma_axi_mm2s_arready;
    wire [63:0] dma_axi_mm2s_rdata;
    wire [1:0] dma_axi_mm2s_rresp;
    wire dma_axi_mm2s_rlast;
    wire dma_axi_mm2s_rvalid;
    wire dma_axi_mm2s_rready;

    wire [31:0] dma_axi_s2mm_awaddr;
    wire [7:0] dma_axi_s2mm_awlen;
    wire [2:0] dma_axi_s2mm_awsize;
    wire [1:0] dma_axi_s2mm_awburst;
    wire [2:0] dma_axi_s2mm_awprot;
    wire [3:0] dma_axi_s2mm_awcache;
    wire dma_axi_s2mm_awvalid;
    wire dma_axi_s2mm_awready;
    wire [63:0] dma_axi_s2mm_wdata;
    wire [7:0] dma_axi_s2mm_wstrb;
    wire dma_axi_s2mm_wlast;
    wire dma_axi_s2mm_wvalid;
    wire dma_axi_s2mm_wready;
    wire [1:0] dma_axi_s2mm_bresp;
    wire dma_axi_s2mm_bvalid;
    wire dma_axi_s2mm_bready;

    ExampleRocketSystem rvcore(
        .clock(CLK),
        .reset(reset),
        .debug_clockeddmi_dmi_req_ready(),
        .debug_clockeddmi_dmi_req_valid(1'b0),
        .debug_clockeddmi_dmi_req_bits_addr(7'b0),
        .debug_clockeddmi_dmi_req_bits_data(32'b0),
        .debug_clockeddmi_dmi_req_bits_op(2'b0),
        .debug_clockeddmi_dmi_resp_ready(1'b0),
        .debug_clockeddmi_dmi_resp_valid(),
        .debug_clockeddmi_dmi_resp_bits_data(),
        .debug_clockeddmi_dmi_resp_bits_resp(),
        .debug_clockeddmi_dmiClock(1'b0),
        .debug_clockeddmi_dmiReset(1'b0),
        .debug_ndreset(),
        .debug_dmactive(),
        .interrupts(2'b0),
        .mem_axi4_0_aw_ready(mem_axi_awready),
        .mem_axi4_0_aw_valid(mem_axi_awvalid),
        .mem_axi4_0_aw_bits_id(mem_axi_awid),
        .mem_axi4_0_aw_bits_addr(mem_axi_awaddr),
        .mem_axi4_0_aw_bits_len(mem_axi_awlen),
        .mem_axi4_0_aw_bits_size(mem_axi_awsize),
        .mem_axi4_0_aw_bits_burst(mem_axi_awburst),
        .mem_axi4_0_aw_bits_lock(),
        .mem_axi4_0_aw_bits_cache(),
        .mem_axi4_0_aw_bits_prot(),
        .mem_axi4_0_aw_bits_qos(),
        .mem_axi4_0_w_ready(mem_axi_wready),
        .mem_axi4_0_w_valid(mem_axi_wvalid),
        .mem_axi4_0_w_bits_data(mem_axi_wdata),
        .mem_axi4_0_w_bits_strb(mem_axi_wstrb),
        .mem_axi4_0_w_bits_last(mem_axi_wlast),
        .mem_axi4_0_b_ready(mem_axi_bready),
        .mem_axi4_0_b_valid(mem_axi_bvalid),
        .mem_axi4_0_b_bits_id(mem_axi_bid),
        .mem_axi4_0_b_bits_resp(mem_axi_bresp),
        .mem_axi4_0_ar_ready(mem_axi_arready),
        .mem_axi4_0_ar_valid(mem_axi_arvalid),
        .mem_axi4_0_ar_bits_id(mem_axi_arid),
        .mem_axi4_0_ar_bits_addr(mem_axi_araddr),
        .mem_axi4_0_ar_bits_len(mem_axi_arlen),
        .mem_axi4_0_ar_bits_size(mem_axi_arsize),
        .mem_axi4_0_ar_bits_burst(mem_axi_arburst),
        .mem_axi4_0_ar_bits_lock(),
        .mem_axi4_0_ar_bits_cache(),
        .mem_axi4_0_ar_bits_prot(),
        .mem_axi4_0_ar_bits_qos(),
        .mem_axi4_0_r_ready(mem_axi_rready),
        .mem_axi4_0_r_valid(mem_axi_rvalid),
        .mem_axi4_0_r_bits_id(mem_axi_rid),
        .mem_axi4_0_r_bits_data(mem_axi_rdata),
        .mem_axi4_0_r_bits_resp(mem_axi_rresp),
        .mem_axi4_0_r_bits_last(mem_axi_rlast),
        .mmio_axi4_0_aw_ready(core_mmio_axi4_0_aw_ready),
        .mmio_axi4_0_aw_valid(core_mmio_axi4_0_aw_valid),
        .mmio_axi4_0_aw_bits_id(core_mmio_axi4_0_aw_bits_id),
        .mmio_axi4_0_aw_bits_addr(core_mmio_axi4_0_aw_bits_addr),
        .mmio_axi4_0_aw_bits_len(core_mmio_axi4_0_aw_bits_len),
        .mmio_axi4_0_aw_bits_size(core_mmio_axi4_0_aw_bits_size),
        .mmio_axi4_0_aw_bits_burst(core_mmio_axi4_0_aw_bits_burst),
        .mmio_axi4_0_aw_bits_lock(core_mmio_axi4_0_aw_bits_lock),
        .mmio_axi4_0_aw_bits_cache(core_mmio_axi4_0_aw_bits_cache),
        .mmio_axi4_0_aw_bits_prot(core_mmio_axi4_0_aw_bits_prot),
        .mmio_axi4_0_aw_bits_qos(core_mmio_axi4_0_aw_bits_qos),
        .mmio_axi4_0_w_ready(core_mmio_axi4_0_w_ready),
        .mmio_axi4_0_w_valid(core_mmio_axi4_0_w_valid),
        .mmio_axi4_0_w_bits_data(core_mmio_axi4_0_w_bits_data),
        .mmio_axi4_0_w_bits_strb(core_mmio_axi4_0_w_bits_strb),
        .mmio_axi4_0_w_bits_last(core_mmio_axi4_0_w_bits_last),
        .mmio_axi4_0_b_ready(core_mmio_axi4_0_b_ready),
        .mmio_axi4_0_b_valid(core_mmio_axi4_0_b_valid),
        .mmio_axi4_0_b_bits_id(core_mmio_axi4_0_b_bits_id),
        .mmio_axi4_0_b_bits_resp(core_mmio_axi4_0_b_bits_resp),
        .mmio_axi4_0_ar_ready(core_mmio_axi4_0_ar_ready),
        .mmio_axi4_0_ar_valid(core_mmio_axi4_0_ar_valid),
        .mmio_axi4_0_ar_bits_id(core_mmio_axi4_0_ar_bits_id),
        .mmio_axi4_0_ar_bits_addr(core_mmio_axi4_0_ar_bits_addr),
        .mmio_axi4_0_ar_bits_len(core_mmio_axi4_0_ar_bits_len),
        .mmio_axi4_0_ar_bits_size(core_mmio_axi4_0_ar_bits_size),
        .mmio_axi4_0_ar_bits_burst(core_mmio_axi4_0_ar_bits_burst),
        .mmio_axi4_0_ar_bits_lock(core_mmio_axi4_0_ar_bits_lock),
        .mmio_axi4_0_ar_bits_cache(core_mmio_axi4_0_ar_bits_cache),
        .mmio_axi4_0_ar_bits_prot(core_mmio_axi4_0_ar_bits_prot),
        .mmio_axi4_0_ar_bits_qos(core_mmio_axi4_0_ar_bits_qos),
        .mmio_axi4_0_r_ready(core_mmio_axi4_0_r_ready),
        .mmio_axi4_0_r_valid(core_mmio_axi4_0_r_valid),
        .mmio_axi4_0_r_bits_id(core_mmio_axi4_0_r_bits_id),
        .mmio_axi4_0_r_bits_data(core_mmio_axi4_0_r_bits_data),
        .mmio_axi4_0_r_bits_resp(core_mmio_axi4_0_r_bits_resp),
        .mmio_axi4_0_r_bits_last(core_mmio_axi4_0_r_bits_last),
        .l2_frontend_bus_axi4_0_aw_ready(dma_axi_s2mm_awready),
        .l2_frontend_bus_axi4_0_aw_valid(dma_axi_s2mm_awvalid),
        .l2_frontend_bus_axi4_0_aw_bits_id(8'b0),
        .l2_frontend_bus_axi4_0_aw_bits_addr(dma_axi_s2mm_awaddr),
        .l2_frontend_bus_axi4_0_aw_bits_len(dma_axi_s2mm_awlen),
        .l2_frontend_bus_axi4_0_aw_bits_size(dma_axi_s2mm_awsize),
        .l2_frontend_bus_axi4_0_aw_bits_burst(dma_axi_s2mm_awburst),
        .l2_frontend_bus_axi4_0_aw_bits_lock(1'b0),
        .l2_frontend_bus_axi4_0_aw_bits_cache(dma_axi_s2mm_awcache),
        .l2_frontend_bus_axi4_0_aw_bits_prot(dma_axi_s2mm_awprot),
        .l2_frontend_bus_axi4_0_aw_bits_qos(4'b0),
        .l2_frontend_bus_axi4_0_w_ready(dma_axi_s2mm_wready),
        .l2_frontend_bus_axi4_0_w_valid(dma_axi_s2mm_wvalid),
        .l2_frontend_bus_axi4_0_w_bits_data(dma_axi_s2mm_wdata),
        .l2_frontend_bus_axi4_0_w_bits_strb(dma_axi_s2mm_wstrb),
        .l2_frontend_bus_axi4_0_w_bits_last(dma_axi_s2mm_wlast),
        .l2_frontend_bus_axi4_0_b_ready(dma_axi_s2mm_bready),
        .l2_frontend_bus_axi4_0_b_valid(dma_axi_s2mm_bvalid),
        .l2_frontend_bus_axi4_0_b_bits_id(),
        .l2_frontend_bus_axi4_0_b_bits_resp(dma_axi_s2mm_bresp),
        .l2_frontend_bus_axi4_0_ar_ready(dma_axi_mm2s_arready),
        .l2_frontend_bus_axi4_0_ar_valid(dma_axi_mm2s_arvalid),
        .l2_frontend_bus_axi4_0_ar_bits_id(8'b0),
        .l2_frontend_bus_axi4_0_ar_bits_addr(dma_axi_mm2s_araddr),
        .l2_frontend_bus_axi4_0_ar_bits_len(dma_axi_mm2s_arlen),
        .l2_frontend_bus_axi4_0_ar_bits_size(dma_axi_mm2s_arsize),
        .l2_frontend_bus_axi4_0_ar_bits_burst(dma_axi_mm2s_arburst),
        .l2_frontend_bus_axi4_0_ar_bits_lock(1'b0),
        .l2_frontend_bus_axi4_0_ar_bits_cache(dma_axi_mm2s_arcache),
        .l2_frontend_bus_axi4_0_ar_bits_prot(dma_axi_mm2s_arprot),
        .l2_frontend_bus_axi4_0_ar_bits_qos(4'b0),
        .l2_frontend_bus_axi4_0_r_ready(dma_axi_mm2s_rready),
        .l2_frontend_bus_axi4_0_r_valid(dma_axi_mm2s_rvalid),
        .l2_frontend_bus_axi4_0_r_bits_id(),
        .l2_frontend_bus_axi4_0_r_bits_data(dma_axi_mm2s_rdata),
        .l2_frontend_bus_axi4_0_r_bits_resp(dma_axi_mm2s_rresp),
        .l2_frontend_bus_axi4_0_r_bits_last(dma_axi_mm2s_rlast)
    );

    axi_blk_mem_gen_0 axi_blk_mem_gen_mem(
        .rsta_busy(),
        .rstb_busy(),
        .s_aclk(CLK),
        .s_aresetn(~reset),
        .s_axi_awid(mem_axi_awid),
        .s_axi_awaddr(mem_axi_awaddr),
        .s_axi_awlen(mem_axi_awlen),
        .s_axi_awsize(mem_axi_awsize),
        .s_axi_awburst(mem_axi_awburst),
        .s_axi_awvalid(mem_axi_awvalid),
        .s_axi_awready(mem_axi_awready),
        .s_axi_wdata(mem_axi_wdata),
        .s_axi_wstrb(mem_axi_wstrb),
        .s_axi_wlast(mem_axi_wlast),
        .s_axi_wvalid(mem_axi_wvalid),
        .s_axi_wready(mem_axi_wready),
        .s_axi_bid(mem_axi_bid),
        .s_axi_bresp(mem_axi_bresp),
        .s_axi_bvalid(mem_axi_bvalid),
        .s_axi_bready(mem_axi_bready),
        .s_axi_arid(mem_axi_arid),
        .s_axi_araddr(mem_axi_araddr),
        .s_axi_arlen(mem_axi_arlen),
        .s_axi_arsize(mem_axi_arsize),
        .s_axi_arburst(mem_axi_arburst),
        .s_axi_arvalid(mem_axi_arvalid),
        .s_axi_arready(mem_axi_arready),
        .s_axi_rid(mem_axi_rid),
        .s_axi_rdata(mem_axi_rdata),
        .s_axi_rresp(mem_axi_rresp),
        .s_axi_rlast(mem_axi_rlast),
        .s_axi_rvalid(mem_axi_rvalid),
        .s_axi_rready(mem_axi_rready)
    );

    wire dma_axi_lite32_awvalid;
    wire dma_axi_lite32_awready;
    wire [9:0] dma_axi_lite32_awaddr;
    wire dma_axi_lite32_wvalid;
    wire dma_axi_lite32_wready;
    wire [31:0] dma_axi_lite32_wdata;
    wire [1:0] dma_axi_lite32_bresp;
    wire dma_axi_lite32_bvalid;
    wire dma_axi_lite32_bready;
    wire dma_axi_lite32_arvalid;
    wire dma_axi_lite32_arready;
    wire [9:0] dma_axi_lite32_araddr;
    wire dma_axi_lite32_rvalid;
    wire dma_axi_lite32_rready;
    wire [31:0] dma_axi_lite32_rdata;
    wire [1:0] dma_axi_lite32_rresp;

    wire dma_axi_lite_awvalid;
    wire dma_axi_lite_awready;
    wire [31:0] dma_axi_lite_awaddr;
    wire [2:0] dma_axi_lite_awprot;
    wire dma_axi_lite_wvalid;
    wire dma_axi_lite_wready;
    wire [63:0] dma_axi_lite_wdata;
    wire [7:0] dma_axi_lite_wstrb;
    wire [1:0] dma_axi_lite_bresp;
    wire dma_axi_lite_bvalid;
    wire dma_axi_lite_bready;
    wire dma_axi_lite_arvalid;
    wire dma_axi_lite_arready;
    wire [31:0] dma_axi_lite_araddr;
    wire [2:0] dma_axi_lite_arprot;
    wire dma_axi_lite_rvalid;
    wire dma_axi_lite_rready;
    wire [63:0] dma_axi_lite_rdata;
    wire [1:0] dma_axi_lite_rresp;

    wire [3:0] dma_axi_awid;
    wire [31:0] dma_axi_awaddr;
    wire [7:0] dma_axi_awlen;
    wire [2:0] dma_axi_awsize;
    wire [1:0] dma_axi_awburst;
    wire dma_axi_awlock;
    wire [3:0] dma_axi_awcache;
    wire [2:0] dma_axi_awprot;
    wire [3:0] dma_axi_awregion;
    wire [3:0] dma_axi_awqos;
    wire dma_axi_awvalid;
    wire dma_axi_awready;
    wire [63:0] dma_axi_wdata;
    wire [7:0] dma_axi_wstrb;
    wire dma_axi_wlast;
    wire dma_axi_wvalid;
    wire dma_axi_wready;
    wire [3:0] dma_axi_bid;
    wire [1:0] dma_axi_bresp;
    wire dma_axi_bvalid;
    wire dma_axi_bready;
    wire [3:0] dma_axi_arid;
    wire [31:0] dma_axi_araddr;
    wire [7:0] dma_axi_arlen;
    wire [2:0] dma_axi_arsize;
    wire [1:0] dma_axi_arburst;
    wire dma_axi_arlock;
    wire [3:0] dma_axi_arcache;
    wire [2:0] dma_axi_arprot;
    wire [3:0] dma_axi_arregion;
    wire [3:0] dma_axi_arqos;
    wire dma_axi_arvalid;
    wire dma_axi_arready;
    wire [3:0] dma_axi_rid;
    wire [63:0] dma_axi_rdata;
    wire [1:0] dma_axi_rresp;
    wire dma_axi_rlast;
    wire dma_axi_rvalid;
    wire dma_axi_rready;

    wire dma_mm2s_prmry_reset_out_n;
    wire dma_s2mm_prmry_reset_out_n;

    wire dma_mm2s_introut;
    wire dma_s2mm_introut;
    wire [31:0] axi_dma_tstvec;

    axi_dma_0 axi_dma_0_inst(
        .s_axi_lite_aclk(CLK),
        .m_axi_mm2s_aclk(CLK),
        .m_axi_s2mm_aclk(CLK),
        .axi_resetn(~reset),
        .s_axi_lite_awvalid(dma_axi_lite32_awvalid),
        .s_axi_lite_awready(dma_axi_lite32_awready),
        .s_axi_lite_awaddr(dma_axi_lite32_awaddr),
        .s_axi_lite_wvalid(dma_axi_lite32_wvalid),
        .s_axi_lite_wready(dma_axi_lite32_wready),
        .s_axi_lite_wdata(dma_axi_lite32_wdata),
        .s_axi_lite_bresp(dma_axi_lite32_bresp),
        .s_axi_lite_bvalid(dma_axi_lite32_bvalid),
        .s_axi_lite_bready(dma_axi_lite32_bready),
        .s_axi_lite_arvalid(dma_axi_lite32_arvalid),
        .s_axi_lite_arready(dma_axi_lite32_arready),
        .s_axi_lite_araddr(dma_axi_lite32_araddr),
        .s_axi_lite_rvalid(dma_axi_lite32_rvalid),
        .s_axi_lite_rready(dma_axi_lite32_rready),
        .s_axi_lite_rdata(dma_axi_lite32_rdata),
        .s_axi_lite_rresp(dma_axi_lite32_rresp),
        .m_axi_mm2s_araddr(dma_axi_mm2s_araddr),
        .m_axi_mm2s_arlen(dma_axi_mm2s_arlen),
        .m_axi_mm2s_arsize(dma_axi_mm2s_arsize),
        .m_axi_mm2s_arburst(dma_axi_mm2s_arburst),
        .m_axi_mm2s_arprot(dma_axi_mm2s_arprot),
        .m_axi_mm2s_arcache(dma_axi_mm2s_arcache),
        .m_axi_mm2s_arvalid(dma_axi_mm2s_arvalid),
        .m_axi_mm2s_arready(dma_axi_mm2s_arready),
        .m_axi_mm2s_rdata(dma_axi_mm2s_rdata),
        .m_axi_mm2s_rresp(dma_axi_mm2s_rresp),
        .m_axi_mm2s_rlast(dma_axi_mm2s_rlast),
        .m_axi_mm2s_rvalid(dma_axi_mm2s_rvalid),
        .m_axi_mm2s_rready(dma_axi_mm2s_rready),
        .mm2s_prmry_reset_out_n(dma_mm2s_prmry_reset_out_n),
        .m_axis_mm2s_tdata(eth_tx_data),
        .m_axis_mm2s_tkeep(eth_tx_keep),
        .m_axis_mm2s_tvalid(eth_tx_valid),
        .m_axis_mm2s_tready(eth_tx_ready),
        .m_axis_mm2s_tlast(eth_tx_last),
        .m_axi_s2mm_awaddr(dma_axi_s2mm_awaddr),
        .m_axi_s2mm_awlen(dma_axi_s2mm_awlen),
        .m_axi_s2mm_awsize(dma_axi_s2mm_awsize),
        .m_axi_s2mm_awburst(dma_axi_s2mm_awburst),
        .m_axi_s2mm_awprot(dma_axi_s2mm_awprot),
        .m_axi_s2mm_awcache(dma_axi_s2mm_awcache),
        .m_axi_s2mm_awvalid(dma_axi_s2mm_awvalid),
        .m_axi_s2mm_awready(dma_axi_s2mm_awready),
        .m_axi_s2mm_wdata(dma_axi_s2mm_wdata),
        .m_axi_s2mm_wstrb(dma_axi_s2mm_wstrb),
        .m_axi_s2mm_wlast(dma_axi_s2mm_wlast),
        .m_axi_s2mm_wvalid(dma_axi_s2mm_wvalid),
        .m_axi_s2mm_wready(dma_axi_s2mm_wready),
        .m_axi_s2mm_bresp(dma_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid(dma_axi_s2mm_bvalid),
        .m_axi_s2mm_bready(dma_axi_s2mm_bready),
        .s2mm_prmry_reset_out_n(dma_s2mm_prmry_reset_out_n),
        .s_axis_s2mm_tdata(eth_rx_data),
        .s_axis_s2mm_tkeep(eth_rx_keep),
        .s_axis_s2mm_tvalid(eth_rx_valid),
        .s_axis_s2mm_tready(eth_rx_ready),
        .s_axis_s2mm_tlast(eth_rx_last),
        .mm2s_introut(dma_mm2s_introut),
        .s2mm_introut(dma_s2mm_introut),
        .axi_dma_tstvec(axi_dma_tstvec)
    );

    axi_lite_dwidth_converter_0 axi_lite_dwidth_converter_dma(
        .s_axi_aclk(CLK),        // input wire s_axi_aclk
        .s_axi_aresetn(~reset),  // input wire s_axi_aresetn
        .s_axi_awaddr(dma_axi_lite_awaddr),    // input wire [31 : 0] s_axi_awaddr
        .s_axi_awprot(dma_axi_lite_awprot),    // input wire [2 : 0] s_axi_awprot
        .s_axi_awvalid(dma_axi_lite_awvalid),  // input wire s_axi_awvalid
        .s_axi_awready(dma_axi_lite_awready),  // output wire s_axi_awready
        .s_axi_wdata(dma_axi_lite_wdata),      // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(dma_axi_lite_wstrb),      // input wire [7 : 0] s_axi_wstrb
        .s_axi_wvalid(dma_axi_lite_wvalid),    // input wire s_axi_wvalid
        .s_axi_wready(dma_axi_lite_wready),    // output wire s_axi_wready
        .s_axi_bresp(dma_axi_lite_bresp),      // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(dma_axi_lite_bvalid),    // output wire s_axi_bvalid
        .s_axi_bready(dma_axi_lite_bready),    // input wire s_axi_bready
        .s_axi_araddr(dma_axi_lite_araddr),    // input wire [31 : 0] s_axi_araddr
        .s_axi_arprot(dma_axi_lite_arprot),    // input wire [2 : 0] s_axi_arprot
        .s_axi_arvalid(dma_axi_lite_arvalid),  // input wire s_axi_arvalid
        .s_axi_arready(dma_axi_lite_arready),  // output wire s_axi_arready
        .s_axi_rdata(dma_axi_lite_rdata),      // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(dma_axi_lite_rresp),      // output wire [1 : 0] s_axi_rresp
        .s_axi_rvalid(dma_axi_lite_rvalid),    // output wire s_axi_rvalid
        .s_axi_rready(dma_axi_lite_rready),    // input wire s_axi_rready
        .m_axi_awaddr(dma_axi_lite32_awaddr),    // output wire [31 : 0] m_axi_awaddr
        .m_axi_awprot(),    // output wire [2 : 0] m_axi_awprot
        .m_axi_awvalid(dma_axi_lite32_awvalid),  // output wire m_axi_awvalid
        .m_axi_awready(dma_axi_lite32_awready),  // input wire m_axi_awready
        .m_axi_wdata(dma_axi_lite32_wdata),      // output wire [31 : 0] m_axi_wdata
        .m_axi_wstrb(),      // output wire [3 : 0] m_axi_wstrb
        .m_axi_wvalid(dma_axi_lite32_wvalid),    // output wire m_axi_wvalid
        .m_axi_wready(dma_axi_lite32_wready),    // input wire m_axi_wready
        .m_axi_bresp(dma_axi_lite32_bresp),      // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(dma_axi_lite32_bvalid),    // input wire m_axi_bvalid
        .m_axi_bready(dma_axi_lite32_bready),    // output wire m_axi_bready
        .m_axi_araddr(dma_axi_lite32_araddr),    // output wire [31 : 0] m_axi_araddr
        .m_axi_arprot(),    // output wire [2 : 0] m_axi_arprot
        .m_axi_arvalid(dma_axi_lite32_arvalid),  // output wire m_axi_arvalid
        .m_axi_arready(dma_axi_lite32_arready),  // input wire m_axi_arready
        .m_axi_rdata(dma_axi_lite32_rdata),      // input wire [31 : 0] m_axi_rdata
        .m_axi_rresp(dma_axi_lite32_rresp),      // input wire [1 : 0] m_axi_rresp
        .m_axi_rvalid(dma_axi_lite32_rvalid),    // input wire m_axi_rvalid
        .m_axi_rready(dma_axi_lite32_rready)    // output wire m_axi_rready
    );

    axi_protocol_converter_0 axi_protocol_converter_dma(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn
        .s_axi_awid(dma_axi_awid),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(dma_axi_awaddr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(dma_axi_awlen),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(dma_axi_awsize),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(dma_axi_awburst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(dma_axi_awlock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(dma_axi_awcache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(dma_axi_awprot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awregion(dma_axi_awregion),  // input wire [3 : 0] s_axi_awregion
        .s_axi_awqos(dma_axi_awqos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(dma_axi_awvalid),    // input wire s_axi_awvalid
        .s_axi_awready(dma_axi_awready),    // output wire s_axi_awready
        .s_axi_wdata(dma_axi_wdata),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(dma_axi_wstrb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(dma_axi_wlast),        // input wire s_axi_wlast
        .s_axi_wvalid(dma_axi_wvalid),      // input wire s_axi_wvalid
        .s_axi_wready(dma_axi_wready),      // output wire s_axi_wready
        .s_axi_bid(dma_axi_bid),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(dma_axi_bresp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(dma_axi_bvalid),      // output wire s_axi_bvalid
        .s_axi_bready(dma_axi_bready),      // input wire s_axi_bready
        .s_axi_arid(dma_axi_arid),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(dma_axi_araddr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(dma_axi_arlen),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(dma_axi_arsize),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(dma_axi_arburst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(dma_axi_arlock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(dma_axi_arcache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(dma_axi_arprot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arregion(dma_axi_arregion),  // input wire [3 : 0] s_axi_arregion
        .s_axi_arqos(dma_axi_arqos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(dma_axi_arvalid),    // input wire s_axi_arvalid
        .s_axi_arready(dma_axi_arready),    // output wire s_axi_arready
        .s_axi_rid(dma_axi_rid),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(dma_axi_rdata),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(dma_axi_rresp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(dma_axi_rlast),        // output wire s_axi_rlast
        .s_axi_rvalid(dma_axi_rvalid),      // output wire s_axi_rvalid
        .s_axi_rready(dma_axi_rready),      // input wire s_axi_rready
        .m_axi_awaddr(dma_axi_lite_awaddr),      // output wire [31 : 0] m_axi_awaddr
        .m_axi_awprot(dma_axi_lite_awprot),      // output wire [2 : 0] m_axi_awprot
        .m_axi_awvalid(dma_axi_lite_awvalid),    // output wire m_axi_awvalid
        .m_axi_awready(dma_axi_lite_awready),    // input wire m_axi_awready
        .m_axi_wdata(dma_axi_lite_wdata),        // output wire [63 : 0] m_axi_wdata
        .m_axi_wstrb(dma_axi_lite_wstrb),        // output wire [7 : 0] m_axi_wstrb
        .m_axi_wvalid(dma_axi_lite_wvalid),      // output wire m_axi_wvalid
        .m_axi_wready(dma_axi_lite_wready),      // input wire m_axi_wready
        .m_axi_bresp(dma_axi_lite_bresp),        // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(dma_axi_lite_bvalid),      // input wire m_axi_bvalid
        .m_axi_bready(dma_axi_lite_bready),      // output wire m_axi_bready
        .m_axi_araddr(dma_axi_lite_araddr),      // output wire [31 : 0] m_axi_araddr
        .m_axi_arprot(dma_axi_lite_arprot),      // output wire [2 : 0] m_axi_arprot
        .m_axi_arvalid(dma_axi_lite_arvalid),    // output wire m_axi_arvalid
        .m_axi_arready(dma_axi_lite_arready),    // input wire m_axi_arready
        .m_axi_rdata(dma_axi_lite_rdata),        // input wire [63 : 0] m_axi_rdata
        .m_axi_rresp(dma_axi_lite_rresp),        // input wire [1 : 0] m_axi_rresp
        .m_axi_rvalid(dma_axi_lite_rvalid),      // input wire m_axi_rvalid
        .m_axi_rready(dma_axi_lite_rready)      // output wire m_axi_rready
    );

    wire [3:0] eth_axi_awid;
    wire [31:0] eth_axi_awaddr;
    wire [7:0] eth_axi_awlen;
    wire [2:0] eth_axi_awsize;
    wire [1:0] eth_axi_awburst;
    wire eth_axi_awlock;
    wire [3:0] eth_axi_awcache;
    wire [2:0] eth_axi_awprot;
    wire [3:0] eth_axi_awregion;
    wire [3:0] eth_axi_awqos;
    wire eth_axi_awvalid;
    wire eth_axi_awready;
    wire [63:0] eth_axi_wdata;
    wire [7:0] eth_axi_wstrb;
    wire eth_axi_wlast;
    wire eth_axi_wvalid;
    wire eth_axi_wready;
    wire [3:0] eth_axi_bid;
    wire [1:0] eth_axi_bresp;
    wire eth_axi_bvalid;
    wire eth_axi_bready;
    wire [3:0] eth_axi_arid;
    wire [31:0] eth_axi_araddr;
    wire [7:0] eth_axi_arlen;
    wire [2:0] eth_axi_arsize;
    wire [1:0] eth_axi_arburst;
    wire eth_axi_arlock;
    wire [3:0] eth_axi_arcache;
    wire [2:0] eth_axi_arprot;
    wire [3:0] eth_axi_arregion;
    wire [3:0] eth_axi_arqos;
    wire eth_axi_arvalid;
    wire eth_axi_arready;
    wire [3:0] eth_axi_rid;
    wire [63:0] eth_axi_rdata;
    wire [1:0] eth_axi_rresp;
    wire eth_axi_rlast;
    wire eth_axi_rvalid;
    wire eth_axi_rready;

    axi_protocol_converter_0 axi_protocol_converter_eth(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn
        .s_axi_awid(eth_axi_awid),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(eth_axi_awaddr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(eth_axi_awlen),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(eth_axi_awsize),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(eth_axi_awburst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(eth_axi_awlock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(eth_axi_awcache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(eth_axi_awprot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awregion(eth_axi_awregion),  // input wire [3 : 0] s_axi_awregion
        .s_axi_awqos(eth_axi_awqos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(eth_axi_awvalid),    // input wire s_axi_awvalid
        .s_axi_awready(eth_axi_awready),    // output wire s_axi_awready
        .s_axi_wdata(eth_axi_wdata),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(eth_axi_wstrb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(eth_axi_wlast),        // input wire s_axi_wlast
        .s_axi_wvalid(eth_axi_wvalid),      // input wire s_axi_wvalid
        .s_axi_wready(eth_axi_wready),      // output wire s_axi_wready
        .s_axi_bid(eth_axi_bid),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(eth_axi_bresp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(eth_axi_bvalid),      // output wire s_axi_bvalid
        .s_axi_bready(eth_axi_bready),      // input wire s_axi_bready
        .s_axi_arid(eth_axi_arid),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(eth_axi_araddr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(eth_axi_arlen),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(eth_axi_arsize),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(eth_axi_arburst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(eth_axi_arlock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(eth_axi_arcache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(eth_axi_arprot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arregion(eth_axi_arregion),  // input wire [3 : 0] s_axi_arregion
        .s_axi_arqos(eth_axi_arqos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(eth_axi_arvalid),    // input wire s_axi_arvalid
        .s_axi_arready(eth_axi_arready),    // output wire s_axi_arready
        .s_axi_rid(eth_axi_rid),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(eth_axi_rdata),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(eth_axi_rresp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(eth_axi_rlast),        // output wire s_axi_rlast
        .s_axi_rvalid(eth_axi_rvalid),      // output wire s_axi_rvalid
        .s_axi_rready(eth_axi_rready),      // input wire s_axi_rready
        .m_axi_awaddr(eth_axi_lite_awaddr),      // output wire [31 : 0] m_axi_awaddr
        .m_axi_awprot(eth_axi_lite_awprot),      // output wire [2 : 0] m_axi_awprot
        .m_axi_awvalid(eth_axi_lite_awvalid),    // output wire m_axi_awvalid
        .m_axi_awready(eth_axi_lite_awready),    // input wire m_axi_awready
        .m_axi_wdata(eth_axi_lite_wdata),        // output wire [63 : 0] m_axi_wdata
        .m_axi_wstrb(eth_axi_lite_wstrb),        // output wire [7 : 0] m_axi_wstrb
        .m_axi_wvalid(eth_axi_lite_wvalid),      // output wire m_axi_wvalid
        .m_axi_wready(eth_axi_lite_wready),      // input wire m_axi_wready
        .m_axi_bresp(eth_axi_lite_bresp),        // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(eth_axi_lite_bvalid),      // input wire m_axi_bvalid
        .m_axi_bready(eth_axi_lite_bready),      // output wire m_axi_bready
        .m_axi_araddr(eth_axi_lite_araddr),      // output wire [31 : 0] m_axi_araddr
        .m_axi_arprot(eth_axi_lite_arprot),      // output wire [2 : 0] m_axi_arprot
        .m_axi_arvalid(eth_axi_lite_arvalid),    // output wire m_axi_arvalid
        .m_axi_arready(eth_axi_lite_arready),    // input wire m_axi_arready
        .m_axi_rdata(eth_axi_lite_rdata),        // input wire [63 : 0] m_axi_rdata
        .m_axi_rresp(eth_axi_lite_rresp),        // input wire [1 : 0] m_axi_rresp
        .m_axi_rvalid(eth_axi_lite_rvalid),      // input wire m_axi_rvalid
        .m_axi_rready(eth_axi_lite_rready)      // output wire m_axi_rready
    );

    wire uart_axi_lite32_awvalid;
    wire uart_axi_lite32_awready;
    wire [31:0] uart_axi_lite32_awaddr;
    wire [2:0] uart_axi_lite32_awprot;
    wire uart_axi_lite32_wvalid;
    wire uart_axi_lite32_wready;
    wire [31:0] uart_axi_lite32_wdata;
    wire [3:0] uart_axi_lite32_wstrb;
    wire [1:0] uart_axi_lite32_bresp;
    wire uart_axi_lite32_bvalid;
    wire uart_axi_lite32_bready;
    wire uart_axi_lite32_arvalid;
    wire uart_axi_lite32_arready;
    wire [31:0] uart_axi_lite32_araddr;
    wire [2:0] uart_axi_lite32_arprot;
    wire uart_axi_lite32_rvalid;
    wire uart_axi_lite32_rready;
    wire [31:0] uart_axi_lite32_rdata;
    wire [1:0] uart_axi_lite32_rresp;

    wire uart_axi_lite_awvalid;
    wire uart_axi_lite_awready;
    wire [31:0] uart_axi_lite_awaddr;
    wire [2:0] uart_axi_lite_awprot;
    wire uart_axi_lite_wvalid;
    wire uart_axi_lite_wready;
    wire [63:0] uart_axi_lite_wdata;
    wire [7:0] uart_axi_lite_wstrb;
    wire [1:0] uart_axi_lite_bresp;
    wire uart_axi_lite_bvalid;
    wire uart_axi_lite_bready;
    wire uart_axi_lite_arvalid;
    wire uart_axi_lite_arready;
    wire [31:0] uart_axi_lite_araddr;
    wire [2:0] uart_axi_lite_arprot;
    wire uart_axi_lite_rvalid;
    wire uart_axi_lite_rready;
    wire [63:0] uart_axi_lite_rdata;
    wire [1:0] uart_axi_lite_rresp;

    wire [3:0] uart_axi_awid;
    wire [31:0] uart_axi_awaddr;
    wire [7:0] uart_axi_awlen;
    wire [2:0] uart_axi_awsize;
    wire [1:0] uart_axi_awburst;
    wire uart_axi_awlock;
    wire [3:0] uart_axi_awcache;
    wire [2:0] uart_axi_awprot;
    wire [3:0] uart_axi_awregion;
    wire [3:0] uart_axi_awqos;
    wire uart_axi_awvalid;
    wire uart_axi_awready;
    wire [63:0] uart_axi_wdata;
    wire [7:0] uart_axi_wstrb;
    wire uart_axi_wlast;
    wire uart_axi_wvalid;
    wire uart_axi_wready;
    wire [3:0] uart_axi_bid;
    wire [1:0] uart_axi_bresp;
    wire uart_axi_bvalid;
    wire uart_axi_bready;
    wire [3:0] uart_axi_arid;
    wire [31:0] uart_axi_araddr;
    wire [7:0] uart_axi_arlen;
    wire [2:0] uart_axi_arsize;
    wire [1:0] uart_axi_arburst;
    wire uart_axi_arlock;
    wire [3:0] uart_axi_arcache;
    wire [2:0] uart_axi_arprot;
    wire [3:0] uart_axi_arregion;
    wire [3:0] uart_axi_arqos;
    wire uart_axi_arvalid;
    wire uart_axi_arready;
    wire [3:0] uart_axi_rid;
    wire [63:0] uart_axi_rdata;
    wire [1:0] uart_axi_rresp;
    wire uart_axi_rlast;
    wire uart_axi_rvalid;
    wire uart_axi_rready;

    axi_uartlite_0 axi_uartlite_0_inst(
        .s_axi_aclk(CLK),        // input wire s_axi_aclk
        .s_axi_aresetn(~reset),  // input wire s_axi_aresetn
        .interrupt(),          // output wire interrupt
        .s_axi_awaddr(uart_axi_lite32_awaddr),    // input wire [3 : 0] s_axi_awaddr
        .s_axi_awvalid(uart_axi_lite32_awvalid),  // input wire s_axi_awvalid
        .s_axi_awready(uart_axi_lite32_awready),  // output wire s_axi_awready
        .s_axi_wdata(uart_axi_lite32_wdata),      // input wire [31 : 0] s_axi_wdata
        .s_axi_wstrb(uart_axi_lite32_wstrb),      // input wire [3 : 0] s_axi_wstrb
        .s_axi_wvalid(uart_axi_lite32_wvalid),    // input wire s_axi_wvalid
        .s_axi_wready(uart_axi_lite32_wready),    // output wire s_axi_wready
        .s_axi_bresp(uart_axi_lite32_bresp),      // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(uart_axi_lite32_bvalid),    // output wire s_axi_bvalid
        .s_axi_bready(uart_axi_lite32_bready),    // input wire s_axi_bready
        .s_axi_araddr(uart_axi_lite32_araddr),    // input wire [3 : 0] s_axi_araddr
        .s_axi_arvalid(uart_axi_lite32_arvalid),  // input wire s_axi_arvalid
        .s_axi_arready(uart_axi_lite32_arready),  // output wire s_axi_arready
        .s_axi_rdata(uart_axi_lite32_rdata),      // output wire [31 : 0] s_axi_rdata
        .s_axi_rresp(uart_axi_lite32_rresp),      // output wire [1 : 0] s_axi_rresp
        .s_axi_rvalid(uart_axi_lite32_rvalid),    // output wire s_axi_rvalid
        .s_axi_rready(uart_axi_lite32_rready),    // input wire s_axi_rready
        .rx(UART_RX),                        // input wire rx
        .tx(UART_TX)                        // output wire tx
    );

    axi_lite_dwidth_converter_0 axi_lite_dwidth_converter_uart(
        .s_axi_aclk(CLK),        // input wire s_axi_aclk
        .s_axi_aresetn(~reset),  // input wire s_axi_aresetn
        .s_axi_awaddr(uart_axi_lite_awaddr),    // input wire [31 : 0] s_axi_awaddr
        .s_axi_awprot(uart_axi_lite_awprot),    // input wire [2 : 0] s_axi_awprot
        .s_axi_awvalid(uart_axi_lite_awvalid),  // input wire s_axi_awvalid
        .s_axi_awready(uart_axi_lite_awready),  // output wire s_axi_awready
        .s_axi_wdata(uart_axi_lite_wdata),      // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(uart_axi_lite_wstrb),      // input wire [7 : 0] s_axi_wstrb
        .s_axi_wvalid(uart_axi_lite_wvalid),    // input wire s_axi_wvalid
        .s_axi_wready(uart_axi_lite_wready),    // output wire s_axi_wready
        .s_axi_bresp(uart_axi_lite_bresp),      // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(uart_axi_lite_bvalid),    // output wire s_axi_bvalid
        .s_axi_bready(uart_axi_lite_bready),    // input wire s_axi_bready
        .s_axi_araddr(uart_axi_lite_araddr),    // input wire [31 : 0] s_axi_araddr
        .s_axi_arprot(uart_axi_lite_arprot),    // input wire [2 : 0] s_axi_arprot
        .s_axi_arvalid(uart_axi_lite_arvalid),  // input wire s_axi_arvalid
        .s_axi_arready(uart_axi_lite_arready),  // output wire s_axi_arready
        .s_axi_rdata(uart_axi_lite_rdata),      // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(uart_axi_lite_rresp),      // output wire [1 : 0] s_axi_rresp
        .s_axi_rvalid(uart_axi_lite_rvalid),    // output wire s_axi_rvalid
        .s_axi_rready(uart_axi_lite_rready),    // input wire s_axi_rready
        .m_axi_awaddr(uart_axi_lite32_awaddr),    // output wire [31 : 0] m_axi_awaddr
        .m_axi_awprot(uart_axi_lite32_awprot),    // output wire [2 : 0] m_axi_awprot
        .m_axi_awvalid(uart_axi_lite32_awvalid),  // output wire m_axi_awvalid
        .m_axi_awready(uart_axi_lite32_awready),  // input wire m_axi_awready
        .m_axi_wdata(uart_axi_lite32_wdata),      // output wire [31 : 0] m_axi_wdata
        .m_axi_wstrb(uart_axi_lite32_wstrb),      // output wire [3 : 0] m_axi_wstrb
        .m_axi_wvalid(uart_axi_lite32_wvalid),    // output wire m_axi_wvalid
        .m_axi_wready(uart_axi_lite32_wready),    // input wire m_axi_wready
        .m_axi_bresp(uart_axi_lite32_bresp),      // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(uart_axi_lite32_bvalid),    // input wire m_axi_bvalid
        .m_axi_bready(uart_axi_lite32_bready),    // output wire m_axi_bready
        .m_axi_araddr(uart_axi_lite32_araddr),    // output wire [31 : 0] m_axi_araddr
        .m_axi_arprot(uart_axi_lite32_arprot),    // output wire [2 : 0] m_axi_arprot
        .m_axi_arvalid(uart_axi_lite32_arvalid),  // output wire m_axi_arvalid
        .m_axi_arready(uart_axi_lite32_arready),  // input wire m_axi_arready
        .m_axi_rdata(uart_axi_lite32_rdata),      // input wire [31 : 0] m_axi_rdata
        .m_axi_rresp(uart_axi_lite32_rresp),      // input wire [1 : 0] m_axi_rresp
        .m_axi_rvalid(uart_axi_lite32_rvalid),    // input wire m_axi_rvalid
        .m_axi_rready(uart_axi_lite32_rready)    // output wire m_axi_rready
    );

    axi_protocol_converter_0 axi_protocol_converter_uart(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn
        .s_axi_awid(uart_axi_awid),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(uart_axi_awaddr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(uart_axi_awlen),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(uart_axi_awsize),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(uart_axi_awburst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(uart_axi_awlock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(uart_axi_awcache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(uart_axi_awprot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awregion(uart_axi_awregion),  // input wire [3 : 0] s_axi_awregion
        .s_axi_awqos(uart_axi_awqos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(uart_axi_awvalid),    // input wire s_axi_awvalid
        .s_axi_awready(uart_axi_awready),    // output wire s_axi_awready
        .s_axi_wdata(uart_axi_wdata),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(uart_axi_wstrb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(uart_axi_wlast),        // input wire s_axi_wlast
        .s_axi_wvalid(uart_axi_wvalid),      // input wire s_axi_wvalid
        .s_axi_wready(uart_axi_wready),      // output wire s_axi_wready
        .s_axi_bid(uart_axi_bid),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(uart_axi_bresp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(uart_axi_bvalid),      // output wire s_axi_bvalid
        .s_axi_bready(uart_axi_bready),      // input wire s_axi_bready
        .s_axi_arid(uart_axi_arid),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(uart_axi_araddr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(uart_axi_arlen),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(uart_axi_arsize),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(uart_axi_arburst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(uart_axi_arlock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(uart_axi_arcache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(uart_axi_arprot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arregion(uart_axi_arregion),  // input wire [3 : 0] s_axi_arregion
        .s_axi_arqos(uart_axi_arqos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(uart_axi_arvalid),    // input wire s_axi_arvalid
        .s_axi_arready(uart_axi_arready),    // output wire s_axi_arready
        .s_axi_rid(uart_axi_rid),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(uart_axi_rdata),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(uart_axi_rresp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(uart_axi_rlast),        // output wire s_axi_rlast
        .s_axi_rvalid(uart_axi_rvalid),      // output wire s_axi_rvalid
        .s_axi_rready(uart_axi_rready),      // input wire s_axi_rready
        .m_axi_awaddr(uart_axi_lite_awaddr),      // output wire [31 : 0] m_axi_awaddr
        .m_axi_awprot(uart_axi_lite_awprot),      // output wire [2 : 0] m_axi_awprot
        .m_axi_awvalid(uart_axi_lite_awvalid),    // output wire m_axi_awvalid
        .m_axi_awready(uart_axi_lite_awready),    // input wire m_axi_awready
        .m_axi_wdata(uart_axi_lite_wdata),        // output wire [63 : 0] m_axi_wdata
        .m_axi_wstrb(uart_axi_lite_wstrb),        // output wire [7 : 0] m_axi_wstrb
        .m_axi_wvalid(uart_axi_lite_wvalid),      // output wire m_axi_wvalid
        .m_axi_wready(uart_axi_lite_wready),      // input wire m_axi_wready
        .m_axi_bresp(uart_axi_lite_bresp),        // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(uart_axi_lite_bvalid),      // input wire m_axi_bvalid
        .m_axi_bready(uart_axi_lite_bready),      // output wire m_axi_bready
        .m_axi_araddr(uart_axi_lite_araddr),      // output wire [31 : 0] m_axi_araddr
        .m_axi_arprot(uart_axi_lite_arprot),      // output wire [2 : 0] m_axi_arprot
        .m_axi_arvalid(uart_axi_lite_arvalid),    // output wire m_axi_arvalid
        .m_axi_arready(uart_axi_lite_arready),    // input wire m_axi_arready
        .m_axi_rdata(uart_axi_lite_rdata),        // input wire [63 : 0] m_axi_rdata
        .m_axi_rresp(uart_axi_lite_rresp),        // input wire [1 : 0] m_axi_rresp
        .m_axi_rvalid(uart_axi_lite_rvalid),      // input wire m_axi_rvalid
        .m_axi_rready(uart_axi_lite_rready)      // output wire m_axi_rready
    );

    // register slice to improve timing
    wire [3:0] fib_1_axi_awid;
    wire [31:0] fib_1_axi_awaddr;
    wire [7:0] fib_1_axi_awlen;
    wire [2:0] fib_1_axi_awsize;
    wire [1:0] fib_1_axi_awburst;
    wire fib_1_axi_awlock;
    wire [3:0] fib_1_axi_awcache;
    wire [2:0] fib_1_axi_awprot;
    wire [3:0] fib_1_axi_awregion;
    wire [3:0] fib_1_axi_awqos;
    wire fib_1_axi_awvalid;
    wire fib_1_axi_awready;
    wire [63:0] fib_1_axi_wdata;
    wire [7:0] fib_1_axi_wstrb;
    wire fib_1_axi_wlast;
    wire fib_1_axi_wvalid;
    wire fib_1_axi_wready;
    wire [3:0] fib_1_axi_bid;
    wire [1:0] fib_1_axi_bresp;
    wire fib_1_axi_bvalid;
    wire fib_1_axi_bready;
    wire [3:0] fib_1_axi_arid;
    wire [31:0] fib_1_axi_araddr;
    wire [7:0] fib_1_axi_arlen;
    wire [2:0] fib_1_axi_arsize;
    wire [1:0] fib_1_axi_arburst;
    wire fib_1_axi_arlock;
    wire [3:0] fib_1_axi_arcache;
    wire [2:0] fib_1_axi_arprot;
    wire [3:0] fib_1_axi_arregion;
    wire [3:0] fib_1_axi_arqos;
    wire fib_1_axi_arvalid;
    wire fib_1_axi_arready;
    wire [3:0] fib_1_axi_rid;
    wire [63:0] fib_1_axi_rdata;
    wire [1:0] fib_1_axi_rresp;
    wire fib_1_axi_rlast;
    wire fib_1_axi_rvalid;
    wire fib_1_axi_rready;
    axi_register_slice_0 axi_register_slice_0_fib(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn

        .s_axi_awid(fib_1_axi_awid),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(fib_1_axi_awaddr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(fib_1_axi_awlen),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(fib_1_axi_awsize),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(fib_1_axi_awburst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(fib_1_axi_awlock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(fib_1_axi_awcache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(fib_1_axi_awprot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awregion(fib_1_axi_awregion),  // input wire [3 : 0] s_axi_awregion
        .s_axi_awqos(fib_1_axi_awqos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(fib_1_axi_awvalid),    // input wire s_axi_awvalid
        .s_axi_awready(fib_1_axi_awready),    // output wire s_axi_awready
        .s_axi_wdata(fib_1_axi_wdata),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(fib_1_axi_wstrb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(fib_1_axi_wlast),        // input wire s_axi_wlast
        .s_axi_wvalid(fib_1_axi_wvalid),      // input wire s_axi_wvalid
        .s_axi_wready(fib_1_axi_wready),      // output wire s_axi_wready
        .s_axi_bid(fib_1_axi_bid),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(fib_1_axi_bresp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(fib_1_axi_bvalid),      // output wire s_axi_bvalid
        .s_axi_bready(fib_1_axi_bready),      // input wire s_axi_bready
        .s_axi_arid(fib_1_axi_arid),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(fib_1_axi_araddr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(fib_1_axi_arlen),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(fib_1_axi_arsize),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(fib_1_axi_arburst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(fib_1_axi_arlock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(fib_1_axi_arcache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(fib_1_axi_arprot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arregion(fib_1_axi_arregion),  // input wire [3 : 0] s_axi_arregion
        .s_axi_arqos(fib_1_axi_arqos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(fib_1_axi_arvalid),    // input wire s_axi_arvalid
        .s_axi_arready(fib_1_axi_arready),    // output wire s_axi_arready
        .s_axi_rid(fib_1_axi_rid),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(fib_1_axi_rdata),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(fib_1_axi_rresp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(fib_1_axi_rlast),        // output wire s_axi_rlast
        .s_axi_rvalid(fib_1_axi_rvalid),      // output wire s_axi_rvalid
        .s_axi_rready(fib_1_axi_rready),      // input wire s_axi_rready

        .m_axi_awid(fib_axi_awid),          // output wire [3 : 0] m_axi_awid
        .m_axi_awaddr(fib_axi_awaddr),      // output wire [31 : 0] m_axi_awaddr
        .m_axi_awlen(fib_axi_awlen),        // output wire [7 : 0] m_axi_awlen
        .m_axi_awsize(fib_axi_awsize),      // output wire [2 : 0] m_axi_awsize
        .m_axi_awburst(fib_axi_awburst),    // output wire [1 : 0] m_axi_awburst
        .m_axi_awlock(fib_axi_awlock),      // output wire [0 : 0] m_axi_awlock
        .m_axi_awcache(fib_axi_awcache),    // output wire [3 : 0] m_axi_awcache
        .m_axi_awprot(fib_axi_awprot),      // output wire [2 : 0] m_axi_awprot
        .m_axi_awregion(fib_axi_awregion),  // output wire [3 : 0] m_axi_awregion
        .m_axi_awqos(fib_axi_awqos),        // output wire [3 : 0] m_axi_awqos
        .m_axi_awvalid(fib_axi_awvalid),    // output wire m_axi_awvalid
        .m_axi_awready(fib_axi_awready),    // input wire m_axi_awready
        .m_axi_wdata(fib_axi_wdata),        // output wire [63 : 0] m_axi_wdata
        .m_axi_wstrb(fib_axi_wstrb),        // output wire [7 : 0] m_axi_wstrb
        .m_axi_wlast(fib_axi_wlast),        // output wire m_axi_wlast
        .m_axi_wvalid(fib_axi_wvalid),      // output wire m_axi_wvalid
        .m_axi_wready(fib_axi_wready),      // input wire m_axi_wready
        .m_axi_bid(fib_axi_bid),            // input wire [3 : 0] m_axi_bid
        .m_axi_bresp(fib_axi_bresp),        // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(fib_axi_bvalid),      // input wire m_axi_bvalid
        .m_axi_bready(fib_axi_bready),      // output wire m_axi_bready
        .m_axi_arid(fib_axi_arid),          // output wire [3 : 0] m_axi_arid
        .m_axi_araddr(fib_axi_araddr),      // output wire [31 : 0] m_axi_araddr
        .m_axi_arlen(fib_axi_arlen),        // output wire [7 : 0] m_axi_arlen
        .m_axi_arsize(fib_axi_arsize),      // output wire [2 : 0] m_axi_arsize
        .m_axi_arburst(fib_axi_arburst),    // output wire [1 : 0] m_axi_arburst
        .m_axi_arlock(fib_axi_arlock),      // output wire [0 : 0] m_axi_arlock
        .m_axi_arcache(fib_axi_arcache),    // output wire [3 : 0] m_axi_arcache
        .m_axi_arprot(fib_axi_arprot),      // output wire [2 : 0] m_axi_arprot
        .m_axi_arregion(fib_axi_arregion),  // output wire [3 : 0] m_axi_arregion
        .m_axi_arqos(fib_axi_arqos),        // output wire [3 : 0] m_axi_arqos
        .m_axi_arvalid(fib_axi_arvalid),    // output wire m_axi_arvalid
        .m_axi_arready(fib_axi_arready),    // input wire m_axi_arready
        .m_axi_rid(fib_axi_rid),            // input wire [3 : 0] m_axi_rid
        .m_axi_rdata(fib_axi_rdata),        // input wire [63 : 0] m_axi_rdata
        .m_axi_rresp(fib_axi_rresp),        // input wire [1 : 0] m_axi_rresp
        .m_axi_rlast(fib_axi_rlast),        // input wire m_axi_rlast
        .m_axi_rvalid(fib_axi_rvalid),      // input wire m_axi_rvalid
        .m_axi_rready(fib_axi_rready)      // output wire m_axi_rready
    );

    wire [3:0] eth_1_axi_awid;
    wire [31:0] eth_1_axi_awaddr;
    wire [7:0] eth_1_axi_awlen;
    wire [2:0] eth_1_axi_awsize;
    wire [1:0] eth_1_axi_awburst;
    wire eth_1_axi_awlock;
    wire [3:0] eth_1_axi_awcache;
    wire [2:0] eth_1_axi_awprot;
    wire [3:0] eth_1_axi_awregion;
    wire [3:0] eth_1_axi_awqos;
    wire eth_1_axi_awvalid;
    wire eth_1_axi_awready;
    wire [63:0] eth_1_axi_wdata;
    wire [7:0] eth_1_axi_wstrb;
    wire eth_1_axi_wlast;
    wire eth_1_axi_wvalid;
    wire eth_1_axi_wready;
    wire [3:0] eth_1_axi_bid;
    wire [1:0] eth_1_axi_bresp;
    wire eth_1_axi_bvalid;
    wire eth_1_axi_bready;
    wire [3:0] eth_1_axi_arid;
    wire [31:0] eth_1_axi_araddr;
    wire [7:0] eth_1_axi_arlen;
    wire [2:0] eth_1_axi_arsize;
    wire [1:0] eth_1_axi_arburst;
    wire eth_1_axi_arlock;
    wire [3:0] eth_1_axi_arcache;
    wire [2:0] eth_1_axi_arprot;
    wire [3:0] eth_1_axi_arregion;
    wire [3:0] eth_1_axi_arqos;
    wire eth_1_axi_arvalid;
    wire eth_1_axi_arready;
    wire [3:0] eth_1_axi_rid;
    wire [63:0] eth_1_axi_rdata;
    wire [1:0] eth_1_axi_rresp;
    wire eth_1_axi_rlast;
    wire eth_1_axi_rvalid;
    wire eth_1_axi_rready;
    axi_register_slice_0 axi_register_slice_0_eth(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn

        .s_axi_awid(eth_1_axi_awid),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(eth_1_axi_awaddr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(eth_1_axi_awlen),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(eth_1_axi_awsize),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(eth_1_axi_awburst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(eth_1_axi_awlock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(eth_1_axi_awcache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(eth_1_axi_awprot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awregion(eth_1_axi_awregion),  // input wire [3 : 0] s_axi_awregion
        .s_axi_awqos(eth_1_axi_awqos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(eth_1_axi_awvalid),    // input wire s_axi_awvalid
        .s_axi_awready(eth_1_axi_awready),    // output wire s_axi_awready
        .s_axi_wdata(eth_1_axi_wdata),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(eth_1_axi_wstrb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(eth_1_axi_wlast),        // input wire s_axi_wlast
        .s_axi_wvalid(eth_1_axi_wvalid),      // input wire s_axi_wvalid
        .s_axi_wready(eth_1_axi_wready),      // output wire s_axi_wready
        .s_axi_bid(eth_1_axi_bid),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(eth_1_axi_bresp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(eth_1_axi_bvalid),      // output wire s_axi_bvalid
        .s_axi_bready(eth_1_axi_bready),      // input wire s_axi_bready
        .s_axi_arid(eth_1_axi_arid),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(eth_1_axi_araddr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(eth_1_axi_arlen),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(eth_1_axi_arsize),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(eth_1_axi_arburst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(eth_1_axi_arlock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(eth_1_axi_arcache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(eth_1_axi_arprot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arregion(eth_1_axi_arregion),  // input wire [3 : 0] s_axi_arregion
        .s_axi_arqos(eth_1_axi_arqos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(eth_1_axi_arvalid),    // input wire s_axi_arvalid
        .s_axi_arready(eth_1_axi_arready),    // output wire s_axi_arready
        .s_axi_rid(eth_1_axi_rid),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(eth_1_axi_rdata),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(eth_1_axi_rresp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(eth_1_axi_rlast),        // output wire s_axi_rlast
        .s_axi_rvalid(eth_1_axi_rvalid),      // output wire s_axi_rvalid
        .s_axi_rready(eth_1_axi_rready),      // input wire s_axi_rready

        .m_axi_awid(eth_axi_awid),          // output wire [3 : 0] m_axi_awid
        .m_axi_awaddr(eth_axi_awaddr),      // output wire [31 : 0] m_axi_awaddr
        .m_axi_awlen(eth_axi_awlen),        // output wire [7 : 0] m_axi_awlen
        .m_axi_awsize(eth_axi_awsize),      // output wire [2 : 0] m_axi_awsize
        .m_axi_awburst(eth_axi_awburst),    // output wire [1 : 0] m_axi_awburst
        .m_axi_awlock(eth_axi_awlock),      // output wire [0 : 0] m_axi_awlock
        .m_axi_awcache(eth_axi_awcache),    // output wire [3 : 0] m_axi_awcache
        .m_axi_awprot(eth_axi_awprot),      // output wire [2 : 0] m_axi_awprot
        .m_axi_awregion(eth_axi_awregion),  // output wire [3 : 0] m_axi_awregion
        .m_axi_awqos(eth_axi_awqos),        // output wire [3 : 0] m_axi_awqos
        .m_axi_awvalid(eth_axi_awvalid),    // output wire m_axi_awvalid
        .m_axi_awready(eth_axi_awready),    // input wire m_axi_awready
        .m_axi_wdata(eth_axi_wdata),        // output wire [63 : 0] m_axi_wdata
        .m_axi_wstrb(eth_axi_wstrb),        // output wire [7 : 0] m_axi_wstrb
        .m_axi_wlast(eth_axi_wlast),        // output wire m_axi_wlast
        .m_axi_wvalid(eth_axi_wvalid),      // output wire m_axi_wvalid
        .m_axi_wready(eth_axi_wready),      // input wire m_axi_wready
        .m_axi_bid(eth_axi_bid),            // input wire [3 : 0] m_axi_bid
        .m_axi_bresp(eth_axi_bresp),        // input wire [1 : 0] m_axi_bresp
        .m_axi_bvalid(eth_axi_bvalid),      // input wire m_axi_bvalid
        .m_axi_bready(eth_axi_bready),      // output wire m_axi_bready
        .m_axi_arid(eth_axi_arid),          // output wire [3 : 0] m_axi_arid
        .m_axi_araddr(eth_axi_araddr),      // output wire [31 : 0] m_axi_araddr
        .m_axi_arlen(eth_axi_arlen),        // output wire [7 : 0] m_axi_arlen
        .m_axi_arsize(eth_axi_arsize),      // output wire [2 : 0] m_axi_arsize
        .m_axi_arburst(eth_axi_arburst),    // output wire [1 : 0] m_axi_arburst
        .m_axi_arlock(eth_axi_arlock),      // output wire [0 : 0] m_axi_arlock
        .m_axi_arcache(eth_axi_arcache),    // output wire [3 : 0] m_axi_arcache
        .m_axi_arprot(eth_axi_arprot),      // output wire [2 : 0] m_axi_arprot
        .m_axi_arregion(eth_axi_arregion),  // output wire [3 : 0] m_axi_arregion
        .m_axi_arqos(eth_axi_arqos),        // output wire [3 : 0] m_axi_arqos
        .m_axi_arvalid(eth_axi_arvalid),    // output wire m_axi_arvalid
        .m_axi_arready(eth_axi_arready),    // input wire m_axi_arready
        .m_axi_rid(eth_axi_rid),            // input wire [3 : 0] m_axi_rid
        .m_axi_rdata(eth_axi_rdata),        // input wire [63 : 0] m_axi_rdata
        .m_axi_rresp(eth_axi_rresp),        // input wire [1 : 0] m_axi_rresp
        .m_axi_rlast(eth_axi_rlast),        // input wire m_axi_rlast
        .m_axi_rvalid(eth_axi_rvalid),      // input wire m_axi_rvalid
        .m_axi_rready(eth_axi_rready)      // output wire m_axi_rready
    );

    // 0x60000000 uart
    // 0x60100000 dma control
    // 0x60200000 eth control
    // 0x60300000 fib mmap

    axi_crossbar_0 axi_crossbar_0_inst(
        .aclk(CLK),                      // input wire aclk
        .aresetn(~reset),                // input wire aresetn

        .s_axi_awid(core_mmio_axi4_0_aw_bits_id),          // input wire [3 : 0] s_axi_awid
        .s_axi_awaddr(core_mmio_axi4_0_aw_bits_addr),      // input wire [31 : 0] s_axi_awaddr
        .s_axi_awlen(core_mmio_axi4_0_aw_bits_len),        // input wire [7 : 0] s_axi_awlen
        .s_axi_awsize(core_mmio_axi4_0_aw_bits_size),      // input wire [2 : 0] s_axi_awsize
        .s_axi_awburst(core_mmio_axi4_0_aw_bits_burst),    // input wire [1 : 0] s_axi_awburst
        .s_axi_awlock(core_mmio_axi4_0_aw_bits_lock),      // input wire [0 : 0] s_axi_awlock
        .s_axi_awcache(core_mmio_axi4_0_aw_bits_cache),    // input wire [3 : 0] s_axi_awcache
        .s_axi_awprot(core_mmio_axi4_0_aw_bits_prot),      // input wire [2 : 0] s_axi_awprot
        .s_axi_awqos(core_mmio_axi4_0_aw_bits_qos),        // input wire [3 : 0] s_axi_awqos
        .s_axi_awvalid(core_mmio_axi4_0_aw_valid),    // input wire [0 : 0] s_axi_awvalid
        .s_axi_awready(core_mmio_axi4_0_aw_ready),    // output wire [0 : 0] s_axi_awready
        .s_axi_wdata(core_mmio_axi4_0_w_bits_data),        // input wire [63 : 0] s_axi_wdata
        .s_axi_wstrb(core_mmio_axi4_0_w_bits_strb),        // input wire [7 : 0] s_axi_wstrb
        .s_axi_wlast(core_mmio_axi4_0_w_bits_last),        // input wire [0 : 0] s_axi_wlast
        .s_axi_wvalid(core_mmio_axi4_0_w_valid),      // input wire [0 : 0] s_axi_wvalid
        .s_axi_wready(core_mmio_axi4_0_w_ready),      // output wire [0 : 0] s_axi_wready
        .s_axi_bid(core_mmio_axi4_0_b_bits_id),            // output wire [3 : 0] s_axi_bid
        .s_axi_bresp(core_mmio_axi4_0_b_bits_resp),        // output wire [1 : 0] s_axi_bresp
        .s_axi_bvalid(core_mmio_axi4_0_b_valid),      // output wire [0 : 0] s_axi_bvalid
        .s_axi_bready(core_mmio_axi4_0_b_ready),      // input wire [0 : 0] s_axi_bready
        .s_axi_arid(core_mmio_axi4_0_ar_bits_id),          // input wire [3 : 0] s_axi_arid
        .s_axi_araddr(core_mmio_axi4_0_ar_bits_addr),      // input wire [31 : 0] s_axi_araddr
        .s_axi_arlen(core_mmio_axi4_0_ar_bits_len),        // input wire [7 : 0] s_axi_arlen
        .s_axi_arsize(core_mmio_axi4_0_ar_bits_size),      // input wire [2 : 0] s_axi_arsize
        .s_axi_arburst(core_mmio_axi4_0_ar_bits_burst),    // input wire [1 : 0] s_axi_arburst
        .s_axi_arlock(core_mmio_axi4_0_ar_bits_lock),      // input wire [0 : 0] s_axi_arlock
        .s_axi_arcache(core_mmio_axi4_0_ar_bits_cache),    // input wire [3 : 0] s_axi_arcache
        .s_axi_arprot(core_mmio_axi4_0_ar_bits_prot),      // input wire [2 : 0] s_axi_arprot
        .s_axi_arqos(core_mmio_axi4_0_ar_bits_qos),        // input wire [3 : 0] s_axi_arqos
        .s_axi_arvalid(core_mmio_axi4_0_ar_valid),    // input wire [0 : 0] s_axi_arvalid
        .s_axi_arready(core_mmio_axi4_0_ar_ready),    // output wire [0 : 0] s_axi_arready
        .s_axi_rid(core_mmio_axi4_0_r_bits_id),            // output wire [3 : 0] s_axi_rid
        .s_axi_rdata(core_mmio_axi4_0_r_bits_data),        // output wire [63 : 0] s_axi_rdata
        .s_axi_rresp(core_mmio_axi4_0_r_bits_resp),        // output wire [1 : 0] s_axi_rresp
        .s_axi_rlast(core_mmio_axi4_0_r_bits_last),        // output wire [0 : 0] s_axi_rlast
        .s_axi_rvalid(core_mmio_axi4_0_r_valid),      // output wire [0 : 0] s_axi_rvalid
        .s_axi_rready(core_mmio_axi4_0_r_ready),      // input wire [0 : 0] s_axi_rready

        .m_axi_awid({fib_1_axi_awid, eth_1_axi_awid, dma_axi_awid, uart_axi_awid}),          // output wire [11 : 0] m_axi_awid
        .m_axi_awaddr({fib_1_axi_awaddr, eth_1_axi_awaddr, dma_axi_awaddr, uart_axi_awaddr}),      // output wire [95 : 0] m_axi_awaddr
        .m_axi_awlen({fib_1_axi_awlen, eth_1_axi_awlen, dma_axi_awlen, uart_axi_awlen}),        // output wire [23 : 0] m_axi_awlen
        .m_axi_awsize({fib_1_axi_awsize, eth_1_axi_awsize, dma_axi_awsize, uart_axi_awsize}),      // output wire [8 : 0] m_axi_awsize
        .m_axi_awburst({fib_1_axi_awburst, eth_1_axi_awburst, dma_axi_awburst, uart_axi_awburst}),    // output wire [5 : 0] m_axi_awburst
        .m_axi_awlock({fib_1_axi_awlock, eth_1_axi_awlock, dma_axi_awlock, uart_axi_awlock}),      // output wire [2 : 0] m_axi_awlock
        .m_axi_awcache({fib_1_axi_awcache, eth_1_axi_awcache, dma_axi_awcache, uart_axi_awcache}),    // output wire [11 : 0] m_axi_awcache
        .m_axi_awprot({fib_1_axi_awprot, eth_1_axi_awprot, dma_axi_awprot, uart_axi_awprot}),      // output wire [8 : 0] m_axi_awprot
        .m_axi_awregion({fib_1_axi_awregion, eth_1_axi_awregion, dma_axi_awregion, uart_axi_awregion}),  // output wire [11 : 0] m_axi_awregion
        .m_axi_awqos({fib_1_axi_awqos, eth_1_axi_awqos, dma_axi_awqos, uart_axi_awqos}),        // output wire [11 : 0] m_axi_awqos
        .m_axi_awvalid({fib_1_axi_awvalid, eth_1_axi_awvalid, dma_axi_awvalid, uart_axi_awvalid}),    // output wire [2 : 0] m_axi_awvalid
        .m_axi_awready({fib_1_axi_awready, eth_1_axi_awready, dma_axi_awready, uart_axi_awready}),    // input wire [2 : 0] m_axi_awready
        .m_axi_wdata({fib_1_axi_wdata, eth_1_axi_wdata, dma_axi_wdata, uart_axi_wdata}),        // output wire [191 : 0] m_axi_wdata
        .m_axi_wstrb({fib_1_axi_wstrb, eth_1_axi_wstrb, dma_axi_wstrb, uart_axi_wstrb}),        // output wire [23 : 0] m_axi_wstrb
        .m_axi_wlast({fib_1_axi_wlast, eth_1_axi_wlast, dma_axi_wlast, uart_axi_wlast}),        // output wire [2 : 0] m_axi_wlast
        .m_axi_wvalid({fib_1_axi_wvalid, eth_1_axi_wvalid, dma_axi_wvalid, uart_axi_wvalid}),      // output wire [2 : 0] m_axi_wvalid
        .m_axi_wready({fib_1_axi_wready, eth_1_axi_wready, dma_axi_wready, uart_axi_wready}),      // input wire [2 : 0] m_axi_wready
        .m_axi_bid({fib_1_axi_bid, eth_1_axi_bid, dma_axi_bid, uart_axi_bid}),            // input wire [11 : 0] m_axi_bid
        .m_axi_bresp({fib_1_axi_bresp, eth_1_axi_bresp, dma_axi_bresp, uart_axi_bresp}),        // input wire [5 : 0] m_axi_bresp
        .m_axi_bvalid({fib_1_axi_bvalid, eth_1_axi_bvalid, dma_axi_bvalid, uart_axi_bvalid}),      // input wire [2 : 0] m_axi_bvalid
        .m_axi_bready({fib_1_axi_bready, eth_1_axi_bready, dma_axi_bready, uart_axi_bready}),      // output wire [2 : 0] m_axi_bready
        .m_axi_arid({fib_1_axi_arid, eth_1_axi_arid, dma_axi_arid, uart_axi_arid}),          // output wire [11 : 0] m_axi_arid
        .m_axi_araddr({fib_1_axi_araddr, eth_1_axi_araddr, dma_axi_araddr, uart_axi_araddr}),      // output wire [95 : 0] m_axi_araddr
        .m_axi_arlen({fib_1_axi_arlen, eth_1_axi_arlen, dma_axi_arlen, uart_axi_arlen}),        // output wire [23 : 0] m_axi_arlen
        .m_axi_arsize({fib_1_axi_arsize, eth_1_axi_arsize, dma_axi_arsize, uart_axi_arsize}),      // output wire [8 : 0] m_axi_arsize
        .m_axi_arburst({fib_1_axi_arburst, eth_1_axi_arburst, dma_axi_arburst, uart_axi_arburst}),    // output wire [5 : 0] m_axi_arburst
        .m_axi_arlock({fib_1_axi_arlock, eth_1_axi_arlock, dma_axi_arlock, uart_axi_arlock}),      // output wire [2 : 0] m_axi_arlock
        .m_axi_arcache({fib_1_axi_arcache, eth_1_axi_arcache, dma_axi_arcache, uart_axi_arcache}),    // output wire [11 : 0] m_axi_arcache
        .m_axi_arprot({fib_1_axi_arprot, eth_1_axi_arprot, dma_axi_arprot, uart_axi_arprot}),      // output wire [8 : 0] m_axi_arprot
        .m_axi_arregion({fib_1_axi_arregion, eth_1_axi_arregion, dma_axi_arregion, uart_axi_arregion}),  // output wire [11 : 0] m_axi_arregion
        .m_axi_arqos({fib_1_axi_arqos, eth_1_axi_arqos, dma_axi_arqos, uart_axi_arqos}),        // output wire [11 : 0] m_axi_arqos
        .m_axi_arvalid({fib_1_axi_arvalid, eth_1_axi_arvalid, dma_axi_arvalid, uart_axi_arvalid}),    // output wire [2 : 0] m_axi_arvalid
        .m_axi_arready({fib_1_axi_arready, eth_1_axi_arready, dma_axi_arready, uart_axi_arready}),    // input wire [2 : 0] m_axi_arready
        .m_axi_rid({fib_1_axi_rid, eth_1_axi_rid, dma_axi_rid, uart_axi_rid}),            // input wire [11 : 0] m_axi_rid
        .m_axi_rdata({fib_1_axi_rdata, eth_1_axi_rdata, dma_axi_rdata, uart_axi_rdata}),        // input wire [191 : 0] m_axi_rdata
        .m_axi_rresp({fib_1_axi_rresp, eth_1_axi_rresp, dma_axi_rresp, uart_axi_rresp}),        // input wire [5 : 0] m_axi_rresp
        .m_axi_rlast({fib_1_axi_rlast, eth_1_axi_rlast, dma_axi_rlast, uart_axi_rlast}),        // input wire [2 : 0] m_axi_rlast
        .m_axi_rvalid({fib_1_axi_rvalid, eth_1_axi_rvalid, dma_axi_rvalid, uart_axi_rvalid}),      // input wire [2 : 0] m_axi_rvalid
        .m_axi_rready({fib_1_axi_rready, eth_1_axi_rready, dma_axi_rready, uart_axi_rready})      // output wire [2 : 0] m_axi_rready
    );
endmodule
