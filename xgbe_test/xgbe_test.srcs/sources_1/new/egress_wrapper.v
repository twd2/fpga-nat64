`timescale 1ns / 1ps

module egress_wrapper(
    input eth_coreclk,
    input reset,

    input [1023:0] wrapped_data,
    input [127:0] wrapped_keep,
    input wrapped_last,
    input wrapped_valid,
    output wire wrapped_ready,

    output wire [63:0] data,
    output wire [7:0] keep,
    output wire last, 
    output wire valid,
    input ready
    );

    assign wrapped_ready = 1'b1;
    wire filtered_ready;
    wire [1023:0] filtered_data = wrapped_data;
    wire [127:0] filtered_keep = wrapped_keep;
    wire filtered_last = wrapped_last;
    wire prog_full;

    // Drop this packet when prog_full.
    reg is_first; // if previous is the last one, this is the first one.
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            is_first <= 1'b1;
        end
        else
        begin
            if (wrapped_valid)
            begin
                is_first <= wrapped_last;
            end
        end
    end

    reg drop_packet;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            drop_packet <= 1'b0;
        end
        else
        begin
            if (is_first)
            begin
                drop_packet <= prog_full;
            end
        end
    end

    wire drop_current = is_first ? prog_full : drop_packet;
    wire filtered_valid = wrapped_valid && !drop_current;

    wire [1023:0] fifo_data;
    wire [127:0] fifo_keep;
    wire fifo_last; 
    wire fifo_valid;
    wire fifo_ready;

    axis_data_fifo_egress axis_data_fifo_egress_i(
        .s_axis_aresetn(~reset),
        .s_axis_aclk(eth_coreclk),

        .s_axis_tvalid(filtered_valid),
        .s_axis_tready(filtered_ready),
        .s_axis_tdata(filtered_data),
        .s_axis_tkeep(filtered_keep),
        .s_axis_tlast(filtered_last),

        .m_axis_tvalid(fifo_valid),
        .m_axis_tready(fifo_ready),
        .m_axis_tdata(fifo_data),
        .m_axis_tkeep(fifo_keep),
        .m_axis_tlast(fifo_last),

        .prog_full(prog_full)
    );

    axis_dwidth_converter_1024_64 axis_dwidth_converter_1024_64_i(
        .aclk(eth_coreclk),
        .aresetn(~reset),

        .s_axis_tvalid(fifo_valid),
        .s_axis_tready(fifo_ready),
        .s_axis_tdata(fifo_data),
        .s_axis_tkeep(fifo_keep),
        .s_axis_tlast(fifo_last),

        .m_axis_tvalid(valid),
        .m_axis_tready(ready),
        .m_axis_tdata(data),
        .m_axis_tkeep(keep),
        .m_axis_tlast(last)
    );
endmodule
