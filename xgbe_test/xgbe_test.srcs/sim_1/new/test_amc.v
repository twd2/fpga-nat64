`timescale 1ns / 1ps

module test_amc();
    reg eth_coreclk;
    reg reset;
    reg [15:0] atime_counter;
    reg [128 * 2 - 1:0] s0_addrs;
    wire [128 * 2 - 1:0] s3_new_addrs;
    wire [1:0] s3_new_addr_valids;
    wire [16 * 2 - 1:0] s3_new_addr_atimes;
    reg [128 * 2 - 1:0] update_addr_i;
    reg [1:0] update_valid_i;
    wire ready;
    reg valid;
    reg [4 * 4 - 1:0] write_en;
    reg [127:0] addr;
    reg hash_en;
    reg [3:0] entry_valid_i;
    reg [128 * 4 - 1 : 0] entry_tag_i;
    reg [128 * 4 - 1 : 0] entry_value_i;
    reg [16 * 4 - 1 : 0] entry_atime_i;
    wire [3:0] entry_valid_o;
    wire [128 * 4 - 1 : 0] entry_tag_o;
    wire [128 * 4 - 1 : 0] entry_value_o;
    wire [16 * 4 - 1 : 0] entry_atime_o;
    wire [4 - 1 : 0] entry_match_o;

    address_mapping_cache dut(
        .eth_coreclk(eth_coreclk),
        .reset(reset),
        .atime_counter(atime_counter),
        .s0_addrs(s0_addrs),
        .s3_new_addrs(s3_new_addrs),
        .s3_new_addr_valids(s3_new_addr_valids),
        .s3_new_addr_atimes(s3_new_addr_atimes),
        .update_addr_i(update_addr_i),
        .update_valid_i(update_valid_i),
        .ready(ready),
        .valid(valid),
        .write_en(write_en),
        .addr(addr),
        .hash_en(hash_en),
        .entry_valid_i(entry_valid_i),
        .entry_tag_i(entry_tag_i),
        .entry_value_i(entry_value_i),
        .entry_atime_i(entry_atime_i),
        .entry_valid_o(entry_valid_o),
        .entry_tag_o(entry_tag_o),
        .entry_value_o(entry_value_o),
        .entry_atime_o(entry_atime_o),
        .entry_match_o(entry_match_o)
    );
    
    initial
    begin
        reset = 1;
        #11.5;
        reset = 0;
        s0_addrs = {128'h42b60c2a, 128'h41b60c2a};
    end
    
    always
    begin
        eth_coreclk = 1;
        #1;
        eth_coreclk = 0;
        #1;
    end
    
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            atime_counter <= 0;
        end
        else
        begin
            atime_counter <= atime_counter + 1;
        end
    end
 
    initial
    begin
        update_addr_i <= 0;
        update_valid_i <= 0;
        #81.9;
        update_addr_i <= 128'h41b60c2a;
        update_valid_i <= 1'b1;
        #2;
        update_valid_i <= 0;
    end
 
    integer state;
    integer counter;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            state <= 0;
            counter <= 0;
        end
        else
        begin
            case (state)
            0:
            begin
                state <= state + 1;
            end
            1:
            begin
                valid <= 1;
                write_en <= 0;
                addr <= 128'h41b60c2a;
                hash_en <= 1;
                state <= state + 1;
            end
            2:
            begin
                if (ready)
                begin
                    valid <= 0;
                    state <= state + 1;
                end
            end
            3:
            begin
                valid <= 1;
                write_en <= {4{1'b1}};
                addr <= 128'h41b60c2a;
                hash_en <= 1;
                entry_valid_i <= 1'b1;
                entry_tag_i <= 128'h41b60c2a;
                entry_value_i <= 32'h0100000a;
                entry_atime_i <= atime_counter;
                state <= state + 1;
            end
            4:
            begin
                if (ready)
                begin
                    valid <= 0;
                    state <= state + 1;
                end
            end
            5:
            begin
                valid <= 1;
                write_en <= 0;
                addr <= 128'h41b60c2a;
                hash_en <= 1;
                state <= state + 1;
            end
            6:
            begin
                if (ready)
                begin
                    valid <= 0;
                    state <= state + 1;
                end
                counter <= 0;
            end
            7:
            begin
                if (counter == 40)
                begin
                    state <= state + 1;
                end
                else
                begin
                    counter <= counter + 1;
                end
            end
            8:
            begin
                valid <= 1;
                write_en <= 0;
                addr <= 128'h41b60c2a;
                hash_en <= 1;
                state <= state + 1;
            end
            9:
            begin
                if (ready)
                begin
                    valid <= 0;
                    state <= state + 1;
                end
            end
            10:
            begin
            end
            default:
            begin
                state <= 0;
            end
            endcase
        end
    end
endmodule
