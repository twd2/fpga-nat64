`timescale 1ns / 1ps

module packet_pipeline_registers(
    input eth_coreclk,
    input reset,

    input axi_lite_awvalid,
    output reg axi_lite_awready,
    input [31:0] axi_lite_awaddr,
    input [2:0] axi_lite_awprot, // unused
    input axi_lite_wvalid,
    output reg axi_lite_wready,
    input [63:0] axi_lite_wdata,
    input [7:0] axi_lite_wstrb, // unused
    output wire [1:0] axi_lite_bresp,
    output reg axi_lite_bvalid,
    input axi_lite_bready,
    input axi_lite_arvalid,
    output reg axi_lite_arready,
    input [31:0] axi_lite_araddr,
    input [2:0] axi_lite_arprot, // unused
    output reg axi_lite_rvalid,
    input axi_lite_rready,
    output reg [63:0] axi_lite_rdata,
    output wire [1:0] axi_lite_rresp,

    output wire [15:0] atime_counter,
    output wire [48 * 4 - 1 : 0] mac_addr,
    output wire [16 * 4 - 1 : 0] mtu,
    output wire [64 * 4 - 1 : 0] conf,
    output wire [95:0] ipv4_converted_prefix,
    output wire [95:0] ipv4_translatable_prefix,
    output wire [31:0] ipv6_converted_prefix,
    output wire [31:0] ipv6_converted_mask,
    output wire [31:0] ipv4_pool_prefix,
    output wire [31:0] ipv4_pool_mask,
    output wire [15:0] default_nexthop_id,

    // connect to address mapping cache
    input amc_ready,
    output reg amc_valid,
    output wire [4 * 4 - 1:0] amc_write_en,
    output wire [127:0] amc_addr,
    output wire amc_hash_en,
    output wire [3:0] amc_entry_valid_i,
    output wire [128 * 4 - 1 : 0] amc_entry_tag_i,
    output wire [128 * 4 - 1 : 0] amc_entry_value_i,
    output wire [16 * 4 - 1 : 0] amc_entry_atime_i,
    input [3:0] amc_entry_valid_o,
    input [128 * 4 - 1 : 0] amc_entry_tag_o,
    input [128 * 4 - 1 : 0] amc_entry_value_o,
    input [16 * 4 - 1 : 0] amc_entry_atime_o,
    input [4 - 1 : 0] amc_entry_match_o,

    // connect to address resolution cache
    input arc_ready,
    output reg arc_valid,
    output wire [4 * 4 - 1:0] arc_write_en,
    output wire [127:0] arc_addr,
    output wire arc_hash_en,
    output wire [3:0] arc_entry_valid_i,
    output wire [128 * 4 - 1 : 0] arc_entry_tag_i,
    output wire [48 * 4 - 1 : 0] arc_entry_value_i,
    output wire [16 * 4 - 1 : 0] arc_entry_atime_i,
    input [3:0] arc_entry_valid_o,
    input [128 * 4 - 1 : 0] arc_entry_tag_o,
    input [48 * 4 - 1 : 0] arc_entry_value_o,
    input [16 * 4 - 1 : 0] arc_entry_atime_o,
    input [4 - 1 : 0] arc_entry_match_o
    );

/******************************* generated code *********************************/
    localparam ADDR_MSB = 9;
    localparam ADDR_LSB = 3;

    localparam ADDR_VENDOR = 0;
    localparam ADDR_CLOCK = 1;
    localparam ADDR_MAC_0 = 2;
    localparam ADDR_MAC_1 = 3;
    localparam ADDR_MAC_2 = 4;
    localparam ADDR_MAC_3 = 5;
    localparam ADDR_MTU_0 = 6;
    localparam ADDR_MTU_1 = 7;
    localparam ADDR_MTU_2 = 8;
    localparam ADDR_MTU_3 = 9;
    localparam ADDR_CONFIG_0 = 10;
    localparam ADDR_CONFIG_1 = 11;
    localparam ADDR_CONFIG_2 = 12;
    localparam ADDR_CONFIG_3 = 13;
    localparam ADDR_IPV4_CONVERTED_PREFIX = 14;
    localparam ADDR_IPV4_CONVERTED_PREFIX_HI = 15;
    localparam ADDR_IPV4_TRANSLATABLE_PREFIX = 16;
    localparam ADDR_IPV4_TRANSLATABLE_PREFIX_HI = 17;
    localparam ADDR_IPV6_CONVERTED_PREFIX = 18;
    localparam ADDR_IPV6_CONVERTED_MASK = 19;
    localparam ADDR_IPV4_POOL_PREFIX = 20;
    localparam ADDR_IPV4_POOL_MASK = 21;
    localparam ADDR_DEFAULT_NEXTHOP_ID = 22;
    localparam ADDR_AMC_WRITE_EN = 23;
    localparam ADDR_AMC_ADDR = 24;
    localparam ADDR_AMC_ADDR_HI = 25;
    localparam ADDR_AMC_HASH_EN = 26;
    localparam ADDR_AMC_VALID = 27;
    localparam ADDR_AMC_MATCH = 28;
    localparam ADDR_AMC_TAG_0 = 29;
    localparam ADDR_AMC_TAG_1 = 30;
    localparam ADDR_AMC_TAG_2 = 31;
    localparam ADDR_AMC_TAG_3 = 32;
    localparam ADDR_AMC_TAG_HI_0 = 33;
    localparam ADDR_AMC_TAG_HI_1 = 34;
    localparam ADDR_AMC_TAG_HI_2 = 35;
    localparam ADDR_AMC_TAG_HI_3 = 36;
    localparam ADDR_AMC_VALUE_0 = 37;
    localparam ADDR_AMC_VALUE_1 = 38;
    localparam ADDR_AMC_VALUE_2 = 39;
    localparam ADDR_AMC_VALUE_3 = 40;
    localparam ADDR_AMC_VALUE_HI_0 = 41;
    localparam ADDR_AMC_VALUE_HI_1 = 42;
    localparam ADDR_AMC_VALUE_HI_2 = 43;
    localparam ADDR_AMC_VALUE_HI_3 = 44;
    localparam ADDR_AMC_ATIME_0 = 45;
    localparam ADDR_AMC_ATIME_1 = 46;
    localparam ADDR_AMC_ATIME_2 = 47;
    localparam ADDR_AMC_ATIME_3 = 48;
    localparam ADDR_ARC_WRITE_EN = 49;
    localparam ADDR_ARC_ADDR = 50;
    localparam ADDR_ARC_ADDR_HI = 51;
    localparam ADDR_ARC_ADDR_EXTRA = 52;
    localparam ADDR_ARC_HASH_EN = 53;
    localparam ADDR_ARC_VALID = 54;
    localparam ADDR_ARC_MATCH = 55;
    localparam ADDR_ARC_TAG_0 = 56;
    localparam ADDR_ARC_TAG_1 = 57;
    localparam ADDR_ARC_TAG_2 = 58;
    localparam ADDR_ARC_TAG_3 = 59;
    localparam ADDR_ARC_TAG_HI_0 = 60;
    localparam ADDR_ARC_TAG_HI_1 = 61;
    localparam ADDR_ARC_TAG_HI_2 = 62;
    localparam ADDR_ARC_TAG_HI_3 = 63;
    localparam ADDR_ARC_TAG_EXTRA_0 = 64;
    localparam ADDR_ARC_TAG_EXTRA_1 = 65;
    localparam ADDR_ARC_TAG_EXTRA_2 = 66;
    localparam ADDR_ARC_TAG_EXTRA_3 = 67;
    localparam ADDR_ARC_VALUE_0 = 68;
    localparam ADDR_ARC_VALUE_1 = 69;
    localparam ADDR_ARC_VALUE_2 = 70;
    localparam ADDR_ARC_VALUE_3 = 71;
    localparam ADDR_ARC_ATIME_0 = 72;
    localparam ADDR_ARC_ATIME_1 = 73;
    localparam ADDR_ARC_ATIME_2 = 74;
    localparam ADDR_ARC_ATIME_3 = 75;

    wire [63:0] reg_vendor = 64'h2222222222222223;
    reg [63:0] reg_clock;
    reg [63:0] reg_mac_0;
    reg [63:0] reg_mac_1;
    reg [63:0] reg_mac_2;
    reg [63:0] reg_mac_3;
    reg [63:0] reg_mtu_0;
    reg [63:0] reg_mtu_1;
    reg [63:0] reg_mtu_2;
    reg [63:0] reg_mtu_3;
    reg [63:0] reg_config_0;
    reg [63:0] reg_config_1;
    reg [63:0] reg_config_2;
    reg [63:0] reg_config_3;
    reg [63:0] reg_ipv4_converted_prefix;
    reg [63:0] reg_ipv4_converted_prefix_hi;
    reg [63:0] reg_ipv4_translatable_prefix;
    reg [63:0] reg_ipv4_translatable_prefix_hi;
    reg [63:0] reg_ipv6_converted_prefix;
    reg [63:0] reg_ipv6_converted_mask;
    reg [63:0] reg_ipv4_pool_prefix;
    reg [63:0] reg_ipv4_pool_mask;
    reg [63:0] reg_default_nexthop_id;
    reg [63:0] reg_amc_write_en;
    reg [63:0] reg_amc_addr;
    reg [63:0] reg_amc_addr_hi;
    reg [63:0] reg_amc_hash_en;
    reg [63:0] reg_amc_valid;
    reg [63:0] reg_amc_match;
    reg [63:0] reg_amc_tag_0;
    reg [63:0] reg_amc_tag_1;
    reg [63:0] reg_amc_tag_2;
    reg [63:0] reg_amc_tag_3;
    reg [63:0] reg_amc_tag_hi_0;
    reg [63:0] reg_amc_tag_hi_1;
    reg [63:0] reg_amc_tag_hi_2;
    reg [63:0] reg_amc_tag_hi_3;
    reg [63:0] reg_amc_value_0;
    reg [63:0] reg_amc_value_1;
    reg [63:0] reg_amc_value_2;
    reg [63:0] reg_amc_value_3;
    reg [63:0] reg_amc_value_hi_0;
    reg [63:0] reg_amc_value_hi_1;
    reg [63:0] reg_amc_value_hi_2;
    reg [63:0] reg_amc_value_hi_3;
    reg [63:0] reg_amc_atime_0;
    reg [63:0] reg_amc_atime_1;
    reg [63:0] reg_amc_atime_2;
    reg [63:0] reg_amc_atime_3;
    reg [63:0] reg_arc_write_en;
    reg [63:0] reg_arc_addr;
    reg [63:0] reg_arc_addr_hi;
    reg [63:0] reg_arc_addr_extra;
    reg [63:0] reg_arc_hash_en;
    reg [63:0] reg_arc_valid;
    reg [63:0] reg_arc_match;
    reg [63:0] reg_arc_tag_0;
    reg [63:0] reg_arc_tag_1;
    reg [63:0] reg_arc_tag_2;
    reg [63:0] reg_arc_tag_3;
    reg [63:0] reg_arc_tag_hi_0;
    reg [63:0] reg_arc_tag_hi_1;
    reg [63:0] reg_arc_tag_hi_2;
    reg [63:0] reg_arc_tag_hi_3;
    reg [63:0] reg_arc_tag_extra_0;
    reg [63:0] reg_arc_tag_extra_1;
    reg [63:0] reg_arc_tag_extra_2;
    reg [63:0] reg_arc_tag_extra_3;
    reg [63:0] reg_arc_value_0;
    reg [63:0] reg_arc_value_1;
    reg [63:0] reg_arc_value_2;
    reg [63:0] reg_arc_value_3;
    reg [63:0] reg_arc_atime_0;
    reg [63:0] reg_arc_atime_1;
    reg [63:0] reg_arc_atime_2;
    reg [63:0] reg_arc_atime_3;

    wire reg_write_en, reg_write_amc_regs, reg_write_arc_regs;
    wire [31:0] reg_write_addr, reg_read_addr;
    wire [63:0] reg_write_val;
    reg [63:0] reg_read_val;

    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            reg_mac_0 <= 48'h315f32445754;
            reg_mac_1 <= 48'h325f32445754;
            reg_mac_2 <= 48'h335f32445754;
            reg_mac_3 <= 48'h345f32445754;
            reg_mtu_0 <= 1500;
            reg_mtu_1 <= 1500;
            reg_mtu_2 <= 1500;
            reg_mtu_3 <= 1500;
            reg_config_0 <= 3'b001;
            reg_config_1 <= 3'b001;
            reg_config_2 <= 3'b001;
            reg_config_3 <= 3'b001;
            reg_ipv4_converted_prefix <= 64'h30;
            reg_ipv4_converted_prefix_hi <= 32'h00;
            reg_ipv4_translatable_prefix <= 64'h20;
            reg_ipv4_translatable_prefix_hi <= 32'h00;
            reg_ipv6_converted_prefix <= 32'h0000000a;
            reg_ipv6_converted_mask <= 32'h00ffffff;
            reg_ipv4_pool_prefix <= 32'h00004064;
            reg_ipv4_pool_mask <= 32'h0000c0ff;
            reg_default_nexthop_id <= 16'hffff;
            reg_amc_write_en <= 0;
            reg_amc_addr <= 0;
            reg_amc_addr_hi <= 0;
            reg_amc_hash_en <= 0;
            reg_amc_valid <= 0;
            reg_amc_match <= 0;
            reg_amc_tag_0 <= 0;
            reg_amc_tag_1 <= 0;
            reg_amc_tag_2 <= 0;
            reg_amc_tag_3 <= 0;
            reg_amc_tag_hi_0 <= 0;
            reg_amc_tag_hi_1 <= 0;
            reg_amc_tag_hi_2 <= 0;
            reg_amc_tag_hi_3 <= 0;
            reg_amc_value_0 <= 0;
            reg_amc_value_1 <= 0;
            reg_amc_value_2 <= 0;
            reg_amc_value_3 <= 0;
            reg_amc_value_hi_0 <= 0;
            reg_amc_value_hi_1 <= 0;
            reg_amc_value_hi_2 <= 0;
            reg_amc_value_hi_3 <= 0;
            reg_amc_atime_0 <= 0;
            reg_amc_atime_1 <= 0;
            reg_amc_atime_2 <= 0;
            reg_amc_atime_3 <= 0;
            reg_arc_write_en <= 0;
            reg_arc_addr <= 0;
            reg_arc_addr_hi <= 0;
            reg_arc_addr_extra <= 0;
            reg_arc_hash_en <= 0;
            reg_arc_valid <= 0;
            reg_arc_match <= 0;
            reg_arc_tag_0 <= 0;
            reg_arc_tag_1 <= 0;
            reg_arc_tag_2 <= 0;
            reg_arc_tag_3 <= 0;
            reg_arc_tag_hi_0 <= 0;
            reg_arc_tag_hi_1 <= 0;
            reg_arc_tag_hi_2 <= 0;
            reg_arc_tag_hi_3 <= 0;
            reg_arc_tag_extra_0 <= 0;
            reg_arc_tag_extra_1 <= 0;
            reg_arc_tag_extra_2 <= 0;
            reg_arc_tag_extra_3 <= 0;
            reg_arc_value_0 <= 0;
            reg_arc_value_1 <= 0;
            reg_arc_value_2 <= 0;
            reg_arc_value_3 <= 0;
            reg_arc_atime_0 <= 0;
            reg_arc_atime_1 <= 0;
            reg_arc_atime_2 <= 0;
            reg_arc_atime_3 <= 0;
        end
        else
        begin
            if (reg_write_en)
            begin
                case (reg_write_addr[ADDR_MSB:ADDR_LSB])
                ADDR_MAC_0:
                    reg_mac_0 <= reg_write_val & 64'hffffffffffff;
                ADDR_MAC_1:
                    reg_mac_1 <= reg_write_val & 64'hffffffffffff;
                ADDR_MAC_2:
                    reg_mac_2 <= reg_write_val & 64'hffffffffffff;
                ADDR_MAC_3:
                    reg_mac_3 <= reg_write_val & 64'hffffffffffff;
                ADDR_MTU_0:
                    reg_mtu_0 <= reg_write_val & 64'hffff;
                ADDR_MTU_1:
                    reg_mtu_1 <= reg_write_val & 64'hffff;
                ADDR_MTU_2:
                    reg_mtu_2 <= reg_write_val & 64'hffff;
                ADDR_MTU_3:
                    reg_mtu_3 <= reg_write_val & 64'hffff;
                ADDR_CONFIG_0:
                    reg_config_0 <= reg_write_val & 64'h7;
                ADDR_CONFIG_1:
                    reg_config_1 <= reg_write_val & 64'h7;
                ADDR_CONFIG_2:
                    reg_config_2 <= reg_write_val & 64'h7;
                ADDR_CONFIG_3:
                    reg_config_3 <= reg_write_val & 64'h7;
                ADDR_IPV4_CONVERTED_PREFIX:
                    reg_ipv4_converted_prefix <= reg_write_val;
                ADDR_IPV4_CONVERTED_PREFIX_HI:
                    reg_ipv4_converted_prefix_hi <= reg_write_val & 64'hffffffff;
                ADDR_IPV4_TRANSLATABLE_PREFIX:
                    reg_ipv4_translatable_prefix <= reg_write_val;
                ADDR_IPV4_TRANSLATABLE_PREFIX_HI:
                    reg_ipv4_translatable_prefix_hi <= reg_write_val & 64'hffffffff;
                ADDR_IPV6_CONVERTED_PREFIX:
                    reg_ipv6_converted_prefix <= reg_write_val & 64'hffffffff;
                ADDR_IPV6_CONVERTED_MASK:
                    reg_ipv6_converted_mask <= reg_write_val & 64'hffffffff;
                ADDR_IPV4_POOL_PREFIX:
                    reg_ipv4_pool_prefix <= reg_write_val & 64'hffffffff;
                ADDR_IPV4_POOL_MASK:
                    reg_ipv4_pool_mask <= reg_write_val & 64'hffffffff;
                ADDR_DEFAULT_NEXTHOP_ID:
                    reg_default_nexthop_id <= reg_write_val & 64'hffff;
                ADDR_AMC_WRITE_EN:
                    reg_amc_write_en <= reg_write_val & 64'hffff;
                ADDR_AMC_ADDR:
                    reg_amc_addr <= reg_write_val;
                ADDR_AMC_ADDR_HI:
                    reg_amc_addr_hi <= reg_write_val;
                ADDR_AMC_HASH_EN:
                    reg_amc_hash_en <= reg_write_val & 64'h1;
                ADDR_AMC_VALID:
                    reg_amc_valid <= reg_write_val & 64'hf;
                ADDR_AMC_MATCH:
                    reg_amc_match <= reg_write_val & 64'hf;
                ADDR_AMC_TAG_0:
                    reg_amc_tag_0 <= reg_write_val;
                ADDR_AMC_TAG_1:
                    reg_amc_tag_1 <= reg_write_val;
                ADDR_AMC_TAG_2:
                    reg_amc_tag_2 <= reg_write_val;
                ADDR_AMC_TAG_3:
                    reg_amc_tag_3 <= reg_write_val;
                ADDR_AMC_TAG_HI_0:
                    reg_amc_tag_hi_0 <= reg_write_val;
                ADDR_AMC_TAG_HI_1:
                    reg_amc_tag_hi_1 <= reg_write_val;
                ADDR_AMC_TAG_HI_2:
                    reg_amc_tag_hi_2 <= reg_write_val;
                ADDR_AMC_TAG_HI_3:
                    reg_amc_tag_hi_3 <= reg_write_val;
                ADDR_AMC_VALUE_0:
                    reg_amc_value_0 <= reg_write_val;
                ADDR_AMC_VALUE_1:
                    reg_amc_value_1 <= reg_write_val;
                ADDR_AMC_VALUE_2:
                    reg_amc_value_2 <= reg_write_val;
                ADDR_AMC_VALUE_3:
                    reg_amc_value_3 <= reg_write_val;
                ADDR_AMC_VALUE_HI_0:
                    reg_amc_value_hi_0 <= reg_write_val;
                ADDR_AMC_VALUE_HI_1:
                    reg_amc_value_hi_1 <= reg_write_val;
                ADDR_AMC_VALUE_HI_2:
                    reg_amc_value_hi_2 <= reg_write_val;
                ADDR_AMC_VALUE_HI_3:
                    reg_amc_value_hi_3 <= reg_write_val;
                ADDR_AMC_ATIME_0:
                    reg_amc_atime_0 <= reg_write_val & 64'hffff;
                ADDR_AMC_ATIME_1:
                    reg_amc_atime_1 <= reg_write_val & 64'hffff;
                ADDR_AMC_ATIME_2:
                    reg_amc_atime_2 <= reg_write_val & 64'hffff;
                ADDR_AMC_ATIME_3:
                    reg_amc_atime_3 <= reg_write_val & 64'hffff;
                ADDR_ARC_WRITE_EN:
                    reg_arc_write_en <= reg_write_val & 64'hffff;
                ADDR_ARC_ADDR:
                    reg_arc_addr <= reg_write_val;
                ADDR_ARC_ADDR_HI:
                    reg_arc_addr_hi <= reg_write_val;
                ADDR_ARC_ADDR_EXTRA:
                    reg_arc_addr_extra <= reg_write_val & 64'hff;
                ADDR_ARC_HASH_EN:
                    reg_arc_hash_en <= reg_write_val & 64'h1;
                ADDR_ARC_VALID:
                    reg_arc_valid <= reg_write_val & 64'hf;
                ADDR_ARC_MATCH:
                    reg_arc_match <= reg_write_val & 64'hf;
                ADDR_ARC_TAG_0:
                    reg_arc_tag_0 <= reg_write_val;
                ADDR_ARC_TAG_1:
                    reg_arc_tag_1 <= reg_write_val;
                ADDR_ARC_TAG_2:
                    reg_arc_tag_2 <= reg_write_val;
                ADDR_ARC_TAG_3:
                    reg_arc_tag_3 <= reg_write_val;
                ADDR_ARC_TAG_HI_0:
                    reg_arc_tag_hi_0 <= reg_write_val;
                ADDR_ARC_TAG_HI_1:
                    reg_arc_tag_hi_1 <= reg_write_val;
                ADDR_ARC_TAG_HI_2:
                    reg_arc_tag_hi_2 <= reg_write_val;
                ADDR_ARC_TAG_HI_3:
                    reg_arc_tag_hi_3 <= reg_write_val;
                ADDR_ARC_TAG_EXTRA_0:
                    reg_arc_tag_extra_0 <= reg_write_val & 64'hff;
                ADDR_ARC_TAG_EXTRA_1:
                    reg_arc_tag_extra_1 <= reg_write_val & 64'hff;
                ADDR_ARC_TAG_EXTRA_2:
                    reg_arc_tag_extra_2 <= reg_write_val & 64'hff;
                ADDR_ARC_TAG_EXTRA_3:
                    reg_arc_tag_extra_3 <= reg_write_val & 64'hff;
                ADDR_ARC_VALUE_0:
                    reg_arc_value_0 <= reg_write_val & 64'hffffffffffff;
                ADDR_ARC_VALUE_1:
                    reg_arc_value_1 <= reg_write_val & 64'hffffffffffff;
                ADDR_ARC_VALUE_2:
                    reg_arc_value_2 <= reg_write_val & 64'hffffffffffff;
                ADDR_ARC_VALUE_3:
                    reg_arc_value_3 <= reg_write_val & 64'hffffffffffff;
                ADDR_ARC_ATIME_0:
                    reg_arc_atime_0 <= reg_write_val & 64'hffff;
                ADDR_ARC_ATIME_1:
                    reg_arc_atime_1 <= reg_write_val & 64'hffff;
                ADDR_ARC_ATIME_2:
                    reg_arc_atime_2 <= reg_write_val & 64'hffff;
                ADDR_ARC_ATIME_3:
                    reg_arc_atime_3 <= reg_write_val & 64'hffff;
                default:
                begin
                end
                endcase
            end
            if (reg_write_amc_regs)
            begin
                reg_amc_valid[3:0] <= amc_entry_valid_o;
                reg_amc_match[3:0] <= amc_entry_match_o;
                {reg_amc_tag_hi_3, reg_amc_tag_3,
                 reg_amc_tag_hi_2, reg_amc_tag_2,
                 reg_amc_tag_hi_1, reg_amc_tag_1,
                 reg_amc_tag_hi_0, reg_amc_tag_0} <= amc_entry_tag_o;
                {reg_amc_value_hi_3, reg_amc_value_3,
                 reg_amc_value_hi_2, reg_amc_value_2,
                 reg_amc_value_hi_1, reg_amc_value_1,
                 reg_amc_value_hi_0, reg_amc_value_0} <= amc_entry_value_o;
                {reg_amc_atime_3[15:0], reg_amc_atime_2[15:0],
                 reg_amc_atime_1[15:0], reg_amc_atime_0[15:0]} <= amc_entry_atime_o;
            end
            if (reg_write_arc_regs)
            begin
                reg_arc_valid[3:0] <= arc_entry_valid_o;
                reg_arc_match[3:0] <= arc_entry_match_o;
                {reg_arc_tag_hi_3, reg_arc_tag_3,
                 reg_arc_tag_hi_2, reg_arc_tag_2,
                 reg_arc_tag_hi_1, reg_arc_tag_1,
                 reg_arc_tag_hi_0, reg_arc_tag_0} <= arc_entry_tag_o;
                {reg_arc_value_3[47:0], reg_arc_value_2[47:0],
                 reg_arc_value_1[47:0], reg_arc_value_0[47:0]} <= arc_entry_value_o;
                {reg_arc_atime_3[15:0], reg_arc_atime_2[15:0],
                 reg_arc_atime_1[15:0], reg_arc_atime_0[15:0]} <= arc_entry_atime_o;
            end
        end
    end

    always @ (*)
    begin
        case (reg_read_addr[ADDR_MSB:ADDR_LSB])
        ADDR_VENDOR:
            reg_read_val = reg_vendor;
        ADDR_CLOCK:
            reg_read_val = reg_clock;
        ADDR_MAC_0:
            reg_read_val = reg_mac_0 & 64'hffffffffffff;
        ADDR_MAC_1:
            reg_read_val = reg_mac_1 & 64'hffffffffffff;
        ADDR_MAC_2:
            reg_read_val = reg_mac_2 & 64'hffffffffffff;
        ADDR_MAC_3:
            reg_read_val = reg_mac_3 & 64'hffffffffffff;
        ADDR_MTU_0:
            reg_read_val = reg_mtu_0 & 64'hffff;
        ADDR_MTU_1:
            reg_read_val = reg_mtu_1 & 64'hffff;
        ADDR_MTU_2:
            reg_read_val = reg_mtu_2 & 64'hffff;
        ADDR_MTU_3:
            reg_read_val = reg_mtu_3 & 64'hffff;
        ADDR_CONFIG_0:
            reg_read_val = reg_config_0 & 64'h7;
        ADDR_CONFIG_1:
            reg_read_val = reg_config_1 & 64'h7;
        ADDR_CONFIG_2:
            reg_read_val = reg_config_2 & 64'h7;
        ADDR_CONFIG_3:
            reg_read_val = reg_config_3 & 64'h7;
        ADDR_IPV4_CONVERTED_PREFIX:
            reg_read_val = reg_ipv4_converted_prefix;
        ADDR_IPV4_CONVERTED_PREFIX_HI:
            reg_read_val = reg_ipv4_converted_prefix_hi & 64'hffffffff;
        ADDR_IPV4_TRANSLATABLE_PREFIX:
            reg_read_val = reg_ipv4_translatable_prefix;
        ADDR_IPV4_TRANSLATABLE_PREFIX_HI:
            reg_read_val = reg_ipv4_translatable_prefix_hi & 64'hffffffff;
        ADDR_IPV6_CONVERTED_PREFIX:
            reg_read_val = reg_ipv6_converted_prefix & 64'hffffffff;
        ADDR_IPV6_CONVERTED_MASK:
            reg_read_val = reg_ipv6_converted_mask & 64'hffffffff;
        ADDR_IPV4_POOL_PREFIX:
            reg_read_val = reg_ipv4_pool_prefix & 64'hffffffff;
        ADDR_IPV4_POOL_MASK:
            reg_read_val = reg_ipv4_pool_mask & 64'hffffffff;
        ADDR_DEFAULT_NEXTHOP_ID:
            reg_read_val = reg_default_nexthop_id & 64'hffff;
        ADDR_AMC_WRITE_EN:
            reg_read_val = reg_amc_write_en & 64'hffff;
        ADDR_AMC_ADDR:
            reg_read_val = reg_amc_addr;
        ADDR_AMC_ADDR_HI:
            reg_read_val = reg_amc_addr_hi;
        ADDR_AMC_HASH_EN:
            reg_read_val = reg_amc_hash_en & 64'h1;
        ADDR_AMC_VALID:
            reg_read_val = reg_amc_valid & 64'hf;
        ADDR_AMC_MATCH:
            reg_read_val = reg_amc_match & 64'hf;
        ADDR_AMC_TAG_0:
            reg_read_val = reg_amc_tag_0;
        ADDR_AMC_TAG_1:
            reg_read_val = reg_amc_tag_1;
        ADDR_AMC_TAG_2:
            reg_read_val = reg_amc_tag_2;
        ADDR_AMC_TAG_3:
            reg_read_val = reg_amc_tag_3;
        ADDR_AMC_TAG_HI_0:
            reg_read_val = reg_amc_tag_hi_0;
        ADDR_AMC_TAG_HI_1:
            reg_read_val = reg_amc_tag_hi_1;
        ADDR_AMC_TAG_HI_2:
            reg_read_val = reg_amc_tag_hi_2;
        ADDR_AMC_TAG_HI_3:
            reg_read_val = reg_amc_tag_hi_3;
        ADDR_AMC_VALUE_0:
            reg_read_val = reg_amc_value_0;
        ADDR_AMC_VALUE_1:
            reg_read_val = reg_amc_value_1;
        ADDR_AMC_VALUE_2:
            reg_read_val = reg_amc_value_2;
        ADDR_AMC_VALUE_3:
            reg_read_val = reg_amc_value_3;
        ADDR_AMC_VALUE_HI_0:
            reg_read_val = reg_amc_value_hi_0;
        ADDR_AMC_VALUE_HI_1:
            reg_read_val = reg_amc_value_hi_1;
        ADDR_AMC_VALUE_HI_2:
            reg_read_val = reg_amc_value_hi_2;
        ADDR_AMC_VALUE_HI_3:
            reg_read_val = reg_amc_value_hi_3;
        ADDR_AMC_ATIME_0:
            reg_read_val = reg_amc_atime_0 & 64'hffff;
        ADDR_AMC_ATIME_1:
            reg_read_val = reg_amc_atime_1 & 64'hffff;
        ADDR_AMC_ATIME_2:
            reg_read_val = reg_amc_atime_2 & 64'hffff;
        ADDR_AMC_ATIME_3:
            reg_read_val = reg_amc_atime_3 & 64'hffff;
        ADDR_ARC_WRITE_EN:
            reg_read_val = reg_arc_write_en & 64'hffff;
        ADDR_ARC_ADDR:
            reg_read_val = reg_arc_addr;
        ADDR_ARC_ADDR_HI:
            reg_read_val = reg_arc_addr_hi;
        ADDR_ARC_ADDR_EXTRA:
            reg_read_val = reg_arc_addr_extra & 64'hff;
        ADDR_ARC_HASH_EN:
            reg_read_val = reg_arc_hash_en & 64'h1;
        ADDR_ARC_VALID:
            reg_read_val = reg_arc_valid & 64'hf;
        ADDR_ARC_MATCH:
            reg_read_val = reg_arc_match & 64'hf;
        ADDR_ARC_TAG_0:
            reg_read_val = reg_arc_tag_0;
        ADDR_ARC_TAG_1:
            reg_read_val = reg_arc_tag_1;
        ADDR_ARC_TAG_2:
            reg_read_val = reg_arc_tag_2;
        ADDR_ARC_TAG_3:
            reg_read_val = reg_arc_tag_3;
        ADDR_ARC_TAG_HI_0:
            reg_read_val = reg_arc_tag_hi_0;
        ADDR_ARC_TAG_HI_1:
            reg_read_val = reg_arc_tag_hi_1;
        ADDR_ARC_TAG_HI_2:
            reg_read_val = reg_arc_tag_hi_2;
        ADDR_ARC_TAG_HI_3:
            reg_read_val = reg_arc_tag_hi_3;
        ADDR_ARC_TAG_EXTRA_0:
            reg_read_val = reg_arc_tag_extra_0 & 64'hff;
        ADDR_ARC_TAG_EXTRA_1:
            reg_read_val = reg_arc_tag_extra_1 & 64'hff;
        ADDR_ARC_TAG_EXTRA_2:
            reg_read_val = reg_arc_tag_extra_2 & 64'hff;
        ADDR_ARC_TAG_EXTRA_3:
            reg_read_val = reg_arc_tag_extra_3 & 64'hff;
        ADDR_ARC_VALUE_0:
            reg_read_val = reg_arc_value_0 & 64'hffffffffffff;
        ADDR_ARC_VALUE_1:
            reg_read_val = reg_arc_value_1 & 64'hffffffffffff;
        ADDR_ARC_VALUE_2:
            reg_read_val = reg_arc_value_2 & 64'hffffffffffff;
        ADDR_ARC_VALUE_3:
            reg_read_val = reg_arc_value_3 & 64'hffffffffffff;
        ADDR_ARC_ATIME_0:
            reg_read_val = reg_arc_atime_0 & 64'hffff;
        ADDR_ARC_ATIME_1:
            reg_read_val = reg_arc_atime_1 & 64'hffff;
        ADDR_ARC_ATIME_2:
            reg_read_val = reg_arc_atime_2 & 64'hffff;
        ADDR_ARC_ATIME_3:
            reg_read_val = reg_arc_atime_3 & 64'hffff;
        default:
        begin
            reg_read_val = 0;
        end
        endcase
    end

    assign amc_write_en = reg_amc_write_en[15:0];
    assign amc_addr = {reg_amc_addr_hi, reg_amc_addr};
    assign amc_hash_en = reg_amc_hash_en[0];
    assign amc_entry_valid_i = reg_amc_valid[3:0];
    assign amc_entry_tag_i = {reg_amc_tag_hi_3, reg_amc_tag_3,
                              reg_amc_tag_hi_2, reg_amc_tag_2,
                              reg_amc_tag_hi_1, reg_amc_tag_1,
                              reg_amc_tag_hi_0, reg_amc_tag_0};
    assign amc_entry_value_i = {reg_amc_value_hi_3, reg_amc_value_3,
                                reg_amc_value_hi_2, reg_amc_value_2,
                                reg_amc_value_hi_1, reg_amc_value_1,
                                reg_amc_value_hi_0, reg_amc_value_0};
    assign amc_entry_atime_i = {reg_amc_atime_3[15:0], reg_amc_atime_2[15:0],
                                reg_amc_atime_1[15:0], reg_amc_atime_0[15:0]};

    assign arc_write_en = reg_arc_write_en[15:0];
    assign arc_addr = {reg_arc_addr_hi, reg_arc_addr};
    assign arc_hash_en = reg_arc_hash_en[0];
    assign arc_entry_valid_i = reg_arc_valid[3:0];
    assign arc_entry_tag_i = {reg_arc_tag_hi_3, reg_arc_tag_3,
                              reg_arc_tag_hi_2, reg_arc_tag_2,
                              reg_arc_tag_hi_1, reg_arc_tag_1,
                              reg_arc_tag_hi_0, reg_arc_tag_0};
    assign arc_entry_value_i = {reg_arc_value_3[47:0], reg_arc_value_2[47:0],
                                reg_arc_value_1[47:0], reg_arc_value_0[47:0]};
    assign arc_entry_atime_i = {reg_arc_atime_3[15:0], reg_arc_atime_2[15:0],
                                reg_arc_atime_1[15:0], reg_arc_atime_0[15:0]};
/********************************************************************************/

    assign mac_addr = {reg_mac_3[47:0], reg_mac_2[47:0], reg_mac_1[47:0], reg_mac_0[47:0]};
    assign mtu = {reg_mtu_3[15:0], reg_mtu_2[15:0], reg_mtu_1[15:0], reg_mtu_0[15:0]};
    assign conf = {reg_config_3, reg_config_2, reg_config_1, reg_config_0};
    assign ipv4_converted_prefix = {reg_ipv4_converted_prefix_hi[31:0], reg_ipv4_converted_prefix};
    assign ipv4_translatable_prefix = {reg_ipv4_translatable_prefix_hi[31:0], reg_ipv4_translatable_prefix};
    assign ipv6_converted_prefix = reg_ipv6_converted_prefix;
    assign ipv6_converted_mask = reg_ipv6_converted_mask;
    assign ipv4_pool_prefix = reg_ipv4_pool_prefix;
    assign ipv4_pool_mask = reg_ipv4_pool_mask;
    assign default_nexthop_id = reg_default_nexthop_id[15:0];

    localparam RESP_NO_ERROR = 2'b0;
    assign axi_lite_bresp = RESP_NO_ERROR;
    assign axi_lite_rresp = RESP_NO_ERROR;

    localparam ST_RECV_ADDR = 0;
    localparam ST_RECV_DATA = 1;
    localparam ST_SEND_DATA = 2;
    localparam ST_SEND_RESP = 3;
    localparam ST_WAIT_AMC = 4;
    localparam ST_WAIT_ARC = 5;
    reg [2:0] state;
    reg [31:0] addr;
    reg cache_write;

    assign reg_read_addr = axi_lite_araddr;
    assign reg_write_en = state == ST_RECV_DATA && axi_lite_wvalid;
    assign reg_write_addr = addr;
    assign reg_write_val = axi_lite_wdata;
    assign reg_write_amc_regs = state == ST_WAIT_AMC && amc_ready && !cache_write;
    assign reg_write_arc_regs = state == ST_WAIT_ARC && arc_ready && !cache_write;

    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            state <= ST_RECV_ADDR;
            addr <= 0;
            axi_lite_rdata <= 0;
            cache_write <= 1'b0;
        end
        else
        begin
            case (state)
            ST_RECV_ADDR:
            begin
                if (axi_lite_awvalid)
                begin
                    addr <= axi_lite_awaddr;
                    state <= ST_RECV_DATA;
                end
                else if (axi_lite_arvalid)
                begin
                    axi_lite_rdata <= reg_read_val;
                    state <= ST_SEND_DATA;
                end
                else
                begin
                    state <= ST_RECV_ADDR;
                end
            end
            ST_RECV_DATA:
            begin
                if (axi_lite_wvalid)
                begin
                    case (addr[ADDR_MSB:ADDR_LSB])
                    ADDR_AMC_WRITE_EN:
                    begin
                        cache_write <= |reg_write_val;
                        state <= ST_WAIT_AMC;
                    end
                    ADDR_ARC_WRITE_EN:
                    begin
                        cache_write <= |reg_write_val;
                        state <= ST_WAIT_ARC;
                    end
                    default:
                        state <= ST_SEND_RESP;
                    endcase
                end
            end
            ST_SEND_DATA:
            begin
                if (axi_lite_rready)
                begin
                    state <= ST_RECV_ADDR;
                end
            end
            ST_SEND_RESP:
            begin
                if (axi_lite_bready)
                begin
                    state <= ST_RECV_ADDR;
                end
            end
            ST_WAIT_AMC:
            begin
                if (amc_ready)
                begin
                    state <= ST_SEND_RESP;
                end
            end
            ST_WAIT_ARC:
            begin
                if (arc_ready)
                begin
                    state <= ST_SEND_RESP;
                end
            end
            default:
                state <= ST_RECV_ADDR;
            endcase
        end
    end

    always @ (*)
    begin
        axi_lite_awready = 1'b0;
        axi_lite_wready = 1'b0;
        axi_lite_bvalid = 1'b0;
        axi_lite_arready = 1'b0;
        axi_lite_rvalid = 1'b0;
        amc_valid = 1'b0;
        arc_valid = 1'b0;
        case (state)
        ST_RECV_ADDR:
        begin
            if (axi_lite_awvalid)
            begin
                axi_lite_awready = 1'b1;
            end
            else
            begin
                axi_lite_arready = 1'b1;
            end
        end
        ST_RECV_DATA:
        begin
            axi_lite_wready = 1'b1;
        end
        ST_SEND_DATA:
        begin
            axi_lite_rvalid = 1'b1;
        end
        ST_SEND_RESP:
        begin
            axi_lite_bvalid = 1'b1;
        end
        ST_WAIT_AMC:
        begin
            amc_valid = 1'b1;
        end
        ST_WAIT_ARC:
        begin
            arc_valid = 1'b1;
        end
        endcase
    end

    integer counter;
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
            reg_clock <= 0;
            counter <= 0;
        end
        else
        begin
            if (counter == 9765625 - 1) // 156250000 / 16 - 1
            begin
                reg_clock <= reg_clock + 1;
                counter <= 0;
            end
            else
            begin
                counter <= counter + 1;
            end
        end
    end
    assign atime_counter = reg_clock[19:4]; // (reg_clock / 16) & 0xffff
endmodule
