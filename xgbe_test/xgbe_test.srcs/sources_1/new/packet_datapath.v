`timescale 1ns / 1ps

module packet_datapath(
    input eth_coreclk,
    input reset,

    input [1023:0] bus_rx_data,
    input [127:0] bus_rx_keep,
    input bus_rx_last,
    input bus_rx_valid,
    input [2:0] bus_rx_id,
    input bus_rx_error,

    output reg [1023:0] bus_tx_data,
    output reg [127:0] bus_tx_keep,
    output reg bus_tx_last, 
    output wire bus_tx_valid,
    input bus_tx_ready,
    output reg [2:0] bus_tx_dest,

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
    reg bus_tx_valid_reg;
    assign bus_tx_valid = bus_tx_valid_reg;

    reg [6:0] bus_rx_keep_num;
    always @ (*)
    begin : calc_keep_num
        // sum bus_rx_keep[0 to 127] - 1
        // bus_rx_keep[0] is always 1 when bus_rx_last is 1
        // thus, sum bus_rx_keep[0 to 127] - 1 == sum bus_rx_keep[1 to 127]
        integer i;
        bus_rx_keep_num = 0;
        for (i = 1; i < 128; i = i + 1)
            bus_rx_keep_num = bus_rx_keep_num + bus_rx_keep[i];
    end

    // generate FIFOs for packets and their metadata
    reg [1:0] rx_fifo_wen;
    wire [1:0] rx_fifo_ren;
    wire [1023:0] rx_fifo_din;
    wire [1023:0] rx_fifo_dout [0:1];

    wire [1:0] rx_fifo_full_array, rx_fifo_almost_full_array,
                rx_fifo_empty_array, rx_fifo_almost_empty_array;
    /*wire rx_fifo_full = |rx_fifo_full_array,
         rx_fifo_almost_full = |rx_fifo_almost_full_array,
         rx_fifo_empty = |rx_fifo_empty_array,
         rx_fifo_almost_empty = |rx_fifo_almost_empty_array;*/

    reg [1023:0] rx_fifo_data;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            rx_fifo_data <= 0;
        end
        else
        begin
            if (rx_fifo_wen[0])
            begin
                rx_fifo_data <= rx_fifo_din;
            end
        end
    end
    assign rx_fifo_dout[0] = rx_fifo_data;
    // TODO
    assign rx_fifo_full_array[0] = 1'b0;
    assign rx_fifo_almost_full_array[0] = 1'b0;
    assign rx_fifo_empty_array[0] = 1'b0;
    assign rx_fifo_almost_empty_array[0] = 1'b0;

    genvar j;
    generate
        for (j = 1; j < 2; j = j + 1)
        begin : rx_gen_fifo
            fifo_generator_1024 fifo_generator_1024_inst(
                .srst(reset),
                .clk(eth_coreclk),
                .din(rx_fifo_din),
                .wr_en(rx_fifo_wen[j]),
                .rd_en(rx_fifo_ren[j]),
                .dout(rx_fifo_dout[j]),
                .full(rx_fifo_full_array[j]),
                .almost_full(rx_fifo_almost_full_array[j]),
                .empty(rx_fifo_empty_array[j]),
                .almost_empty(rx_fifo_almost_empty_array[j])
            );
        end
    endgenerate

    reg rx_meta_fifo_wen;
    wire [1023:0] rx_meta_fifo_din;

    reg rx_meta_fifo_valid;
    reg [1023:0] rx_meta_fifo_data;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            rx_meta_fifo_valid <= 1'b0;
            rx_meta_fifo_data <= 0;
        end
        else
        begin
            rx_meta_fifo_valid <= rx_meta_fifo_wen;
            rx_meta_fifo_data <= rx_meta_fifo_din;
        end
    end

    reg [3:0] rx_counter;
    assign rx_fifo_din = bus_rx_data;
    assign rx_meta_fifo_din = {984'b0, 8'd4, 5'b0, bus_rx_id, 7'b0, bus_rx_error, 5'b0, rx_counter, bus_rx_keep_num};
    always @ (*)
    begin
        if (bus_rx_valid)
        begin
            rx_fifo_wen[0] = rx_counter == 0;
            rx_fifo_wen[1] = rx_counter != 0;
            rx_meta_fifo_wen = bus_rx_last;
        end
        else
        begin
            rx_fifo_wen = 2'b0;
            rx_meta_fifo_wen = 1'b0;
        end
    end

    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            rx_counter <= 0;
        end
        else
        begin
            if (bus_rx_valid)
            begin
                if (!bus_rx_last)
                begin
                    rx_counter <= rx_counter + 1;
                end
                else
                begin
                    rx_counter <= 0;
                end
            end
        end
    end

    wire sout_valid;
    wire [1023:0] sout_packet, sout_meta;

    packet_pipeline packet_pipeline_inst(
        .eth_coreclk(eth_coreclk),
        .reset(reset),

        .sin_valid(rx_meta_fifo_valid),
        .sin_packet(rx_fifo_dout[0]),
        .sin_meta(rx_meta_fifo_data),

        .sout_valid(sout_valid),
        .sout_packet(sout_packet),
        .sout_meta(sout_meta),

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

    wire tx_meta_fifo_full, tx_meta_fifo_almost_full;
    wire tx_meta_fifo_wen = sout_valid && !tx_meta_fifo_full;
    wire [1023:0] tx_meta_fifo_din = sout_meta;

    wire tx_fifo_full_0, tx_fifo_almost_full_0;
    wire tx_fifo_wen_0 = sout_valid && !tx_fifo_full_0;
    wire [1023:0] tx_fifo_din_0 = sout_packet;

    reg tx_meta_fifo_ren;
    wire [1023:0] tx_meta_fifo_dout;
    wire tx_meta_fifo_empty, tx_meta_fifo_almost_empty;

    fifo_generator_1024 tx_gen_fifo_meta(
        .srst(reset),
        .clk(eth_coreclk),
        .din(tx_meta_fifo_din),
        .wr_en(tx_meta_fifo_wen),
        .rd_en(tx_meta_fifo_ren),
        .dout(tx_meta_fifo_dout),
        .full(tx_meta_fifo_full),
        .almost_full(tx_meta_fifo_almost_full),
        .empty(tx_meta_fifo_empty),
        .almost_empty(tx_meta_fifo_almost_empty)
    );

    reg [1:0] tx_fifo_ren;
    wire [1023:0] tx_fifo_dout [0:1];
    wire [1:0] tx_fifo_empty_array, tx_fifo_almost_empty_array;

    fifo_generator_1024 tx_gen_fifo_0(
        .srst(reset),
        .clk(eth_coreclk),
        .din(tx_fifo_din_0),
        .wr_en(tx_fifo_wen_0),
        .rd_en(tx_fifo_ren[0]),
        .dout(tx_fifo_dout[0]),
        .full(tx_fifo_full_0),
        .almost_full(tx_fifo_almost_full_0),
        .empty(tx_fifo_empty_array[0]),
        .almost_empty(tx_fifo_almost_empty_array[0])
    );

    generate
        for (j = 1; j < 2; j = j + 1)
        begin
            assign rx_fifo_ren[j] = tx_fifo_ren[j];
            assign tx_fifo_dout[j] = rx_fifo_dout[j];
            assign tx_fifo_empty_array[j] = rx_fifo_empty_array[j];
            assign tx_fifo_almost_empty_array[j] = rx_fifo_almost_empty_array[j];
        end
    endgenerate

    reg [3:0] tx_counter;
    reg [1:0] tx_state;
    reg [1023:0] tx_leftover;
    reg [2:0] tx_leftover_dest;
    reg [6:0] tx_leftover_len;
    reg tx_leftover_drop;
    reg [2:0] tx_leftover_type;

    localparam ST_FIRST_LAST = 0;
    localparam ST_DATA = 1;

    reg [127:0] tx_leftover_keep;
    always @ (*)
    begin : decode_keep_num
        integer i;
        for (i = 0; i < 128; i = i + 1)
            tx_leftover_keep[i] = i < tx_leftover_len;
    end

    wire [6:0] tx_meta_limit_lo = tx_meta_fifo_dout[6:0];

    reg [127:0] tx_last_keep;
    always @ (*)
    begin : decode_last_keep_num
        integer i;
        for (i = 0; i < 128; i = i + 1)
            tx_last_keep[i] = i <= (tx_meta_limit_lo + tx_leftover_len);
    end

    wire [3:0] tx_meta_limit_hi = tx_meta_fifo_dout[10:7];
    wire tx_meta_drop = tx_meta_fifo_dout[16];
    wire [2:0] tx_meta_dest = tx_meta_fifo_dout[26:24];
    localparam TYPE_A20 = 3'b000; // add 20 bytes
    localparam TYPE_A28 = 3'b001; // add 28 bytes
    localparam TYPE_R20 = 3'b010; // remove 20 bytes
    localparam TYPE_R28 = 3'b011; // remove 28 bytes
    localparam TYPE_ORIG = 3'b100;
    wire [2:0] tx_meta_type = tx_meta_fifo_dout[34:32];//TYPE_ORIG;
    wire [223:0] tx_meta_prepend = tx_meta_fifo_dout[1023:800];

    wire tx_fifo_sel = tx_counter == 0 ? 1'b0 : 1'b1;

    always @ (*)
    begin
        tx_fifo_ren[0] = 1'b0;
        tx_fifo_ren[1] = 1'b0;
        tx_meta_fifo_ren = 1'b0;
        if (bus_tx_ready || !bus_tx_valid_reg)
        begin
            case (tx_state)
            ST_FIRST_LAST:
            begin
                if (!tx_meta_fifo_empty)
                begin
                    // if decrease packet length and tx_meta_limit_hi == 0
                    if (tx_meta_type == TYPE_R20 || tx_meta_type == TYPE_R28)
                    begin
                        tx_fifo_ren[0] = 1'b1;
                        if (tx_meta_limit_hi == 0)
                        begin
                            tx_meta_fifo_ren = 1'b1;
                        end
                    end
                end
            end
            ST_DATA:
            begin
                tx_fifo_ren[0] = tx_counter == 0;
                tx_fifo_ren[1] = tx_counter != 0;
                if (tx_counter == tx_meta_limit_hi) // last 128B chunk
                begin
                    tx_meta_fifo_ren = 1'b1;
                end
            end
            endcase
        end
    end

    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            tx_counter <= 0;
            tx_state <= ST_FIRST_LAST;
            tx_leftover <= 0;
            tx_leftover_len <= 0;
            tx_leftover_dest <= 3'b0;
            tx_leftover_drop <= 1'b0;
            bus_tx_data <= 0;
            bus_tx_keep <= 0;
            bus_tx_last <= 1'b0;
            bus_tx_valid_reg <= 1'b0;
            bus_tx_dest <= 3'b0;
        end
        else
        begin
            if (bus_tx_ready || !bus_tx_valid_reg)
            begin
                case (tx_state)
                ST_FIRST_LAST:
                begin
                    // transmit leftovers
                    bus_tx_data <= tx_leftover;
                    bus_tx_keep <= tx_leftover_keep;
                    bus_tx_last <= 1'b1;
                    bus_tx_dest <= tx_leftover_dest;
                    tx_leftover_len <= 0;
                    if (tx_leftover_len != 0)
                    begin
                        bus_tx_valid_reg <= !tx_leftover_drop;
                    end
                    else
                    begin
                        bus_tx_valid_reg <= 1'b0;
                    end
                    // and get a new packet to transmit
                    if (!tx_meta_fifo_empty)
                    begin
                        tx_leftover_dest <= tx_meta_dest;
                        tx_leftover_drop <= tx_meta_drop;
                        tx_leftover_type <= tx_meta_type;
                        tx_leftover <= {160'b0, tx_fifo_dout[0][863:0]};
                        case (tx_meta_type[1:0])
                        TYPE_A20:
                        begin
                            tx_leftover[223:0] <= tx_meta_prepend;
                            tx_leftover_len <= 20;
                            tx_state <= ST_DATA;
                            tx_counter <= 0;
                        end
                        TYPE_A28:
                        begin
                            tx_leftover[223:0] <= tx_meta_prepend;
                            tx_leftover_len <= 28;
                            tx_state <= ST_DATA;
                            tx_counter <= 0;
                        end
                        TYPE_R20:
                        begin
                            tx_leftover[863:0] <= tx_fifo_dout[0][863:0];
                            if (tx_meta_limit_hi == 0)
                            begin
                                tx_leftover_len <= tx_meta_limit_lo + 1 - 20;
                                tx_state <= ST_FIRST_LAST;
                                tx_counter <= 0;
                            end
                            else
                            begin
                                tx_leftover_len <= 128 - 20;
                                tx_state <= ST_DATA;
                                tx_counter <= 1;
                            end
                        end
                        TYPE_R28:
                        begin
                            tx_leftover[863:0] <= tx_fifo_dout[0][863:0];
                            if (tx_meta_limit_hi == 0)
                            begin
                                tx_leftover_len <= tx_meta_limit_lo + 1 - 28;
                                tx_state <= ST_FIRST_LAST;
                                tx_counter <= 0;
                            end
                            else
                            begin
                                tx_leftover_len <= 128 - 28;
                                tx_state <= ST_DATA;
                                tx_counter <= 1;
                            end
                        end
                        endcase
                        if (tx_meta_type[2] == 1'b1) // TYPE_ORIG
                        begin
                            tx_leftover_len <= 0;
                            tx_state <= ST_DATA;
                            tx_counter <= 0;
                        end
                    end
                end
                ST_DATA:
                begin
                    bus_tx_dest <= tx_leftover_dest;
                    tx_leftover <= {160'b0, tx_fifo_dout[tx_fifo_sel][1023:1024 - 108 * 8]};
                    case (tx_meta_type[1:0])
                    TYPE_A20:
                    begin
                        bus_tx_data <= {tx_fifo_dout[tx_fifo_sel][1023 - 20 * 8:0], tx_leftover[20 * 8 - 1:0]};
                        tx_leftover[159:0] <= tx_fifo_dout[tx_fifo_sel][1023:1024 - 20 * 8];
                    end
                    TYPE_A28:
                    begin
                        bus_tx_data <= {tx_fifo_dout[tx_fifo_sel][1023 - 28 * 8:0], tx_leftover[28 * 8 - 1:0]};
                        tx_leftover[223:0] <= tx_fifo_dout[tx_fifo_sel][1023:1024 - 28 * 8];
                    end
                    TYPE_R20:
                    begin
                        bus_tx_data <= {tx_fifo_dout[tx_fifo_sel][1023 - 108 * 8:0], tx_leftover[108 * 8 - 1:0]};
                        tx_leftover[863:0] <= tx_fifo_dout[tx_fifo_sel][1023:1024 - 108 * 8];
                    end
                    TYPE_R28:
                    begin
                        bus_tx_data <= {tx_fifo_dout[tx_fifo_sel][1023 - 100 * 8:0], tx_leftover[100 * 8 - 1:0]};
                        tx_leftover[799:0] <= tx_fifo_dout[tx_fifo_sel][1023:1024 - 100 * 8];
                    end
                    endcase
                    if (tx_meta_type[2] == 1'b1) // TYPE_ORIG
                    begin
                        bus_tx_data <= tx_fifo_dout[tx_fifo_sel];
                    end
                    if (tx_counter == tx_meta_limit_hi) // last 128B chunk
                    begin
                        if (tx_meta_limit_lo + tx_leftover_len > 127)
                        begin
                            tx_leftover_len <= tx_meta_limit_lo + tx_leftover_len + 1 - 128;
                            bus_tx_keep <= 128'hffffffffffffffffffffffffffffffff;
                            bus_tx_valid_reg <= !tx_leftover_drop;
                            bus_tx_last <= 1'b0;
                        end
                        else
                        begin
                            tx_leftover_len <= 0;
                            bus_tx_keep <= tx_last_keep;
                            bus_tx_valid_reg <= !tx_leftover_drop;
                            bus_tx_last <= 1'b1;
                        end
                        tx_state <= ST_FIRST_LAST;
                        tx_counter <= 0;
                    end
                    else
                    begin
                        tx_leftover_len <= tx_leftover_len;
                        bus_tx_keep <= 128'hffffffffffffffffffffffffffffffff;
                        bus_tx_valid_reg <= !tx_leftover_drop;
                        bus_tx_last <= 1'b0;
                        tx_counter <= tx_counter + 1;
                    end
                end
                default:
                begin
                    tx_counter <= 0;
                    tx_state <= ST_FIRST_LAST;
                end
                endcase
            end
        end
    end
endmodule
