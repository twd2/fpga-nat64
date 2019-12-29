`timescale 1ns / 1ps

module mac_test(
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

    generate
        for (j = 0; j < 4; j = j + 1)
        begin
            axis_data_fifo_64 axis_data_fifo_64_i(
                .s_axis_aresetn(~reset),
                .s_axis_aclk(eth_coreclk),
                .s_axis_tvalid(eth_rx_valid[j]),
                .s_axis_tready(),
                .s_axis_tdata(eth_rx_data[j]),
                .s_axis_tkeep(eth_rx_keep[j]),
                .s_axis_tlast(eth_rx_last[j]),
                .m_axis_tvalid(eth_tx_valid[j ^ 1]),
                .m_axis_tready(eth_tx_ready[j ^ 1]),
                .m_axis_tdata(eth_tx_data[j ^ 1]),
                .m_axis_tkeep(eth_tx_keep[j ^ 1]),
                .m_axis_tlast(eth_tx_last[j ^ 1])
            );
        end
    endgenerate
endmodule