`timescale 1ns / 1ps

module xgbe_test(
    input CLK,
    input nRST,

    input gtrefclk0_p,
    input gtrefclk0_n,

    input [3:0] sfp_rx_p,
    input [3:0] sfp_rx_n,
    output wire [3:0] sfp_tx_p,
    output wire [3:0] sfp_tx_n,
    output wire [3:0] sfp_tx_disable,
    output wire [3:0] sfp_rate,

    output wire UART_TX,
    input UART_RX,
    output wire [7:0] nLED
    );

    wire reset0 = ~nRST;
    wire [7:0] LED;
    assign nLED = ~LED;

    wire eth_coreclk, eth_areset_coreclk, eth_gttxreset, eth_gtrxreset,
         eth_reset_counter_done;

    wire [1:0] eth_shared_txuserrdy, eth_shared_txusrclk, eth_shared_txusrclk2,
               eth_shared_qplllock, eth_shared_qplloutclk, eth_shared_qplloutrefclk;

    wire eth_txoutclk[0:3];

    axi_10g_ethernet_0_shared_clocking_wrapper axi_10g_ethernet_0_shared_clocking_wrapper_i(
        .reset(reset0),
        .refclk_p(gtrefclk0_p),
        .refclk_n(gtrefclk0_n),
        .dclk(1'b0),
        .txoutclk({eth_txoutclk[0], eth_txoutclk[2]}),
        .coreclk(eth_coreclk),
        .areset_coreclk(eth_areset_coreclk),
        .gttxreset(eth_gttxreset),
        .gtrxreset(eth_gtrxreset),
        .txuserrdy(eth_shared_txuserrdy),
        .txusrclk(eth_shared_txusrclk),
        .txusrclk2(eth_shared_txusrclk2),
        .reset_counter_done(eth_reset_counter_done),
        .qplllock_out(eth_shared_qplllock),
        .qplloutclk(eth_shared_qplloutclk),
        .qplloutrefclk(eth_shared_qplloutrefclk)
    );

    reg [7:0] reset_buff;
    always @ (posedge eth_coreclk or posedge reset0)
    begin
        if (reset0)
        begin
            reset_buff <= 8'b11111111;
        end
        else
        begin
            reset_buff <= {reset_buff[6:0], 1'b0};
        end
    end

    wire reset;
    BUFG reset_bufg(
        .I(reset_buff[7]),
        .O(reset)
    );

    wire [3:0] eth_txuserrdy = {eth_shared_txuserrdy[1], eth_shared_txuserrdy[1],
                                eth_shared_txuserrdy[0], eth_shared_txuserrdy[0]},
               eth_txusrclk = {eth_shared_txusrclk[1], eth_shared_txusrclk[1],
                               eth_shared_txusrclk[0], eth_shared_txusrclk[0]},
               eth_txusrclk2 = {eth_shared_txusrclk2[1], eth_shared_txusrclk2[1],
                                eth_shared_txusrclk2[0], eth_shared_txusrclk2[0]},
               eth_qplllock = {eth_shared_qplllock[1], eth_shared_qplllock[1],
                               eth_shared_qplllock[0], eth_shared_qplllock[0]},
               eth_qplloutclk = {eth_shared_qplloutclk[1], eth_shared_qplloutclk[1],
                                 eth_shared_qplloutclk[0], eth_shared_qplloutclk[0]},
               eth_qplloutrefclk = {eth_shared_qplloutrefclk[1], eth_shared_qplloutrefclk[1],
                                    eth_shared_qplloutrefclk[0], eth_shared_qplloutrefclk[0]};

    wire [7:0] eth_pcspma_status[0:3];
    wire [2:0] eth_mac_status_vector[0:3];
    wire [447:0] eth_pcs_pma_status_vector[0:3];
    wire eth_tx_resetdone[0:3], eth_rx_resetdone[0:3];
    wire eth_block_lock[0:3];
    wire eth_no_fault[0:3];
    wire eth_resetdone[0:3];

    wire [63:0] eth_tx_data[0:3];
    wire [7:0] eth_tx_keep[0:3];
    wire eth_tx_valid[0:3], eth_tx_ready[0:3], eth_tx_last[0:3];

    wire [63:0] eth_rx_data[0:3];
    wire [7:0] eth_rx_keep[0:3];
    wire eth_rx_valid[0:3], eth_rx_last[0:3], eth_rx_user[0:3];
    wire eth_rx_error[0:3];

    reg eth_resetdone_reg[0:3];
    reg [1:0] eth_resetdone_count[0:3];
    wire eth_resetdone_rising_edge[0:3];
    wire eth_ready[0:3];

    genvar j;
    generate
        for (j = 0; j < 4; j = j + 1)
        begin : gen_eth
            assign eth_block_lock[j] = eth_pcspma_status[j][0];
            assign eth_no_fault[j] = !eth_mac_status_vector[j][0] && !eth_mac_status_vector[j][1];
            assign eth_resetdone[j] = eth_tx_resetdone[j] && eth_rx_resetdone[j];

            assign eth_rx_error[j] = eth_rx_last[j] && !eth_rx_user[j];

            axi_10g_ethernet_0 axi_10g_ethernet_0_inst(
                .dclk(1'b0), //???

                // SFP+
                .txp(sfp_tx_p[j]),
                .txn(sfp_tx_n[j]),
                .rxp(sfp_rx_p[j]),
                .rxn(sfp_rx_n[j]),
                .signal_detect(1'b1),
                .tx_fault(1'b0),
                .tx_disable(sfp_tx_disable[j]),

                .sim_speedup_control(1'b0),
                .rxrecclk_out(),

                // config and status
                .pcspma_status(eth_pcspma_status[j]),
                .mac_tx_configuration_vector({78'd0, 2'b10}),
                .mac_rx_configuration_vector({78'd0, 2'b10}),
                .mac_status_vector(eth_mac_status_vector[j]),
                .pcs_pma_configuration_vector(536'd0),
                .pcs_pma_status_vector(eth_pcs_pma_status_vector[j]),

                // clock and reset
                .areset_coreclk(eth_areset_coreclk),
                .txusrclk(eth_txusrclk[j]),
                .txusrclk2(eth_txusrclk2[j]),
                .txoutclk(eth_txoutclk[j]),
                .txuserrdy(eth_txuserrdy[j]),
                .tx_resetdone(eth_tx_resetdone[j]),
                .rx_resetdone(eth_rx_resetdone[j]),
                .coreclk(eth_coreclk),
                .areset(reset),
                .gttxreset(eth_gttxreset),
                .gtrxreset(eth_gtrxreset),
                .qplllock(eth_qplllock[j]),
                .qplloutclk(eth_qplloutclk[j]),
                .qplloutrefclk(eth_qplloutrefclk[j]),
                .reset_counter_done(eth_reset_counter_done),

                .tx_axis_aresetn(~reset),
                .s_axis_tx_tdata(eth_tx_data[j]),
                .s_axis_tx_tkeep(eth_tx_keep[j]),
                .s_axis_tx_tlast(eth_tx_last[j]),
                .s_axis_tx_tready(eth_tx_ready[j]),
                .s_axis_tx_tuser(1'b0),
                .s_axis_tx_tvalid(eth_tx_valid[j]),
                .s_axis_pause_tdata(16'h0000),
                .s_axis_pause_tvalid(1'b0),
                .tx_ifg_delay(8'h00),

                .rx_axis_aresetn(~reset),
                .m_axis_rx_tdata(eth_rx_data[j]),
                .m_axis_rx_tkeep(eth_rx_keep[j]),
                .m_axis_rx_tlast(eth_rx_last[j]),
                .m_axis_rx_tuser(eth_rx_user[j]),
                .m_axis_rx_tvalid(eth_rx_valid[j]),

                .tx_statistics_valid(),
                .tx_statistics_vector(),
                .rx_statistics_valid(),
                .rx_statistics_vector()
            );
            assign sfp_rate[j] = 1'b1;

            assign eth_resetdone_rising_edge[j] = eth_resetdone[j] & !eth_resetdone_reg[j];

            always @ (posedge eth_coreclk)
            begin
                eth_resetdone_reg[j] <= eth_resetdone[j];
            end

            always @ (posedge eth_coreclk or posedge reset)
            begin
                if (reset) begin
                    eth_resetdone_count[j] <= 0;
                end
                else if (eth_resetdone_rising_edge[j]) begin
                    eth_resetdone_count[j] <= eth_resetdone_count[j] + 1;
                end
            end

            assign eth_ready[j] = eth_block_lock[j] && eth_no_fault[j] && eth_resetdone_count[j][1];
        end
    endgenerate

    assign {LED[6], LED[4], LED[2], LED[0]} = {eth_ready[3], eth_ready[2], eth_ready[1], eth_ready[0]};
    led_delayer led_delayer_i(
        .clk(eth_coreclk),
        .reset(reset),
        .in_led({eth_tx_valid[3] | eth_rx_valid[3],
                 eth_tx_valid[2] | eth_rx_valid[2],
                 eth_tx_valid[1] | eth_rx_valid[1],
                 eth_tx_valid[0] | eth_rx_valid[0]}),
        .out_led({LED[7], LED[5], LED[3], LED[1]})
    );

    wire [63:0] cpu_tx_data;
    wire [7:0] cpu_tx_keep;
    wire cpu_tx_valid, cpu_tx_last, cpu_tx_user;
    wire cpu_tx_error = 1'b0;

    wire [1023:0] bus_rx_data;
    wire [127:0] bus_rx_keep;
    wire bus_rx_last, bus_rx_valid;
    wire [2:0] bus_rx_id;
    wire [127:0] bus_rx_user_array;
    wire bus_rx_error = |bus_rx_user_array;

    axis_interconnect_in axis_interconnect_in_inst(
        .ACLK(eth_coreclk),
        .ARESETN(~reset),
        .S00_AXIS_ACLK(eth_coreclk),
        .S00_AXIS_ARESETN(~reset),
        .S01_AXIS_ACLK(eth_coreclk),
        .S01_AXIS_ARESETN(~reset),
        .S02_AXIS_ACLK(eth_coreclk),
        .S02_AXIS_ARESETN(~reset),
        .S03_AXIS_ACLK(eth_coreclk),
        .S03_AXIS_ARESETN(~reset),
        .S04_AXIS_ACLK(eth_coreclk),
        .S04_AXIS_ARESETN(~reset),

        .S00_AXIS_TVALID(eth_rx_valid[0]),
        .S00_AXIS_TREADY(),
        .S00_AXIS_TDATA(eth_rx_data[0]),
        .S00_AXIS_TKEEP(eth_rx_keep[0]),
        .S00_AXIS_TLAST(eth_rx_last[0]),
        .S00_AXIS_TID(3'd0),
        .S00_AXIS_TUSER({8{eth_rx_error[0]}}),

        .S01_AXIS_TVALID(eth_rx_valid[1]),
        .S01_AXIS_TREADY(),
        .S01_AXIS_TDATA(eth_rx_data[1]),
        .S01_AXIS_TKEEP(eth_rx_keep[1]),
        .S01_AXIS_TLAST(eth_rx_last[1]),
        .S01_AXIS_TID(3'd1),
        .S01_AXIS_TUSER({8{eth_rx_error[1]}}),

        .S02_AXIS_TVALID(eth_rx_valid[2]),
        .S02_AXIS_TREADY(),
        .S02_AXIS_TDATA(eth_rx_data[2]),
        .S02_AXIS_TKEEP(eth_rx_keep[2]),
        .S02_AXIS_TLAST(eth_rx_last[2]),
        .S02_AXIS_TID(3'd2),
        .S02_AXIS_TUSER({8{eth_rx_error[2]}}),

        .S03_AXIS_TVALID(eth_rx_valid[3]),
        .S03_AXIS_TREADY(),
        .S03_AXIS_TDATA(eth_rx_data[3]),
        .S03_AXIS_TKEEP(eth_rx_keep[3]),
        .S03_AXIS_TLAST(eth_rx_last[3]),
        .S03_AXIS_TID(3'd3),
        .S03_AXIS_TUSER({8{eth_rx_error[3]}}),

        .S04_AXIS_TVALID(cpu_tx_valid),
        .S04_AXIS_TREADY(),
        .S04_AXIS_TDATA(cpu_tx_data),
        .S04_AXIS_TKEEP(cpu_tx_keep),
        .S04_AXIS_TLAST(cpu_tx_last),
        .S04_AXIS_TID(3'd4),
        .S04_AXIS_TUSER({8{cpu_tx_error}}),

        .M00_AXIS_ACLK(eth_coreclk),
        .M00_AXIS_ARESETN(~reset),
        .M00_AXIS_TVALID(bus_rx_valid),
        .M00_AXIS_TREADY(1'b1),
        .M00_AXIS_TDATA(bus_rx_data),
        .M00_AXIS_TKEEP(bus_rx_keep),
        .M00_AXIS_TLAST(bus_rx_last),
        .M00_AXIS_TID(bus_rx_id),
        .M00_AXIS_TUSER(bus_rx_user_array),
        .S00_ARB_REQ_SUPPRESS(1'b0),
        .S01_ARB_REQ_SUPPRESS(1'b0),
        .S02_ARB_REQ_SUPPRESS(1'b0),
        .S03_ARB_REQ_SUPPRESS(1'b0),
        .S04_ARB_REQ_SUPPRESS(1'b0),
        .S00_FIFO_DATA_COUNT(),
        .S01_FIFO_DATA_COUNT(),
        .S02_FIFO_DATA_COUNT(),
        .S03_FIFO_DATA_COUNT(),
        .S04_FIFO_DATA_COUNT()
    );

    wire [1023:0] bus_tx_data;
    wire [127:0] bus_tx_keep;
    wire bus_tx_last, bus_tx_valid;
    wire bus_tx_ready;
    wire [2:0] bus_tx_dest;

    wire eth_axi_lite_awvalid;
    wire eth_axi_lite_awready;
    wire [31:0] eth_axi_lite_awaddr;
    wire [2:0] eth_axi_lite_awprot;
    wire eth_axi_lite_wvalid;
    wire eth_axi_lite_wready;
    wire [63:0] eth_axi_lite_wdata;
    wire [7:0] eth_axi_lite_wstrb;
    wire [1:0] eth_axi_lite_bresp;
    wire eth_axi_lite_bvalid;
    wire eth_axi_lite_bready;
    wire eth_axi_lite_arvalid;
    wire eth_axi_lite_arready;
    wire [31:0] eth_axi_lite_araddr;
    wire [2:0] eth_axi_lite_arprot;
    wire eth_axi_lite_rvalid;
    wire eth_axi_lite_rready;
    wire [63:0] eth_axi_lite_rdata;
    wire [1:0] eth_axi_lite_rresp;

    wire [3:0] fib_axi_awid;
    wire [31:0] fib_axi_awaddr;
    wire [7:0] fib_axi_awlen;
    wire [2:0] fib_axi_awsize;
    wire [1:0] fib_axi_awburst;
    wire fib_axi_awlock;
    wire [3:0] fib_axi_awcache;
    wire [2:0] fib_axi_awprot;
    wire [3:0] fib_axi_awregion;
    wire [3:0] fib_axi_awqos;
    wire fib_axi_awvalid;
    wire fib_axi_awready;
    wire [63:0] fib_axi_wdata;
    wire [7:0] fib_axi_wstrb;
    wire fib_axi_wlast;
    wire fib_axi_wvalid;
    wire fib_axi_wready;
    wire [3:0] fib_axi_bid;
    wire [1:0] fib_axi_bresp;
    wire fib_axi_bvalid;
    wire fib_axi_bready;
    wire [3:0] fib_axi_arid;
    wire [31:0] fib_axi_araddr;
    wire [7:0] fib_axi_arlen;
    wire [2:0] fib_axi_arsize;
    wire [1:0] fib_axi_arburst;
    wire fib_axi_arlock;
    wire [3:0] fib_axi_arcache;
    wire [2:0] fib_axi_arprot;
    wire [3:0] fib_axi_arregion;
    wire [3:0] fib_axi_arqos;
    wire fib_axi_arvalid;
    wire fib_axi_arready;
    wire [3:0] fib_axi_rid;
    wire [63:0] fib_axi_rdata;
    wire [1:0] fib_axi_rresp;
    wire fib_axi_rlast;
    wire fib_axi_rvalid;
    wire fib_axi_rready;

    packet_datapath packet_datapath_inst(
        .eth_coreclk(eth_coreclk),
        .reset(reset),

        .bus_rx_data(bus_rx_data),
        .bus_rx_keep(bus_rx_keep),
        .bus_rx_last(bus_rx_last),
        .bus_rx_valid(bus_rx_valid),
        .bus_rx_id(bus_rx_id),
        .bus_rx_error(bus_rx_error),

        .bus_tx_data(bus_tx_data),
        .bus_tx_keep(bus_tx_keep),
        .bus_tx_last(bus_tx_last), 
        .bus_tx_valid(bus_tx_valid),
        .bus_tx_ready(bus_tx_ready),
        .bus_tx_dest(bus_tx_dest),

        .axi_lite_awvalid(eth_axi_lite_awvalid),
        .axi_lite_awready(eth_axi_lite_awready),
        .axi_lite_awaddr(eth_axi_lite_awaddr),
        .axi_lite_awprot(eth_axi_lite_awprot),
        .axi_lite_wvalid(eth_axi_lite_wvalid),
        .axi_lite_wready(eth_axi_lite_wready),
        .axi_lite_wdata(eth_axi_lite_wdata),
        .axi_lite_wstrb(eth_axi_lite_wstrb),
        .axi_lite_bresp(eth_axi_lite_bresp),
        .axi_lite_bvalid(eth_axi_lite_bvalid),
        .axi_lite_bready(eth_axi_lite_bready),
        .axi_lite_arvalid(eth_axi_lite_arvalid),
        .axi_lite_arready(eth_axi_lite_arready),
        .axi_lite_araddr(eth_axi_lite_araddr),
        .axi_lite_arprot(eth_axi_lite_arprot),
        .axi_lite_rvalid(eth_axi_lite_rvalid),
        .axi_lite_rready(eth_axi_lite_rready),
        .axi_lite_rdata(eth_axi_lite_rdata),
        .axi_lite_rresp(eth_axi_lite_rresp),

        .fib_axi_awid(fib_axi_awid),
        .fib_axi_awaddr(fib_axi_awaddr),
        .fib_axi_awlen(fib_axi_awlen),
        .fib_axi_awsize(fib_axi_awsize),
        .fib_axi_awburst(fib_axi_awburst),
        .fib_axi_awlock(fib_axi_awlock),
        .fib_axi_awcache(fib_axi_awcache),
        .fib_axi_awprot(fib_axi_awprot),
        .fib_axi_awregion(fib_axi_awregion),
        .fib_axi_awqos(fib_axi_awqos),
        .fib_axi_awvalid(fib_axi_awvalid),
        .fib_axi_awready(fib_axi_awready),
        .fib_axi_wdata(fib_axi_wdata),
        .fib_axi_wstrb(fib_axi_wstrb),
        .fib_axi_wlast(fib_axi_wlast),
        .fib_axi_wvalid(fib_axi_wvalid),
        .fib_axi_wready(fib_axi_wready),
        .fib_axi_bid(fib_axi_bid),
        .fib_axi_bresp(fib_axi_bresp),
        .fib_axi_bvalid(fib_axi_bvalid),
        .fib_axi_bready(fib_axi_bready),
        .fib_axi_arid(fib_axi_arid),
        .fib_axi_araddr(fib_axi_araddr),
        .fib_axi_arlen(fib_axi_arlen),
        .fib_axi_arsize(fib_axi_arsize),
        .fib_axi_arburst(fib_axi_arburst),
        .fib_axi_arlock(fib_axi_arlock),
        .fib_axi_arcache(fib_axi_arcache),
        .fib_axi_arprot(fib_axi_arprot),
        .fib_axi_arregion(fib_axi_arregion),
        .fib_axi_arqos(fib_axi_arqos),
        .fib_axi_arvalid(fib_axi_arvalid),
        .fib_axi_arready(fib_axi_arready),
        .fib_axi_rid(fib_axi_rid),
        .fib_axi_rdata(fib_axi_rdata),
        .fib_axi_rresp(fib_axi_rresp),
        .fib_axi_rlast(fib_axi_rlast),
        .fib_axi_rvalid(fib_axi_rvalid),
        .fib_axi_rready(fib_axi_rready)
    );

    wire [63:0] cpu_rx_data;
    wire [7:0] cpu_rx_keep;
    wire cpu_rx_valid, cpu_rx_last;
    wire cpu_rx_ready;

    cpu cpu0(
        .CLK(eth_coreclk),
        .nRST(~reset),

        .UART_TX(UART_TX),
        .UART_RX(UART_RX),

        .eth_tx_data(cpu_tx_data),
        .eth_tx_keep(cpu_tx_keep),
        .eth_tx_valid(cpu_tx_valid),
        .eth_tx_ready(1'b1),
        .eth_tx_last(cpu_tx_last),

        .eth_rx_data(cpu_rx_data),
        .eth_rx_keep(cpu_rx_keep),
        .eth_rx_valid(cpu_rx_valid),
        .eth_rx_ready(cpu_rx_ready),
        .eth_rx_last(cpu_rx_last),

        .eth_axi_lite_awvalid(eth_axi_lite_awvalid),
        .eth_axi_lite_awready(eth_axi_lite_awready),
        .eth_axi_lite_awaddr(eth_axi_lite_awaddr),
        .eth_axi_lite_awprot(eth_axi_lite_awprot),
        .eth_axi_lite_wvalid(eth_axi_lite_wvalid),
        .eth_axi_lite_wready(eth_axi_lite_wready),
        .eth_axi_lite_wdata(eth_axi_lite_wdata),
        .eth_axi_lite_wstrb(eth_axi_lite_wstrb),
        .eth_axi_lite_bresp(eth_axi_lite_bresp),
        .eth_axi_lite_bvalid(eth_axi_lite_bvalid),
        .eth_axi_lite_bready(eth_axi_lite_bready),
        .eth_axi_lite_arvalid(eth_axi_lite_arvalid),
        .eth_axi_lite_arready(eth_axi_lite_arready),
        .eth_axi_lite_araddr(eth_axi_lite_araddr),
        .eth_axi_lite_arprot(eth_axi_lite_arprot),
        .eth_axi_lite_rvalid(eth_axi_lite_rvalid),
        .eth_axi_lite_rready(eth_axi_lite_rready),
        .eth_axi_lite_rdata(eth_axi_lite_rdata),
        .eth_axi_lite_rresp(eth_axi_lite_rresp),

        .fib_axi_awid(fib_axi_awid),
        .fib_axi_awaddr(fib_axi_awaddr),
        .fib_axi_awlen(fib_axi_awlen),
        .fib_axi_awsize(fib_axi_awsize),
        .fib_axi_awburst(fib_axi_awburst),
        .fib_axi_awlock(fib_axi_awlock),
        .fib_axi_awcache(fib_axi_awcache),
        .fib_axi_awprot(fib_axi_awprot),
        .fib_axi_awregion(fib_axi_awregion),
        .fib_axi_awqos(fib_axi_awqos),
        .fib_axi_awvalid(fib_axi_awvalid),
        .fib_axi_awready(fib_axi_awready),
        .fib_axi_wdata(fib_axi_wdata),
        .fib_axi_wstrb(fib_axi_wstrb),
        .fib_axi_wlast(fib_axi_wlast),
        .fib_axi_wvalid(fib_axi_wvalid),
        .fib_axi_wready(fib_axi_wready),
        .fib_axi_bid(fib_axi_bid),
        .fib_axi_bresp(fib_axi_bresp),
        .fib_axi_bvalid(fib_axi_bvalid),
        .fib_axi_bready(fib_axi_bready),
        .fib_axi_arid(fib_axi_arid),
        .fib_axi_araddr(fib_axi_araddr),
        .fib_axi_arlen(fib_axi_arlen),
        .fib_axi_arsize(fib_axi_arsize),
        .fib_axi_arburst(fib_axi_arburst),
        .fib_axi_arlock(fib_axi_arlock),
        .fib_axi_arcache(fib_axi_arcache),
        .fib_axi_arprot(fib_axi_arprot),
        .fib_axi_arregion(fib_axi_arregion),
        .fib_axi_arqos(fib_axi_arqos),
        .fib_axi_arvalid(fib_axi_arvalid),
        .fib_axi_arready(fib_axi_arready),
        .fib_axi_rid(fib_axi_rid),
        .fib_axi_rdata(fib_axi_rdata),
        .fib_axi_rresp(fib_axi_rresp),
        .fib_axi_rlast(fib_axi_rlast),
        .fib_axi_rvalid(fib_axi_rvalid),
        .fib_axi_rready(fib_axi_rready)
    );

    wire [1023:0] wrapped_cpu_rx_data;
    wire [127:0] wrapped_cpu_rx_keep;
    wire wrapped_cpu_rx_valid, wrapped_cpu_rx_last;
    wire wrapped_cpu_rx_ready;

    wire [1023:0] wrapped_eth_tx_data[0:3];
    wire [127:0] wrapped_eth_tx_keep[0:3];
    wire wrapped_eth_tx_valid[0:3], wrapped_eth_tx_ready[0:3], wrapped_eth_tx_last[0:3];

    axis_interconnect_out axis_interconnect_out_inst(
        .ACLK(eth_coreclk),
        .ARESETN(~reset),
        .S00_AXIS_ACLK(eth_coreclk),
        .S00_AXIS_ARESETN(~reset),
        .S00_AXIS_TVALID(bus_tx_valid),
        .S00_AXIS_TREADY(bus_tx_ready),
        .S00_AXIS_TDATA(bus_tx_data),
        .S00_AXIS_TKEEP(bus_tx_keep),
        .S00_AXIS_TLAST(bus_tx_last),
        .S00_AXIS_TDEST(bus_tx_dest),
        .M00_AXIS_ACLK(eth_coreclk),
        .M00_AXIS_ARESETN(~reset),
        .M01_AXIS_ACLK(eth_coreclk),
        .M01_AXIS_ARESETN(~reset),
        .M02_AXIS_ACLK(eth_coreclk),
        .M02_AXIS_ARESETN(~reset),
        .M03_AXIS_ACLK(eth_coreclk),
        .M03_AXIS_ARESETN(~reset),
        .M04_AXIS_ACLK(eth_coreclk),
        .M04_AXIS_ARESETN(~reset),

        .M00_AXIS_TVALID(wrapped_eth_tx_valid[0]),
        .M00_AXIS_TREADY(wrapped_eth_tx_ready[0]),
        .M00_AXIS_TDATA(wrapped_eth_tx_data[0]),
        .M00_AXIS_TKEEP(wrapped_eth_tx_keep[0]),
        .M00_AXIS_TLAST(wrapped_eth_tx_last[0]),

        .M01_AXIS_TVALID(wrapped_eth_tx_valid[1]),
        .M01_AXIS_TREADY(wrapped_eth_tx_ready[1]),
        .M01_AXIS_TDATA(wrapped_eth_tx_data[1]),
        .M01_AXIS_TKEEP(wrapped_eth_tx_keep[1]),
        .M01_AXIS_TLAST(wrapped_eth_tx_last[1]),

        .M02_AXIS_TVALID(wrapped_eth_tx_valid[2]),
        .M02_AXIS_TREADY(wrapped_eth_tx_ready[2]),
        .M02_AXIS_TDATA(wrapped_eth_tx_data[2]),
        .M02_AXIS_TKEEP(wrapped_eth_tx_keep[2]),
        .M02_AXIS_TLAST(wrapped_eth_tx_last[2]),

        .M03_AXIS_TVALID(wrapped_eth_tx_valid[3]),
        .M03_AXIS_TREADY(wrapped_eth_tx_ready[3]),
        .M03_AXIS_TDATA(wrapped_eth_tx_data[3]),
        .M03_AXIS_TKEEP(wrapped_eth_tx_keep[3]),
        .M03_AXIS_TLAST(wrapped_eth_tx_last[3]),

        .M04_AXIS_TVALID(wrapped_cpu_rx_valid),
        .M04_AXIS_TREADY(wrapped_cpu_rx_ready),
        .M04_AXIS_TDATA(wrapped_cpu_rx_data),
        .M04_AXIS_TKEEP(wrapped_cpu_rx_keep),
        .M04_AXIS_TLAST(wrapped_cpu_rx_last),

        .M00_AXIS_TDEST(),
        .M01_AXIS_TDEST(),
        .M02_AXIS_TDEST(),
        .M03_AXIS_TDEST(),
        .M04_AXIS_TDEST(),
        .S00_DECODE_ERR()
    );

    generate
        for (j = 0; j < 4; j = j + 1)
        begin
            egress_wrapper egress_wrapper_eth_i(
                .eth_coreclk(eth_coreclk),
                .reset(reset),

                .wrapped_data(wrapped_eth_tx_data[j]),
                .wrapped_keep(wrapped_eth_tx_keep[j]),
                .wrapped_last(wrapped_eth_tx_last[j]),
                .wrapped_valid(wrapped_eth_tx_valid[j]),
                .wrapped_ready(wrapped_eth_tx_ready[j]),

                .data(eth_tx_data[j]),
                .keep(eth_tx_keep[j]),
                .last(eth_tx_last[j]),
                .valid(eth_tx_valid[j]),
                .ready(eth_tx_ready[j])
            );
        end
        egress_wrapper egress_wrapper_cpu_i(
            .eth_coreclk(eth_coreclk),
            .reset(reset),

            .wrapped_data(wrapped_cpu_rx_data),
            .wrapped_keep(wrapped_cpu_rx_keep),
            .wrapped_last(wrapped_cpu_rx_last),
            .wrapped_valid(wrapped_cpu_rx_valid),
            .wrapped_ready(wrapped_cpu_rx_ready),

            .data(cpu_rx_data),
            .keep(cpu_rx_keep),
            .last(cpu_rx_last),
            .valid(cpu_rx_valid),
            .ready(cpu_rx_ready)
        );
    endgenerate
endmodule