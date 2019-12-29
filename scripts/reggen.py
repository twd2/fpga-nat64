import math

f = open('packet_pipeline_regfile.v', 'w')

#    name      type  mask/ro_value   default
REGS = [
    ('vendor', 'ro', "64'h2222222222222223"),
    ('clock', 'ro', ''),
    ('mac_0', 'rw', 0xffffffffffff, "48'h315f32445754"),
    ('mac_1', 'rw', 0xffffffffffff, "48'h325f32445754"),
    ('mac_2', 'rw', 0xffffffffffff, "48'h335f32445754"),
    ('mac_3', 'rw', 0xffffffffffff, "48'h345f32445754"),
    ('mtu_0', 'rw', 0xffff, '1500'),
    ('mtu_1', 'rw', 0xffff, '1500'),
    ('mtu_2', 'rw', 0xffff, '1500'),
    ('mtu_3', 'rw', 0xffff, '1500'),
    ('config_0', 'rw', 0x7, "3'b001"),  # all_to_cpu, promiscuous, en
    ('config_1', 'rw', 0x7, "3'b001"),
    ('config_2', 'rw', 0x7, "3'b001"),
    ('config_3', 'rw', 0x7, "3'b001"),
    ('ipv4_converted_prefix', 'rw', 0xffffffffffffffff, "64'h30"),
    ('ipv4_converted_prefix_hi', 'rw', 0xffffffff, "32'h00"),
    ('ipv4_translatable_prefix', 'rw', 0xffffffffffffffff, "64'h20"),
    ('ipv4_translatable_prefix_hi', 'rw', 0xffffffff, "32'h00"),
    ('ipv6_converted_prefix', 'rw', 0xffffffff, "32'h0000000a"),
    ('ipv6_converted_mask', 'rw', 0xffffffff, "32'h00ffffff"),
    ('ipv4_pool_prefix', 'rw', 0xffffffff, "32'h00004064"),
    ('ipv4_pool_mask', 'rw', 0xffffffff, "32'h0000c0ff"),
    ('default_nexthop_id', 'rw', 0xffff, "16'hffff"),
    ('amc_write_en', 'rw', 0xffff),
    ('amc_addr', 'rw', 0xffffffffffffffff),
    ('amc_addr_hi', 'rw', 0xffffffffffffffff),
    ('amc_hash_en', 'rw', 0x1),
    ('amc_valid', 'rw', 0xf),
    ('amc_match', 'rw', 0xf),
    ('amc_tag_0', 'rw', 0xffffffffffffffff),
    ('amc_tag_1', 'rw', 0xffffffffffffffff),
    ('amc_tag_2', 'rw', 0xffffffffffffffff),
    ('amc_tag_3', 'rw', 0xffffffffffffffff),
    ('amc_tag_hi_0', 'rw', 0xffffffffffffffff),
    ('amc_tag_hi_1', 'rw', 0xffffffffffffffff),
    ('amc_tag_hi_2', 'rw', 0xffffffffffffffff),
    ('amc_tag_hi_3', 'rw', 0xffffffffffffffff),
    ('amc_value_0', 'rw', 0xffffffffffffffff),
    ('amc_value_1', 'rw', 0xffffffffffffffff),
    ('amc_value_2', 'rw', 0xffffffffffffffff),
    ('amc_value_3', 'rw', 0xffffffffffffffff),
    ('amc_value_hi_0', 'rw', 0xffffffffffffffff),
    ('amc_value_hi_1', 'rw', 0xffffffffffffffff),
    ('amc_value_hi_2', 'rw', 0xffffffffffffffff),
    ('amc_value_hi_3', 'rw', 0xffffffffffffffff),
    ('amc_atime_0', 'rw', 0xffff),
    ('amc_atime_1', 'rw', 0xffff),
    ('amc_atime_2', 'rw', 0xffff),
    ('amc_atime_3', 'rw', 0xffff),
    ('arc_write_en', 'rw', 0xffff),
    ('arc_addr', 'rw', 0xffffffffffffffff),
    ('arc_addr_hi', 'rw', 0xffffffffffffffff),
    ('arc_addr_extra', 'rw', 0xff),
    ('arc_hash_en', 'rw', 0x1),
    ('arc_valid', 'rw', 0xf),
    ('arc_match', 'rw', 0xf),
    ('arc_tag_0', 'rw', 0xffffffffffffffff),
    ('arc_tag_1', 'rw', 0xffffffffffffffff),
    ('arc_tag_2', 'rw', 0xffffffffffffffff),
    ('arc_tag_3', 'rw', 0xffffffffffffffff),
    ('arc_tag_hi_0', 'rw', 0xffffffffffffffff),
    ('arc_tag_hi_1', 'rw', 0xffffffffffffffff),
    ('arc_tag_hi_2', 'rw', 0xffffffffffffffff),
    ('arc_tag_hi_3', 'rw', 0xffffffffffffffff),
    ('arc_tag_extra_0', 'rw', 0xff),
    ('arc_tag_extra_1', 'rw', 0xff),
    ('arc_tag_extra_2', 'rw', 0xff),
    ('arc_tag_extra_3', 'rw', 0xff),
    ('arc_value_0', 'rw', 0xffffffffffff),
    ('arc_value_1', 'rw', 0xffffffffffff),
    ('arc_value_2', 'rw', 0xffffffffffff),
    ('arc_value_3', 'rw', 0xffffffffffff),
    ('arc_atime_0', 'rw', 0xffff),
    ('arc_atime_1', 'rw', 0xffff),
    ('arc_atime_2', 'rw', 0xffff),
    ('arc_atime_3', 'rw', 0xffff),
]

