module ExampleRocketSystem( // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144455.2]
  input         clock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144456.4]
  input         reset, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144457.4]
  output        debug_clockeddmi_dmi_req_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input         debug_clockeddmi_dmi_req_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input  [6:0]  debug_clockeddmi_dmi_req_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input  [31:0] debug_clockeddmi_dmi_req_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input  [1:0]  debug_clockeddmi_dmi_req_bits_op, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input         debug_clockeddmi_dmi_resp_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  output        debug_clockeddmi_dmi_resp_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  output [31:0] debug_clockeddmi_dmi_resp_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  output [1:0]  debug_clockeddmi_dmi_resp_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input         debug_clockeddmi_dmiClock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input         debug_clockeddmi_dmiReset, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  output        debug_ndreset, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  output        debug_dmactive, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144459.4]
  input  [1:0]  interrupts, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144460.4]
  input         mem_axi4_0_aw_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_aw_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_aw_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [31:0] mem_axi4_0_aw_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [7:0]  mem_axi4_0_aw_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [2:0]  mem_axi4_0_aw_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [1:0]  mem_axi4_0_aw_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_aw_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_aw_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [2:0]  mem_axi4_0_aw_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_aw_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mem_axi4_0_w_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_w_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [63:0] mem_axi4_0_w_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [7:0]  mem_axi4_0_w_bits_strb, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_w_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_b_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mem_axi4_0_b_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input  [3:0]  mem_axi4_0_b_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input  [1:0]  mem_axi4_0_b_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mem_axi4_0_ar_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_ar_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_ar_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [31:0] mem_axi4_0_ar_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [7:0]  mem_axi4_0_ar_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [2:0]  mem_axi4_0_ar_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [1:0]  mem_axi4_0_ar_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_ar_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_ar_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [2:0]  mem_axi4_0_ar_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output [3:0]  mem_axi4_0_ar_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  output        mem_axi4_0_r_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mem_axi4_0_r_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input  [3:0]  mem_axi4_0_r_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input  [63:0] mem_axi4_0_r_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input  [1:0]  mem_axi4_0_r_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mem_axi4_0_r_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144461.4]
  input         mmio_axi4_0_aw_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_aw_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_aw_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [30:0] mmio_axi4_0_aw_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [7:0]  mmio_axi4_0_aw_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [2:0]  mmio_axi4_0_aw_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [1:0]  mmio_axi4_0_aw_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_aw_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_aw_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [2:0]  mmio_axi4_0_aw_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_aw_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input         mmio_axi4_0_w_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_w_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [63:0] mmio_axi4_0_w_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [7:0]  mmio_axi4_0_w_bits_strb, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_w_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_b_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input         mmio_axi4_0_b_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input  [3:0]  mmio_axi4_0_b_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input  [1:0]  mmio_axi4_0_b_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input         mmio_axi4_0_ar_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_ar_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_ar_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [30:0] mmio_axi4_0_ar_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [7:0]  mmio_axi4_0_ar_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [2:0]  mmio_axi4_0_ar_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [1:0]  mmio_axi4_0_ar_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_ar_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_ar_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [2:0]  mmio_axi4_0_ar_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output [3:0]  mmio_axi4_0_ar_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        mmio_axi4_0_r_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input         mmio_axi4_0_r_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input  [3:0]  mmio_axi4_0_r_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input  [63:0] mmio_axi4_0_r_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input  [1:0]  mmio_axi4_0_r_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  input         mmio_axi4_0_r_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144462.4]
  output        l2_frontend_bus_axi4_0_aw_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_aw_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [31:0] l2_frontend_bus_axi4_0_aw_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [1:0]  l2_frontend_bus_axi4_0_aw_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_aw_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output        l2_frontend_bus_axi4_0_w_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_w_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [63:0] l2_frontend_bus_axi4_0_w_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [7:0]  l2_frontend_bus_axi4_0_w_bits_strb, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_w_bits_last, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_b_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output        l2_frontend_bus_axi4_0_b_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output [7:0]  l2_frontend_bus_axi4_0_b_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output [1:0]  l2_frontend_bus_axi4_0_b_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output        l2_frontend_bus_axi4_0_ar_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_ar_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [31:0] l2_frontend_bus_axi4_0_ar_bits_addr, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_len, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_size, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [1:0]  l2_frontend_bus_axi4_0_ar_bits_burst, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_ar_bits_lock, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_cache, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_prot, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_qos, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  input         l2_frontend_bus_axi4_0_r_ready, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output        l2_frontend_bus_axi4_0_r_valid, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output [7:0]  l2_frontend_bus_axi4_0_r_bits_id, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output [63:0] l2_frontend_bus_axi4_0_r_bits_data, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output [1:0]  l2_frontend_bus_axi4_0_r_bits_resp, // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
  output        l2_frontend_bus_axi4_0_r_bits_last // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144463.4]
);
  wire  int_bus_auto_int_in_0; // @[InterruptBus.scala 13:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144473.4]
  wire  int_bus_auto_int_in_1; // @[InterruptBus.scala 13:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144473.4]
  wire  int_bus_auto_int_out_0; // @[InterruptBus.scala 13:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144473.4]
  wire  int_bus_auto_int_out_1; // @[InterruptBus.scala 13:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144473.4]
  wire  sbus_clock; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_reset; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [30:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [30:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_mask; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_denied; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [4:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [27:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_mask; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [4:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_denied; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_mask; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [3:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_denied; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_a_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_a_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [4:0] sbus_auto_system_bus_xbar_out_a_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_system_bus_xbar_out_a_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [7:0] sbus_auto_system_bus_xbar_out_a_bits_mask; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_system_bus_xbar_out_a_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_a_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_b_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_b_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_system_bus_xbar_out_b_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_system_bus_xbar_out_b_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_c_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_c_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [4:0] sbus_auto_system_bus_xbar_out_c_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [31:0] sbus_auto_system_bus_xbar_out_c_bits_address; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_system_bus_xbar_out_c_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_c_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_d_ready; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_d_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_d_bits_opcode; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_system_bus_xbar_out_d_bits_param; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [2:0] sbus_auto_system_bus_xbar_out_d_bits_size; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [4:0] sbus_auto_system_bus_xbar_out_d_bits_source; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_system_bus_xbar_out_d_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_d_bits_denied; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [63:0] sbus_auto_system_bus_xbar_out_d_bits_data; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_d_bits_corrupt; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  sbus_auto_system_bus_xbar_out_e_valid; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire [1:0] sbus_auto_system_bus_xbar_out_e_bits_sink; // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
  wire  fbus_clock; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_reset; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [31:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [2:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [63:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [31:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [2:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [63:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_a_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_a_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [2:0] fbus_auto_bus_xing_out_a_bits_opcode; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [2:0] fbus_auto_bus_xing_out_a_bits_param; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [3:0] fbus_auto_bus_xing_out_a_bits_size; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [3:0] fbus_auto_bus_xing_out_a_bits_source; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [31:0] fbus_auto_bus_xing_out_a_bits_address; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [7:0] fbus_auto_bus_xing_out_a_bits_mask; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [63:0] fbus_auto_bus_xing_out_a_bits_data; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_a_bits_corrupt; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_d_ready; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_d_valid; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [2:0] fbus_auto_bus_xing_out_d_bits_opcode; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_bus_xing_out_d_bits_param; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [3:0] fbus_auto_bus_xing_out_d_bits_size; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [3:0] fbus_auto_bus_xing_out_d_bits_source; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [1:0] fbus_auto_bus_xing_out_d_bits_sink; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_d_bits_denied; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire [63:0] fbus_auto_bus_xing_out_d_bits_data; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  fbus_auto_bus_xing_out_d_bits_corrupt; // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
  wire  mbus_clock; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_reset; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_id; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [31:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_addr; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [7:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_len; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_size; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_burst; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_lock; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_cache; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_prot; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_qos; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [63:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_data; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [7:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_strb; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_last; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_id; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_resp; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_id; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [31:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_addr; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [7:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_len; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_size; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_burst; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_lock; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_cache; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_prot; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_qos; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [3:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_id; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [63:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_data; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_resp; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_last; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [31:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [7:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [63:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_ready; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_valid; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [1:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire [63:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt; // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
  wire  cbus_clock; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_reset; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [16:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [7:0] cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_debug_fragmenter_out_a_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [11:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [7:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_debug_fragmenter_out_d_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_clint_fragmenter_out_a_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [25:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [7:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_clint_fragmenter_out_d_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_plic_fragmenter_out_a_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [27:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [7:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_coupler_to_plic_fragmenter_out_d_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [8:0] cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_a_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_a_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_bus_xing_in_a_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_bus_xing_in_a_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [3:0] cbus_auto_bus_xing_in_a_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [4:0] cbus_auto_bus_xing_in_a_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [27:0] cbus_auto_bus_xing_in_a_bits_address; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [7:0] cbus_auto_bus_xing_in_a_bits_mask; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_bus_xing_in_a_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_a_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_d_ready; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_d_valid; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [2:0] cbus_auto_bus_xing_in_d_bits_opcode; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [1:0] cbus_auto_bus_xing_in_d_bits_param; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [3:0] cbus_auto_bus_xing_in_d_bits_size; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [4:0] cbus_auto_bus_xing_in_d_bits_source; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_d_bits_sink; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_d_bits_denied; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire [63:0] cbus_auto_bus_xing_in_d_bits_data; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  cbus_auto_bus_xing_in_d_bits_corrupt; // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
  wire  plic_clock; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_reset; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_int_in_0; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_int_in_1; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_int_out_0; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_in_a_ready; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_in_a_valid; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [2:0] plic_auto_in_a_bits_opcode; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [2:0] plic_auto_in_a_bits_param; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [1:0] plic_auto_in_a_bits_size; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [8:0] plic_auto_in_a_bits_source; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [27:0] plic_auto_in_a_bits_address; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [7:0] plic_auto_in_a_bits_mask; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [63:0] plic_auto_in_a_bits_data; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_in_a_bits_corrupt; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_in_d_ready; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  plic_auto_in_d_valid; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [2:0] plic_auto_in_d_bits_opcode; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [1:0] plic_auto_in_d_bits_size; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [8:0] plic_auto_in_d_bits_source; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire [63:0] plic_auto_in_d_bits_data; // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
  wire  clint_clock; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_reset; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_int_out_0; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_int_out_1; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_in_a_ready; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_in_a_valid; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [2:0] clint_auto_in_a_bits_opcode; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [2:0] clint_auto_in_a_bits_param; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [1:0] clint_auto_in_a_bits_size; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [8:0] clint_auto_in_a_bits_source; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [25:0] clint_auto_in_a_bits_address; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [7:0] clint_auto_in_a_bits_mask; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [63:0] clint_auto_in_a_bits_data; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_in_a_bits_corrupt; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_in_d_ready; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_auto_in_d_valid; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [2:0] clint_auto_in_d_bits_opcode; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [1:0] clint_auto_in_d_bits_size; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [8:0] clint_auto_in_d_bits_source; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire [63:0] clint_auto_in_d_bits_data; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  clint_io_rtcTick; // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
  wire  debug_1_clock; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_reset; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_ready; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_valid; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_param; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_size; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_source; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [11:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_address; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [7:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_data; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_ready; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_valid; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_auto_dmOuter_intsource_out_sync_0; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_ctrl_ndreset; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_ctrl_dmactive; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmi_req_ready; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmi_req_valid; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [6:0] debug_1_io_dmi_dmi_req_bits_addr; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [31:0] debug_1_io_dmi_dmi_req_bits_data; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [1:0] debug_1_io_dmi_dmi_req_bits_op; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmi_resp_ready; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmi_resp_valid; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [31:0] debug_1_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire [1:0] debug_1_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmiClock; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  debug_1_io_dmi_dmiReset; // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
  wire  tile_clock; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_reset; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_intsink_in_sync_0; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_int_in_xing_in_1_sync_0; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_int_in_xing_in_0_sync_0; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_int_in_xing_in_0_sync_1; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_a_ready; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_a_valid; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [2:0] tile_auto_tl_master_xing_out_a_bits_opcode; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [2:0] tile_auto_tl_master_xing_out_a_bits_param; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [3:0] tile_auto_tl_master_xing_out_a_bits_size; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_a_bits_source; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [31:0] tile_auto_tl_master_xing_out_a_bits_address; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [7:0] tile_auto_tl_master_xing_out_a_bits_mask; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [63:0] tile_auto_tl_master_xing_out_a_bits_data; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_a_bits_corrupt; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_b_ready; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_b_valid; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_b_bits_param; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [31:0] tile_auto_tl_master_xing_out_b_bits_address; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_c_ready; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_c_valid; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [2:0] tile_auto_tl_master_xing_out_c_bits_opcode; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [2:0] tile_auto_tl_master_xing_out_c_bits_param; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [3:0] tile_auto_tl_master_xing_out_c_bits_size; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_c_bits_source; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [31:0] tile_auto_tl_master_xing_out_c_bits_address; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [63:0] tile_auto_tl_master_xing_out_c_bits_data; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_c_bits_corrupt; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_d_ready; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_d_valid; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [2:0] tile_auto_tl_master_xing_out_d_bits_opcode; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_d_bits_param; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [3:0] tile_auto_tl_master_xing_out_d_bits_size; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_d_bits_source; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_d_bits_sink; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_d_bits_denied; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [63:0] tile_auto_tl_master_xing_out_d_bits_data; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_d_bits_corrupt; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  tile_auto_tl_master_xing_out_e_valid; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire [1:0] tile_auto_tl_master_xing_out_e_bits_sink; // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
  wire  intsource_clock; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_reset; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_auto_in_0; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_auto_in_1; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_auto_out_sync_0; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_auto_out_sync_1; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
  wire  intsource_1_clock; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144566.4]
  wire  intsource_1_reset; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144566.4]
  wire  intsource_1_auto_in_0; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144566.4]
  wire  intsource_1_auto_out_sync_0; // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144566.4]
  wire  bh_clock; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_reset; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_a_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_a_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_a_bits_opcode; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_a_bits_param; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_a_bits_size; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [4:0] bh_auto_in_a_bits_source; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [31:0] bh_auto_in_a_bits_address; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [7:0] bh_auto_in_a_bits_mask; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [63:0] bh_auto_in_a_bits_data; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_a_bits_corrupt; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_b_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_b_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [1:0] bh_auto_in_b_bits_param; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [31:0] bh_auto_in_b_bits_address; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_c_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_c_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_c_bits_opcode; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_c_bits_param; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_c_bits_size; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [4:0] bh_auto_in_c_bits_source; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [31:0] bh_auto_in_c_bits_address; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [63:0] bh_auto_in_c_bits_data; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_c_bits_corrupt; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_d_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_d_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_d_bits_opcode; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [1:0] bh_auto_in_d_bits_param; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_in_d_bits_size; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [4:0] bh_auto_in_d_bits_source; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [1:0] bh_auto_in_d_bits_sink; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_d_bits_denied; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [63:0] bh_auto_in_d_bits_data; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_d_bits_corrupt; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_in_e_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [1:0] bh_auto_in_e_bits_sink; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_a_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_a_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_out_a_bits_opcode; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_out_a_bits_param; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_out_a_bits_size; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [6:0] bh_auto_out_a_bits_source; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [31:0] bh_auto_out_a_bits_address; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [7:0] bh_auto_out_a_bits_mask; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [63:0] bh_auto_out_a_bits_data; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_a_bits_corrupt; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_d_ready; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_d_valid; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_out_d_bits_opcode; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [2:0] bh_auto_out_d_bits_size; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [6:0] bh_auto_out_d_bits_source; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_d_bits_denied; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire [63:0] bh_auto_out_d_bits_data; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  bh_auto_out_d_bits_corrupt; // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
  wire  ww_clock; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_reset; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_a_ready; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_a_valid; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_in_a_bits_opcode; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_in_a_bits_param; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_in_a_bits_size; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [6:0] ww_auto_in_a_bits_source; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [31:0] ww_auto_in_a_bits_address; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [7:0] ww_auto_in_a_bits_mask; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [63:0] ww_auto_in_a_bits_data; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_a_bits_corrupt; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_d_ready; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_d_valid; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_in_d_bits_opcode; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_in_d_bits_size; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [6:0] ww_auto_in_d_bits_source; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_d_bits_denied; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [63:0] ww_auto_in_d_bits_data; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_in_d_bits_corrupt; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_a_ready; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_a_valid; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_out_a_bits_opcode; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_out_a_bits_param; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_out_a_bits_size; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [6:0] ww_auto_out_a_bits_source; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [31:0] ww_auto_out_a_bits_address; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [7:0] ww_auto_out_a_bits_mask; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [63:0] ww_auto_out_a_bits_data; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_a_bits_corrupt; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_d_ready; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_d_valid; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_out_d_bits_opcode; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [2:0] ww_auto_out_d_bits_size; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [6:0] ww_auto_out_d_bits_source; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_d_bits_denied; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire [63:0] ww_auto_out_d_bits_data; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  ww_auto_out_d_bits_corrupt; // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
  wire  shrinker_clock; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_reset; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_a_ready; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_a_valid; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_in_a_bits_opcode; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_in_a_bits_param; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_in_a_bits_size; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [6:0] shrinker_auto_in_a_bits_source; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [31:0] shrinker_auto_in_a_bits_address; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [7:0] shrinker_auto_in_a_bits_mask; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [63:0] shrinker_auto_in_a_bits_data; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_a_bits_corrupt; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_d_ready; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_d_valid; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_in_d_bits_opcode; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_in_d_bits_size; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [6:0] shrinker_auto_in_d_bits_source; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_d_bits_denied; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [63:0] shrinker_auto_in_d_bits_data; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_in_d_bits_corrupt; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_a_ready; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_a_valid; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_out_a_bits_opcode; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_out_a_bits_param; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_out_a_bits_size; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [1:0] shrinker_auto_out_a_bits_source; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [31:0] shrinker_auto_out_a_bits_address; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [7:0] shrinker_auto_out_a_bits_mask; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [63:0] shrinker_auto_out_a_bits_data; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_a_bits_corrupt; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_d_ready; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_d_valid; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_out_d_bits_opcode; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [2:0] shrinker_auto_out_d_bits_size; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [1:0] shrinker_auto_out_d_bits_source; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_d_bits_denied; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire [63:0] shrinker_auto_out_d_bits_data; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  shrinker_auto_out_d_bits_corrupt; // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
  wire  asyncXing_clock; // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
  wire  asyncXing_auto_int_in_0; // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
  wire  asyncXing_auto_int_in_1; // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
  wire  asyncXing_auto_int_out_0; // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
  wire  asyncXing_auto_int_out_1; // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
  wire  bootrom_clock; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_reset; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_auto_in_a_ready; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_auto_in_a_valid; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [2:0] bootrom_auto_in_a_bits_opcode; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [2:0] bootrom_auto_in_a_bits_param; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [1:0] bootrom_auto_in_a_bits_size; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [8:0] bootrom_auto_in_a_bits_source; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [16:0] bootrom_auto_in_a_bits_address; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [7:0] bootrom_auto_in_a_bits_mask; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_auto_in_a_bits_corrupt; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_auto_in_d_ready; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire  bootrom_auto_in_d_valid; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [1:0] bootrom_auto_in_d_bits_size; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [8:0] bootrom_auto_in_d_bits_source; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  wire [63:0] bootrom_auto_in_d_bits_data; // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
  reg [6:0] value; // @[Counter.scala 26:33:freechips.rocketchip.system.DefaultFPGAConfig.fir@144683.4]
  reg [31:0] _RAND_0;
  wire  int_rtc_tick; // @[Counter.scala 34:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144685.6]
  wire [6:0] _T_17; // @[Counter.scala 35:22:freechips.rocketchip.system.DefaultFPGAConfig.fir@144687.6]
  IntXbar int_bus ( // @[InterruptBus.scala 13:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144473.4]
    .auto_int_in_0(int_bus_auto_int_in_0),
    .auto_int_in_1(int_bus_auto_int_in_1),
    .auto_int_out_0(int_bus_auto_int_out_0),
    .auto_int_out_1(int_bus_auto_int_out_1)
  );
  SystemBus sbus ( // @[BaseSubsystem.scala 57:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144479.4]
    .clock(sbus_clock),
    .reset(sbus_reset),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last(sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_ready(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_ready),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_valid(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_valid),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_opcode(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_opcode),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_param(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_param),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_size(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_size),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_source(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_source),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_address(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_address),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_mask(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_mask),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_data(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_data),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_corrupt(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_corrupt),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_ready(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_ready),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_valid(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_valid),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_opcode(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_opcode),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_param(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_param),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_size(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_size),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_source(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_source),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_sink(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_sink),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_denied(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_denied),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_data(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_data),
    .auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_corrupt(sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_ready(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_valid(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_opcode(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_param(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_size(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_source(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_address(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_mask(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_data(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_corrupt(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_ready(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_valid(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_opcode(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_param(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_size(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_source(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_sink(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_denied(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_data(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_corrupt(sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_b_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_b_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_denied),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_e_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_e_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_bits_sink),
    .auto_system_bus_xbar_out_a_ready(sbus_auto_system_bus_xbar_out_a_ready),
    .auto_system_bus_xbar_out_a_valid(sbus_auto_system_bus_xbar_out_a_valid),
    .auto_system_bus_xbar_out_a_bits_opcode(sbus_auto_system_bus_xbar_out_a_bits_opcode),
    .auto_system_bus_xbar_out_a_bits_param(sbus_auto_system_bus_xbar_out_a_bits_param),
    .auto_system_bus_xbar_out_a_bits_size(sbus_auto_system_bus_xbar_out_a_bits_size),
    .auto_system_bus_xbar_out_a_bits_source(sbus_auto_system_bus_xbar_out_a_bits_source),
    .auto_system_bus_xbar_out_a_bits_address(sbus_auto_system_bus_xbar_out_a_bits_address),
    .auto_system_bus_xbar_out_a_bits_mask(sbus_auto_system_bus_xbar_out_a_bits_mask),
    .auto_system_bus_xbar_out_a_bits_data(sbus_auto_system_bus_xbar_out_a_bits_data),
    .auto_system_bus_xbar_out_a_bits_corrupt(sbus_auto_system_bus_xbar_out_a_bits_corrupt),
    .auto_system_bus_xbar_out_b_ready(sbus_auto_system_bus_xbar_out_b_ready),
    .auto_system_bus_xbar_out_b_valid(sbus_auto_system_bus_xbar_out_b_valid),
    .auto_system_bus_xbar_out_b_bits_param(sbus_auto_system_bus_xbar_out_b_bits_param),
    .auto_system_bus_xbar_out_b_bits_address(sbus_auto_system_bus_xbar_out_b_bits_address),
    .auto_system_bus_xbar_out_c_ready(sbus_auto_system_bus_xbar_out_c_ready),
    .auto_system_bus_xbar_out_c_valid(sbus_auto_system_bus_xbar_out_c_valid),
    .auto_system_bus_xbar_out_c_bits_opcode(sbus_auto_system_bus_xbar_out_c_bits_opcode),
    .auto_system_bus_xbar_out_c_bits_param(sbus_auto_system_bus_xbar_out_c_bits_param),
    .auto_system_bus_xbar_out_c_bits_size(sbus_auto_system_bus_xbar_out_c_bits_size),
    .auto_system_bus_xbar_out_c_bits_source(sbus_auto_system_bus_xbar_out_c_bits_source),
    .auto_system_bus_xbar_out_c_bits_address(sbus_auto_system_bus_xbar_out_c_bits_address),
    .auto_system_bus_xbar_out_c_bits_data(sbus_auto_system_bus_xbar_out_c_bits_data),
    .auto_system_bus_xbar_out_c_bits_corrupt(sbus_auto_system_bus_xbar_out_c_bits_corrupt),
    .auto_system_bus_xbar_out_d_ready(sbus_auto_system_bus_xbar_out_d_ready),
    .auto_system_bus_xbar_out_d_valid(sbus_auto_system_bus_xbar_out_d_valid),
    .auto_system_bus_xbar_out_d_bits_opcode(sbus_auto_system_bus_xbar_out_d_bits_opcode),
    .auto_system_bus_xbar_out_d_bits_param(sbus_auto_system_bus_xbar_out_d_bits_param),
    .auto_system_bus_xbar_out_d_bits_size(sbus_auto_system_bus_xbar_out_d_bits_size),
    .auto_system_bus_xbar_out_d_bits_source(sbus_auto_system_bus_xbar_out_d_bits_source),
    .auto_system_bus_xbar_out_d_bits_sink(sbus_auto_system_bus_xbar_out_d_bits_sink),
    .auto_system_bus_xbar_out_d_bits_denied(sbus_auto_system_bus_xbar_out_d_bits_denied),
    .auto_system_bus_xbar_out_d_bits_data(sbus_auto_system_bus_xbar_out_d_bits_data),
    .auto_system_bus_xbar_out_d_bits_corrupt(sbus_auto_system_bus_xbar_out_d_bits_corrupt),
    .auto_system_bus_xbar_out_e_valid(sbus_auto_system_bus_xbar_out_e_valid),
    .auto_system_bus_xbar_out_e_bits_sink(sbus_auto_system_bus_xbar_out_e_bits_sink)
  );
  FrontBus fbus ( // @[BaseSubsystem.scala 59:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144491.4]
    .clock(fbus_clock),
    .reset(fbus_reset),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp),
    .auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last(fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last),
    .auto_bus_xing_out_a_ready(fbus_auto_bus_xing_out_a_ready),
    .auto_bus_xing_out_a_valid(fbus_auto_bus_xing_out_a_valid),
    .auto_bus_xing_out_a_bits_opcode(fbus_auto_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_out_a_bits_param(fbus_auto_bus_xing_out_a_bits_param),
    .auto_bus_xing_out_a_bits_size(fbus_auto_bus_xing_out_a_bits_size),
    .auto_bus_xing_out_a_bits_source(fbus_auto_bus_xing_out_a_bits_source),
    .auto_bus_xing_out_a_bits_address(fbus_auto_bus_xing_out_a_bits_address),
    .auto_bus_xing_out_a_bits_mask(fbus_auto_bus_xing_out_a_bits_mask),
    .auto_bus_xing_out_a_bits_data(fbus_auto_bus_xing_out_a_bits_data),
    .auto_bus_xing_out_a_bits_corrupt(fbus_auto_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_out_d_ready(fbus_auto_bus_xing_out_d_ready),
    .auto_bus_xing_out_d_valid(fbus_auto_bus_xing_out_d_valid),
    .auto_bus_xing_out_d_bits_opcode(fbus_auto_bus_xing_out_d_bits_opcode),
    .auto_bus_xing_out_d_bits_param(fbus_auto_bus_xing_out_d_bits_param),
    .auto_bus_xing_out_d_bits_size(fbus_auto_bus_xing_out_d_bits_size),
    .auto_bus_xing_out_d_bits_source(fbus_auto_bus_xing_out_d_bits_source),
    .auto_bus_xing_out_d_bits_sink(fbus_auto_bus_xing_out_d_bits_sink),
    .auto_bus_xing_out_d_bits_denied(fbus_auto_bus_xing_out_d_bits_denied),
    .auto_bus_xing_out_d_bits_data(fbus_auto_bus_xing_out_d_bits_data),
    .auto_bus_xing_out_d_bits_corrupt(fbus_auto_bus_xing_out_d_bits_corrupt)
  );
  MemoryBus mbus ( // @[BaseSubsystem.scala 60:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144497.4]
    .clock(mbus_clock),
    .reset(mbus_reset),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_ready(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_ready),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_valid(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_valid),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_id(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_id),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_addr(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_addr),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_len(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_len),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_size(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_size),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_burst(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_burst),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_lock(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_lock),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_cache(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_cache),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_prot(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_prot),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_qos(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_qos),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_ready(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_ready),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_valid(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_valid),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_data(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_data),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_strb(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_strb),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_last(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_last),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_ready(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_ready),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_valid(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_valid),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_id(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_id),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_resp(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_resp),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_ready(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_ready),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_valid(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_valid),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_id(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_id),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_addr(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_addr),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_len(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_len),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_size(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_size),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_burst(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_burst),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_lock(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_lock),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_cache(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_cache),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_prot(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_prot),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_qos(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_qos),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_ready(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_ready),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_valid(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_valid),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_id(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_id),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_data(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_data),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_resp(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_resp),
    .auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_last(mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_last),
    .auto_coupler_from_coherence_manager_binder_in_a_ready(mbus_auto_coupler_from_coherence_manager_binder_in_a_ready),
    .auto_coupler_from_coherence_manager_binder_in_a_valid(mbus_auto_coupler_from_coherence_manager_binder_in_a_valid),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_opcode(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_param(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_size(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_source(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_address(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_mask(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_data(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt),
    .auto_coupler_from_coherence_manager_binder_in_d_ready(mbus_auto_coupler_from_coherence_manager_binder_in_d_ready),
    .auto_coupler_from_coherence_manager_binder_in_d_valid(mbus_auto_coupler_from_coherence_manager_binder_in_d_valid),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_opcode(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_size(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_source(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_denied(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_data(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt)
  );
  PeripheryBus_1 cbus ( // @[BaseSubsystem.scala 61:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144503.4]
    .clock(cbus_clock),
    .reset(cbus_reset),
    .auto_coupler_to_bootrom_fragmenter_out_a_ready(cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready),
    .auto_coupler_to_bootrom_fragmenter_out_a_valid(cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_param(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_size(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_source(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_address(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_mask(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt(cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_bootrom_fragmenter_out_d_ready(cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_coupler_to_bootrom_fragmenter_out_d_valid(cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_size(cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_source(cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_data(cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_ready(cbus_auto_coupler_to_debug_fragmenter_out_a_ready),
    .auto_coupler_to_debug_fragmenter_out_a_valid(cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_coupler_to_debug_fragmenter_out_a_bits_opcode(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_a_bits_param(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param),
    .auto_coupler_to_debug_fragmenter_out_a_bits_size(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_debug_fragmenter_out_a_bits_source(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_debug_fragmenter_out_a_bits_address(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_debug_fragmenter_out_a_bits_mask(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_debug_fragmenter_out_a_bits_data(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_bits_corrupt(cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_d_ready(cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_coupler_to_debug_fragmenter_out_d_valid(cbus_auto_coupler_to_debug_fragmenter_out_d_valid),
    .auto_coupler_to_debug_fragmenter_out_d_bits_opcode(cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_d_bits_size(cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size),
    .auto_coupler_to_debug_fragmenter_out_d_bits_source(cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source),
    .auto_coupler_to_debug_fragmenter_out_d_bits_data(cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_ready(cbus_auto_coupler_to_clint_fragmenter_out_a_ready),
    .auto_coupler_to_clint_fragmenter_out_a_valid(cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_coupler_to_clint_fragmenter_out_a_bits_opcode(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_a_bits_param(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param),
    .auto_coupler_to_clint_fragmenter_out_a_bits_size(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_clint_fragmenter_out_a_bits_source(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_clint_fragmenter_out_a_bits_address(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_clint_fragmenter_out_a_bits_mask(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_clint_fragmenter_out_a_bits_data(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_bits_corrupt(cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_d_ready(cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_coupler_to_clint_fragmenter_out_d_valid(cbus_auto_coupler_to_clint_fragmenter_out_d_valid),
    .auto_coupler_to_clint_fragmenter_out_d_bits_opcode(cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_d_bits_size(cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size),
    .auto_coupler_to_clint_fragmenter_out_d_bits_source(cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source),
    .auto_coupler_to_clint_fragmenter_out_d_bits_data(cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_ready(cbus_auto_coupler_to_plic_fragmenter_out_a_ready),
    .auto_coupler_to_plic_fragmenter_out_a_valid(cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_coupler_to_plic_fragmenter_out_a_bits_opcode(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_plic_fragmenter_out_a_bits_param(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_plic_fragmenter_out_a_bits_size(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_plic_fragmenter_out_a_bits_source(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source),
    .auto_coupler_to_plic_fragmenter_out_a_bits_address(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_plic_fragmenter_out_a_bits_mask(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_plic_fragmenter_out_a_bits_data(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_bits_corrupt(cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_d_ready(cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_coupler_to_plic_fragmenter_out_d_valid(cbus_auto_coupler_to_plic_fragmenter_out_d_valid),
    .auto_coupler_to_plic_fragmenter_out_d_bits_opcode(cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_plic_fragmenter_out_d_bits_size(cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size),
    .auto_coupler_to_plic_fragmenter_out_d_bits_source(cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source),
    .auto_coupler_to_plic_fragmenter_out_d_bits_data(cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data),
    .auto_bus_xing_in_a_ready(cbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(cbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(cbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(cbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(cbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(cbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(cbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(cbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(cbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(cbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(cbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(cbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(cbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(cbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(cbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(cbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(cbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(cbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(cbus_auto_bus_xing_in_d_bits_corrupt)
  );
  TLPLIC plic ( // @[Plic.scala 351:26:freechips.rocketchip.system.DefaultFPGAConfig.fir@144527.4]
    .clock(plic_clock),
    .reset(plic_reset),
    .auto_int_in_0(plic_auto_int_in_0),
    .auto_int_in_1(plic_auto_int_in_1),
    .auto_int_out_0(plic_auto_int_out_0),
    .auto_in_a_ready(plic_auto_in_a_ready),
    .auto_in_a_valid(plic_auto_in_a_valid),
    .auto_in_a_bits_opcode(plic_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(plic_auto_in_a_bits_param),
    .auto_in_a_bits_size(plic_auto_in_a_bits_size),
    .auto_in_a_bits_source(plic_auto_in_a_bits_source),
    .auto_in_a_bits_address(plic_auto_in_a_bits_address),
    .auto_in_a_bits_mask(plic_auto_in_a_bits_mask),
    .auto_in_a_bits_data(plic_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(plic_auto_in_a_bits_corrupt),
    .auto_in_d_ready(plic_auto_in_d_ready),
    .auto_in_d_valid(plic_auto_in_d_valid),
    .auto_in_d_bits_opcode(plic_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(plic_auto_in_d_bits_size),
    .auto_in_d_bits_source(plic_auto_in_d_bits_source),
    .auto_in_d_bits_data(plic_auto_in_d_bits_data)
  );
  CLINT clint ( // @[CLINT.scala 109:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144533.4]
    .clock(clint_clock),
    .reset(clint_reset),
    .auto_int_out_0(clint_auto_int_out_0),
    .auto_int_out_1(clint_auto_int_out_1),
    .auto_in_a_ready(clint_auto_in_a_ready),
    .auto_in_a_valid(clint_auto_in_a_valid),
    .auto_in_a_bits_opcode(clint_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(clint_auto_in_a_bits_param),
    .auto_in_a_bits_size(clint_auto_in_a_bits_size),
    .auto_in_a_bits_source(clint_auto_in_a_bits_source),
    .auto_in_a_bits_address(clint_auto_in_a_bits_address),
    .auto_in_a_bits_mask(clint_auto_in_a_bits_mask),
    .auto_in_a_bits_data(clint_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(clint_auto_in_a_bits_corrupt),
    .auto_in_d_ready(clint_auto_in_d_ready),
    .auto_in_d_valid(clint_auto_in_d_valid),
    .auto_in_d_bits_opcode(clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(clint_auto_in_d_bits_size),
    .auto_in_d_bits_source(clint_auto_in_d_bits_source),
    .auto_in_d_bits_data(clint_auto_in_d_bits_data),
    .io_rtcTick(clint_io_rtcTick)
  );
  TLDebugModule debug_1 ( // @[Periphery.scala 61:25:freechips.rocketchip.system.DefaultFPGAConfig.fir@144540.4]
    .clock(debug_1_clock),
    .reset(debug_1_reset),
    .auto_dmInner_dmInner_tl_in_a_ready(debug_1_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid(debug_1_auto_dmInner_dmInner_tl_in_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param(debug_1_auto_dmInner_dmInner_tl_in_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size(debug_1_auto_dmInner_dmInner_tl_in_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source(debug_1_auto_dmInner_dmInner_tl_in_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address(debug_1_auto_dmInner_dmInner_tl_in_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask(debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data(debug_1_auto_dmInner_dmInner_tl_in_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt(debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready(debug_1_auto_dmInner_dmInner_tl_in_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid(debug_1_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_size(debug_1_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source(debug_1_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_data(debug_1_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmOuter_intsource_out_sync_0(debug_1_auto_dmOuter_intsource_out_sync_0),
    .io_ctrl_ndreset(debug_1_io_ctrl_ndreset),
    .io_ctrl_dmactive(debug_1_io_ctrl_dmactive),
    .io_dmi_dmi_req_ready(debug_1_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid(debug_1_io_dmi_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr(debug_1_io_dmi_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data(debug_1_io_dmi_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op(debug_1_io_dmi_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready(debug_1_io_dmi_dmi_resp_ready),
    .io_dmi_dmi_resp_valid(debug_1_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data(debug_1_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp(debug_1_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock(debug_1_io_dmi_dmiClock),
    .io_dmi_dmiReset(debug_1_io_dmi_dmiReset)
  );
  RocketTile tile ( // @[RocketSubsystem.scala 42:28:freechips.rocketchip.system.DefaultFPGAConfig.fir@144553.4]
    .clock(tile_clock),
    .reset(tile_reset),
    .auto_intsink_in_sync_0(tile_auto_intsink_in_sync_0),
    .auto_int_in_xing_in_1_sync_0(tile_auto_int_in_xing_in_1_sync_0),
    .auto_int_in_xing_in_0_sync_0(tile_auto_int_in_xing_in_0_sync_0),
    .auto_int_in_xing_in_0_sync_1(tile_auto_int_in_xing_in_0_sync_1),
    .auto_tl_master_xing_out_a_ready(tile_auto_tl_master_xing_out_a_ready),
    .auto_tl_master_xing_out_a_valid(tile_auto_tl_master_xing_out_a_valid),
    .auto_tl_master_xing_out_a_bits_opcode(tile_auto_tl_master_xing_out_a_bits_opcode),
    .auto_tl_master_xing_out_a_bits_param(tile_auto_tl_master_xing_out_a_bits_param),
    .auto_tl_master_xing_out_a_bits_size(tile_auto_tl_master_xing_out_a_bits_size),
    .auto_tl_master_xing_out_a_bits_source(tile_auto_tl_master_xing_out_a_bits_source),
    .auto_tl_master_xing_out_a_bits_address(tile_auto_tl_master_xing_out_a_bits_address),
    .auto_tl_master_xing_out_a_bits_mask(tile_auto_tl_master_xing_out_a_bits_mask),
    .auto_tl_master_xing_out_a_bits_data(tile_auto_tl_master_xing_out_a_bits_data),
    .auto_tl_master_xing_out_a_bits_corrupt(tile_auto_tl_master_xing_out_a_bits_corrupt),
    .auto_tl_master_xing_out_b_ready(tile_auto_tl_master_xing_out_b_ready),
    .auto_tl_master_xing_out_b_valid(tile_auto_tl_master_xing_out_b_valid),
    .auto_tl_master_xing_out_b_bits_param(tile_auto_tl_master_xing_out_b_bits_param),
    .auto_tl_master_xing_out_b_bits_address(tile_auto_tl_master_xing_out_b_bits_address),
    .auto_tl_master_xing_out_c_ready(tile_auto_tl_master_xing_out_c_ready),
    .auto_tl_master_xing_out_c_valid(tile_auto_tl_master_xing_out_c_valid),
    .auto_tl_master_xing_out_c_bits_opcode(tile_auto_tl_master_xing_out_c_bits_opcode),
    .auto_tl_master_xing_out_c_bits_param(tile_auto_tl_master_xing_out_c_bits_param),
    .auto_tl_master_xing_out_c_bits_size(tile_auto_tl_master_xing_out_c_bits_size),
    .auto_tl_master_xing_out_c_bits_source(tile_auto_tl_master_xing_out_c_bits_source),
    .auto_tl_master_xing_out_c_bits_address(tile_auto_tl_master_xing_out_c_bits_address),
    .auto_tl_master_xing_out_c_bits_data(tile_auto_tl_master_xing_out_c_bits_data),
    .auto_tl_master_xing_out_c_bits_corrupt(tile_auto_tl_master_xing_out_c_bits_corrupt),
    .auto_tl_master_xing_out_d_ready(tile_auto_tl_master_xing_out_d_ready),
    .auto_tl_master_xing_out_d_valid(tile_auto_tl_master_xing_out_d_valid),
    .auto_tl_master_xing_out_d_bits_opcode(tile_auto_tl_master_xing_out_d_bits_opcode),
    .auto_tl_master_xing_out_d_bits_param(tile_auto_tl_master_xing_out_d_bits_param),
    .auto_tl_master_xing_out_d_bits_size(tile_auto_tl_master_xing_out_d_bits_size),
    .auto_tl_master_xing_out_d_bits_source(tile_auto_tl_master_xing_out_d_bits_source),
    .auto_tl_master_xing_out_d_bits_sink(tile_auto_tl_master_xing_out_d_bits_sink),
    .auto_tl_master_xing_out_d_bits_denied(tile_auto_tl_master_xing_out_d_bits_denied),
    .auto_tl_master_xing_out_d_bits_data(tile_auto_tl_master_xing_out_d_bits_data),
    .auto_tl_master_xing_out_d_bits_corrupt(tile_auto_tl_master_xing_out_d_bits_corrupt),
    .auto_tl_master_xing_out_e_valid(tile_auto_tl_master_xing_out_e_valid),
    .auto_tl_master_xing_out_e_bits_sink(tile_auto_tl_master_xing_out_e_bits_sink)
  );
  IntSyncCrossingSource_2 intsource ( // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144560.4]
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_3 intsource_1 ( // @[Crossing.scala 26:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144566.4]
    .clock(intsource_1_clock),
    .reset(intsource_1_reset),
    .auto_in_0(intsource_1_auto_in_0),
    .auto_out_sync_0(intsource_1_auto_out_sync_0)
  );
  TLBroadcast bh ( // @[MemoryBus.scala 29:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144578.4]
    .clock(bh_clock),
    .reset(bh_reset),
    .auto_in_a_ready(bh_auto_in_a_ready),
    .auto_in_a_valid(bh_auto_in_a_valid),
    .auto_in_a_bits_opcode(bh_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bh_auto_in_a_bits_param),
    .auto_in_a_bits_size(bh_auto_in_a_bits_size),
    .auto_in_a_bits_source(bh_auto_in_a_bits_source),
    .auto_in_a_bits_address(bh_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bh_auto_in_a_bits_mask),
    .auto_in_a_bits_data(bh_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(bh_auto_in_a_bits_corrupt),
    .auto_in_b_ready(bh_auto_in_b_ready),
    .auto_in_b_valid(bh_auto_in_b_valid),
    .auto_in_b_bits_param(bh_auto_in_b_bits_param),
    .auto_in_b_bits_address(bh_auto_in_b_bits_address),
    .auto_in_c_ready(bh_auto_in_c_ready),
    .auto_in_c_valid(bh_auto_in_c_valid),
    .auto_in_c_bits_opcode(bh_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(bh_auto_in_c_bits_param),
    .auto_in_c_bits_size(bh_auto_in_c_bits_size),
    .auto_in_c_bits_source(bh_auto_in_c_bits_source),
    .auto_in_c_bits_address(bh_auto_in_c_bits_address),
    .auto_in_c_bits_data(bh_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(bh_auto_in_c_bits_corrupt),
    .auto_in_d_ready(bh_auto_in_d_ready),
    .auto_in_d_valid(bh_auto_in_d_valid),
    .auto_in_d_bits_opcode(bh_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(bh_auto_in_d_bits_param),
    .auto_in_d_bits_size(bh_auto_in_d_bits_size),
    .auto_in_d_bits_source(bh_auto_in_d_bits_source),
    .auto_in_d_bits_sink(bh_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(bh_auto_in_d_bits_denied),
    .auto_in_d_bits_data(bh_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(bh_auto_in_d_bits_corrupt),
    .auto_in_e_valid(bh_auto_in_e_valid),
    .auto_in_e_bits_sink(bh_auto_in_e_bits_sink),
    .auto_out_a_ready(bh_auto_out_a_ready),
    .auto_out_a_valid(bh_auto_out_a_valid),
    .auto_out_a_bits_opcode(bh_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(bh_auto_out_a_bits_param),
    .auto_out_a_bits_size(bh_auto_out_a_bits_size),
    .auto_out_a_bits_source(bh_auto_out_a_bits_source),
    .auto_out_a_bits_address(bh_auto_out_a_bits_address),
    .auto_out_a_bits_mask(bh_auto_out_a_bits_mask),
    .auto_out_a_bits_data(bh_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(bh_auto_out_a_bits_corrupt),
    .auto_out_d_ready(bh_auto_out_d_ready),
    .auto_out_d_valid(bh_auto_out_d_valid),
    .auto_out_d_bits_opcode(bh_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(bh_auto_out_d_bits_size),
    .auto_out_d_bits_source(bh_auto_out_d_bits_source),
    .auto_out_d_bits_denied(bh_auto_out_d_bits_denied),
    .auto_out_d_bits_data(bh_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(bh_auto_out_d_bits_corrupt)
  );
  TLWidthWidget_8 ww ( // @[MemoryBus.scala 30:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144584.4]
    .clock(ww_clock),
    .reset(ww_reset),
    .auto_in_a_ready(ww_auto_in_a_ready),
    .auto_in_a_valid(ww_auto_in_a_valid),
    .auto_in_a_bits_opcode(ww_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ww_auto_in_a_bits_param),
    .auto_in_a_bits_size(ww_auto_in_a_bits_size),
    .auto_in_a_bits_source(ww_auto_in_a_bits_source),
    .auto_in_a_bits_address(ww_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ww_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ww_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(ww_auto_in_a_bits_corrupt),
    .auto_in_d_ready(ww_auto_in_d_ready),
    .auto_in_d_valid(ww_auto_in_d_valid),
    .auto_in_d_bits_opcode(ww_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ww_auto_in_d_bits_size),
    .auto_in_d_bits_source(ww_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ww_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ww_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ww_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ww_auto_out_a_ready),
    .auto_out_a_valid(ww_auto_out_a_valid),
    .auto_out_a_bits_opcode(ww_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ww_auto_out_a_bits_param),
    .auto_out_a_bits_size(ww_auto_out_a_bits_size),
    .auto_out_a_bits_source(ww_auto_out_a_bits_source),
    .auto_out_a_bits_address(ww_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ww_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ww_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(ww_auto_out_a_bits_corrupt),
    .auto_out_d_ready(ww_auto_out_d_ready),
    .auto_out_d_valid(ww_auto_out_d_valid),
    .auto_out_d_bits_opcode(ww_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(ww_auto_out_d_bits_size),
    .auto_out_d_bits_source(ww_auto_out_d_bits_source),
    .auto_out_d_bits_denied(ww_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ww_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ww_auto_out_d_bits_corrupt)
  );
  TLSourceShrinker shrinker ( // @[SourceShrinker.scala 79:30:freechips.rocketchip.system.DefaultFPGAConfig.fir@144590.4]
    .clock(shrinker_clock),
    .reset(shrinker_reset),
    .auto_in_a_ready(shrinker_auto_in_a_ready),
    .auto_in_a_valid(shrinker_auto_in_a_valid),
    .auto_in_a_bits_opcode(shrinker_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(shrinker_auto_in_a_bits_param),
    .auto_in_a_bits_size(shrinker_auto_in_a_bits_size),
    .auto_in_a_bits_source(shrinker_auto_in_a_bits_source),
    .auto_in_a_bits_address(shrinker_auto_in_a_bits_address),
    .auto_in_a_bits_mask(shrinker_auto_in_a_bits_mask),
    .auto_in_a_bits_data(shrinker_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(shrinker_auto_in_a_bits_corrupt),
    .auto_in_d_ready(shrinker_auto_in_d_ready),
    .auto_in_d_valid(shrinker_auto_in_d_valid),
    .auto_in_d_bits_opcode(shrinker_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(shrinker_auto_in_d_bits_size),
    .auto_in_d_bits_source(shrinker_auto_in_d_bits_source),
    .auto_in_d_bits_denied(shrinker_auto_in_d_bits_denied),
    .auto_in_d_bits_data(shrinker_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(shrinker_auto_in_d_bits_corrupt),
    .auto_out_a_ready(shrinker_auto_out_a_ready),
    .auto_out_a_valid(shrinker_auto_out_a_valid),
    .auto_out_a_bits_opcode(shrinker_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(shrinker_auto_out_a_bits_param),
    .auto_out_a_bits_size(shrinker_auto_out_a_bits_size),
    .auto_out_a_bits_source(shrinker_auto_out_a_bits_source),
    .auto_out_a_bits_address(shrinker_auto_out_a_bits_address),
    .auto_out_a_bits_mask(shrinker_auto_out_a_bits_mask),
    .auto_out_a_bits_data(shrinker_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(shrinker_auto_out_a_bits_corrupt),
    .auto_out_d_ready(shrinker_auto_out_d_ready),
    .auto_out_d_valid(shrinker_auto_out_d_valid),
    .auto_out_d_bits_opcode(shrinker_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(shrinker_auto_out_d_bits_size),
    .auto_out_d_bits_source(shrinker_auto_out_d_bits_source),
    .auto_out_d_bits_denied(shrinker_auto_out_d_bits_denied),
    .auto_out_d_bits_data(shrinker_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(shrinker_auto_out_d_bits_corrupt)
  );
  IntXing asyncXing ( // @[InterruptBus.scala 16:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144596.4]
    .clock(asyncXing_clock),
    .auto_int_in_0(asyncXing_auto_int_in_0),
    .auto_int_in_1(asyncXing_auto_int_in_1),
    .auto_int_out_0(asyncXing_auto_int_out_0),
    .auto_int_out_1(asyncXing_auto_int_out_1)
  );
  TLROM bootrom ( // @[BootROM.scala 72:27:freechips.rocketchip.system.DefaultFPGAConfig.fir@144602.4]
    .clock(bootrom_clock),
    .reset(bootrom_reset),
    .auto_in_a_ready(bootrom_auto_in_a_ready),
    .auto_in_a_valid(bootrom_auto_in_a_valid),
    .auto_in_a_bits_opcode(bootrom_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bootrom_auto_in_a_bits_param),
    .auto_in_a_bits_size(bootrom_auto_in_a_bits_size),
    .auto_in_a_bits_source(bootrom_auto_in_a_bits_source),
    .auto_in_a_bits_address(bootrom_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bootrom_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(bootrom_auto_in_a_bits_corrupt),
    .auto_in_d_ready(bootrom_auto_in_d_ready),
    .auto_in_d_valid(bootrom_auto_in_d_valid),
    .auto_in_d_bits_size(bootrom_auto_in_d_bits_size),
    .auto_in_d_bits_source(bootrom_auto_in_d_bits_source),
    .auto_in_d_bits_data(bootrom_auto_in_d_bits_data)
  );
  assign int_rtc_tick = value == 7'h63; // @[Counter.scala 34:24:freechips.rocketchip.system.DefaultFPGAConfig.fir@144685.6]
  assign _T_17 = value + 7'h1; // @[Counter.scala 35:22:freechips.rocketchip.system.DefaultFPGAConfig.fir@144687.6]
  assign debug_clockeddmi_dmi_req_ready = debug_1_io_dmi_dmi_req_ready; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_clockeddmi_dmi_resp_valid = debug_1_io_dmi_dmi_resp_valid; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_clockeddmi_dmi_resp_bits_data = debug_1_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_clockeddmi_dmi_resp_bits_resp = debug_1_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_ndreset = debug_1_io_ctrl_ndreset; // @[Periphery.scala 110:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@144666.4]
  assign debug_dmactive = debug_1_io_ctrl_dmactive; // @[Periphery.scala 111:18:freechips.rocketchip.system.DefaultFPGAConfig.fir@144667.4]
  assign mem_axi4_0_aw_valid = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_valid; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_id = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_id; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_addr = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_addr; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_len = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_len; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_size = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_size; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_burst = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_burst; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_lock = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_lock; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_cache = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_cache; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_prot = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_prot; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_aw_bits_qos = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_bits_qos; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_w_valid = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_valid; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_w_bits_data = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_data; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_w_bits_strb = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_strb; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_w_bits_last = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_bits_last; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_b_ready = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_ready; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_valid = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_valid; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_id = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_id; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_addr = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_addr; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_len = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_len; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_size = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_size; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_burst = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_burst; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_lock = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_lock; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_cache = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_cache; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_prot = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_prot; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_ar_bits_qos = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_bits_qos; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mem_axi4_0_r_ready = mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_ready; // @[Ports.scala 69:61:freechips.rocketchip.system.DefaultFPGAConfig.fir@144699.4]
  assign mmio_axi4_0_aw_valid = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_id = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_addr = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_len = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_size = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_burst = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_lock = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_cache = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_prot = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_aw_bits_qos = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_w_valid = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_w_bits_data = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_w_bits_strb = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_w_bits_last = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_b_ready = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_valid = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_id = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_addr = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_len = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_size = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_burst = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_lock = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_cache = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_prot = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_ar_bits_qos = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign mmio_axi4_0_r_ready = sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready; // @[Ports.scala 115:80:freechips.rocketchip.system.DefaultFPGAConfig.fir@144700.4]
  assign l2_frontend_bus_axi4_0_aw_ready = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_w_ready = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_b_valid = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_b_bits_id = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_b_bits_resp = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_ar_ready = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_r_valid = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_r_bits_id = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_r_bits_data = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_r_bits_resp = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign l2_frontend_bus_axi4_0_r_bits_last = fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last; // @[Ports.scala 154:102:freechips.rocketchip.system.DefaultFPGAConfig.fir@144701.4]
  assign int_bus_auto_int_in_0 = asyncXing_auto_int_out_0; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144658.4]
  assign int_bus_auto_int_in_1 = asyncXing_auto_int_out_1; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144658.4]
  assign sbus_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144483.4]
  assign sbus_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144484.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready = mmio_axi4_0_aw_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready = mmio_axi4_0_w_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid = mmio_axi4_0_b_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id = mmio_axi4_0_b_bits_id; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp = mmio_axi4_0_b_bits_resp; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready = mmio_axi4_0_ar_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid = mmio_axi4_0_r_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id = mmio_axi4_0_r_bits_id; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data = mmio_axi4_0_r_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp = mmio_axi4_0_r_bits_resp; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last = mmio_axi4_0_r_bits_last; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144660.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_valid = fbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_opcode = fbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_param = fbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_size = fbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_source = fbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_address = fbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_mask = fbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_data = fbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_bits_corrupt = fbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_ready = fbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_ready = cbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_valid = cbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_opcode = cbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_param = cbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_size = cbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_source = cbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_sink = cbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_denied = cbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_data = cbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_bits_corrupt = cbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_valid = tile_auto_tl_master_xing_out_a_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_opcode = tile_auto_tl_master_xing_out_a_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_param = tile_auto_tl_master_xing_out_a_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_size = tile_auto_tl_master_xing_out_a_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_source = tile_auto_tl_master_xing_out_a_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_address = tile_auto_tl_master_xing_out_a_bits_address; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_mask = tile_auto_tl_master_xing_out_a_bits_mask; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_data = tile_auto_tl_master_xing_out_a_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_bits_corrupt = tile_auto_tl_master_xing_out_a_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_ready = tile_auto_tl_master_xing_out_b_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_valid = tile_auto_tl_master_xing_out_c_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_opcode = tile_auto_tl_master_xing_out_c_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_param = tile_auto_tl_master_xing_out_c_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_size = tile_auto_tl_master_xing_out_c_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_source = tile_auto_tl_master_xing_out_c_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_address = tile_auto_tl_master_xing_out_c_bits_address; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_data = tile_auto_tl_master_xing_out_c_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_bits_corrupt = tile_auto_tl_master_xing_out_c_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_ready = tile_auto_tl_master_xing_out_d_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_valid = tile_auto_tl_master_xing_out_e_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_e_bits_sink = tile_auto_tl_master_xing_out_e_bits_sink; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign sbus_auto_system_bus_xbar_out_a_ready = bh_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_b_valid = bh_auto_in_b_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_b_bits_param = bh_auto_in_b_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_b_bits_address = bh_auto_in_b_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_c_ready = bh_auto_in_c_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_valid = bh_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_opcode = bh_auto_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_param = bh_auto_in_d_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_size = bh_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_source = bh_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_sink = bh_auto_in_d_bits_sink; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_denied = bh_auto_in_d_bits_denied; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_data = bh_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign sbus_auto_system_bus_xbar_out_d_bits_corrupt = bh_auto_in_d_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign fbus_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144495.4]
  assign fbus_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144496.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid = l2_frontend_bus_axi4_0_aw_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id = l2_frontend_bus_axi4_0_aw_bits_id; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr = l2_frontend_bus_axi4_0_aw_bits_addr; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len = l2_frontend_bus_axi4_0_aw_bits_len; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size = l2_frontend_bus_axi4_0_aw_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst = l2_frontend_bus_axi4_0_aw_bits_burst; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid = l2_frontend_bus_axi4_0_w_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data = l2_frontend_bus_axi4_0_w_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb = l2_frontend_bus_axi4_0_w_bits_strb; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last = l2_frontend_bus_axi4_0_w_bits_last; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready = l2_frontend_bus_axi4_0_b_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid = l2_frontend_bus_axi4_0_ar_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id = l2_frontend_bus_axi4_0_ar_bits_id; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr = l2_frontend_bus_axi4_0_ar_bits_addr; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len = l2_frontend_bus_axi4_0_ar_bits_len; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size = l2_frontend_bus_axi4_0_ar_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst = l2_frontend_bus_axi4_0_ar_bits_burst; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready = l2_frontend_bus_axi4_0_r_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144661.4]
  assign fbus_auto_bus_xing_out_a_ready = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_a_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_valid = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_opcode = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_param = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_size = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_source = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_sink = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_sink; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_denied = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_denied; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_data = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign fbus_auto_bus_xing_out_d_bits_corrupt = sbus_auto_coupler_from_bus_named_front_bus_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144653.4]
  assign mbus_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144501.4]
  assign mbus_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144502.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_aw_ready = mem_axi4_0_aw_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_w_ready = mem_axi4_0_w_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_valid = mem_axi4_0_b_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_id = mem_axi4_0_b_bits_id; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_b_bits_resp = mem_axi4_0_b_bits_resp; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_ar_ready = mem_axi4_0_ar_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_valid = mem_axi4_0_r_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_id = mem_axi4_0_r_bits_id; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_data = mem_axi4_0_r_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_resp = mem_axi4_0_r_bits_resp; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_to_memory_controller_named_axi4_axi4yank_out_r_bits_last = mem_axi4_0_r_bits_last; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144659.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_valid = shrinker_auto_out_a_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode = shrinker_auto_out_a_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param = shrinker_auto_out_a_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size = shrinker_auto_out_a_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source = shrinker_auto_out_a_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address = shrinker_auto_out_a_bits_address; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask = shrinker_auto_out_a_bits_mask; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data = shrinker_auto_out_a_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt = shrinker_auto_out_a_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign mbus_auto_coupler_from_coherence_manager_binder_in_d_ready = shrinker_auto_out_d_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign cbus_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144507.4]
  assign cbus_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144508.4]
  assign cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready = bootrom_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid = bootrom_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size = bootrom_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source = bootrom_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data = bootrom_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_a_ready = debug_1_auto_dmInner_dmInner_tl_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_d_valid = debug_1_auto_dmInner_dmInner_tl_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode = debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size = debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source = debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data = debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_a_ready = clint_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_d_valid = clint_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode = clint_auto_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size = clint_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source = clint_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data = clint_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_a_ready = plic_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_d_valid = plic_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode = plic_auto_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size = plic_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source = plic_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data = plic_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign cbus_auto_bus_xing_in_a_valid = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_opcode = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_param = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_size = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_source = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_address = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_mask = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_data = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_a_bits_corrupt = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign cbus_auto_bus_xing_in_d_ready = sbus_auto_coupler_to_bus_named_periphery_bus_bus_xing_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144652.4]
  assign plic_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144531.4]
  assign plic_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144532.4]
  assign plic_auto_int_in_0 = int_bus_auto_int_out_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144632.4]
  assign plic_auto_int_in_1 = int_bus_auto_int_out_1; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144632.4]
  assign plic_auto_in_a_valid = cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_opcode = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_param = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_size = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_source = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_address = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_mask = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_data = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_a_bits_corrupt = cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign plic_auto_in_d_ready = cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144638.4]
  assign clint_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144538.4]
  assign clint_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144539.4]
  assign clint_auto_in_a_valid = cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_opcode = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_param = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_size = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_source = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_address = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_mask = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_data = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_a_bits_corrupt = cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_auto_in_d_ready = cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144640.4]
  assign clint_io_rtcTick = value == 7'h63; // @[RTC.scala 24:29:freechips.rocketchip.system.DefaultFPGAConfig.fir@144694.4]
  assign debug_1_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144545.4]
  assign debug_1_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144546.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_valid = cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_param = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_size = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_source = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_address = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_data = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt = cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_auto_dmInner_dmInner_tl_in_d_ready = cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144642.4]
  assign debug_1_io_dmi_dmi_req_valid = debug_clockeddmi_dmi_req_valid; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmi_req_bits_addr = debug_clockeddmi_dmi_req_bits_addr; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmi_req_bits_data = debug_clockeddmi_dmi_req_bits_data; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmi_req_bits_op = debug_clockeddmi_dmi_req_bits_op; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmi_resp_ready = debug_clockeddmi_dmi_resp_ready; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmiClock = debug_clockeddmi_dmiClock; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign debug_1_io_dmi_dmiReset = debug_clockeddmi_dmiReset; // @[Periphery.scala 96:67:freechips.rocketchip.system.DefaultFPGAConfig.fir@144665.4]
  assign tile_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144558.4]
  assign tile_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144559.4]
  assign tile_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_sync_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144641.4]
  assign tile_auto_int_in_xing_in_1_sync_0 = intsource_1_auto_out_sync_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144650.4]
  assign tile_auto_int_in_xing_in_0_sync_0 = intsource_auto_out_sync_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144648.4]
  assign tile_auto_int_in_xing_in_0_sync_1 = intsource_auto_out_sync_1; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144648.4]
  assign tile_auto_tl_master_xing_out_a_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_a_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_b_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_b_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_b_bits_address = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_b_bits_address; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_c_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_c_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_param; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_sink = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_sink; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_denied = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_denied; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_data = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign tile_auto_tl_master_xing_out_d_bits_corrupt = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_d_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144647.4]
  assign intsource_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144564.4]
  assign intsource_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144565.4]
  assign intsource_auto_in_0 = clint_auto_int_out_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144639.4]
  assign intsource_auto_in_1 = clint_auto_int_out_1; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144639.4]
  assign intsource_1_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144570.4]
  assign intsource_1_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144571.4]
  assign intsource_1_auto_in_0 = plic_auto_int_out_0; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144637.4]
  assign bh_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144582.4]
  assign bh_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144583.4]
  assign bh_auto_in_a_valid = sbus_auto_system_bus_xbar_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_opcode = sbus_auto_system_bus_xbar_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_param = sbus_auto_system_bus_xbar_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_size = sbus_auto_system_bus_xbar_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_source = sbus_auto_system_bus_xbar_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_address = sbus_auto_system_bus_xbar_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_mask = sbus_auto_system_bus_xbar_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_data = sbus_auto_system_bus_xbar_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_a_bits_corrupt = sbus_auto_system_bus_xbar_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_b_ready = sbus_auto_system_bus_xbar_out_b_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_valid = sbus_auto_system_bus_xbar_out_c_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_opcode = sbus_auto_system_bus_xbar_out_c_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_param = sbus_auto_system_bus_xbar_out_c_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_size = sbus_auto_system_bus_xbar_out_c_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_source = sbus_auto_system_bus_xbar_out_c_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_address = sbus_auto_system_bus_xbar_out_c_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_data = sbus_auto_system_bus_xbar_out_c_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_c_bits_corrupt = sbus_auto_system_bus_xbar_out_c_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_d_ready = sbus_auto_system_bus_xbar_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_e_valid = sbus_auto_system_bus_xbar_out_e_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_in_e_bits_sink = sbus_auto_system_bus_xbar_out_e_bits_sink; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144633.4]
  assign bh_auto_out_a_ready = ww_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_valid = ww_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_opcode = ww_auto_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_size = ww_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_source = ww_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_denied = ww_auto_in_d_bits_denied; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_data = ww_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign bh_auto_out_d_bits_corrupt = ww_auto_in_d_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144588.4]
  assign ww_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144589.4]
  assign ww_auto_in_a_valid = bh_auto_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_opcode = bh_auto_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_param = bh_auto_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_size = bh_auto_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_source = bh_auto_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_address = bh_auto_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_mask = bh_auto_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_data = bh_auto_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_a_bits_corrupt = bh_auto_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_in_d_ready = bh_auto_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144654.4]
  assign ww_auto_out_a_ready = shrinker_auto_in_a_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_valid = shrinker_auto_in_d_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_opcode = shrinker_auto_in_d_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_size = shrinker_auto_in_d_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_source = shrinker_auto_in_d_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_denied = shrinker_auto_in_d_bits_denied; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_data = shrinker_auto_in_d_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign ww_auto_out_d_bits_corrupt = shrinker_auto_in_d_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144594.4]
  assign shrinker_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144595.4]
  assign shrinker_auto_in_a_valid = ww_auto_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_opcode = ww_auto_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_param = ww_auto_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_size = ww_auto_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_source = ww_auto_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_address = ww_auto_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_mask = ww_auto_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_data = ww_auto_out_a_bits_data; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_a_bits_corrupt = ww_auto_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_in_d_ready = ww_auto_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144655.4]
  assign shrinker_auto_out_a_ready = mbus_auto_coupler_from_coherence_manager_binder_in_a_ready; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_valid = mbus_auto_coupler_from_coherence_manager_binder_in_d_valid; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_opcode = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_size = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_source = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_denied = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_data = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign shrinker_auto_out_d_bits_corrupt = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt; // @[LazyModule.scala 167:31:freechips.rocketchip.system.DefaultFPGAConfig.fir@144656.4]
  assign asyncXing_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144600.4]
  assign asyncXing_auto_int_in_0 = interrupts[0]; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144657.4]
  assign asyncXing_auto_int_in_1 = interrupts[1]; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144657.4]
  assign bootrom_clock = clock; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144606.4]
  assign bootrom_reset = reset; // @[:freechips.rocketchip.system.DefaultFPGAConfig.fir@144607.4]
  assign bootrom_auto_in_a_valid = cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_opcode = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_param = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_size = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_source = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_address = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_mask = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_a_bits_corrupt = cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
  assign bootrom_auto_in_d_ready = cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[LazyModule.scala 167:57:freechips.rocketchip.system.DefaultFPGAConfig.fir@144662.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  value = _RAND_0[6:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      value <= 7'h0;
    end else begin
      if (int_rtc_tick) begin
        value <= 7'h0;
      end else begin
        value <= _T_17;
      end
    end
  end
endmodule