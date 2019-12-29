`timescale 1ns / 1ps

module address_mapping_cache(
    input eth_coreclk,
    input reset,

    input [15:0] atime_counter,

    input [128 * 1 - 1:0] s0_addrs,
    output wire [128 * 1 - 1:0] s3_new_addrs,
    output wire [1 - 1:0] s3_new_addr_valids,
    output wire [16 * 1 - 1:0] s3_new_addr_atimes,

    // interface for updating access time
    input [128 * 1 - 1:0] update_addr_i,
    input [1 - 1:0] update_valid_i,

    // for cpu
    output reg ready,
    input valid,
    input [4 * 4 - 1:0] write_en,
    input [127:0] addr,
    input hash_en,
    input [3:0] entry_valid_i,
    input [128 * 4 - 1 : 0] entry_tag_i,
    input [128 * 4 - 1 : 0] entry_value_i,
    input [16 * 4 - 1 : 0] entry_atime_i,
    output reg [3:0] entry_valid_o,
    output reg [128 * 4 - 1 : 0] entry_tag_o,
    output reg [128 * 4 - 1 : 0] entry_value_o,
    output reg [16 * 4 - 1 : 0] entry_atime_o,
    output reg [4 - 1 : 0] entry_match_o
    );

    localparam TIME_TO_LIVE = 60; // TODO: configurable

    localparam NUM_PORTS = 1;
    localparam NUM_WAYS = 4;
    localparam VALUE_SIZE = 16;
    localparam WAY_SIZE = 1 + 16 + VALUE_SIZE + 2;
    localparam VALID_OFFSET = 0;
    localparam TAG_OFFSET = 1;
    localparam VALUE_OFFSET = 17;
    localparam ATIME_OFFSET = VALUE_OFFSET + VALUE_SIZE;

    function [9:0] iphash;
        input [127:0] ip;
        reg c1, c2, c3, c4, c5, c6;
        reg [15:0] sum1, sum2, sum3, sum4, sum5, sum6;
        reg [15:0] sum;
    begin
        {c1, sum1} = ip[0 * 16 +: 16] + ip[1 * 16 +: 16];
        {c2, sum2} = ip[2 * 16 +: 16] + ip[3 * 16 +: 16];
        {c3, sum3} = ip[4 * 16 +: 16] + ip[5 * 16 +: 16];
        {c4, sum4} = ip[6 * 16 +: 16] + ip[7 * 16 +: 16];
        {c5, sum5} = sum1 + sum2 + (c1 ^ c2);
        {c6, sum6} = sum3 + sum4 + (c3 ^ c4);
        sum = sum5 ^ sum6 ^ c5 ^ c6;
        iphash = {4'd0, sum[15:10]} ^ sum[9:0];
    end
    endfunction

    function [NUM_WAYS * WAY_SIZE - 1:0] to_mask;
        input [NUM_WAYS * 4 - 1:0] wen;
        integer i;
    begin
        to_mask = 0;
        for (i = 0; i < NUM_WAYS; i = i + 1)
        begin
            to_mask[WAY_SIZE * i +: WAY_SIZE] = {{2{wen[4 * i + 3]}}, {VALUE_SIZE{wen[4 * i + 2]}}, {16{wen[4 * i + 1]}}, wen[4 * i + 0]};
        end
    end
    endfunction

    function [NUM_WAYS * WAY_SIZE - 1:0] to_atime_mask;
        input [NUM_WAYS - 1:0] way_mask;
        integer i;
    begin
        to_atime_mask = 0;
        for (i = 0; i < NUM_WAYS; i = i + 1)
        begin
            to_atime_mask[WAY_SIZE * i + ATIME_OFFSET +: 2] = {2{way_mask[i]}};
        end
    end
    endfunction

    function [NUM_WAYS * WAY_SIZE * 8 - 1:0] atime_to_ways;
        input [15:0] atime;
        integer i;
    begin
        atime_to_ways = 0;
        for (i = 0; i < NUM_WAYS; i = i + 1)
        begin
            atime_to_ways[WAY_SIZE * i * 8 + ATIME_OFFSET * 8 +: 16] = atime;
        end
    end
    endfunction

    wire [NUM_WAYS * WAY_SIZE - 1:0] bram_wea [0:NUM_PORTS - 1];
    wire [9:0] bram_addra [0:NUM_PORTS - 1];
    wire [NUM_WAYS * WAY_SIZE * 8 - 1:0] bram_dina [0:NUM_PORTS - 1], bram_douta [0:NUM_PORTS - 1];
    reg [NUM_WAYS * WAY_SIZE - 1:0] bram_web;
    wire [9:0] bram_addrb;
    reg [NUM_WAYS * WAY_SIZE * 8 - 1:0] bram_dinb;
    wire [NUM_WAYS * WAY_SIZE * 8 - 1:0] bram_doutb;
    blk_mem_gen_for_amc blk_mem_gen_for_amc_0(
        .clka(eth_coreclk),
        .wea(bram_wea[0]),
        .addra(bram_addra[0]),
        .dina(bram_dina[0]),
        .douta(bram_douta[0]),
        .clkb(eth_coreclk),
        .web(bram_web),
        .addrb(bram_addrb),
        .dinb(bram_dinb),
        .doutb(bram_doutb)
    );

    genvar j;
    generate
        for (j = 1; j < NUM_PORTS; j = j + 1)
        begin
            blk_mem_gen_for_amc blk_mem_gen_for_amc_i(
                .clka(eth_coreclk),
                .wea(bram_wea[j]),
                .addra(bram_addra[j]),
                .dina(bram_dina[j]),
                .douta(bram_douta[j]),
                .clkb(eth_coreclk),
                .web(bram_web),
                .addrb(bram_addrb),
                .dinb(bram_dinb),
                .doutb()
            );
        end
    endgenerate

    // query pipeline
    genvar i;
    generate
        for (j = 0; j < NUM_PORTS; j = j + 1)
        begin
            wire [127:0] s0_addr;
            reg [VALUE_SIZE * 8 - 1:0] s3_new_addr;
            reg s3_new_addr_valid;
            reg [15:0] s3_new_addr_atime;

            assign s0_addr = s0_addrs[128 * j +: 128];
            assign s3_new_addrs[VALUE_SIZE * 8 * j +: VALUE_SIZE * 8] = s3_new_addr;
            assign s3_new_addr_valids[j] = s3_new_addr_valid;
            assign s3_new_addr_atimes[16 * j +: 16] = s3_new_addr_atime;

            wire [9:0] s0_hash = iphash(s0_addr);
            assign bram_wea[j] = 0;
            assign bram_dina[j] = 0;
            assign bram_addra[j] = s0_hash;
            reg [127:0] s1_addr;
            wire s1_valid [0:NUM_WAYS - 1], s1_match [0:NUM_WAYS - 1], s1_alive [0:NUM_WAYS - 1];
            wire [127:0] s1_tag [0:NUM_WAYS - 1];
            wire [VALUE_SIZE * 8 - 1:0] s1_value [0:NUM_WAYS - 1];
            wire [15:0] s1_atime [0:NUM_WAYS - 1];

            for (i = 0; i < NUM_WAYS; i = i + 1)
            begin
                assign s1_valid[i] = bram_douta[j][WAY_SIZE * 8 * i + 0];
                assign s1_tag[i] = bram_douta[j][WAY_SIZE * 8 * i + TAG_OFFSET * 8 +: 128];
                assign s1_value[i] = bram_douta[j][WAY_SIZE * 8 * i + VALUE_OFFSET * 8 +: VALUE_SIZE * 8];
                assign s1_atime[i] = bram_douta[j][WAY_SIZE * 8 * i + ATIME_OFFSET * 8 +: 16];
                assign s1_match[i] = s1_tag[i] == s1_addr;
                assign s1_alive[i] = (atime_counter - s1_atime[i]) <= TIME_TO_LIVE;
            end

            reg s2_valid [0:NUM_WAYS - 1], s2_match [0:NUM_WAYS - 1], s2_alive [0:NUM_WAYS - 1];
            reg [127:0] s2_tag [0:NUM_WAYS - 1];
            reg [VALUE_SIZE * 8 - 1:0] s2_value [0:NUM_WAYS - 1];
            reg [15:0] s2_atime [0:NUM_WAYS - 1];
            wire s2_hit [0:NUM_WAYS - 1];

            for (i = 0; i < NUM_WAYS; i = i + 1)
            begin
                assign s2_hit[i] = s2_valid[i] && s2_match[i] && s2_alive[i];
            end

            always @ (posedge eth_coreclk or posedge reset)
            begin : lookup_blk
                integer i;
                if (reset)
                begin
                    s1_addr <= 0;
                    for (i = 0; i < NUM_WAYS; i = i + 1)
                    begin
                        s2_valid[i] <= 0;
                        s2_match[i] <= 0;
                        s2_alive[i] <= 0;
                        s2_tag[i] <= 0;
                        s2_value[i] <= 0;
                        s2_atime[i] <= 0;
                    end
                    s3_new_addr <= 0;
                    s3_new_addr_valid <= 0;
                    s3_new_addr_atime <= 0;
                end
                else
                begin
                    s1_addr <= s0_addr;
        
                    for (i = 0; i < NUM_WAYS; i = i + 1)
                    begin
                        s2_valid[i] <= s1_valid[i];
                        s2_match[i] <= s1_match[i];
                        s2_alive[i] <= s1_alive[i];
                        s2_tag[i] <= s1_tag[i];
                        s2_value[i] <= s1_value[i];
                        s2_atime[i] <= s1_atime[i];
                    end
        
                    for (i = 0; i < NUM_WAYS; i = i + 1)
                    begin
                        if (i == 0 || s2_hit[i])
                        begin
                            s3_new_addr <= s2_value[i];
                            s3_new_addr_valid <= s2_hit[i];
                            s3_new_addr_atime <= s2_atime[i];
                        end
                    end
                end
            end
        end
    endgenerate

    // update buffer
    wire [127:0] update_addr [0:1];
    wire update_valid [0:1];
    reg update_ready [0:1];
    generate
        for (j = 0; j < NUM_PORTS; j = j + 1)
        begin
            wire fifo_full, fifo_empty;
            fifo_generator_128 fifo_generator_128_i(
                .clk(eth_coreclk),
                .srst(reset),
                .din(update_addr_i[128 * j +: 128]),
                .wr_en(update_valid_i[j] && !fifo_full),
                .rd_en(update_ready[j] && update_valid[j]),
                .dout(update_addr[j]),
                .full(fifo_full),
                .almost_full(),
                .empty(fifo_empty),
                .almost_empty()
            );
            assign update_valid[j] = !fifo_empty;
        end
    endgenerate

    reg bram_hash_en;
    reg [127:0] bram_addr;
    assign bram_addrb = bram_hash_en ? iphash(bram_addr) : bram_addr;

    wire bram_entry_valid [0:3];
    wire [127:0] bram_entry_tag [0:3];
    wire [VALUE_SIZE * 8 - 1:0] bram_entry_value [0:3];
    wire [15:0] bram_entry_atime [0:3];
    wire [3:0] bram_entry_match;
    generate
        for (i = 0; i < NUM_WAYS; i = i + 1)
        begin
            assign bram_entry_valid[i] = bram_doutb[WAY_SIZE * 8 * i + 0];
            assign bram_entry_tag[i] = bram_doutb[WAY_SIZE * 8 * i + TAG_OFFSET * 8 +: 128];
            assign bram_entry_value[i] = bram_doutb[WAY_SIZE * 8 * i + VALUE_OFFSET * 8 +: VALUE_SIZE * 8];
            assign bram_entry_atime[i] = bram_doutb[WAY_SIZE * 8 * i + ATIME_OFFSET * 8 +: 16];
            assign bram_entry_match[i] = bram_entry_valid[i] && (bram_entry_tag[i] == bram_addr);
        end
    endgenerate

    reg granted_update_request;
    reg current_update_request;

    // update FSM
    localparam ST_WAIT = 0;
    localparam ST_CPU_RADDR = 1;
    localparam ST_CPU_RDATA = 2;
    localparam ST_UPDATE_ADDR = 3;
    localparam ST_UPDATE_DATA = 4;
    localparam ST_FINISH = 5;
    integer state;
    always @ (posedge eth_coreclk or posedge reset)
    begin : update_blk
        integer i, j;
        if (reset)
        begin
            state <= ST_WAIT;
            ready <= 1'b0;
            granted_update_request <= 0;
            current_update_request <= 0;
            bram_hash_en <= 1'b0;
            bram_addr <= 0;
            bram_dinb <= 0;
            bram_web <= 0;
            entry_valid_o <= 0;
            entry_tag_o <= 0;
            entry_value_o <= 0;
            entry_atime_o <= 0;
            entry_match_o <= 0;
            for (j = 0; j < NUM_PORTS; j = j + 1)
            begin
                update_ready[j] <= 1'b0;
            end
        end
        else
        begin
            ready <= 1'b0;
            for (j = 0; j < NUM_PORTS; j = j + 1)
            begin
                update_ready[j] <= 1'b0;
            end
            bram_web <= 0;
            case (state)
            ST_WAIT:
            begin
                if (valid)
                begin
                    bram_hash_en <= hash_en;
                    bram_addr <= addr;
                    for (i = 0; i < NUM_WAYS; i = i + 1)
                    begin
                        bram_dinb[WAY_SIZE * 8 * i + 0] <= entry_valid_i[i];
                        bram_dinb[WAY_SIZE * 8 * i + TAG_OFFSET * 8 +: 128] <= entry_tag_i[128 * i +: 128];
                        bram_dinb[WAY_SIZE * 8 * i + VALUE_OFFSET * 8 +: VALUE_SIZE * 8] <= entry_value_i[VALUE_SIZE * 8 * i +: VALUE_SIZE * 8];
                        bram_dinb[WAY_SIZE * 8 * i + ATIME_OFFSET * 8 +: 16] <= entry_atime_i[16 * i +: 16];
                    end
                    bram_web <= to_mask(write_en);
                    if (|write_en)
                    begin
                        ready <= 1'b1;
                        state <= ST_FINISH;
                    end
                    else
                    begin
                        state <= ST_CPU_RADDR;
                    end
                end
                else if (NUM_PORTS == 2)
                begin
                    // update atime
                    bram_hash_en <= 1'b1;
                    if ((update_valid[0] && update_valid[1] && granted_update_request == 0)
                        || (update_valid[0] && !update_valid[1]))
                    begin
                        // process 0
                        bram_addr <= update_addr[0];
                        current_update_request <= 0;
                        granted_update_request <= 1;
                        state <= ST_UPDATE_ADDR;
                    end
                    if ((update_valid[0] && update_valid[1] && granted_update_request == 1)
                        || (!update_valid[0] && update_valid[1]))
                    begin
                        // process 1
                        bram_addr <= update_addr[1];
                        current_update_request <= 1;
                        granted_update_request <= 0;
                        state <= ST_UPDATE_ADDR;
                    end
                end
                else if (NUM_PORTS == 1)
                begin
                    bram_hash_en <= 1'b1;
                    if (update_valid[0])
                    begin
                        bram_addr <= update_addr[0];
                        current_update_request <= 0;
                        state <= ST_UPDATE_ADDR;
                    end
                end
            end
            ST_CPU_RADDR:
            begin
                state <= ST_CPU_RDATA;
            end
            ST_CPU_RDATA:
            begin
                for (i = 0; i < NUM_WAYS; i = i + 1)
                begin
                    entry_valid_o[i] <= bram_entry_valid[i];
                    entry_tag_o[128 * i +: 128] <= bram_entry_tag[i];
                    entry_value_o[VALUE_SIZE * 8 * i +: VALUE_SIZE * 8] <= bram_entry_value[i];
                    entry_atime_o[16 * i +: 16] <= bram_entry_atime[i];
                    entry_match_o[i] <= bram_entry_match[i];
                end
                ready <= 1'b1;
                state <= ST_FINISH;
            end
            ST_UPDATE_ADDR:
            begin
                state <= ST_UPDATE_DATA;
            end
            ST_UPDATE_DATA:
            begin
                bram_web <= to_atime_mask(bram_entry_match);
                bram_dinb <= atime_to_ways(atime_counter);
                for (j = 0; j < NUM_PORTS; j = j + 1)
                begin
                    update_ready[j] <= current_update_request == j;
                end
                state <= ST_FINISH;
            end
            ST_FINISH:
            begin
                // delay 1 tick
                state <= ST_WAIT;
            end
            default:
                state <= ST_WAIT;
            endcase
        end
    end
endmodule