addr_bits = math.ceil(math.log2(len(REGS)))
addr_msb = 3 + addr_bits - 1
addr_lsb = 3
print(addr_msb, addr_lsb)

f.write('/******************************* generated code *********************************/\n')
f.write('    localparam ADDR_MSB = {};\n'.format(addr_msb))
f.write('    localparam ADDR_LSB = {};\n\n'.format(addr_lsb))
addr_range = 'ADDR_MSB:ADDR_LSB'

# gen declaration
for i, reg in enumerate(REGS):
    f.write('    localparam ADDR_{} = {};\n'.format(reg[0].upper(), i))
f.write('\n')
for i, reg in enumerate(REGS):
    if reg[1] == 'rw':
        f.write('    reg [63:0] reg_{};\n'.format(reg[0]))
    elif reg[1] == 'ro':
        if reg[2]:
            f.write('    wire [63:0] reg_{} = {};\n'.format(reg[0], reg[2]))
        else:
            f.write('    reg [63:0] reg_{};\n'.format(reg[0]))
    else:
        assert(False)

f.write('''
    wire reg_write_en, reg_write_amc_regs, reg_write_arc_regs;
    wire [31:0] reg_write_addr, reg_read_addr;
    wire [63:0] reg_write_val;
    reg [63:0] reg_read_val;
''')

# gen write process
f.write('''
    always @ (posedge eth_coreclk or posedge reset)
    begin
        if (reset)
        begin
''')

for i, reg in enumerate(REGS):
    if reg[1] == 'rw':
        if len(reg) >= 4:
            f.write('            reg_{} <= {};\n'.format(reg[0], reg[3]))
        else:
            f.write('            reg_{} <= 0;\n'.format(reg[0]))

f.write('''        end
        else
        begin
            if (reg_write_en)
            begin
                case (reg_write_addr[{}])
'''.format(addr_range))

for i, reg in enumerate(REGS):
    if reg[1] == 'rw':
        f.write('                ADDR_{}:\n'.format(reg[0].upper()))
        if reg[2] == 0xffffffffffffffff:
            f.write('                    reg_{} <= reg_write_val;\n'.format(reg[0]))
        else:
            f.write("                    reg_{} <= reg_write_val & 64'h{};\n"
                    .format(reg[0], hex(reg[2])[2:]))

f.write('''                default:
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
''')

# gen read process
f.write('''
    always @ (*)
    begin
        case (reg_read_addr[{}])
'''.format(addr_range))

for i, reg in enumerate(REGS):
    f.write('        ADDR_{}:\n'.format(reg[0].upper()))
    if reg[1] != 'rw' or reg[2] == 0xffffffffffffffff:
        f.write('            reg_read_val = reg_{};\n'.format(reg[0]))
    else:
        f.write("            reg_read_val = reg_{} & 64'h{};\n"
                    .format(reg[0], hex(reg[2])[2:]))

f.write('''        default:
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
''')
f.write('/********************************************************************************/\n')
f.close()

f = open('reg.c', 'w')

# gen c code
for i, reg in enumerate(REGS):
    f.write('#define ETH_{} (*(volatile uint64_t *)(ETH_BASE + {}))\n'.format(reg[0].upper(), hex(i * 8)))
    if reg[0].endswith('_0'):
        f.write('#define ETH_{} (&ETH_{})\n'.format(reg[0][:-2].upper(), reg[0].upper()))
f.write('\n')
