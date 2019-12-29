`timescale 1ns / 1ps

module test_rvcore(
    input CLK,
    input nRST,
    
    output wire UART_TX,
    input UART_RX,
    output wire [7:0] nLED
    );

    wire [7:0] LED = 8'hA5;
    assign nLED = ~LED;

    cpu cpu0(
        .CLK(CLK),
        .nRST(nRST),

        .UART_TX(UART_TX),
        .UART_RX(UART_RX),

        .eth_tx_data(),
        .eth_tx_keep(),
        .eth_tx_valid(),
        .eth_tx_ready(1'b0),
        .eth_tx_last(),

        .eth_rx_data(0),
        .eth_rx_keep(0),
        .eth_rx_valid(0),
        .eth_rx_ready(),
        .eth_rx_last(0),

        .eth_axi_lite_awvalid(),
        .eth_axi_lite_awready(0),
        .eth_axi_lite_awaddr(),
        .eth_axi_lite_awprot(),
        .eth_axi_lite_wvalid(),
        .eth_axi_lite_wready(0),
        .eth_axi_lite_wdata(),
        .eth_axi_lite_wstrb(),
        .eth_axi_lite_bresp(0),
        .eth_axi_lite_bvalid(0),
        .eth_axi_lite_bready(),
        .eth_axi_lite_arvalid(),
        .eth_axi_lite_arready(0),
        .eth_axi_lite_araddr(),
        .eth_axi_lite_arprot(),
        .eth_axi_lite_rvalid(0),
        .eth_axi_lite_rready(),
        .eth_axi_lite_rdata(0),
        .eth_axi_lite_rresp(0)
    );
endmodule
