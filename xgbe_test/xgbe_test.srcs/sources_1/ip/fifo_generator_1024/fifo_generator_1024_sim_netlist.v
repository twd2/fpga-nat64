// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Dec  8 15:24:55 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/fifo_generator_1024/fifo_generator_1024_sim_netlist.v
// Design      : fifo_generator_1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_1024,fifo_generator_v13_2_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_4,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module fifo_generator_1024
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    empty,
    almost_empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [1023:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [1023:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ ALMOST_EMPTY" *) output almost_empty;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "1024" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "1024" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "1" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_generator_1024_fifo_generator_v13_2_4 U0
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module fifo_generator_1024_blk_mem_gen_generic_cstr
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ,
    WEBWE,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 );
  output [1023:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [1023:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  input [1:0]WEBWE;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;

  wire [1023:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [1023:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D[35:0]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 [1]),
        .Q(Q),
        .clk(clk),
        .din(din[35:0]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized9 \ramloop[10].ram.r 
       (.D(D[755:684]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 [0],WEBWE[1]}),
        .clk(clk),
        .din(din[755:684]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized10 \ramloop[11].ram.r 
       (.D(D[827:756]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din[827:756]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized11 \ramloop[12].ram.r 
       (.D(D[899:828]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din[899:828]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized12 \ramloop[13].ram.r 
       (.D(D[971:900]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din[971:900]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized13 \ramloop[14].ram.r 
       (.D(D[1023:972]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE[0]),
        .clk(clk),
        .din(din[1023:972]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.D(D[107:36]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1]),
        .Q(Q),
        .clk(clk),
        .din(din[107:36]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.D(D[179:108]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din[179:108]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.D(D[251:180]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ),
        .Q(Q),
        .clk(clk),
        .din(din[251:180]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.D(D[323:252]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 [0]),
        .Q(Q),
        .clk(clk),
        .din(din[323:252]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.D(D[395:324]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 [1]}),
        .clk(clk),
        .din(din[395:324]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.D(D[467:396]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 [1]),
        .Q(Q),
        .clk(clk),
        .din(din[467:396]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.D(D[539:468]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 [0]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ),
        .Q(Q),
        .clk(clk),
        .din(din[539:468]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized7 \ramloop[8].ram.r 
       (.D(D[611:540]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ),
        .Q(Q),
        .clk(clk),
        .din(din[611:540]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_blk_mem_gen_prim_width__parameterized8 \ramloop[9].ram.r 
       (.D(D[683:612]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 [0]),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 [0]),
        .Q(Q),
        .clk(clk),
        .din(din[683:612]),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 );
  output [35:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input [35:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ;

  wire [35:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [35:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized0
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized1
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized1 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized10
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;

  wire [71:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized10 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized11
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized11 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized12
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;

  wire [71:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized12 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized13
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    WEBWE);
  output [51:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [51:0]din;
  input [0:0]WEBWE;

  wire [51:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire [0:0]WEBWE;
  wire clk;
  wire [51:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized13 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized2
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized2 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized3
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized3 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized4
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized4 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized5
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized5 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized6
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized6 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized7
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized7 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized8
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;

  wire [71:0]D;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized8 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_1024_blk_mem_gen_prim_width__parameterized9
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized9 \prim_noinit.ram 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 );
  output [35:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ;
  input [35:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 ;

  wire [35:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [35:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_1 ,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({din[16:9],din[7:0]}),
        .DIBDI({din[34:27],din[25:18]}),
        .DIPADIP({din[17],din[8]}),
        .DIPBDIP({din[35],din[26]}),
        .DOADO({D[16:9],D[7:0]}),
        .DOBDO({D[34:27],D[25:18]}),
        .DOPADOP({D[17],D[8]}),
        .DOPBDOP({D[35],D[26]}),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_0 ),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_2 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized0
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized1
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized10
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;

  wire [71:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0]),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized11
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE[1],WEBWE[1],WEBWE[1],WEBWE[1],WEBWE[1],WEBWE,WEBWE[0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized12
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;

  wire [71:0]D;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0]),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 [0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized13
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    WEBWE);
  output [51:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [51:0]din;
  input [0:0]WEBWE;

  wire [51:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_12 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_20 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_21 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_28 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_36 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_37 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_4 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_44 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_52 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_53 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_60 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_68 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_69 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_70 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_71 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_72 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_73 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_74 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_75 ;
  wire [8:0]Q;
  wire [0:0]WEBWE;
  wire clk;
  wire [51:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,din[25:20],1'b0,din[19:13],1'b0,1'b0,din[12:7],1'b0,din[6:0]}),
        .DIBDI({1'b0,1'b0,din[51:46],1'b0,din[45:39],1'b0,1'b0,din[38:33],1'b0,din[32:26]}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_4 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_5 ,D[25:20],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_12 ,D[19:13],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_20 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_21 ,D[12:7],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_28 ,D[6:0]}),
        .DOBDO({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_36 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_37 ,D[51:46],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_44 ,D[45:39],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_52 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_53 ,D[38:33],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_60 ,D[32:26]}),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_68 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_69 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_70 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_71 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_72 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_73 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_74 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_n_75 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE,WEBWE}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized2
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized3
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized4
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE[1],WEBWE[1],WEBWE[1],WEBWE,WEBWE[0],WEBWE[0],WEBWE[0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized5
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized6
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized7
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0],\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 [0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized8
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 );
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;

  wire [71:0]D;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [8:0]Q;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_1024_blk_mem_gen_prim_wrapper__parameterized9
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    din,
    WEBWE);
  output [71:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [71:0]din;
  input [1:0]WEBWE;

  wire [71:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [71:0]din;
  wire srst;
  wire tmp_ram_rd_en;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(72),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(72)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram 
       (.ADDRARDADDR({1'b1,Q,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_DBITERR_UNCONNECTED ),
        .DIADI({din[34:27],din[25:18],din[16:9],din[7:0]}),
        .DIBDI({din[70:63],din[61:54],din[52:45],din[43:36]}),
        .DIPADIP({din[35],din[26],din[17],din[8]}),
        .DIPBDIP({din[71],din[62],din[53],din[44]}),
        .DOADO({D[34:27],D[25:18],D[16:9],D[7:0]}),
        .DOBDO({D[70:63],D[61:54],D[52:45],D[43:36]}),
        .DOPADOP({D[35],D[26],D[17],D[8]}),
        .DOPBDOP({D[71],D[62],D[53],D[44]}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(tmp_ram_rd_en),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(srst),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({WEBWE[1],WEBWE[1],WEBWE[1],WEBWE,WEBWE[0],WEBWE[0],WEBWE[0]}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module fifo_generator_1024_blk_mem_gen_top
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ,
    WEBWE,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 );
  output [1023:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [1023:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  input [1:0]WEBWE;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;

  wire [1023:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [1023:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_3" *) 
module fifo_generator_1024_blk_mem_gen_v8_4_3
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ,
    WEBWE,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 );
  output [1023:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [1023:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  input [1:0]WEBWE;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;

  wire [1023:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [1023:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_v8_4_3_synth inst_blk_mem_gen
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_3_synth" *) 
module fifo_generator_1024_blk_mem_gen_v8_4_3_synth
   (D,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ,
    WEBWE,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 );
  output [1023:0]D;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [1023:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  input [1:0]WEBWE;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;

  wire [1023:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [1023:0]din;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_1024_compare
   (comp0,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg);
  output comp0;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_1024_compare_0
   (comp1,
    ram_full_comb,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg_0,
    wr_en,
    out,
    comp0,
    p_7_out);
  output comp1;
  output ram_full_comb;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg_0;
  input wr_en;
  input out;
  input comp0;
  input p_7_out;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire out;
  wire p_7_out;
  wire ram_full_comb;
  wire [0:0]v1_reg_0;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0}));
  LUT5 #(
    .INIT(32'h00CCECEC)) 
    ram_full_fb_i_i_1
       (.I0(wr_en),
        .I1(out),
        .I2(comp1),
        .I3(comp0),
        .I4(p_7_out),
        .O(ram_full_comb));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_1024_compare_1
   (p_2_out,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg_1,
    wr_en,
    out,
    p_7_out,
    comp1,
    almost_full);
  output p_2_out;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg_1;
  input wr_en;
  input out;
  input p_7_out;
  input comp1;
  input almost_full;

  wire almost_full;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire out;
  wire p_0_in;
  wire p_2_out;
  wire p_7_out;
  wire [0:0]v1_reg_1;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h22FFFFFF00200020)) 
    \gaf.gaf0.ram_afull_i_i_1 
       (.I0(wr_en),
        .I1(out),
        .I2(p_0_in),
        .I3(p_7_out),
        .I4(comp1),
        .I5(almost_full),
        .O(p_2_out));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[4].gms.ms_0 ));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],p_0_in}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_1}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_1024_compare_2
   (comp0,
    \gmux.gm[1].gms.ms_0 ,
    \gmux.gm[2].gms.ms_0 ,
    \gmux.gm[3].gms.ms_0 ,
    \gmux.gm[4].gms.ms_0 ,
    ram_empty_i_reg);
  output comp0;
  input \gmux.gm[1].gms.ms_0 ;
  input \gmux.gm[2].gms.ms_0 ;
  input \gmux.gm[3].gms.ms_0 ;
  input \gmux.gm[4].gms.ms_0 ;
  input ram_empty_i_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire \gmux.gm[1].gms.ms_0 ;
  wire \gmux.gm[2].gms.ms_0 ;
  wire \gmux.gm[3].gms.ms_0 ;
  wire \gmux.gm[4].gms.ms_0 ;
  wire ram_empty_i_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S({\gmux.gm[4].gms.ms_0 ,\gmux.gm[3].gms.ms_0 ,\gmux.gm[2].gms.ms_0 ,\gmux.gm[1].gms.ms_0 }));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_i_reg}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_1024_compare_3
   (ram_empty_i0__3,
    v1_reg,
    ram_empty_i_reg,
    wr_en,
    ram_empty_i_reg_0,
    E,
    comp0,
    out);
  output ram_empty_i0__3;
  input [3:0]v1_reg;
  input [0:0]ram_empty_i_reg;
  input wr_en;
  input ram_empty_i_reg_0;
  input [0:0]E;
  input comp0;
  input out;

  wire [0:0]E;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire comp0;
  wire comp1;
  wire out;
  wire ram_empty_i0__3;
  wire [0:0]ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire [3:0]v1_reg;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],ram_empty_i_reg}));
  LUT6 #(
    .INIT(64'hDDDDFFFFD000D000)) 
    ram_empty_fb_i_i_1
       (.I0(wr_en),
        .I1(ram_empty_i_reg_0),
        .I2(comp1),
        .I3(E),
        .I4(comp0),
        .I5(out),
        .O(ram_empty_i0__3));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module fifo_generator_1024_fifo_generator_ramfifo
   (almost_full,
    almost_empty,
    empty,
    full,
    dout,
    wr_en,
    clk,
    srst,
    din,
    rd_en);
  output almost_full;
  output almost_empty;
  output empty;
  output full;
  output [1023:0]dout;
  input wr_en;
  input clk;
  input srst;
  input [1023:0]din;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire \gntv_or_sync_fifo.gl0.wr_n_0 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_29 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_30 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_31 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_32 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_33 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_34 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_35 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_36 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_37 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_38 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_39 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_40 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_41 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_42 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_43 ;
  wire [4:4]\grss.rsts/c2/v1_reg ;
  wire [3:0]\gwss.wsts/c0/v1_reg ;
  wire [3:0]\gwss.wsts/c1/v1_reg ;
  wire [3:0]\gwss.wsts/gaf.c2/v1_reg ;
  wire [8:0]p_0_out;
  wire [8:0]p_11_out;
  wire [7:0]p_12_out;
  wire p_5_out;
  wire p_7_out;
  wire rd_en;
  wire [8:8]rd_pntr_plus1;
  wire srst;
  wire tmp_ram_rd_en;
  wire wr_en;
  wire [7:0]wr_pntr_plus2;

  fifo_generator_1024_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.E(p_5_out),
        .Q(p_0_out),
        .almost_empty(almost_empty),
        .clk(clk),
        .empty(empty),
        .\gc1.count_d1_reg[8] (rd_pntr_plus1),
        .\gmux.gm[3].gms.ms (p_11_out[7:0]),
        .\gmux.gm[3].gms.ms_0 (p_12_out),
        .\gmux.gm[3].gms.ms_1 (wr_pntr_plus2),
        .out(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .p_7_out(p_7_out),
        .ram_empty_i_reg(\gntv_or_sync_fifo.gl0.wr_n_29 ),
        .ram_empty_i_reg_0(\grss.rsts/c2/v1_reg ),
        .rd_en(rd_en),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en),
        .v1_reg(\gwss.wsts/c0/v1_reg ),
        .v1_reg_0(\gwss.wsts/c1/v1_reg ),
        .v1_reg_1(\gwss.wsts/gaf.c2/v1_reg ),
        .wr_en(wr_en));
  fifo_generator_1024_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.Q(wr_pntr_plus2),
        .WEBWE({\gntv_or_sync_fifo.gl0.wr_n_30 ,\gntv_or_sync_fifo.gl0.wr_n_31 }),
        .almost_full(almost_full),
        .clk(clk),
        .full(full),
        .\gcc0.gc1.gsym.count_d1_reg[7] (p_12_out),
        .\gcc0.gc1.gsym.count_d2_reg[8] (p_11_out),
        .\gcc0.gc1.gsym.count_d2_reg[8]_0 (\grss.rsts/c2/v1_reg ),
        .\gcc0.gc1.gsym.count_d2_reg[8]_1 (\gntv_or_sync_fifo.gl0.wr_n_29 ),
        .\gmux.gm[4].gms.ms (\gwss.wsts/c0/v1_reg ),
        .\gmux.gm[4].gms.ms_0 (\gwss.wsts/c1/v1_reg ),
        .\gmux.gm[4].gms.ms_1 (\gwss.wsts/gaf.c2/v1_reg ),
        .\gmux.gm[4].gms.ms_2 (p_0_out[8]),
        .\gmux.gm[4].gms.ms_3 (rd_pntr_plus1),
        .out(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .p_7_out(p_7_out),
        .srst(srst),
        .wr_en(wr_en),
        .wr_en_0({\gntv_or_sync_fifo.gl0.wr_n_32 ,\gntv_or_sync_fifo.gl0.wr_n_33 }),
        .wr_en_1({\gntv_or_sync_fifo.gl0.wr_n_34 ,\gntv_or_sync_fifo.gl0.wr_n_35 }),
        .wr_en_2({\gntv_or_sync_fifo.gl0.wr_n_36 ,\gntv_or_sync_fifo.gl0.wr_n_37 }),
        .wr_en_3({\gntv_or_sync_fifo.gl0.wr_n_38 ,\gntv_or_sync_fifo.gl0.wr_n_39 }),
        .wr_en_4({\gntv_or_sync_fifo.gl0.wr_n_40 ,\gntv_or_sync_fifo.gl0.wr_n_41 }),
        .wr_en_5(\gntv_or_sync_fifo.gl0.wr_n_42 ),
        .wr_en_6(\gntv_or_sync_fifo.gl0.wr_n_43 ));
  fifo_generator_1024_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\gntv_or_sync_fifo.gl0.wr_n_42 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (p_11_out),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ({\gntv_or_sync_fifo.gl0.wr_n_34 ,\gntv_or_sync_fifo.gl0.wr_n_35 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ({\gntv_or_sync_fifo.gl0.wr_n_36 ,\gntv_or_sync_fifo.gl0.wr_n_37 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ({\gntv_or_sync_fifo.gl0.wr_n_38 ,\gntv_or_sync_fifo.gl0.wr_n_39 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ({\gntv_or_sync_fifo.gl0.wr_n_32 ,\gntv_or_sync_fifo.gl0.wr_n_33 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ({\gntv_or_sync_fifo.gl0.wr_n_40 ,\gntv_or_sync_fifo.gl0.wr_n_41 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 (\gntv_or_sync_fifo.gl0.wr_n_43 ),
        .E(p_5_out),
        .Q(p_0_out),
        .WEBWE({\gntv_or_sync_fifo.gl0.wr_n_30 ,\gntv_or_sync_fifo.gl0.wr_n_31 }),
        .clk(clk),
        .din(din),
        .dout(dout),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_generator_1024_fifo_generator_top
   (almost_full,
    almost_empty,
    empty,
    full,
    dout,
    wr_en,
    clk,
    srst,
    din,
    rd_en);
  output almost_full;
  output almost_empty;
  output empty;
  output full;
  output [1023:0]dout;
  input wr_en;
  input clk;
  input srst;
  input [1023:0]din;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  fifo_generator_1024_fifo_generator_ramfifo \grf.rf 
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "1024" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "1024" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "kintex7" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "1" *) 
(* C_HAS_ALMOST_FULL = "1" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x72" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "1" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_4" *) 
module fifo_generator_1024_fifo_generator_v13_2_4
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [1023:0]din;
  input wr_en;
  input rd_en;
  input [8:0]prog_empty_thresh;
  input [8:0]prog_empty_thresh_assert;
  input [8:0]prog_empty_thresh_negate;
  input [8:0]prog_full_thresh;
  input [8:0]prog_full_thresh_assert;
  input [8:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [1023:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [9:0]data_count;
  output [9:0]rd_data_count;
  output [9:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fifo_generator_1024_fifo_generator_v13_2_4_synth inst_fifo_gen
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_4_synth" *) 
module fifo_generator_1024_fifo_generator_v13_2_4_synth
   (almost_full,
    almost_empty,
    empty,
    full,
    dout,
    wr_en,
    clk,
    srst,
    din,
    rd_en);
  output almost_full;
  output almost_empty;
  output empty;
  output full;
  output [1023:0]dout;
  input wr_en;
  input clk;
  input srst;
  input [1023:0]din;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  fifo_generator_1024_fifo_generator_top \gconvfifo.rf 
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module fifo_generator_1024_memory
   (dout,
    clk,
    tmp_ram_rd_en,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ,
    srst,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ,
    din,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ,
    WEBWE,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ,
    E);
  output [1023:0]dout;
  input clk;
  input tmp_ram_rd_en;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  input srst;
  input [8:0]Q;
  input [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  input [1023:0]din;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  input [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  input [1:0]WEBWE;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  input [0:0]E;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ;
  wire [8:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ;
  wire [0:0]E;
  wire [8:0]Q;
  wire [1:0]WEBWE;
  wire clk;
  wire [1023:0]din;
  wire [1023:0]dout;
  wire [1023:0]doutb;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_generator_1024_blk_mem_gen_v8_4_3 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_1 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_2 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_3 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_4 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_5 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_6 ),
        .Q(Q),
        .WEBWE(WEBWE),
        .clk(clk),
        .din(din),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[0] 
       (.C(clk),
        .CE(E),
        .D(doutb[0]),
        .Q(dout[0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1000] 
       (.C(clk),
        .CE(E),
        .D(doutb[1000]),
        .Q(dout[1000]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1001] 
       (.C(clk),
        .CE(E),
        .D(doutb[1001]),
        .Q(dout[1001]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1002] 
       (.C(clk),
        .CE(E),
        .D(doutb[1002]),
        .Q(dout[1002]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1003] 
       (.C(clk),
        .CE(E),
        .D(doutb[1003]),
        .Q(dout[1003]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1004] 
       (.C(clk),
        .CE(E),
        .D(doutb[1004]),
        .Q(dout[1004]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1005] 
       (.C(clk),
        .CE(E),
        .D(doutb[1005]),
        .Q(dout[1005]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1006] 
       (.C(clk),
        .CE(E),
        .D(doutb[1006]),
        .Q(dout[1006]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1007] 
       (.C(clk),
        .CE(E),
        .D(doutb[1007]),
        .Q(dout[1007]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1008] 
       (.C(clk),
        .CE(E),
        .D(doutb[1008]),
        .Q(dout[1008]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1009] 
       (.C(clk),
        .CE(E),
        .D(doutb[1009]),
        .Q(dout[1009]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[100] 
       (.C(clk),
        .CE(E),
        .D(doutb[100]),
        .Q(dout[100]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1010] 
       (.C(clk),
        .CE(E),
        .D(doutb[1010]),
        .Q(dout[1010]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1011] 
       (.C(clk),
        .CE(E),
        .D(doutb[1011]),
        .Q(dout[1011]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1012] 
       (.C(clk),
        .CE(E),
        .D(doutb[1012]),
        .Q(dout[1012]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1013] 
       (.C(clk),
        .CE(E),
        .D(doutb[1013]),
        .Q(dout[1013]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1014] 
       (.C(clk),
        .CE(E),
        .D(doutb[1014]),
        .Q(dout[1014]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1015] 
       (.C(clk),
        .CE(E),
        .D(doutb[1015]),
        .Q(dout[1015]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1016] 
       (.C(clk),
        .CE(E),
        .D(doutb[1016]),
        .Q(dout[1016]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1017] 
       (.C(clk),
        .CE(E),
        .D(doutb[1017]),
        .Q(dout[1017]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1018] 
       (.C(clk),
        .CE(E),
        .D(doutb[1018]),
        .Q(dout[1018]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1019] 
       (.C(clk),
        .CE(E),
        .D(doutb[1019]),
        .Q(dout[1019]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[101] 
       (.C(clk),
        .CE(E),
        .D(doutb[101]),
        .Q(dout[101]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1020] 
       (.C(clk),
        .CE(E),
        .D(doutb[1020]),
        .Q(dout[1020]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1021] 
       (.C(clk),
        .CE(E),
        .D(doutb[1021]),
        .Q(dout[1021]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1022] 
       (.C(clk),
        .CE(E),
        .D(doutb[1022]),
        .Q(dout[1022]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1023] 
       (.C(clk),
        .CE(E),
        .D(doutb[1023]),
        .Q(dout[1023]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[102] 
       (.C(clk),
        .CE(E),
        .D(doutb[102]),
        .Q(dout[102]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[103] 
       (.C(clk),
        .CE(E),
        .D(doutb[103]),
        .Q(dout[103]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[104] 
       (.C(clk),
        .CE(E),
        .D(doutb[104]),
        .Q(dout[104]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[105] 
       (.C(clk),
        .CE(E),
        .D(doutb[105]),
        .Q(dout[105]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[106] 
       (.C(clk),
        .CE(E),
        .D(doutb[106]),
        .Q(dout[106]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[107] 
       (.C(clk),
        .CE(E),
        .D(doutb[107]),
        .Q(dout[107]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[108] 
       (.C(clk),
        .CE(E),
        .D(doutb[108]),
        .Q(dout[108]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[109] 
       (.C(clk),
        .CE(E),
        .D(doutb[109]),
        .Q(dout[109]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[10] 
       (.C(clk),
        .CE(E),
        .D(doutb[10]),
        .Q(dout[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[110] 
       (.C(clk),
        .CE(E),
        .D(doutb[110]),
        .Q(dout[110]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[111] 
       (.C(clk),
        .CE(E),
        .D(doutb[111]),
        .Q(dout[111]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[112] 
       (.C(clk),
        .CE(E),
        .D(doutb[112]),
        .Q(dout[112]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[113] 
       (.C(clk),
        .CE(E),
        .D(doutb[113]),
        .Q(dout[113]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[114] 
       (.C(clk),
        .CE(E),
        .D(doutb[114]),
        .Q(dout[114]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[115] 
       (.C(clk),
        .CE(E),
        .D(doutb[115]),
        .Q(dout[115]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[116] 
       (.C(clk),
        .CE(E),
        .D(doutb[116]),
        .Q(dout[116]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[117] 
       (.C(clk),
        .CE(E),
        .D(doutb[117]),
        .Q(dout[117]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[118] 
       (.C(clk),
        .CE(E),
        .D(doutb[118]),
        .Q(dout[118]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[119] 
       (.C(clk),
        .CE(E),
        .D(doutb[119]),
        .Q(dout[119]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[11] 
       (.C(clk),
        .CE(E),
        .D(doutb[11]),
        .Q(dout[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[120] 
       (.C(clk),
        .CE(E),
        .D(doutb[120]),
        .Q(dout[120]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[121] 
       (.C(clk),
        .CE(E),
        .D(doutb[121]),
        .Q(dout[121]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[122] 
       (.C(clk),
        .CE(E),
        .D(doutb[122]),
        .Q(dout[122]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[123] 
       (.C(clk),
        .CE(E),
        .D(doutb[123]),
        .Q(dout[123]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[124] 
       (.C(clk),
        .CE(E),
        .D(doutb[124]),
        .Q(dout[124]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[125] 
       (.C(clk),
        .CE(E),
        .D(doutb[125]),
        .Q(dout[125]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[126] 
       (.C(clk),
        .CE(E),
        .D(doutb[126]),
        .Q(dout[126]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[127] 
       (.C(clk),
        .CE(E),
        .D(doutb[127]),
        .Q(dout[127]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[128] 
       (.C(clk),
        .CE(E),
        .D(doutb[128]),
        .Q(dout[128]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[129] 
       (.C(clk),
        .CE(E),
        .D(doutb[129]),
        .Q(dout[129]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[12] 
       (.C(clk),
        .CE(E),
        .D(doutb[12]),
        .Q(dout[12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[130] 
       (.C(clk),
        .CE(E),
        .D(doutb[130]),
        .Q(dout[130]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[131] 
       (.C(clk),
        .CE(E),
        .D(doutb[131]),
        .Q(dout[131]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[132] 
       (.C(clk),
        .CE(E),
        .D(doutb[132]),
        .Q(dout[132]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[133] 
       (.C(clk),
        .CE(E),
        .D(doutb[133]),
        .Q(dout[133]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[134] 
       (.C(clk),
        .CE(E),
        .D(doutb[134]),
        .Q(dout[134]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[135] 
       (.C(clk),
        .CE(E),
        .D(doutb[135]),
        .Q(dout[135]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[136] 
       (.C(clk),
        .CE(E),
        .D(doutb[136]),
        .Q(dout[136]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[137] 
       (.C(clk),
        .CE(E),
        .D(doutb[137]),
        .Q(dout[137]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[138] 
       (.C(clk),
        .CE(E),
        .D(doutb[138]),
        .Q(dout[138]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[139] 
       (.C(clk),
        .CE(E),
        .D(doutb[139]),
        .Q(dout[139]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[13] 
       (.C(clk),
        .CE(E),
        .D(doutb[13]),
        .Q(dout[13]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[140] 
       (.C(clk),
        .CE(E),
        .D(doutb[140]),
        .Q(dout[140]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[141] 
       (.C(clk),
        .CE(E),
        .D(doutb[141]),
        .Q(dout[141]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[142] 
       (.C(clk),
        .CE(E),
        .D(doutb[142]),
        .Q(dout[142]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[143] 
       (.C(clk),
        .CE(E),
        .D(doutb[143]),
        .Q(dout[143]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[144] 
       (.C(clk),
        .CE(E),
        .D(doutb[144]),
        .Q(dout[144]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[145] 
       (.C(clk),
        .CE(E),
        .D(doutb[145]),
        .Q(dout[145]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[146] 
       (.C(clk),
        .CE(E),
        .D(doutb[146]),
        .Q(dout[146]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[147] 
       (.C(clk),
        .CE(E),
        .D(doutb[147]),
        .Q(dout[147]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[148] 
       (.C(clk),
        .CE(E),
        .D(doutb[148]),
        .Q(dout[148]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[149] 
       (.C(clk),
        .CE(E),
        .D(doutb[149]),
        .Q(dout[149]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[14] 
       (.C(clk),
        .CE(E),
        .D(doutb[14]),
        .Q(dout[14]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[150] 
       (.C(clk),
        .CE(E),
        .D(doutb[150]),
        .Q(dout[150]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[151] 
       (.C(clk),
        .CE(E),
        .D(doutb[151]),
        .Q(dout[151]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[152] 
       (.C(clk),
        .CE(E),
        .D(doutb[152]),
        .Q(dout[152]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[153] 
       (.C(clk),
        .CE(E),
        .D(doutb[153]),
        .Q(dout[153]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[154] 
       (.C(clk),
        .CE(E),
        .D(doutb[154]),
        .Q(dout[154]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[155] 
       (.C(clk),
        .CE(E),
        .D(doutb[155]),
        .Q(dout[155]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[156] 
       (.C(clk),
        .CE(E),
        .D(doutb[156]),
        .Q(dout[156]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[157] 
       (.C(clk),
        .CE(E),
        .D(doutb[157]),
        .Q(dout[157]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[158] 
       (.C(clk),
        .CE(E),
        .D(doutb[158]),
        .Q(dout[158]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[159] 
       (.C(clk),
        .CE(E),
        .D(doutb[159]),
        .Q(dout[159]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[15] 
       (.C(clk),
        .CE(E),
        .D(doutb[15]),
        .Q(dout[15]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[160] 
       (.C(clk),
        .CE(E),
        .D(doutb[160]),
        .Q(dout[160]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[161] 
       (.C(clk),
        .CE(E),
        .D(doutb[161]),
        .Q(dout[161]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[162] 
       (.C(clk),
        .CE(E),
        .D(doutb[162]),
        .Q(dout[162]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[163] 
       (.C(clk),
        .CE(E),
        .D(doutb[163]),
        .Q(dout[163]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[164] 
       (.C(clk),
        .CE(E),
        .D(doutb[164]),
        .Q(dout[164]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[165] 
       (.C(clk),
        .CE(E),
        .D(doutb[165]),
        .Q(dout[165]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[166] 
       (.C(clk),
        .CE(E),
        .D(doutb[166]),
        .Q(dout[166]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[167] 
       (.C(clk),
        .CE(E),
        .D(doutb[167]),
        .Q(dout[167]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[168] 
       (.C(clk),
        .CE(E),
        .D(doutb[168]),
        .Q(dout[168]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[169] 
       (.C(clk),
        .CE(E),
        .D(doutb[169]),
        .Q(dout[169]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[16] 
       (.C(clk),
        .CE(E),
        .D(doutb[16]),
        .Q(dout[16]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[170] 
       (.C(clk),
        .CE(E),
        .D(doutb[170]),
        .Q(dout[170]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[171] 
       (.C(clk),
        .CE(E),
        .D(doutb[171]),
        .Q(dout[171]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[172] 
       (.C(clk),
        .CE(E),
        .D(doutb[172]),
        .Q(dout[172]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[173] 
       (.C(clk),
        .CE(E),
        .D(doutb[173]),
        .Q(dout[173]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[174] 
       (.C(clk),
        .CE(E),
        .D(doutb[174]),
        .Q(dout[174]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[175] 
       (.C(clk),
        .CE(E),
        .D(doutb[175]),
        .Q(dout[175]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[176] 
       (.C(clk),
        .CE(E),
        .D(doutb[176]),
        .Q(dout[176]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[177] 
       (.C(clk),
        .CE(E),
        .D(doutb[177]),
        .Q(dout[177]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[178] 
       (.C(clk),
        .CE(E),
        .D(doutb[178]),
        .Q(dout[178]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[179] 
       (.C(clk),
        .CE(E),
        .D(doutb[179]),
        .Q(dout[179]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[17] 
       (.C(clk),
        .CE(E),
        .D(doutb[17]),
        .Q(dout[17]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[180] 
       (.C(clk),
        .CE(E),
        .D(doutb[180]),
        .Q(dout[180]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[181] 
       (.C(clk),
        .CE(E),
        .D(doutb[181]),
        .Q(dout[181]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[182] 
       (.C(clk),
        .CE(E),
        .D(doutb[182]),
        .Q(dout[182]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[183] 
       (.C(clk),
        .CE(E),
        .D(doutb[183]),
        .Q(dout[183]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[184] 
       (.C(clk),
        .CE(E),
        .D(doutb[184]),
        .Q(dout[184]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[185] 
       (.C(clk),
        .CE(E),
        .D(doutb[185]),
        .Q(dout[185]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[186] 
       (.C(clk),
        .CE(E),
        .D(doutb[186]),
        .Q(dout[186]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[187] 
       (.C(clk),
        .CE(E),
        .D(doutb[187]),
        .Q(dout[187]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[188] 
       (.C(clk),
        .CE(E),
        .D(doutb[188]),
        .Q(dout[188]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[189] 
       (.C(clk),
        .CE(E),
        .D(doutb[189]),
        .Q(dout[189]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[18] 
       (.C(clk),
        .CE(E),
        .D(doutb[18]),
        .Q(dout[18]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[190] 
       (.C(clk),
        .CE(E),
        .D(doutb[190]),
        .Q(dout[190]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[191] 
       (.C(clk),
        .CE(E),
        .D(doutb[191]),
        .Q(dout[191]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[192] 
       (.C(clk),
        .CE(E),
        .D(doutb[192]),
        .Q(dout[192]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[193] 
       (.C(clk),
        .CE(E),
        .D(doutb[193]),
        .Q(dout[193]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[194] 
       (.C(clk),
        .CE(E),
        .D(doutb[194]),
        .Q(dout[194]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[195] 
       (.C(clk),
        .CE(E),
        .D(doutb[195]),
        .Q(dout[195]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[196] 
       (.C(clk),
        .CE(E),
        .D(doutb[196]),
        .Q(dout[196]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[197] 
       (.C(clk),
        .CE(E),
        .D(doutb[197]),
        .Q(dout[197]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[198] 
       (.C(clk),
        .CE(E),
        .D(doutb[198]),
        .Q(dout[198]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[199] 
       (.C(clk),
        .CE(E),
        .D(doutb[199]),
        .Q(dout[199]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[19] 
       (.C(clk),
        .CE(E),
        .D(doutb[19]),
        .Q(dout[19]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1] 
       (.C(clk),
        .CE(E),
        .D(doutb[1]),
        .Q(dout[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[200] 
       (.C(clk),
        .CE(E),
        .D(doutb[200]),
        .Q(dout[200]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[201] 
       (.C(clk),
        .CE(E),
        .D(doutb[201]),
        .Q(dout[201]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[202] 
       (.C(clk),
        .CE(E),
        .D(doutb[202]),
        .Q(dout[202]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[203] 
       (.C(clk),
        .CE(E),
        .D(doutb[203]),
        .Q(dout[203]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[204] 
       (.C(clk),
        .CE(E),
        .D(doutb[204]),
        .Q(dout[204]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[205] 
       (.C(clk),
        .CE(E),
        .D(doutb[205]),
        .Q(dout[205]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[206] 
       (.C(clk),
        .CE(E),
        .D(doutb[206]),
        .Q(dout[206]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[207] 
       (.C(clk),
        .CE(E),
        .D(doutb[207]),
        .Q(dout[207]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[208] 
       (.C(clk),
        .CE(E),
        .D(doutb[208]),
        .Q(dout[208]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[209] 
       (.C(clk),
        .CE(E),
        .D(doutb[209]),
        .Q(dout[209]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[20] 
       (.C(clk),
        .CE(E),
        .D(doutb[20]),
        .Q(dout[20]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[210] 
       (.C(clk),
        .CE(E),
        .D(doutb[210]),
        .Q(dout[210]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[211] 
       (.C(clk),
        .CE(E),
        .D(doutb[211]),
        .Q(dout[211]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[212] 
       (.C(clk),
        .CE(E),
        .D(doutb[212]),
        .Q(dout[212]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[213] 
       (.C(clk),
        .CE(E),
        .D(doutb[213]),
        .Q(dout[213]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[214] 
       (.C(clk),
        .CE(E),
        .D(doutb[214]),
        .Q(dout[214]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[215] 
       (.C(clk),
        .CE(E),
        .D(doutb[215]),
        .Q(dout[215]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[216] 
       (.C(clk),
        .CE(E),
        .D(doutb[216]),
        .Q(dout[216]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[217] 
       (.C(clk),
        .CE(E),
        .D(doutb[217]),
        .Q(dout[217]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[218] 
       (.C(clk),
        .CE(E),
        .D(doutb[218]),
        .Q(dout[218]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[219] 
       (.C(clk),
        .CE(E),
        .D(doutb[219]),
        .Q(dout[219]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[21] 
       (.C(clk),
        .CE(E),
        .D(doutb[21]),
        .Q(dout[21]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[220] 
       (.C(clk),
        .CE(E),
        .D(doutb[220]),
        .Q(dout[220]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[221] 
       (.C(clk),
        .CE(E),
        .D(doutb[221]),
        .Q(dout[221]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[222] 
       (.C(clk),
        .CE(E),
        .D(doutb[222]),
        .Q(dout[222]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[223] 
       (.C(clk),
        .CE(E),
        .D(doutb[223]),
        .Q(dout[223]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[224] 
       (.C(clk),
        .CE(E),
        .D(doutb[224]),
        .Q(dout[224]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[225] 
       (.C(clk),
        .CE(E),
        .D(doutb[225]),
        .Q(dout[225]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[226] 
       (.C(clk),
        .CE(E),
        .D(doutb[226]),
        .Q(dout[226]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[227] 
       (.C(clk),
        .CE(E),
        .D(doutb[227]),
        .Q(dout[227]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[228] 
       (.C(clk),
        .CE(E),
        .D(doutb[228]),
        .Q(dout[228]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[229] 
       (.C(clk),
        .CE(E),
        .D(doutb[229]),
        .Q(dout[229]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[22] 
       (.C(clk),
        .CE(E),
        .D(doutb[22]),
        .Q(dout[22]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[230] 
       (.C(clk),
        .CE(E),
        .D(doutb[230]),
        .Q(dout[230]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[231] 
       (.C(clk),
        .CE(E),
        .D(doutb[231]),
        .Q(dout[231]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[232] 
       (.C(clk),
        .CE(E),
        .D(doutb[232]),
        .Q(dout[232]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[233] 
       (.C(clk),
        .CE(E),
        .D(doutb[233]),
        .Q(dout[233]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[234] 
       (.C(clk),
        .CE(E),
        .D(doutb[234]),
        .Q(dout[234]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[235] 
       (.C(clk),
        .CE(E),
        .D(doutb[235]),
        .Q(dout[235]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[236] 
       (.C(clk),
        .CE(E),
        .D(doutb[236]),
        .Q(dout[236]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[237] 
       (.C(clk),
        .CE(E),
        .D(doutb[237]),
        .Q(dout[237]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[238] 
       (.C(clk),
        .CE(E),
        .D(doutb[238]),
        .Q(dout[238]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[239] 
       (.C(clk),
        .CE(E),
        .D(doutb[239]),
        .Q(dout[239]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[23] 
       (.C(clk),
        .CE(E),
        .D(doutb[23]),
        .Q(dout[23]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[240] 
       (.C(clk),
        .CE(E),
        .D(doutb[240]),
        .Q(dout[240]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[241] 
       (.C(clk),
        .CE(E),
        .D(doutb[241]),
        .Q(dout[241]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[242] 
       (.C(clk),
        .CE(E),
        .D(doutb[242]),
        .Q(dout[242]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[243] 
       (.C(clk),
        .CE(E),
        .D(doutb[243]),
        .Q(dout[243]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[244] 
       (.C(clk),
        .CE(E),
        .D(doutb[244]),
        .Q(dout[244]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[245] 
       (.C(clk),
        .CE(E),
        .D(doutb[245]),
        .Q(dout[245]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[246] 
       (.C(clk),
        .CE(E),
        .D(doutb[246]),
        .Q(dout[246]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[247] 
       (.C(clk),
        .CE(E),
        .D(doutb[247]),
        .Q(dout[247]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[248] 
       (.C(clk),
        .CE(E),
        .D(doutb[248]),
        .Q(dout[248]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[249] 
       (.C(clk),
        .CE(E),
        .D(doutb[249]),
        .Q(dout[249]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[24] 
       (.C(clk),
        .CE(E),
        .D(doutb[24]),
        .Q(dout[24]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[250] 
       (.C(clk),
        .CE(E),
        .D(doutb[250]),
        .Q(dout[250]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[251] 
       (.C(clk),
        .CE(E),
        .D(doutb[251]),
        .Q(dout[251]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[252] 
       (.C(clk),
        .CE(E),
        .D(doutb[252]),
        .Q(dout[252]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[253] 
       (.C(clk),
        .CE(E),
        .D(doutb[253]),
        .Q(dout[253]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[254] 
       (.C(clk),
        .CE(E),
        .D(doutb[254]),
        .Q(dout[254]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[255] 
       (.C(clk),
        .CE(E),
        .D(doutb[255]),
        .Q(dout[255]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[256] 
       (.C(clk),
        .CE(E),
        .D(doutb[256]),
        .Q(dout[256]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[257] 
       (.C(clk),
        .CE(E),
        .D(doutb[257]),
        .Q(dout[257]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[258] 
       (.C(clk),
        .CE(E),
        .D(doutb[258]),
        .Q(dout[258]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[259] 
       (.C(clk),
        .CE(E),
        .D(doutb[259]),
        .Q(dout[259]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[25] 
       (.C(clk),
        .CE(E),
        .D(doutb[25]),
        .Q(dout[25]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[260] 
       (.C(clk),
        .CE(E),
        .D(doutb[260]),
        .Q(dout[260]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[261] 
       (.C(clk),
        .CE(E),
        .D(doutb[261]),
        .Q(dout[261]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[262] 
       (.C(clk),
        .CE(E),
        .D(doutb[262]),
        .Q(dout[262]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[263] 
       (.C(clk),
        .CE(E),
        .D(doutb[263]),
        .Q(dout[263]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[264] 
       (.C(clk),
        .CE(E),
        .D(doutb[264]),
        .Q(dout[264]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[265] 
       (.C(clk),
        .CE(E),
        .D(doutb[265]),
        .Q(dout[265]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[266] 
       (.C(clk),
        .CE(E),
        .D(doutb[266]),
        .Q(dout[266]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[267] 
       (.C(clk),
        .CE(E),
        .D(doutb[267]),
        .Q(dout[267]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[268] 
       (.C(clk),
        .CE(E),
        .D(doutb[268]),
        .Q(dout[268]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[269] 
       (.C(clk),
        .CE(E),
        .D(doutb[269]),
        .Q(dout[269]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[26] 
       (.C(clk),
        .CE(E),
        .D(doutb[26]),
        .Q(dout[26]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[270] 
       (.C(clk),
        .CE(E),
        .D(doutb[270]),
        .Q(dout[270]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[271] 
       (.C(clk),
        .CE(E),
        .D(doutb[271]),
        .Q(dout[271]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[272] 
       (.C(clk),
        .CE(E),
        .D(doutb[272]),
        .Q(dout[272]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[273] 
       (.C(clk),
        .CE(E),
        .D(doutb[273]),
        .Q(dout[273]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[274] 
       (.C(clk),
        .CE(E),
        .D(doutb[274]),
        .Q(dout[274]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[275] 
       (.C(clk),
        .CE(E),
        .D(doutb[275]),
        .Q(dout[275]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[276] 
       (.C(clk),
        .CE(E),
        .D(doutb[276]),
        .Q(dout[276]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[277] 
       (.C(clk),
        .CE(E),
        .D(doutb[277]),
        .Q(dout[277]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[278] 
       (.C(clk),
        .CE(E),
        .D(doutb[278]),
        .Q(dout[278]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[279] 
       (.C(clk),
        .CE(E),
        .D(doutb[279]),
        .Q(dout[279]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[27] 
       (.C(clk),
        .CE(E),
        .D(doutb[27]),
        .Q(dout[27]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[280] 
       (.C(clk),
        .CE(E),
        .D(doutb[280]),
        .Q(dout[280]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[281] 
       (.C(clk),
        .CE(E),
        .D(doutb[281]),
        .Q(dout[281]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[282] 
       (.C(clk),
        .CE(E),
        .D(doutb[282]),
        .Q(dout[282]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[283] 
       (.C(clk),
        .CE(E),
        .D(doutb[283]),
        .Q(dout[283]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[284] 
       (.C(clk),
        .CE(E),
        .D(doutb[284]),
        .Q(dout[284]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[285] 
       (.C(clk),
        .CE(E),
        .D(doutb[285]),
        .Q(dout[285]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[286] 
       (.C(clk),
        .CE(E),
        .D(doutb[286]),
        .Q(dout[286]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[287] 
       (.C(clk),
        .CE(E),
        .D(doutb[287]),
        .Q(dout[287]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[288] 
       (.C(clk),
        .CE(E),
        .D(doutb[288]),
        .Q(dout[288]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[289] 
       (.C(clk),
        .CE(E),
        .D(doutb[289]),
        .Q(dout[289]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[28] 
       (.C(clk),
        .CE(E),
        .D(doutb[28]),
        .Q(dout[28]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[290] 
       (.C(clk),
        .CE(E),
        .D(doutb[290]),
        .Q(dout[290]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[291] 
       (.C(clk),
        .CE(E),
        .D(doutb[291]),
        .Q(dout[291]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[292] 
       (.C(clk),
        .CE(E),
        .D(doutb[292]),
        .Q(dout[292]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[293] 
       (.C(clk),
        .CE(E),
        .D(doutb[293]),
        .Q(dout[293]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[294] 
       (.C(clk),
        .CE(E),
        .D(doutb[294]),
        .Q(dout[294]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[295] 
       (.C(clk),
        .CE(E),
        .D(doutb[295]),
        .Q(dout[295]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[296] 
       (.C(clk),
        .CE(E),
        .D(doutb[296]),
        .Q(dout[296]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[297] 
       (.C(clk),
        .CE(E),
        .D(doutb[297]),
        .Q(dout[297]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[298] 
       (.C(clk),
        .CE(E),
        .D(doutb[298]),
        .Q(dout[298]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[299] 
       (.C(clk),
        .CE(E),
        .D(doutb[299]),
        .Q(dout[299]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[29] 
       (.C(clk),
        .CE(E),
        .D(doutb[29]),
        .Q(dout[29]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[2] 
       (.C(clk),
        .CE(E),
        .D(doutb[2]),
        .Q(dout[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[300] 
       (.C(clk),
        .CE(E),
        .D(doutb[300]),
        .Q(dout[300]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[301] 
       (.C(clk),
        .CE(E),
        .D(doutb[301]),
        .Q(dout[301]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[302] 
       (.C(clk),
        .CE(E),
        .D(doutb[302]),
        .Q(dout[302]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[303] 
       (.C(clk),
        .CE(E),
        .D(doutb[303]),
        .Q(dout[303]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[304] 
       (.C(clk),
        .CE(E),
        .D(doutb[304]),
        .Q(dout[304]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[305] 
       (.C(clk),
        .CE(E),
        .D(doutb[305]),
        .Q(dout[305]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[306] 
       (.C(clk),
        .CE(E),
        .D(doutb[306]),
        .Q(dout[306]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[307] 
       (.C(clk),
        .CE(E),
        .D(doutb[307]),
        .Q(dout[307]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[308] 
       (.C(clk),
        .CE(E),
        .D(doutb[308]),
        .Q(dout[308]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[309] 
       (.C(clk),
        .CE(E),
        .D(doutb[309]),
        .Q(dout[309]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[30] 
       (.C(clk),
        .CE(E),
        .D(doutb[30]),
        .Q(dout[30]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[310] 
       (.C(clk),
        .CE(E),
        .D(doutb[310]),
        .Q(dout[310]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[311] 
       (.C(clk),
        .CE(E),
        .D(doutb[311]),
        .Q(dout[311]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[312] 
       (.C(clk),
        .CE(E),
        .D(doutb[312]),
        .Q(dout[312]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[313] 
       (.C(clk),
        .CE(E),
        .D(doutb[313]),
        .Q(dout[313]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[314] 
       (.C(clk),
        .CE(E),
        .D(doutb[314]),
        .Q(dout[314]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[315] 
       (.C(clk),
        .CE(E),
        .D(doutb[315]),
        .Q(dout[315]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[316] 
       (.C(clk),
        .CE(E),
        .D(doutb[316]),
        .Q(dout[316]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[317] 
       (.C(clk),
        .CE(E),
        .D(doutb[317]),
        .Q(dout[317]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[318] 
       (.C(clk),
        .CE(E),
        .D(doutb[318]),
        .Q(dout[318]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[319] 
       (.C(clk),
        .CE(E),
        .D(doutb[319]),
        .Q(dout[319]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[31] 
       (.C(clk),
        .CE(E),
        .D(doutb[31]),
        .Q(dout[31]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[320] 
       (.C(clk),
        .CE(E),
        .D(doutb[320]),
        .Q(dout[320]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[321] 
       (.C(clk),
        .CE(E),
        .D(doutb[321]),
        .Q(dout[321]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[322] 
       (.C(clk),
        .CE(E),
        .D(doutb[322]),
        .Q(dout[322]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[323] 
       (.C(clk),
        .CE(E),
        .D(doutb[323]),
        .Q(dout[323]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[324] 
       (.C(clk),
        .CE(E),
        .D(doutb[324]),
        .Q(dout[324]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[325] 
       (.C(clk),
        .CE(E),
        .D(doutb[325]),
        .Q(dout[325]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[326] 
       (.C(clk),
        .CE(E),
        .D(doutb[326]),
        .Q(dout[326]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[327] 
       (.C(clk),
        .CE(E),
        .D(doutb[327]),
        .Q(dout[327]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[328] 
       (.C(clk),
        .CE(E),
        .D(doutb[328]),
        .Q(dout[328]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[329] 
       (.C(clk),
        .CE(E),
        .D(doutb[329]),
        .Q(dout[329]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[32] 
       (.C(clk),
        .CE(E),
        .D(doutb[32]),
        .Q(dout[32]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[330] 
       (.C(clk),
        .CE(E),
        .D(doutb[330]),
        .Q(dout[330]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[331] 
       (.C(clk),
        .CE(E),
        .D(doutb[331]),
        .Q(dout[331]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[332] 
       (.C(clk),
        .CE(E),
        .D(doutb[332]),
        .Q(dout[332]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[333] 
       (.C(clk),
        .CE(E),
        .D(doutb[333]),
        .Q(dout[333]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[334] 
       (.C(clk),
        .CE(E),
        .D(doutb[334]),
        .Q(dout[334]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[335] 
       (.C(clk),
        .CE(E),
        .D(doutb[335]),
        .Q(dout[335]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[336] 
       (.C(clk),
        .CE(E),
        .D(doutb[336]),
        .Q(dout[336]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[337] 
       (.C(clk),
        .CE(E),
        .D(doutb[337]),
        .Q(dout[337]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[338] 
       (.C(clk),
        .CE(E),
        .D(doutb[338]),
        .Q(dout[338]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[339] 
       (.C(clk),
        .CE(E),
        .D(doutb[339]),
        .Q(dout[339]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[33] 
       (.C(clk),
        .CE(E),
        .D(doutb[33]),
        .Q(dout[33]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[340] 
       (.C(clk),
        .CE(E),
        .D(doutb[340]),
        .Q(dout[340]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[341] 
       (.C(clk),
        .CE(E),
        .D(doutb[341]),
        .Q(dout[341]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[342] 
       (.C(clk),
        .CE(E),
        .D(doutb[342]),
        .Q(dout[342]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[343] 
       (.C(clk),
        .CE(E),
        .D(doutb[343]),
        .Q(dout[343]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[344] 
       (.C(clk),
        .CE(E),
        .D(doutb[344]),
        .Q(dout[344]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[345] 
       (.C(clk),
        .CE(E),
        .D(doutb[345]),
        .Q(dout[345]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[346] 
       (.C(clk),
        .CE(E),
        .D(doutb[346]),
        .Q(dout[346]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[347] 
       (.C(clk),
        .CE(E),
        .D(doutb[347]),
        .Q(dout[347]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[348] 
       (.C(clk),
        .CE(E),
        .D(doutb[348]),
        .Q(dout[348]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[349] 
       (.C(clk),
        .CE(E),
        .D(doutb[349]),
        .Q(dout[349]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[34] 
       (.C(clk),
        .CE(E),
        .D(doutb[34]),
        .Q(dout[34]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[350] 
       (.C(clk),
        .CE(E),
        .D(doutb[350]),
        .Q(dout[350]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[351] 
       (.C(clk),
        .CE(E),
        .D(doutb[351]),
        .Q(dout[351]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[352] 
       (.C(clk),
        .CE(E),
        .D(doutb[352]),
        .Q(dout[352]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[353] 
       (.C(clk),
        .CE(E),
        .D(doutb[353]),
        .Q(dout[353]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[354] 
       (.C(clk),
        .CE(E),
        .D(doutb[354]),
        .Q(dout[354]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[355] 
       (.C(clk),
        .CE(E),
        .D(doutb[355]),
        .Q(dout[355]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[356] 
       (.C(clk),
        .CE(E),
        .D(doutb[356]),
        .Q(dout[356]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[357] 
       (.C(clk),
        .CE(E),
        .D(doutb[357]),
        .Q(dout[357]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[358] 
       (.C(clk),
        .CE(E),
        .D(doutb[358]),
        .Q(dout[358]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[359] 
       (.C(clk),
        .CE(E),
        .D(doutb[359]),
        .Q(dout[359]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[35] 
       (.C(clk),
        .CE(E),
        .D(doutb[35]),
        .Q(dout[35]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[360] 
       (.C(clk),
        .CE(E),
        .D(doutb[360]),
        .Q(dout[360]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[361] 
       (.C(clk),
        .CE(E),
        .D(doutb[361]),
        .Q(dout[361]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[362] 
       (.C(clk),
        .CE(E),
        .D(doutb[362]),
        .Q(dout[362]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[363] 
       (.C(clk),
        .CE(E),
        .D(doutb[363]),
        .Q(dout[363]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[364] 
       (.C(clk),
        .CE(E),
        .D(doutb[364]),
        .Q(dout[364]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[365] 
       (.C(clk),
        .CE(E),
        .D(doutb[365]),
        .Q(dout[365]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[366] 
       (.C(clk),
        .CE(E),
        .D(doutb[366]),
        .Q(dout[366]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[367] 
       (.C(clk),
        .CE(E),
        .D(doutb[367]),
        .Q(dout[367]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[368] 
       (.C(clk),
        .CE(E),
        .D(doutb[368]),
        .Q(dout[368]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[369] 
       (.C(clk),
        .CE(E),
        .D(doutb[369]),
        .Q(dout[369]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[36] 
       (.C(clk),
        .CE(E),
        .D(doutb[36]),
        .Q(dout[36]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[370] 
       (.C(clk),
        .CE(E),
        .D(doutb[370]),
        .Q(dout[370]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[371] 
       (.C(clk),
        .CE(E),
        .D(doutb[371]),
        .Q(dout[371]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[372] 
       (.C(clk),
        .CE(E),
        .D(doutb[372]),
        .Q(dout[372]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[373] 
       (.C(clk),
        .CE(E),
        .D(doutb[373]),
        .Q(dout[373]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[374] 
       (.C(clk),
        .CE(E),
        .D(doutb[374]),
        .Q(dout[374]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[375] 
       (.C(clk),
        .CE(E),
        .D(doutb[375]),
        .Q(dout[375]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[376] 
       (.C(clk),
        .CE(E),
        .D(doutb[376]),
        .Q(dout[376]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[377] 
       (.C(clk),
        .CE(E),
        .D(doutb[377]),
        .Q(dout[377]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[378] 
       (.C(clk),
        .CE(E),
        .D(doutb[378]),
        .Q(dout[378]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[379] 
       (.C(clk),
        .CE(E),
        .D(doutb[379]),
        .Q(dout[379]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[37] 
       (.C(clk),
        .CE(E),
        .D(doutb[37]),
        .Q(dout[37]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[380] 
       (.C(clk),
        .CE(E),
        .D(doutb[380]),
        .Q(dout[380]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[381] 
       (.C(clk),
        .CE(E),
        .D(doutb[381]),
        .Q(dout[381]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[382] 
       (.C(clk),
        .CE(E),
        .D(doutb[382]),
        .Q(dout[382]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[383] 
       (.C(clk),
        .CE(E),
        .D(doutb[383]),
        .Q(dout[383]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[384] 
       (.C(clk),
        .CE(E),
        .D(doutb[384]),
        .Q(dout[384]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[385] 
       (.C(clk),
        .CE(E),
        .D(doutb[385]),
        .Q(dout[385]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[386] 
       (.C(clk),
        .CE(E),
        .D(doutb[386]),
        .Q(dout[386]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[387] 
       (.C(clk),
        .CE(E),
        .D(doutb[387]),
        .Q(dout[387]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[388] 
       (.C(clk),
        .CE(E),
        .D(doutb[388]),
        .Q(dout[388]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[389] 
       (.C(clk),
        .CE(E),
        .D(doutb[389]),
        .Q(dout[389]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[38] 
       (.C(clk),
        .CE(E),
        .D(doutb[38]),
        .Q(dout[38]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[390] 
       (.C(clk),
        .CE(E),
        .D(doutb[390]),
        .Q(dout[390]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[391] 
       (.C(clk),
        .CE(E),
        .D(doutb[391]),
        .Q(dout[391]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[392] 
       (.C(clk),
        .CE(E),
        .D(doutb[392]),
        .Q(dout[392]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[393] 
       (.C(clk),
        .CE(E),
        .D(doutb[393]),
        .Q(dout[393]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[394] 
       (.C(clk),
        .CE(E),
        .D(doutb[394]),
        .Q(dout[394]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[395] 
       (.C(clk),
        .CE(E),
        .D(doutb[395]),
        .Q(dout[395]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[396] 
       (.C(clk),
        .CE(E),
        .D(doutb[396]),
        .Q(dout[396]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[397] 
       (.C(clk),
        .CE(E),
        .D(doutb[397]),
        .Q(dout[397]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[398] 
       (.C(clk),
        .CE(E),
        .D(doutb[398]),
        .Q(dout[398]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[399] 
       (.C(clk),
        .CE(E),
        .D(doutb[399]),
        .Q(dout[399]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[39] 
       (.C(clk),
        .CE(E),
        .D(doutb[39]),
        .Q(dout[39]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[3] 
       (.C(clk),
        .CE(E),
        .D(doutb[3]),
        .Q(dout[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[400] 
       (.C(clk),
        .CE(E),
        .D(doutb[400]),
        .Q(dout[400]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[401] 
       (.C(clk),
        .CE(E),
        .D(doutb[401]),
        .Q(dout[401]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[402] 
       (.C(clk),
        .CE(E),
        .D(doutb[402]),
        .Q(dout[402]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[403] 
       (.C(clk),
        .CE(E),
        .D(doutb[403]),
        .Q(dout[403]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[404] 
       (.C(clk),
        .CE(E),
        .D(doutb[404]),
        .Q(dout[404]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[405] 
       (.C(clk),
        .CE(E),
        .D(doutb[405]),
        .Q(dout[405]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[406] 
       (.C(clk),
        .CE(E),
        .D(doutb[406]),
        .Q(dout[406]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[407] 
       (.C(clk),
        .CE(E),
        .D(doutb[407]),
        .Q(dout[407]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[408] 
       (.C(clk),
        .CE(E),
        .D(doutb[408]),
        .Q(dout[408]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[409] 
       (.C(clk),
        .CE(E),
        .D(doutb[409]),
        .Q(dout[409]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[40] 
       (.C(clk),
        .CE(E),
        .D(doutb[40]),
        .Q(dout[40]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[410] 
       (.C(clk),
        .CE(E),
        .D(doutb[410]),
        .Q(dout[410]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[411] 
       (.C(clk),
        .CE(E),
        .D(doutb[411]),
        .Q(dout[411]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[412] 
       (.C(clk),
        .CE(E),
        .D(doutb[412]),
        .Q(dout[412]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[413] 
       (.C(clk),
        .CE(E),
        .D(doutb[413]),
        .Q(dout[413]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[414] 
       (.C(clk),
        .CE(E),
        .D(doutb[414]),
        .Q(dout[414]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[415] 
       (.C(clk),
        .CE(E),
        .D(doutb[415]),
        .Q(dout[415]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[416] 
       (.C(clk),
        .CE(E),
        .D(doutb[416]),
        .Q(dout[416]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[417] 
       (.C(clk),
        .CE(E),
        .D(doutb[417]),
        .Q(dout[417]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[418] 
       (.C(clk),
        .CE(E),
        .D(doutb[418]),
        .Q(dout[418]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[419] 
       (.C(clk),
        .CE(E),
        .D(doutb[419]),
        .Q(dout[419]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[41] 
       (.C(clk),
        .CE(E),
        .D(doutb[41]),
        .Q(dout[41]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[420] 
       (.C(clk),
        .CE(E),
        .D(doutb[420]),
        .Q(dout[420]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[421] 
       (.C(clk),
        .CE(E),
        .D(doutb[421]),
        .Q(dout[421]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[422] 
       (.C(clk),
        .CE(E),
        .D(doutb[422]),
        .Q(dout[422]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[423] 
       (.C(clk),
        .CE(E),
        .D(doutb[423]),
        .Q(dout[423]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[424] 
       (.C(clk),
        .CE(E),
        .D(doutb[424]),
        .Q(dout[424]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[425] 
       (.C(clk),
        .CE(E),
        .D(doutb[425]),
        .Q(dout[425]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[426] 
       (.C(clk),
        .CE(E),
        .D(doutb[426]),
        .Q(dout[426]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[427] 
       (.C(clk),
        .CE(E),
        .D(doutb[427]),
        .Q(dout[427]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[428] 
       (.C(clk),
        .CE(E),
        .D(doutb[428]),
        .Q(dout[428]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[429] 
       (.C(clk),
        .CE(E),
        .D(doutb[429]),
        .Q(dout[429]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[42] 
       (.C(clk),
        .CE(E),
        .D(doutb[42]),
        .Q(dout[42]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[430] 
       (.C(clk),
        .CE(E),
        .D(doutb[430]),
        .Q(dout[430]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[431] 
       (.C(clk),
        .CE(E),
        .D(doutb[431]),
        .Q(dout[431]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[432] 
       (.C(clk),
        .CE(E),
        .D(doutb[432]),
        .Q(dout[432]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[433] 
       (.C(clk),
        .CE(E),
        .D(doutb[433]),
        .Q(dout[433]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[434] 
       (.C(clk),
        .CE(E),
        .D(doutb[434]),
        .Q(dout[434]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[435] 
       (.C(clk),
        .CE(E),
        .D(doutb[435]),
        .Q(dout[435]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[436] 
       (.C(clk),
        .CE(E),
        .D(doutb[436]),
        .Q(dout[436]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[437] 
       (.C(clk),
        .CE(E),
        .D(doutb[437]),
        .Q(dout[437]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[438] 
       (.C(clk),
        .CE(E),
        .D(doutb[438]),
        .Q(dout[438]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[439] 
       (.C(clk),
        .CE(E),
        .D(doutb[439]),
        .Q(dout[439]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[43] 
       (.C(clk),
        .CE(E),
        .D(doutb[43]),
        .Q(dout[43]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[440] 
       (.C(clk),
        .CE(E),
        .D(doutb[440]),
        .Q(dout[440]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[441] 
       (.C(clk),
        .CE(E),
        .D(doutb[441]),
        .Q(dout[441]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[442] 
       (.C(clk),
        .CE(E),
        .D(doutb[442]),
        .Q(dout[442]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[443] 
       (.C(clk),
        .CE(E),
        .D(doutb[443]),
        .Q(dout[443]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[444] 
       (.C(clk),
        .CE(E),
        .D(doutb[444]),
        .Q(dout[444]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[445] 
       (.C(clk),
        .CE(E),
        .D(doutb[445]),
        .Q(dout[445]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[446] 
       (.C(clk),
        .CE(E),
        .D(doutb[446]),
        .Q(dout[446]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[447] 
       (.C(clk),
        .CE(E),
        .D(doutb[447]),
        .Q(dout[447]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[448] 
       (.C(clk),
        .CE(E),
        .D(doutb[448]),
        .Q(dout[448]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[449] 
       (.C(clk),
        .CE(E),
        .D(doutb[449]),
        .Q(dout[449]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[44] 
       (.C(clk),
        .CE(E),
        .D(doutb[44]),
        .Q(dout[44]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[450] 
       (.C(clk),
        .CE(E),
        .D(doutb[450]),
        .Q(dout[450]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[451] 
       (.C(clk),
        .CE(E),
        .D(doutb[451]),
        .Q(dout[451]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[452] 
       (.C(clk),
        .CE(E),
        .D(doutb[452]),
        .Q(dout[452]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[453] 
       (.C(clk),
        .CE(E),
        .D(doutb[453]),
        .Q(dout[453]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[454] 
       (.C(clk),
        .CE(E),
        .D(doutb[454]),
        .Q(dout[454]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[455] 
       (.C(clk),
        .CE(E),
        .D(doutb[455]),
        .Q(dout[455]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[456] 
       (.C(clk),
        .CE(E),
        .D(doutb[456]),
        .Q(dout[456]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[457] 
       (.C(clk),
        .CE(E),
        .D(doutb[457]),
        .Q(dout[457]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[458] 
       (.C(clk),
        .CE(E),
        .D(doutb[458]),
        .Q(dout[458]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[459] 
       (.C(clk),
        .CE(E),
        .D(doutb[459]),
        .Q(dout[459]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[45] 
       (.C(clk),
        .CE(E),
        .D(doutb[45]),
        .Q(dout[45]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[460] 
       (.C(clk),
        .CE(E),
        .D(doutb[460]),
        .Q(dout[460]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[461] 
       (.C(clk),
        .CE(E),
        .D(doutb[461]),
        .Q(dout[461]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[462] 
       (.C(clk),
        .CE(E),
        .D(doutb[462]),
        .Q(dout[462]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[463] 
       (.C(clk),
        .CE(E),
        .D(doutb[463]),
        .Q(dout[463]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[464] 
       (.C(clk),
        .CE(E),
        .D(doutb[464]),
        .Q(dout[464]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[465] 
       (.C(clk),
        .CE(E),
        .D(doutb[465]),
        .Q(dout[465]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[466] 
       (.C(clk),
        .CE(E),
        .D(doutb[466]),
        .Q(dout[466]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[467] 
       (.C(clk),
        .CE(E),
        .D(doutb[467]),
        .Q(dout[467]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[468] 
       (.C(clk),
        .CE(E),
        .D(doutb[468]),
        .Q(dout[468]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[469] 
       (.C(clk),
        .CE(E),
        .D(doutb[469]),
        .Q(dout[469]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[46] 
       (.C(clk),
        .CE(E),
        .D(doutb[46]),
        .Q(dout[46]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[470] 
       (.C(clk),
        .CE(E),
        .D(doutb[470]),
        .Q(dout[470]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[471] 
       (.C(clk),
        .CE(E),
        .D(doutb[471]),
        .Q(dout[471]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[472] 
       (.C(clk),
        .CE(E),
        .D(doutb[472]),
        .Q(dout[472]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[473] 
       (.C(clk),
        .CE(E),
        .D(doutb[473]),
        .Q(dout[473]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[474] 
       (.C(clk),
        .CE(E),
        .D(doutb[474]),
        .Q(dout[474]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[475] 
       (.C(clk),
        .CE(E),
        .D(doutb[475]),
        .Q(dout[475]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[476] 
       (.C(clk),
        .CE(E),
        .D(doutb[476]),
        .Q(dout[476]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[477] 
       (.C(clk),
        .CE(E),
        .D(doutb[477]),
        .Q(dout[477]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[478] 
       (.C(clk),
        .CE(E),
        .D(doutb[478]),
        .Q(dout[478]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[479] 
       (.C(clk),
        .CE(E),
        .D(doutb[479]),
        .Q(dout[479]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[47] 
       (.C(clk),
        .CE(E),
        .D(doutb[47]),
        .Q(dout[47]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[480] 
       (.C(clk),
        .CE(E),
        .D(doutb[480]),
        .Q(dout[480]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[481] 
       (.C(clk),
        .CE(E),
        .D(doutb[481]),
        .Q(dout[481]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[482] 
       (.C(clk),
        .CE(E),
        .D(doutb[482]),
        .Q(dout[482]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[483] 
       (.C(clk),
        .CE(E),
        .D(doutb[483]),
        .Q(dout[483]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[484] 
       (.C(clk),
        .CE(E),
        .D(doutb[484]),
        .Q(dout[484]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[485] 
       (.C(clk),
        .CE(E),
        .D(doutb[485]),
        .Q(dout[485]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[486] 
       (.C(clk),
        .CE(E),
        .D(doutb[486]),
        .Q(dout[486]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[487] 
       (.C(clk),
        .CE(E),
        .D(doutb[487]),
        .Q(dout[487]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[488] 
       (.C(clk),
        .CE(E),
        .D(doutb[488]),
        .Q(dout[488]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[489] 
       (.C(clk),
        .CE(E),
        .D(doutb[489]),
        .Q(dout[489]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[48] 
       (.C(clk),
        .CE(E),
        .D(doutb[48]),
        .Q(dout[48]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[490] 
       (.C(clk),
        .CE(E),
        .D(doutb[490]),
        .Q(dout[490]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[491] 
       (.C(clk),
        .CE(E),
        .D(doutb[491]),
        .Q(dout[491]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[492] 
       (.C(clk),
        .CE(E),
        .D(doutb[492]),
        .Q(dout[492]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[493] 
       (.C(clk),
        .CE(E),
        .D(doutb[493]),
        .Q(dout[493]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[494] 
       (.C(clk),
        .CE(E),
        .D(doutb[494]),
        .Q(dout[494]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[495] 
       (.C(clk),
        .CE(E),
        .D(doutb[495]),
        .Q(dout[495]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[496] 
       (.C(clk),
        .CE(E),
        .D(doutb[496]),
        .Q(dout[496]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[497] 
       (.C(clk),
        .CE(E),
        .D(doutb[497]),
        .Q(dout[497]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[498] 
       (.C(clk),
        .CE(E),
        .D(doutb[498]),
        .Q(dout[498]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[499] 
       (.C(clk),
        .CE(E),
        .D(doutb[499]),
        .Q(dout[499]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[49] 
       (.C(clk),
        .CE(E),
        .D(doutb[49]),
        .Q(dout[49]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[4] 
       (.C(clk),
        .CE(E),
        .D(doutb[4]),
        .Q(dout[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[500] 
       (.C(clk),
        .CE(E),
        .D(doutb[500]),
        .Q(dout[500]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[501] 
       (.C(clk),
        .CE(E),
        .D(doutb[501]),
        .Q(dout[501]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[502] 
       (.C(clk),
        .CE(E),
        .D(doutb[502]),
        .Q(dout[502]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[503] 
       (.C(clk),
        .CE(E),
        .D(doutb[503]),
        .Q(dout[503]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[504] 
       (.C(clk),
        .CE(E),
        .D(doutb[504]),
        .Q(dout[504]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[505] 
       (.C(clk),
        .CE(E),
        .D(doutb[505]),
        .Q(dout[505]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[506] 
       (.C(clk),
        .CE(E),
        .D(doutb[506]),
        .Q(dout[506]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[507] 
       (.C(clk),
        .CE(E),
        .D(doutb[507]),
        .Q(dout[507]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[508] 
       (.C(clk),
        .CE(E),
        .D(doutb[508]),
        .Q(dout[508]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[509] 
       (.C(clk),
        .CE(E),
        .D(doutb[509]),
        .Q(dout[509]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[50] 
       (.C(clk),
        .CE(E),
        .D(doutb[50]),
        .Q(dout[50]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[510] 
       (.C(clk),
        .CE(E),
        .D(doutb[510]),
        .Q(dout[510]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[511] 
       (.C(clk),
        .CE(E),
        .D(doutb[511]),
        .Q(dout[511]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[512] 
       (.C(clk),
        .CE(E),
        .D(doutb[512]),
        .Q(dout[512]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[513] 
       (.C(clk),
        .CE(E),
        .D(doutb[513]),
        .Q(dout[513]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[514] 
       (.C(clk),
        .CE(E),
        .D(doutb[514]),
        .Q(dout[514]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[515] 
       (.C(clk),
        .CE(E),
        .D(doutb[515]),
        .Q(dout[515]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[516] 
       (.C(clk),
        .CE(E),
        .D(doutb[516]),
        .Q(dout[516]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[517] 
       (.C(clk),
        .CE(E),
        .D(doutb[517]),
        .Q(dout[517]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[518] 
       (.C(clk),
        .CE(E),
        .D(doutb[518]),
        .Q(dout[518]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[519] 
       (.C(clk),
        .CE(E),
        .D(doutb[519]),
        .Q(dout[519]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[51] 
       (.C(clk),
        .CE(E),
        .D(doutb[51]),
        .Q(dout[51]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[520] 
       (.C(clk),
        .CE(E),
        .D(doutb[520]),
        .Q(dout[520]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[521] 
       (.C(clk),
        .CE(E),
        .D(doutb[521]),
        .Q(dout[521]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[522] 
       (.C(clk),
        .CE(E),
        .D(doutb[522]),
        .Q(dout[522]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[523] 
       (.C(clk),
        .CE(E),
        .D(doutb[523]),
        .Q(dout[523]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[524] 
       (.C(clk),
        .CE(E),
        .D(doutb[524]),
        .Q(dout[524]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[525] 
       (.C(clk),
        .CE(E),
        .D(doutb[525]),
        .Q(dout[525]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[526] 
       (.C(clk),
        .CE(E),
        .D(doutb[526]),
        .Q(dout[526]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[527] 
       (.C(clk),
        .CE(E),
        .D(doutb[527]),
        .Q(dout[527]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[528] 
       (.C(clk),
        .CE(E),
        .D(doutb[528]),
        .Q(dout[528]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[529] 
       (.C(clk),
        .CE(E),
        .D(doutb[529]),
        .Q(dout[529]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[52] 
       (.C(clk),
        .CE(E),
        .D(doutb[52]),
        .Q(dout[52]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[530] 
       (.C(clk),
        .CE(E),
        .D(doutb[530]),
        .Q(dout[530]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[531] 
       (.C(clk),
        .CE(E),
        .D(doutb[531]),
        .Q(dout[531]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[532] 
       (.C(clk),
        .CE(E),
        .D(doutb[532]),
        .Q(dout[532]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[533] 
       (.C(clk),
        .CE(E),
        .D(doutb[533]),
        .Q(dout[533]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[534] 
       (.C(clk),
        .CE(E),
        .D(doutb[534]),
        .Q(dout[534]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[535] 
       (.C(clk),
        .CE(E),
        .D(doutb[535]),
        .Q(dout[535]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[536] 
       (.C(clk),
        .CE(E),
        .D(doutb[536]),
        .Q(dout[536]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[537] 
       (.C(clk),
        .CE(E),
        .D(doutb[537]),
        .Q(dout[537]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[538] 
       (.C(clk),
        .CE(E),
        .D(doutb[538]),
        .Q(dout[538]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[539] 
       (.C(clk),
        .CE(E),
        .D(doutb[539]),
        .Q(dout[539]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[53] 
       (.C(clk),
        .CE(E),
        .D(doutb[53]),
        .Q(dout[53]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[540] 
       (.C(clk),
        .CE(E),
        .D(doutb[540]),
        .Q(dout[540]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[541] 
       (.C(clk),
        .CE(E),
        .D(doutb[541]),
        .Q(dout[541]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[542] 
       (.C(clk),
        .CE(E),
        .D(doutb[542]),
        .Q(dout[542]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[543] 
       (.C(clk),
        .CE(E),
        .D(doutb[543]),
        .Q(dout[543]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[544] 
       (.C(clk),
        .CE(E),
        .D(doutb[544]),
        .Q(dout[544]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[545] 
       (.C(clk),
        .CE(E),
        .D(doutb[545]),
        .Q(dout[545]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[546] 
       (.C(clk),
        .CE(E),
        .D(doutb[546]),
        .Q(dout[546]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[547] 
       (.C(clk),
        .CE(E),
        .D(doutb[547]),
        .Q(dout[547]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[548] 
       (.C(clk),
        .CE(E),
        .D(doutb[548]),
        .Q(dout[548]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[549] 
       (.C(clk),
        .CE(E),
        .D(doutb[549]),
        .Q(dout[549]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[54] 
       (.C(clk),
        .CE(E),
        .D(doutb[54]),
        .Q(dout[54]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[550] 
       (.C(clk),
        .CE(E),
        .D(doutb[550]),
        .Q(dout[550]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[551] 
       (.C(clk),
        .CE(E),
        .D(doutb[551]),
        .Q(dout[551]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[552] 
       (.C(clk),
        .CE(E),
        .D(doutb[552]),
        .Q(dout[552]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[553] 
       (.C(clk),
        .CE(E),
        .D(doutb[553]),
        .Q(dout[553]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[554] 
       (.C(clk),
        .CE(E),
        .D(doutb[554]),
        .Q(dout[554]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[555] 
       (.C(clk),
        .CE(E),
        .D(doutb[555]),
        .Q(dout[555]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[556] 
       (.C(clk),
        .CE(E),
        .D(doutb[556]),
        .Q(dout[556]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[557] 
       (.C(clk),
        .CE(E),
        .D(doutb[557]),
        .Q(dout[557]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[558] 
       (.C(clk),
        .CE(E),
        .D(doutb[558]),
        .Q(dout[558]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[559] 
       (.C(clk),
        .CE(E),
        .D(doutb[559]),
        .Q(dout[559]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[55] 
       (.C(clk),
        .CE(E),
        .D(doutb[55]),
        .Q(dout[55]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[560] 
       (.C(clk),
        .CE(E),
        .D(doutb[560]),
        .Q(dout[560]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[561] 
       (.C(clk),
        .CE(E),
        .D(doutb[561]),
        .Q(dout[561]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[562] 
       (.C(clk),
        .CE(E),
        .D(doutb[562]),
        .Q(dout[562]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[563] 
       (.C(clk),
        .CE(E),
        .D(doutb[563]),
        .Q(dout[563]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[564] 
       (.C(clk),
        .CE(E),
        .D(doutb[564]),
        .Q(dout[564]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[565] 
       (.C(clk),
        .CE(E),
        .D(doutb[565]),
        .Q(dout[565]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[566] 
       (.C(clk),
        .CE(E),
        .D(doutb[566]),
        .Q(dout[566]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[567] 
       (.C(clk),
        .CE(E),
        .D(doutb[567]),
        .Q(dout[567]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[568] 
       (.C(clk),
        .CE(E),
        .D(doutb[568]),
        .Q(dout[568]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[569] 
       (.C(clk),
        .CE(E),
        .D(doutb[569]),
        .Q(dout[569]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[56] 
       (.C(clk),
        .CE(E),
        .D(doutb[56]),
        .Q(dout[56]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[570] 
       (.C(clk),
        .CE(E),
        .D(doutb[570]),
        .Q(dout[570]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[571] 
       (.C(clk),
        .CE(E),
        .D(doutb[571]),
        .Q(dout[571]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[572] 
       (.C(clk),
        .CE(E),
        .D(doutb[572]),
        .Q(dout[572]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[573] 
       (.C(clk),
        .CE(E),
        .D(doutb[573]),
        .Q(dout[573]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[574] 
       (.C(clk),
        .CE(E),
        .D(doutb[574]),
        .Q(dout[574]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[575] 
       (.C(clk),
        .CE(E),
        .D(doutb[575]),
        .Q(dout[575]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[576] 
       (.C(clk),
        .CE(E),
        .D(doutb[576]),
        .Q(dout[576]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[577] 
       (.C(clk),
        .CE(E),
        .D(doutb[577]),
        .Q(dout[577]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[578] 
       (.C(clk),
        .CE(E),
        .D(doutb[578]),
        .Q(dout[578]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[579] 
       (.C(clk),
        .CE(E),
        .D(doutb[579]),
        .Q(dout[579]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[57] 
       (.C(clk),
        .CE(E),
        .D(doutb[57]),
        .Q(dout[57]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[580] 
       (.C(clk),
        .CE(E),
        .D(doutb[580]),
        .Q(dout[580]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[581] 
       (.C(clk),
        .CE(E),
        .D(doutb[581]),
        .Q(dout[581]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[582] 
       (.C(clk),
        .CE(E),
        .D(doutb[582]),
        .Q(dout[582]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[583] 
       (.C(clk),
        .CE(E),
        .D(doutb[583]),
        .Q(dout[583]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[584] 
       (.C(clk),
        .CE(E),
        .D(doutb[584]),
        .Q(dout[584]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[585] 
       (.C(clk),
        .CE(E),
        .D(doutb[585]),
        .Q(dout[585]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[586] 
       (.C(clk),
        .CE(E),
        .D(doutb[586]),
        .Q(dout[586]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[587] 
       (.C(clk),
        .CE(E),
        .D(doutb[587]),
        .Q(dout[587]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[588] 
       (.C(clk),
        .CE(E),
        .D(doutb[588]),
        .Q(dout[588]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[589] 
       (.C(clk),
        .CE(E),
        .D(doutb[589]),
        .Q(dout[589]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[58] 
       (.C(clk),
        .CE(E),
        .D(doutb[58]),
        .Q(dout[58]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[590] 
       (.C(clk),
        .CE(E),
        .D(doutb[590]),
        .Q(dout[590]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[591] 
       (.C(clk),
        .CE(E),
        .D(doutb[591]),
        .Q(dout[591]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[592] 
       (.C(clk),
        .CE(E),
        .D(doutb[592]),
        .Q(dout[592]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[593] 
       (.C(clk),
        .CE(E),
        .D(doutb[593]),
        .Q(dout[593]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[594] 
       (.C(clk),
        .CE(E),
        .D(doutb[594]),
        .Q(dout[594]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[595] 
       (.C(clk),
        .CE(E),
        .D(doutb[595]),
        .Q(dout[595]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[596] 
       (.C(clk),
        .CE(E),
        .D(doutb[596]),
        .Q(dout[596]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[597] 
       (.C(clk),
        .CE(E),
        .D(doutb[597]),
        .Q(dout[597]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[598] 
       (.C(clk),
        .CE(E),
        .D(doutb[598]),
        .Q(dout[598]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[599] 
       (.C(clk),
        .CE(E),
        .D(doutb[599]),
        .Q(dout[599]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[59] 
       (.C(clk),
        .CE(E),
        .D(doutb[59]),
        .Q(dout[59]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[5] 
       (.C(clk),
        .CE(E),
        .D(doutb[5]),
        .Q(dout[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[600] 
       (.C(clk),
        .CE(E),
        .D(doutb[600]),
        .Q(dout[600]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[601] 
       (.C(clk),
        .CE(E),
        .D(doutb[601]),
        .Q(dout[601]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[602] 
       (.C(clk),
        .CE(E),
        .D(doutb[602]),
        .Q(dout[602]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[603] 
       (.C(clk),
        .CE(E),
        .D(doutb[603]),
        .Q(dout[603]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[604] 
       (.C(clk),
        .CE(E),
        .D(doutb[604]),
        .Q(dout[604]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[605] 
       (.C(clk),
        .CE(E),
        .D(doutb[605]),
        .Q(dout[605]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[606] 
       (.C(clk),
        .CE(E),
        .D(doutb[606]),
        .Q(dout[606]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[607] 
       (.C(clk),
        .CE(E),
        .D(doutb[607]),
        .Q(dout[607]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[608] 
       (.C(clk),
        .CE(E),
        .D(doutb[608]),
        .Q(dout[608]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[609] 
       (.C(clk),
        .CE(E),
        .D(doutb[609]),
        .Q(dout[609]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[60] 
       (.C(clk),
        .CE(E),
        .D(doutb[60]),
        .Q(dout[60]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[610] 
       (.C(clk),
        .CE(E),
        .D(doutb[610]),
        .Q(dout[610]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[611] 
       (.C(clk),
        .CE(E),
        .D(doutb[611]),
        .Q(dout[611]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[612] 
       (.C(clk),
        .CE(E),
        .D(doutb[612]),
        .Q(dout[612]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[613] 
       (.C(clk),
        .CE(E),
        .D(doutb[613]),
        .Q(dout[613]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[614] 
       (.C(clk),
        .CE(E),
        .D(doutb[614]),
        .Q(dout[614]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[615] 
       (.C(clk),
        .CE(E),
        .D(doutb[615]),
        .Q(dout[615]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[616] 
       (.C(clk),
        .CE(E),
        .D(doutb[616]),
        .Q(dout[616]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[617] 
       (.C(clk),
        .CE(E),
        .D(doutb[617]),
        .Q(dout[617]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[618] 
       (.C(clk),
        .CE(E),
        .D(doutb[618]),
        .Q(dout[618]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[619] 
       (.C(clk),
        .CE(E),
        .D(doutb[619]),
        .Q(dout[619]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[61] 
       (.C(clk),
        .CE(E),
        .D(doutb[61]),
        .Q(dout[61]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[620] 
       (.C(clk),
        .CE(E),
        .D(doutb[620]),
        .Q(dout[620]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[621] 
       (.C(clk),
        .CE(E),
        .D(doutb[621]),
        .Q(dout[621]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[622] 
       (.C(clk),
        .CE(E),
        .D(doutb[622]),
        .Q(dout[622]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[623] 
       (.C(clk),
        .CE(E),
        .D(doutb[623]),
        .Q(dout[623]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[624] 
       (.C(clk),
        .CE(E),
        .D(doutb[624]),
        .Q(dout[624]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[625] 
       (.C(clk),
        .CE(E),
        .D(doutb[625]),
        .Q(dout[625]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[626] 
       (.C(clk),
        .CE(E),
        .D(doutb[626]),
        .Q(dout[626]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[627] 
       (.C(clk),
        .CE(E),
        .D(doutb[627]),
        .Q(dout[627]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[628] 
       (.C(clk),
        .CE(E),
        .D(doutb[628]),
        .Q(dout[628]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[629] 
       (.C(clk),
        .CE(E),
        .D(doutb[629]),
        .Q(dout[629]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[62] 
       (.C(clk),
        .CE(E),
        .D(doutb[62]),
        .Q(dout[62]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[630] 
       (.C(clk),
        .CE(E),
        .D(doutb[630]),
        .Q(dout[630]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[631] 
       (.C(clk),
        .CE(E),
        .D(doutb[631]),
        .Q(dout[631]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[632] 
       (.C(clk),
        .CE(E),
        .D(doutb[632]),
        .Q(dout[632]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[633] 
       (.C(clk),
        .CE(E),
        .D(doutb[633]),
        .Q(dout[633]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[634] 
       (.C(clk),
        .CE(E),
        .D(doutb[634]),
        .Q(dout[634]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[635] 
       (.C(clk),
        .CE(E),
        .D(doutb[635]),
        .Q(dout[635]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[636] 
       (.C(clk),
        .CE(E),
        .D(doutb[636]),
        .Q(dout[636]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[637] 
       (.C(clk),
        .CE(E),
        .D(doutb[637]),
        .Q(dout[637]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[638] 
       (.C(clk),
        .CE(E),
        .D(doutb[638]),
        .Q(dout[638]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[639] 
       (.C(clk),
        .CE(E),
        .D(doutb[639]),
        .Q(dout[639]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[63] 
       (.C(clk),
        .CE(E),
        .D(doutb[63]),
        .Q(dout[63]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[640] 
       (.C(clk),
        .CE(E),
        .D(doutb[640]),
        .Q(dout[640]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[641] 
       (.C(clk),
        .CE(E),
        .D(doutb[641]),
        .Q(dout[641]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[642] 
       (.C(clk),
        .CE(E),
        .D(doutb[642]),
        .Q(dout[642]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[643] 
       (.C(clk),
        .CE(E),
        .D(doutb[643]),
        .Q(dout[643]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[644] 
       (.C(clk),
        .CE(E),
        .D(doutb[644]),
        .Q(dout[644]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[645] 
       (.C(clk),
        .CE(E),
        .D(doutb[645]),
        .Q(dout[645]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[646] 
       (.C(clk),
        .CE(E),
        .D(doutb[646]),
        .Q(dout[646]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[647] 
       (.C(clk),
        .CE(E),
        .D(doutb[647]),
        .Q(dout[647]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[648] 
       (.C(clk),
        .CE(E),
        .D(doutb[648]),
        .Q(dout[648]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[649] 
       (.C(clk),
        .CE(E),
        .D(doutb[649]),
        .Q(dout[649]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[64] 
       (.C(clk),
        .CE(E),
        .D(doutb[64]),
        .Q(dout[64]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[650] 
       (.C(clk),
        .CE(E),
        .D(doutb[650]),
        .Q(dout[650]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[651] 
       (.C(clk),
        .CE(E),
        .D(doutb[651]),
        .Q(dout[651]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[652] 
       (.C(clk),
        .CE(E),
        .D(doutb[652]),
        .Q(dout[652]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[653] 
       (.C(clk),
        .CE(E),
        .D(doutb[653]),
        .Q(dout[653]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[654] 
       (.C(clk),
        .CE(E),
        .D(doutb[654]),
        .Q(dout[654]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[655] 
       (.C(clk),
        .CE(E),
        .D(doutb[655]),
        .Q(dout[655]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[656] 
       (.C(clk),
        .CE(E),
        .D(doutb[656]),
        .Q(dout[656]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[657] 
       (.C(clk),
        .CE(E),
        .D(doutb[657]),
        .Q(dout[657]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[658] 
       (.C(clk),
        .CE(E),
        .D(doutb[658]),
        .Q(dout[658]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[659] 
       (.C(clk),
        .CE(E),
        .D(doutb[659]),
        .Q(dout[659]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[65] 
       (.C(clk),
        .CE(E),
        .D(doutb[65]),
        .Q(dout[65]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[660] 
       (.C(clk),
        .CE(E),
        .D(doutb[660]),
        .Q(dout[660]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[661] 
       (.C(clk),
        .CE(E),
        .D(doutb[661]),
        .Q(dout[661]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[662] 
       (.C(clk),
        .CE(E),
        .D(doutb[662]),
        .Q(dout[662]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[663] 
       (.C(clk),
        .CE(E),
        .D(doutb[663]),
        .Q(dout[663]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[664] 
       (.C(clk),
        .CE(E),
        .D(doutb[664]),
        .Q(dout[664]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[665] 
       (.C(clk),
        .CE(E),
        .D(doutb[665]),
        .Q(dout[665]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[666] 
       (.C(clk),
        .CE(E),
        .D(doutb[666]),
        .Q(dout[666]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[667] 
       (.C(clk),
        .CE(E),
        .D(doutb[667]),
        .Q(dout[667]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[668] 
       (.C(clk),
        .CE(E),
        .D(doutb[668]),
        .Q(dout[668]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[669] 
       (.C(clk),
        .CE(E),
        .D(doutb[669]),
        .Q(dout[669]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[66] 
       (.C(clk),
        .CE(E),
        .D(doutb[66]),
        .Q(dout[66]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[670] 
       (.C(clk),
        .CE(E),
        .D(doutb[670]),
        .Q(dout[670]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[671] 
       (.C(clk),
        .CE(E),
        .D(doutb[671]),
        .Q(dout[671]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[672] 
       (.C(clk),
        .CE(E),
        .D(doutb[672]),
        .Q(dout[672]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[673] 
       (.C(clk),
        .CE(E),
        .D(doutb[673]),
        .Q(dout[673]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[674] 
       (.C(clk),
        .CE(E),
        .D(doutb[674]),
        .Q(dout[674]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[675] 
       (.C(clk),
        .CE(E),
        .D(doutb[675]),
        .Q(dout[675]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[676] 
       (.C(clk),
        .CE(E),
        .D(doutb[676]),
        .Q(dout[676]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[677] 
       (.C(clk),
        .CE(E),
        .D(doutb[677]),
        .Q(dout[677]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[678] 
       (.C(clk),
        .CE(E),
        .D(doutb[678]),
        .Q(dout[678]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[679] 
       (.C(clk),
        .CE(E),
        .D(doutb[679]),
        .Q(dout[679]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[67] 
       (.C(clk),
        .CE(E),
        .D(doutb[67]),
        .Q(dout[67]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[680] 
       (.C(clk),
        .CE(E),
        .D(doutb[680]),
        .Q(dout[680]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[681] 
       (.C(clk),
        .CE(E),
        .D(doutb[681]),
        .Q(dout[681]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[682] 
       (.C(clk),
        .CE(E),
        .D(doutb[682]),
        .Q(dout[682]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[683] 
       (.C(clk),
        .CE(E),
        .D(doutb[683]),
        .Q(dout[683]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[684] 
       (.C(clk),
        .CE(E),
        .D(doutb[684]),
        .Q(dout[684]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[685] 
       (.C(clk),
        .CE(E),
        .D(doutb[685]),
        .Q(dout[685]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[686] 
       (.C(clk),
        .CE(E),
        .D(doutb[686]),
        .Q(dout[686]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[687] 
       (.C(clk),
        .CE(E),
        .D(doutb[687]),
        .Q(dout[687]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[688] 
       (.C(clk),
        .CE(E),
        .D(doutb[688]),
        .Q(dout[688]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[689] 
       (.C(clk),
        .CE(E),
        .D(doutb[689]),
        .Q(dout[689]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[68] 
       (.C(clk),
        .CE(E),
        .D(doutb[68]),
        .Q(dout[68]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[690] 
       (.C(clk),
        .CE(E),
        .D(doutb[690]),
        .Q(dout[690]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[691] 
       (.C(clk),
        .CE(E),
        .D(doutb[691]),
        .Q(dout[691]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[692] 
       (.C(clk),
        .CE(E),
        .D(doutb[692]),
        .Q(dout[692]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[693] 
       (.C(clk),
        .CE(E),
        .D(doutb[693]),
        .Q(dout[693]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[694] 
       (.C(clk),
        .CE(E),
        .D(doutb[694]),
        .Q(dout[694]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[695] 
       (.C(clk),
        .CE(E),
        .D(doutb[695]),
        .Q(dout[695]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[696] 
       (.C(clk),
        .CE(E),
        .D(doutb[696]),
        .Q(dout[696]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[697] 
       (.C(clk),
        .CE(E),
        .D(doutb[697]),
        .Q(dout[697]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[698] 
       (.C(clk),
        .CE(E),
        .D(doutb[698]),
        .Q(dout[698]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[699] 
       (.C(clk),
        .CE(E),
        .D(doutb[699]),
        .Q(dout[699]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[69] 
       (.C(clk),
        .CE(E),
        .D(doutb[69]),
        .Q(dout[69]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[6] 
       (.C(clk),
        .CE(E),
        .D(doutb[6]),
        .Q(dout[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[700] 
       (.C(clk),
        .CE(E),
        .D(doutb[700]),
        .Q(dout[700]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[701] 
       (.C(clk),
        .CE(E),
        .D(doutb[701]),
        .Q(dout[701]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[702] 
       (.C(clk),
        .CE(E),
        .D(doutb[702]),
        .Q(dout[702]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[703] 
       (.C(clk),
        .CE(E),
        .D(doutb[703]),
        .Q(dout[703]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[704] 
       (.C(clk),
        .CE(E),
        .D(doutb[704]),
        .Q(dout[704]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[705] 
       (.C(clk),
        .CE(E),
        .D(doutb[705]),
        .Q(dout[705]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[706] 
       (.C(clk),
        .CE(E),
        .D(doutb[706]),
        .Q(dout[706]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[707] 
       (.C(clk),
        .CE(E),
        .D(doutb[707]),
        .Q(dout[707]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[708] 
       (.C(clk),
        .CE(E),
        .D(doutb[708]),
        .Q(dout[708]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[709] 
       (.C(clk),
        .CE(E),
        .D(doutb[709]),
        .Q(dout[709]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[70] 
       (.C(clk),
        .CE(E),
        .D(doutb[70]),
        .Q(dout[70]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[710] 
       (.C(clk),
        .CE(E),
        .D(doutb[710]),
        .Q(dout[710]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[711] 
       (.C(clk),
        .CE(E),
        .D(doutb[711]),
        .Q(dout[711]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[712] 
       (.C(clk),
        .CE(E),
        .D(doutb[712]),
        .Q(dout[712]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[713] 
       (.C(clk),
        .CE(E),
        .D(doutb[713]),
        .Q(dout[713]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[714] 
       (.C(clk),
        .CE(E),
        .D(doutb[714]),
        .Q(dout[714]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[715] 
       (.C(clk),
        .CE(E),
        .D(doutb[715]),
        .Q(dout[715]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[716] 
       (.C(clk),
        .CE(E),
        .D(doutb[716]),
        .Q(dout[716]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[717] 
       (.C(clk),
        .CE(E),
        .D(doutb[717]),
        .Q(dout[717]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[718] 
       (.C(clk),
        .CE(E),
        .D(doutb[718]),
        .Q(dout[718]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[719] 
       (.C(clk),
        .CE(E),
        .D(doutb[719]),
        .Q(dout[719]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[71] 
       (.C(clk),
        .CE(E),
        .D(doutb[71]),
        .Q(dout[71]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[720] 
       (.C(clk),
        .CE(E),
        .D(doutb[720]),
        .Q(dout[720]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[721] 
       (.C(clk),
        .CE(E),
        .D(doutb[721]),
        .Q(dout[721]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[722] 
       (.C(clk),
        .CE(E),
        .D(doutb[722]),
        .Q(dout[722]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[723] 
       (.C(clk),
        .CE(E),
        .D(doutb[723]),
        .Q(dout[723]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[724] 
       (.C(clk),
        .CE(E),
        .D(doutb[724]),
        .Q(dout[724]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[725] 
       (.C(clk),
        .CE(E),
        .D(doutb[725]),
        .Q(dout[725]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[726] 
       (.C(clk),
        .CE(E),
        .D(doutb[726]),
        .Q(dout[726]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[727] 
       (.C(clk),
        .CE(E),
        .D(doutb[727]),
        .Q(dout[727]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[728] 
       (.C(clk),
        .CE(E),
        .D(doutb[728]),
        .Q(dout[728]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[729] 
       (.C(clk),
        .CE(E),
        .D(doutb[729]),
        .Q(dout[729]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[72] 
       (.C(clk),
        .CE(E),
        .D(doutb[72]),
        .Q(dout[72]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[730] 
       (.C(clk),
        .CE(E),
        .D(doutb[730]),
        .Q(dout[730]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[731] 
       (.C(clk),
        .CE(E),
        .D(doutb[731]),
        .Q(dout[731]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[732] 
       (.C(clk),
        .CE(E),
        .D(doutb[732]),
        .Q(dout[732]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[733] 
       (.C(clk),
        .CE(E),
        .D(doutb[733]),
        .Q(dout[733]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[734] 
       (.C(clk),
        .CE(E),
        .D(doutb[734]),
        .Q(dout[734]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[735] 
       (.C(clk),
        .CE(E),
        .D(doutb[735]),
        .Q(dout[735]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[736] 
       (.C(clk),
        .CE(E),
        .D(doutb[736]),
        .Q(dout[736]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[737] 
       (.C(clk),
        .CE(E),
        .D(doutb[737]),
        .Q(dout[737]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[738] 
       (.C(clk),
        .CE(E),
        .D(doutb[738]),
        .Q(dout[738]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[739] 
       (.C(clk),
        .CE(E),
        .D(doutb[739]),
        .Q(dout[739]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[73] 
       (.C(clk),
        .CE(E),
        .D(doutb[73]),
        .Q(dout[73]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[740] 
       (.C(clk),
        .CE(E),
        .D(doutb[740]),
        .Q(dout[740]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[741] 
       (.C(clk),
        .CE(E),
        .D(doutb[741]),
        .Q(dout[741]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[742] 
       (.C(clk),
        .CE(E),
        .D(doutb[742]),
        .Q(dout[742]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[743] 
       (.C(clk),
        .CE(E),
        .D(doutb[743]),
        .Q(dout[743]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[744] 
       (.C(clk),
        .CE(E),
        .D(doutb[744]),
        .Q(dout[744]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[745] 
       (.C(clk),
        .CE(E),
        .D(doutb[745]),
        .Q(dout[745]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[746] 
       (.C(clk),
        .CE(E),
        .D(doutb[746]),
        .Q(dout[746]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[747] 
       (.C(clk),
        .CE(E),
        .D(doutb[747]),
        .Q(dout[747]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[748] 
       (.C(clk),
        .CE(E),
        .D(doutb[748]),
        .Q(dout[748]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[749] 
       (.C(clk),
        .CE(E),
        .D(doutb[749]),
        .Q(dout[749]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[74] 
       (.C(clk),
        .CE(E),
        .D(doutb[74]),
        .Q(dout[74]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[750] 
       (.C(clk),
        .CE(E),
        .D(doutb[750]),
        .Q(dout[750]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[751] 
       (.C(clk),
        .CE(E),
        .D(doutb[751]),
        .Q(dout[751]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[752] 
       (.C(clk),
        .CE(E),
        .D(doutb[752]),
        .Q(dout[752]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[753] 
       (.C(clk),
        .CE(E),
        .D(doutb[753]),
        .Q(dout[753]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[754] 
       (.C(clk),
        .CE(E),
        .D(doutb[754]),
        .Q(dout[754]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[755] 
       (.C(clk),
        .CE(E),
        .D(doutb[755]),
        .Q(dout[755]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[756] 
       (.C(clk),
        .CE(E),
        .D(doutb[756]),
        .Q(dout[756]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[757] 
       (.C(clk),
        .CE(E),
        .D(doutb[757]),
        .Q(dout[757]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[758] 
       (.C(clk),
        .CE(E),
        .D(doutb[758]),
        .Q(dout[758]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[759] 
       (.C(clk),
        .CE(E),
        .D(doutb[759]),
        .Q(dout[759]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[75] 
       (.C(clk),
        .CE(E),
        .D(doutb[75]),
        .Q(dout[75]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[760] 
       (.C(clk),
        .CE(E),
        .D(doutb[760]),
        .Q(dout[760]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[761] 
       (.C(clk),
        .CE(E),
        .D(doutb[761]),
        .Q(dout[761]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[762] 
       (.C(clk),
        .CE(E),
        .D(doutb[762]),
        .Q(dout[762]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[763] 
       (.C(clk),
        .CE(E),
        .D(doutb[763]),
        .Q(dout[763]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[764] 
       (.C(clk),
        .CE(E),
        .D(doutb[764]),
        .Q(dout[764]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[765] 
       (.C(clk),
        .CE(E),
        .D(doutb[765]),
        .Q(dout[765]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[766] 
       (.C(clk),
        .CE(E),
        .D(doutb[766]),
        .Q(dout[766]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[767] 
       (.C(clk),
        .CE(E),
        .D(doutb[767]),
        .Q(dout[767]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[768] 
       (.C(clk),
        .CE(E),
        .D(doutb[768]),
        .Q(dout[768]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[769] 
       (.C(clk),
        .CE(E),
        .D(doutb[769]),
        .Q(dout[769]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[76] 
       (.C(clk),
        .CE(E),
        .D(doutb[76]),
        .Q(dout[76]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[770] 
       (.C(clk),
        .CE(E),
        .D(doutb[770]),
        .Q(dout[770]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[771] 
       (.C(clk),
        .CE(E),
        .D(doutb[771]),
        .Q(dout[771]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[772] 
       (.C(clk),
        .CE(E),
        .D(doutb[772]),
        .Q(dout[772]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[773] 
       (.C(clk),
        .CE(E),
        .D(doutb[773]),
        .Q(dout[773]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[774] 
       (.C(clk),
        .CE(E),
        .D(doutb[774]),
        .Q(dout[774]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[775] 
       (.C(clk),
        .CE(E),
        .D(doutb[775]),
        .Q(dout[775]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[776] 
       (.C(clk),
        .CE(E),
        .D(doutb[776]),
        .Q(dout[776]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[777] 
       (.C(clk),
        .CE(E),
        .D(doutb[777]),
        .Q(dout[777]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[778] 
       (.C(clk),
        .CE(E),
        .D(doutb[778]),
        .Q(dout[778]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[779] 
       (.C(clk),
        .CE(E),
        .D(doutb[779]),
        .Q(dout[779]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[77] 
       (.C(clk),
        .CE(E),
        .D(doutb[77]),
        .Q(dout[77]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[780] 
       (.C(clk),
        .CE(E),
        .D(doutb[780]),
        .Q(dout[780]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[781] 
       (.C(clk),
        .CE(E),
        .D(doutb[781]),
        .Q(dout[781]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[782] 
       (.C(clk),
        .CE(E),
        .D(doutb[782]),
        .Q(dout[782]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[783] 
       (.C(clk),
        .CE(E),
        .D(doutb[783]),
        .Q(dout[783]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[784] 
       (.C(clk),
        .CE(E),
        .D(doutb[784]),
        .Q(dout[784]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[785] 
       (.C(clk),
        .CE(E),
        .D(doutb[785]),
        .Q(dout[785]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[786] 
       (.C(clk),
        .CE(E),
        .D(doutb[786]),
        .Q(dout[786]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[787] 
       (.C(clk),
        .CE(E),
        .D(doutb[787]),
        .Q(dout[787]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[788] 
       (.C(clk),
        .CE(E),
        .D(doutb[788]),
        .Q(dout[788]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[789] 
       (.C(clk),
        .CE(E),
        .D(doutb[789]),
        .Q(dout[789]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[78] 
       (.C(clk),
        .CE(E),
        .D(doutb[78]),
        .Q(dout[78]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[790] 
       (.C(clk),
        .CE(E),
        .D(doutb[790]),
        .Q(dout[790]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[791] 
       (.C(clk),
        .CE(E),
        .D(doutb[791]),
        .Q(dout[791]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[792] 
       (.C(clk),
        .CE(E),
        .D(doutb[792]),
        .Q(dout[792]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[793] 
       (.C(clk),
        .CE(E),
        .D(doutb[793]),
        .Q(dout[793]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[794] 
       (.C(clk),
        .CE(E),
        .D(doutb[794]),
        .Q(dout[794]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[795] 
       (.C(clk),
        .CE(E),
        .D(doutb[795]),
        .Q(dout[795]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[796] 
       (.C(clk),
        .CE(E),
        .D(doutb[796]),
        .Q(dout[796]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[797] 
       (.C(clk),
        .CE(E),
        .D(doutb[797]),
        .Q(dout[797]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[798] 
       (.C(clk),
        .CE(E),
        .D(doutb[798]),
        .Q(dout[798]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[799] 
       (.C(clk),
        .CE(E),
        .D(doutb[799]),
        .Q(dout[799]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[79] 
       (.C(clk),
        .CE(E),
        .D(doutb[79]),
        .Q(dout[79]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[7] 
       (.C(clk),
        .CE(E),
        .D(doutb[7]),
        .Q(dout[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[800] 
       (.C(clk),
        .CE(E),
        .D(doutb[800]),
        .Q(dout[800]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[801] 
       (.C(clk),
        .CE(E),
        .D(doutb[801]),
        .Q(dout[801]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[802] 
       (.C(clk),
        .CE(E),
        .D(doutb[802]),
        .Q(dout[802]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[803] 
       (.C(clk),
        .CE(E),
        .D(doutb[803]),
        .Q(dout[803]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[804] 
       (.C(clk),
        .CE(E),
        .D(doutb[804]),
        .Q(dout[804]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[805] 
       (.C(clk),
        .CE(E),
        .D(doutb[805]),
        .Q(dout[805]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[806] 
       (.C(clk),
        .CE(E),
        .D(doutb[806]),
        .Q(dout[806]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[807] 
       (.C(clk),
        .CE(E),
        .D(doutb[807]),
        .Q(dout[807]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[808] 
       (.C(clk),
        .CE(E),
        .D(doutb[808]),
        .Q(dout[808]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[809] 
       (.C(clk),
        .CE(E),
        .D(doutb[809]),
        .Q(dout[809]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[80] 
       (.C(clk),
        .CE(E),
        .D(doutb[80]),
        .Q(dout[80]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[810] 
       (.C(clk),
        .CE(E),
        .D(doutb[810]),
        .Q(dout[810]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[811] 
       (.C(clk),
        .CE(E),
        .D(doutb[811]),
        .Q(dout[811]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[812] 
       (.C(clk),
        .CE(E),
        .D(doutb[812]),
        .Q(dout[812]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[813] 
       (.C(clk),
        .CE(E),
        .D(doutb[813]),
        .Q(dout[813]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[814] 
       (.C(clk),
        .CE(E),
        .D(doutb[814]),
        .Q(dout[814]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[815] 
       (.C(clk),
        .CE(E),
        .D(doutb[815]),
        .Q(dout[815]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[816] 
       (.C(clk),
        .CE(E),
        .D(doutb[816]),
        .Q(dout[816]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[817] 
       (.C(clk),
        .CE(E),
        .D(doutb[817]),
        .Q(dout[817]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[818] 
       (.C(clk),
        .CE(E),
        .D(doutb[818]),
        .Q(dout[818]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[819] 
       (.C(clk),
        .CE(E),
        .D(doutb[819]),
        .Q(dout[819]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[81] 
       (.C(clk),
        .CE(E),
        .D(doutb[81]),
        .Q(dout[81]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[820] 
       (.C(clk),
        .CE(E),
        .D(doutb[820]),
        .Q(dout[820]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[821] 
       (.C(clk),
        .CE(E),
        .D(doutb[821]),
        .Q(dout[821]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[822] 
       (.C(clk),
        .CE(E),
        .D(doutb[822]),
        .Q(dout[822]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[823] 
       (.C(clk),
        .CE(E),
        .D(doutb[823]),
        .Q(dout[823]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[824] 
       (.C(clk),
        .CE(E),
        .D(doutb[824]),
        .Q(dout[824]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[825] 
       (.C(clk),
        .CE(E),
        .D(doutb[825]),
        .Q(dout[825]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[826] 
       (.C(clk),
        .CE(E),
        .D(doutb[826]),
        .Q(dout[826]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[827] 
       (.C(clk),
        .CE(E),
        .D(doutb[827]),
        .Q(dout[827]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[828] 
       (.C(clk),
        .CE(E),
        .D(doutb[828]),
        .Q(dout[828]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[829] 
       (.C(clk),
        .CE(E),
        .D(doutb[829]),
        .Q(dout[829]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[82] 
       (.C(clk),
        .CE(E),
        .D(doutb[82]),
        .Q(dout[82]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[830] 
       (.C(clk),
        .CE(E),
        .D(doutb[830]),
        .Q(dout[830]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[831] 
       (.C(clk),
        .CE(E),
        .D(doutb[831]),
        .Q(dout[831]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[832] 
       (.C(clk),
        .CE(E),
        .D(doutb[832]),
        .Q(dout[832]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[833] 
       (.C(clk),
        .CE(E),
        .D(doutb[833]),
        .Q(dout[833]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[834] 
       (.C(clk),
        .CE(E),
        .D(doutb[834]),
        .Q(dout[834]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[835] 
       (.C(clk),
        .CE(E),
        .D(doutb[835]),
        .Q(dout[835]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[836] 
       (.C(clk),
        .CE(E),
        .D(doutb[836]),
        .Q(dout[836]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[837] 
       (.C(clk),
        .CE(E),
        .D(doutb[837]),
        .Q(dout[837]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[838] 
       (.C(clk),
        .CE(E),
        .D(doutb[838]),
        .Q(dout[838]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[839] 
       (.C(clk),
        .CE(E),
        .D(doutb[839]),
        .Q(dout[839]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[83] 
       (.C(clk),
        .CE(E),
        .D(doutb[83]),
        .Q(dout[83]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[840] 
       (.C(clk),
        .CE(E),
        .D(doutb[840]),
        .Q(dout[840]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[841] 
       (.C(clk),
        .CE(E),
        .D(doutb[841]),
        .Q(dout[841]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[842] 
       (.C(clk),
        .CE(E),
        .D(doutb[842]),
        .Q(dout[842]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[843] 
       (.C(clk),
        .CE(E),
        .D(doutb[843]),
        .Q(dout[843]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[844] 
       (.C(clk),
        .CE(E),
        .D(doutb[844]),
        .Q(dout[844]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[845] 
       (.C(clk),
        .CE(E),
        .D(doutb[845]),
        .Q(dout[845]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[846] 
       (.C(clk),
        .CE(E),
        .D(doutb[846]),
        .Q(dout[846]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[847] 
       (.C(clk),
        .CE(E),
        .D(doutb[847]),
        .Q(dout[847]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[848] 
       (.C(clk),
        .CE(E),
        .D(doutb[848]),
        .Q(dout[848]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[849] 
       (.C(clk),
        .CE(E),
        .D(doutb[849]),
        .Q(dout[849]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[84] 
       (.C(clk),
        .CE(E),
        .D(doutb[84]),
        .Q(dout[84]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[850] 
       (.C(clk),
        .CE(E),
        .D(doutb[850]),
        .Q(dout[850]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[851] 
       (.C(clk),
        .CE(E),
        .D(doutb[851]),
        .Q(dout[851]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[852] 
       (.C(clk),
        .CE(E),
        .D(doutb[852]),
        .Q(dout[852]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[853] 
       (.C(clk),
        .CE(E),
        .D(doutb[853]),
        .Q(dout[853]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[854] 
       (.C(clk),
        .CE(E),
        .D(doutb[854]),
        .Q(dout[854]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[855] 
       (.C(clk),
        .CE(E),
        .D(doutb[855]),
        .Q(dout[855]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[856] 
       (.C(clk),
        .CE(E),
        .D(doutb[856]),
        .Q(dout[856]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[857] 
       (.C(clk),
        .CE(E),
        .D(doutb[857]),
        .Q(dout[857]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[858] 
       (.C(clk),
        .CE(E),
        .D(doutb[858]),
        .Q(dout[858]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[859] 
       (.C(clk),
        .CE(E),
        .D(doutb[859]),
        .Q(dout[859]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[85] 
       (.C(clk),
        .CE(E),
        .D(doutb[85]),
        .Q(dout[85]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[860] 
       (.C(clk),
        .CE(E),
        .D(doutb[860]),
        .Q(dout[860]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[861] 
       (.C(clk),
        .CE(E),
        .D(doutb[861]),
        .Q(dout[861]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[862] 
       (.C(clk),
        .CE(E),
        .D(doutb[862]),
        .Q(dout[862]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[863] 
       (.C(clk),
        .CE(E),
        .D(doutb[863]),
        .Q(dout[863]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[864] 
       (.C(clk),
        .CE(E),
        .D(doutb[864]),
        .Q(dout[864]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[865] 
       (.C(clk),
        .CE(E),
        .D(doutb[865]),
        .Q(dout[865]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[866] 
       (.C(clk),
        .CE(E),
        .D(doutb[866]),
        .Q(dout[866]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[867] 
       (.C(clk),
        .CE(E),
        .D(doutb[867]),
        .Q(dout[867]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[868] 
       (.C(clk),
        .CE(E),
        .D(doutb[868]),
        .Q(dout[868]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[869] 
       (.C(clk),
        .CE(E),
        .D(doutb[869]),
        .Q(dout[869]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[86] 
       (.C(clk),
        .CE(E),
        .D(doutb[86]),
        .Q(dout[86]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[870] 
       (.C(clk),
        .CE(E),
        .D(doutb[870]),
        .Q(dout[870]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[871] 
       (.C(clk),
        .CE(E),
        .D(doutb[871]),
        .Q(dout[871]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[872] 
       (.C(clk),
        .CE(E),
        .D(doutb[872]),
        .Q(dout[872]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[873] 
       (.C(clk),
        .CE(E),
        .D(doutb[873]),
        .Q(dout[873]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[874] 
       (.C(clk),
        .CE(E),
        .D(doutb[874]),
        .Q(dout[874]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[875] 
       (.C(clk),
        .CE(E),
        .D(doutb[875]),
        .Q(dout[875]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[876] 
       (.C(clk),
        .CE(E),
        .D(doutb[876]),
        .Q(dout[876]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[877] 
       (.C(clk),
        .CE(E),
        .D(doutb[877]),
        .Q(dout[877]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[878] 
       (.C(clk),
        .CE(E),
        .D(doutb[878]),
        .Q(dout[878]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[879] 
       (.C(clk),
        .CE(E),
        .D(doutb[879]),
        .Q(dout[879]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[87] 
       (.C(clk),
        .CE(E),
        .D(doutb[87]),
        .Q(dout[87]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[880] 
       (.C(clk),
        .CE(E),
        .D(doutb[880]),
        .Q(dout[880]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[881] 
       (.C(clk),
        .CE(E),
        .D(doutb[881]),
        .Q(dout[881]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[882] 
       (.C(clk),
        .CE(E),
        .D(doutb[882]),
        .Q(dout[882]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[883] 
       (.C(clk),
        .CE(E),
        .D(doutb[883]),
        .Q(dout[883]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[884] 
       (.C(clk),
        .CE(E),
        .D(doutb[884]),
        .Q(dout[884]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[885] 
       (.C(clk),
        .CE(E),
        .D(doutb[885]),
        .Q(dout[885]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[886] 
       (.C(clk),
        .CE(E),
        .D(doutb[886]),
        .Q(dout[886]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[887] 
       (.C(clk),
        .CE(E),
        .D(doutb[887]),
        .Q(dout[887]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[888] 
       (.C(clk),
        .CE(E),
        .D(doutb[888]),
        .Q(dout[888]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[889] 
       (.C(clk),
        .CE(E),
        .D(doutb[889]),
        .Q(dout[889]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[88] 
       (.C(clk),
        .CE(E),
        .D(doutb[88]),
        .Q(dout[88]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[890] 
       (.C(clk),
        .CE(E),
        .D(doutb[890]),
        .Q(dout[890]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[891] 
       (.C(clk),
        .CE(E),
        .D(doutb[891]),
        .Q(dout[891]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[892] 
       (.C(clk),
        .CE(E),
        .D(doutb[892]),
        .Q(dout[892]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[893] 
       (.C(clk),
        .CE(E),
        .D(doutb[893]),
        .Q(dout[893]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[894] 
       (.C(clk),
        .CE(E),
        .D(doutb[894]),
        .Q(dout[894]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[895] 
       (.C(clk),
        .CE(E),
        .D(doutb[895]),
        .Q(dout[895]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[896] 
       (.C(clk),
        .CE(E),
        .D(doutb[896]),
        .Q(dout[896]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[897] 
       (.C(clk),
        .CE(E),
        .D(doutb[897]),
        .Q(dout[897]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[898] 
       (.C(clk),
        .CE(E),
        .D(doutb[898]),
        .Q(dout[898]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[899] 
       (.C(clk),
        .CE(E),
        .D(doutb[899]),
        .Q(dout[899]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[89] 
       (.C(clk),
        .CE(E),
        .D(doutb[89]),
        .Q(dout[89]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[8] 
       (.C(clk),
        .CE(E),
        .D(doutb[8]),
        .Q(dout[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[900] 
       (.C(clk),
        .CE(E),
        .D(doutb[900]),
        .Q(dout[900]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[901] 
       (.C(clk),
        .CE(E),
        .D(doutb[901]),
        .Q(dout[901]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[902] 
       (.C(clk),
        .CE(E),
        .D(doutb[902]),
        .Q(dout[902]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[903] 
       (.C(clk),
        .CE(E),
        .D(doutb[903]),
        .Q(dout[903]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[904] 
       (.C(clk),
        .CE(E),
        .D(doutb[904]),
        .Q(dout[904]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[905] 
       (.C(clk),
        .CE(E),
        .D(doutb[905]),
        .Q(dout[905]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[906] 
       (.C(clk),
        .CE(E),
        .D(doutb[906]),
        .Q(dout[906]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[907] 
       (.C(clk),
        .CE(E),
        .D(doutb[907]),
        .Q(dout[907]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[908] 
       (.C(clk),
        .CE(E),
        .D(doutb[908]),
        .Q(dout[908]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[909] 
       (.C(clk),
        .CE(E),
        .D(doutb[909]),
        .Q(dout[909]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[90] 
       (.C(clk),
        .CE(E),
        .D(doutb[90]),
        .Q(dout[90]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[910] 
       (.C(clk),
        .CE(E),
        .D(doutb[910]),
        .Q(dout[910]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[911] 
       (.C(clk),
        .CE(E),
        .D(doutb[911]),
        .Q(dout[911]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[912] 
       (.C(clk),
        .CE(E),
        .D(doutb[912]),
        .Q(dout[912]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[913] 
       (.C(clk),
        .CE(E),
        .D(doutb[913]),
        .Q(dout[913]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[914] 
       (.C(clk),
        .CE(E),
        .D(doutb[914]),
        .Q(dout[914]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[915] 
       (.C(clk),
        .CE(E),
        .D(doutb[915]),
        .Q(dout[915]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[916] 
       (.C(clk),
        .CE(E),
        .D(doutb[916]),
        .Q(dout[916]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[917] 
       (.C(clk),
        .CE(E),
        .D(doutb[917]),
        .Q(dout[917]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[918] 
       (.C(clk),
        .CE(E),
        .D(doutb[918]),
        .Q(dout[918]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[919] 
       (.C(clk),
        .CE(E),
        .D(doutb[919]),
        .Q(dout[919]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[91] 
       (.C(clk),
        .CE(E),
        .D(doutb[91]),
        .Q(dout[91]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[920] 
       (.C(clk),
        .CE(E),
        .D(doutb[920]),
        .Q(dout[920]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[921] 
       (.C(clk),
        .CE(E),
        .D(doutb[921]),
        .Q(dout[921]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[922] 
       (.C(clk),
        .CE(E),
        .D(doutb[922]),
        .Q(dout[922]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[923] 
       (.C(clk),
        .CE(E),
        .D(doutb[923]),
        .Q(dout[923]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[924] 
       (.C(clk),
        .CE(E),
        .D(doutb[924]),
        .Q(dout[924]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[925] 
       (.C(clk),
        .CE(E),
        .D(doutb[925]),
        .Q(dout[925]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[926] 
       (.C(clk),
        .CE(E),
        .D(doutb[926]),
        .Q(dout[926]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[927] 
       (.C(clk),
        .CE(E),
        .D(doutb[927]),
        .Q(dout[927]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[928] 
       (.C(clk),
        .CE(E),
        .D(doutb[928]),
        .Q(dout[928]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[929] 
       (.C(clk),
        .CE(E),
        .D(doutb[929]),
        .Q(dout[929]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[92] 
       (.C(clk),
        .CE(E),
        .D(doutb[92]),
        .Q(dout[92]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[930] 
       (.C(clk),
        .CE(E),
        .D(doutb[930]),
        .Q(dout[930]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[931] 
       (.C(clk),
        .CE(E),
        .D(doutb[931]),
        .Q(dout[931]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[932] 
       (.C(clk),
        .CE(E),
        .D(doutb[932]),
        .Q(dout[932]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[933] 
       (.C(clk),
        .CE(E),
        .D(doutb[933]),
        .Q(dout[933]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[934] 
       (.C(clk),
        .CE(E),
        .D(doutb[934]),
        .Q(dout[934]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[935] 
       (.C(clk),
        .CE(E),
        .D(doutb[935]),
        .Q(dout[935]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[936] 
       (.C(clk),
        .CE(E),
        .D(doutb[936]),
        .Q(dout[936]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[937] 
       (.C(clk),
        .CE(E),
        .D(doutb[937]),
        .Q(dout[937]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[938] 
       (.C(clk),
        .CE(E),
        .D(doutb[938]),
        .Q(dout[938]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[939] 
       (.C(clk),
        .CE(E),
        .D(doutb[939]),
        .Q(dout[939]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[93] 
       (.C(clk),
        .CE(E),
        .D(doutb[93]),
        .Q(dout[93]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[940] 
       (.C(clk),
        .CE(E),
        .D(doutb[940]),
        .Q(dout[940]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[941] 
       (.C(clk),
        .CE(E),
        .D(doutb[941]),
        .Q(dout[941]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[942] 
       (.C(clk),
        .CE(E),
        .D(doutb[942]),
        .Q(dout[942]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[943] 
       (.C(clk),
        .CE(E),
        .D(doutb[943]),
        .Q(dout[943]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[944] 
       (.C(clk),
        .CE(E),
        .D(doutb[944]),
        .Q(dout[944]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[945] 
       (.C(clk),
        .CE(E),
        .D(doutb[945]),
        .Q(dout[945]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[946] 
       (.C(clk),
        .CE(E),
        .D(doutb[946]),
        .Q(dout[946]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[947] 
       (.C(clk),
        .CE(E),
        .D(doutb[947]),
        .Q(dout[947]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[948] 
       (.C(clk),
        .CE(E),
        .D(doutb[948]),
        .Q(dout[948]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[949] 
       (.C(clk),
        .CE(E),
        .D(doutb[949]),
        .Q(dout[949]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[94] 
       (.C(clk),
        .CE(E),
        .D(doutb[94]),
        .Q(dout[94]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[950] 
       (.C(clk),
        .CE(E),
        .D(doutb[950]),
        .Q(dout[950]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[951] 
       (.C(clk),
        .CE(E),
        .D(doutb[951]),
        .Q(dout[951]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[952] 
       (.C(clk),
        .CE(E),
        .D(doutb[952]),
        .Q(dout[952]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[953] 
       (.C(clk),
        .CE(E),
        .D(doutb[953]),
        .Q(dout[953]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[954] 
       (.C(clk),
        .CE(E),
        .D(doutb[954]),
        .Q(dout[954]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[955] 
       (.C(clk),
        .CE(E),
        .D(doutb[955]),
        .Q(dout[955]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[956] 
       (.C(clk),
        .CE(E),
        .D(doutb[956]),
        .Q(dout[956]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[957] 
       (.C(clk),
        .CE(E),
        .D(doutb[957]),
        .Q(dout[957]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[958] 
       (.C(clk),
        .CE(E),
        .D(doutb[958]),
        .Q(dout[958]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[959] 
       (.C(clk),
        .CE(E),
        .D(doutb[959]),
        .Q(dout[959]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[95] 
       (.C(clk),
        .CE(E),
        .D(doutb[95]),
        .Q(dout[95]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[960] 
       (.C(clk),
        .CE(E),
        .D(doutb[960]),
        .Q(dout[960]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[961] 
       (.C(clk),
        .CE(E),
        .D(doutb[961]),
        .Q(dout[961]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[962] 
       (.C(clk),
        .CE(E),
        .D(doutb[962]),
        .Q(dout[962]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[963] 
       (.C(clk),
        .CE(E),
        .D(doutb[963]),
        .Q(dout[963]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[964] 
       (.C(clk),
        .CE(E),
        .D(doutb[964]),
        .Q(dout[964]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[965] 
       (.C(clk),
        .CE(E),
        .D(doutb[965]),
        .Q(dout[965]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[966] 
       (.C(clk),
        .CE(E),
        .D(doutb[966]),
        .Q(dout[966]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[967] 
       (.C(clk),
        .CE(E),
        .D(doutb[967]),
        .Q(dout[967]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[968] 
       (.C(clk),
        .CE(E),
        .D(doutb[968]),
        .Q(dout[968]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[969] 
       (.C(clk),
        .CE(E),
        .D(doutb[969]),
        .Q(dout[969]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[96] 
       (.C(clk),
        .CE(E),
        .D(doutb[96]),
        .Q(dout[96]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[970] 
       (.C(clk),
        .CE(E),
        .D(doutb[970]),
        .Q(dout[970]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[971] 
       (.C(clk),
        .CE(E),
        .D(doutb[971]),
        .Q(dout[971]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[972] 
       (.C(clk),
        .CE(E),
        .D(doutb[972]),
        .Q(dout[972]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[973] 
       (.C(clk),
        .CE(E),
        .D(doutb[973]),
        .Q(dout[973]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[974] 
       (.C(clk),
        .CE(E),
        .D(doutb[974]),
        .Q(dout[974]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[975] 
       (.C(clk),
        .CE(E),
        .D(doutb[975]),
        .Q(dout[975]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[976] 
       (.C(clk),
        .CE(E),
        .D(doutb[976]),
        .Q(dout[976]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[977] 
       (.C(clk),
        .CE(E),
        .D(doutb[977]),
        .Q(dout[977]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[978] 
       (.C(clk),
        .CE(E),
        .D(doutb[978]),
        .Q(dout[978]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[979] 
       (.C(clk),
        .CE(E),
        .D(doutb[979]),
        .Q(dout[979]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[97] 
       (.C(clk),
        .CE(E),
        .D(doutb[97]),
        .Q(dout[97]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[980] 
       (.C(clk),
        .CE(E),
        .D(doutb[980]),
        .Q(dout[980]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[981] 
       (.C(clk),
        .CE(E),
        .D(doutb[981]),
        .Q(dout[981]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[982] 
       (.C(clk),
        .CE(E),
        .D(doutb[982]),
        .Q(dout[982]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[983] 
       (.C(clk),
        .CE(E),
        .D(doutb[983]),
        .Q(dout[983]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[984] 
       (.C(clk),
        .CE(E),
        .D(doutb[984]),
        .Q(dout[984]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[985] 
       (.C(clk),
        .CE(E),
        .D(doutb[985]),
        .Q(dout[985]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[986] 
       (.C(clk),
        .CE(E),
        .D(doutb[986]),
        .Q(dout[986]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[987] 
       (.C(clk),
        .CE(E),
        .D(doutb[987]),
        .Q(dout[987]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[988] 
       (.C(clk),
        .CE(E),
        .D(doutb[988]),
        .Q(dout[988]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[989] 
       (.C(clk),
        .CE(E),
        .D(doutb[989]),
        .Q(dout[989]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[98] 
       (.C(clk),
        .CE(E),
        .D(doutb[98]),
        .Q(dout[98]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[990] 
       (.C(clk),
        .CE(E),
        .D(doutb[990]),
        .Q(dout[990]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[991] 
       (.C(clk),
        .CE(E),
        .D(doutb[991]),
        .Q(dout[991]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[992] 
       (.C(clk),
        .CE(E),
        .D(doutb[992]),
        .Q(dout[992]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[993] 
       (.C(clk),
        .CE(E),
        .D(doutb[993]),
        .Q(dout[993]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[994] 
       (.C(clk),
        .CE(E),
        .D(doutb[994]),
        .Q(dout[994]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[995] 
       (.C(clk),
        .CE(E),
        .D(doutb[995]),
        .Q(dout[995]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[996] 
       (.C(clk),
        .CE(E),
        .D(doutb[996]),
        .Q(dout[996]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[997] 
       (.C(clk),
        .CE(E),
        .D(doutb[997]),
        .Q(dout[997]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[998] 
       (.C(clk),
        .CE(E),
        .D(doutb[998]),
        .Q(dout[998]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[999] 
       (.C(clk),
        .CE(E),
        .D(doutb[999]),
        .Q(dout[999]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[99] 
       (.C(clk),
        .CE(E),
        .D(doutb[99]),
        .Q(dout[99]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[9] 
       (.C(clk),
        .CE(E),
        .D(doutb[9]),
        .Q(dout[9]),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module fifo_generator_1024_rd_bin_cntr
   (v1_reg,
    Q,
    v1_reg_2,
    v1_reg_0,
    v1_reg_1,
    \gc1.count_d2_reg[0]_0 ,
    \gc1.count_d2_reg[2]_0 ,
    \gc1.count_d2_reg[4]_0 ,
    \gc1.count_d2_reg[6]_0 ,
    \gc1.count_d1_reg[8]_0 ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[3].gms.ms_0 ,
    \gmux.gm[3].gms.ms_1 ,
    srst,
    E,
    clk);
  output [3:0]v1_reg;
  output [8:0]Q;
  output [3:0]v1_reg_2;
  output [3:0]v1_reg_0;
  output [3:0]v1_reg_1;
  output \gc1.count_d2_reg[0]_0 ;
  output \gc1.count_d2_reg[2]_0 ;
  output \gc1.count_d2_reg[4]_0 ;
  output \gc1.count_d2_reg[6]_0 ;
  output [0:0]\gc1.count_d1_reg[8]_0 ;
  input [7:0]\gmux.gm[3].gms.ms ;
  input [7:0]\gmux.gm[3].gms.ms_0 ;
  input [7:0]\gmux.gm[3].gms.ms_1 ;
  input srst;
  input [0:0]E;
  input clk;

  wire [0:0]E;
  wire [8:0]Q;
  wire clk;
  wire \gc1.count[8]_i_2_n_0 ;
  wire [0:0]\gc1.count_d1_reg[8]_0 ;
  wire \gc1.count_d2_reg[0]_0 ;
  wire \gc1.count_d2_reg[2]_0 ;
  wire \gc1.count_d2_reg[4]_0 ;
  wire \gc1.count_d2_reg[6]_0 ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [7:0]\gmux.gm[3].gms.ms_0 ;
  wire [7:0]\gmux.gm[3].gms.ms_1 ;
  wire [8:0]plusOp;
  wire [7:0]rd_pntr_plus1;
  wire [8:0]rd_pntr_plus2;
  wire srst;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire [3:0]v1_reg_2;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gc1.count[0]_i_1 
       (.I0(rd_pntr_plus2[0]),
        .O(plusOp[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc1.count[1]_i_1 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc1.count[2]_i_1 
       (.I0(rd_pntr_plus2[0]),
        .I1(rd_pntr_plus2[1]),
        .I2(rd_pntr_plus2[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc1.count[3]_i_1 
       (.I0(rd_pntr_plus2[1]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[2]),
        .I3(rd_pntr_plus2[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc1.count[4]_i_1 
       (.I0(rd_pntr_plus2[2]),
        .I1(rd_pntr_plus2[0]),
        .I2(rd_pntr_plus2[1]),
        .I3(rd_pntr_plus2[3]),
        .I4(rd_pntr_plus2[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc1.count[5]_i_1 
       (.I0(rd_pntr_plus2[3]),
        .I1(rd_pntr_plus2[1]),
        .I2(rd_pntr_plus2[0]),
        .I3(rd_pntr_plus2[2]),
        .I4(rd_pntr_plus2[4]),
        .I5(rd_pntr_plus2[5]),
        .O(plusOp[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gc1.count[6]_i_1 
       (.I0(\gc1.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus2[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc1.count[7]_i_1 
       (.I0(\gc1.count[8]_i_2_n_0 ),
        .I1(rd_pntr_plus2[6]),
        .I2(rd_pntr_plus2[7]),
        .O(plusOp[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc1.count[8]_i_1 
       (.I0(rd_pntr_plus2[6]),
        .I1(\gc1.count[8]_i_2_n_0 ),
        .I2(rd_pntr_plus2[7]),
        .I3(rd_pntr_plus2[8]),
        .O(plusOp[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gc1.count[8]_i_2 
       (.I0(rd_pntr_plus2[5]),
        .I1(rd_pntr_plus2[3]),
        .I2(rd_pntr_plus2[1]),
        .I3(rd_pntr_plus2[0]),
        .I4(rd_pntr_plus2[2]),
        .I5(rd_pntr_plus2[4]),
        .O(\gc1.count[8]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[0]),
        .Q(rd_pntr_plus1[0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[1]),
        .Q(rd_pntr_plus1[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[2]),
        .Q(rd_pntr_plus1[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[3]),
        .Q(rd_pntr_plus1[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[4]),
        .Q(rd_pntr_plus1[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[5]),
        .Q(rd_pntr_plus1[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[6]),
        .Q(rd_pntr_plus1[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[7]),
        .Q(rd_pntr_plus1[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[8]),
        .Q(\gc1.count_d1_reg[8]_0 ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[0] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[1] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[2] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[2]),
        .Q(Q[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[3] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[3]),
        .Q(Q[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[4] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[4]),
        .Q(Q[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[5] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[5]),
        .Q(Q[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[6] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[6]),
        .Q(Q[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[7] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[7]),
        .Q(Q[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_d1_reg[8]_0 ),
        .Q(Q[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(plusOp[0]),
        .Q(rd_pntr_plus2[0]),
        .R(srst));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(plusOp[1]),
        .Q(rd_pntr_plus2[1]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(plusOp[2]),
        .Q(rd_pntr_plus2[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(plusOp[3]),
        .Q(rd_pntr_plus2[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(plusOp[4]),
        .Q(rd_pntr_plus2[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(plusOp[5]),
        .Q(rd_pntr_plus2[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(plusOp[6]),
        .Q(rd_pntr_plus2[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(plusOp[7]),
        .Q(rd_pntr_plus2[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(plusOp[8]),
        .Q(rd_pntr_plus2[8]),
        .R(srst));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(Q[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(rd_pntr_plus1[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(rd_pntr_plus1[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(v1_reg_2[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(Q[0]),
        .I1(\gmux.gm[3].gms.ms_0 [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[3].gms.ms_0 [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(Q[0]),
        .I1(\gmux.gm[3].gms.ms_1 [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[3].gms.ms_1 [1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__3 
       (.I0(Q[0]),
        .I1(\gmux.gm[3].gms.ms [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[3].gms.ms [1]),
        .O(\gc1.count_d2_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(rd_pntr_plus1[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(v1_reg_2[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(Q[2]),
        .I1(\gmux.gm[3].gms.ms_0 [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[3].gms.ms_0 [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(Q[2]),
        .I1(\gmux.gm[3].gms.ms_1 [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[3].gms.ms_1 [3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__3 
       (.I0(Q[2]),
        .I1(\gmux.gm[3].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[3].gms.ms [3]),
        .O(\gc1.count_d2_reg[2]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(rd_pntr_plus1[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(v1_reg_2[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(Q[4]),
        .I1(\gmux.gm[3].gms.ms_0 [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[3].gms.ms_0 [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(Q[4]),
        .I1(\gmux.gm[3].gms.ms_1 [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[3].gms.ms_1 [5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__3 
       (.I0(Q[4]),
        .I1(\gmux.gm[3].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[3].gms.ms [5]),
        .O(\gc1.count_d2_reg[4]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(rd_pntr_plus1[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(v1_reg_2[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(Q[6]),
        .I1(\gmux.gm[3].gms.ms_0 [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[3].gms.ms_0 [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(Q[6]),
        .I1(\gmux.gm[3].gms.ms_1 [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[3].gms.ms_1 [7]),
        .O(v1_reg_1[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__3 
       (.I0(Q[6]),
        .I1(\gmux.gm[3].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[3].gms.ms [7]),
        .O(\gc1.count_d2_reg[6]_0 ));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module fifo_generator_1024_rd_fwft
   (almost_empty,
    empty,
    tmp_ram_rd_en,
    E,
    ram_empty_fb_i_reg,
    srst,
    clk,
    rd_en,
    out);
  output almost_empty;
  output empty;
  output tmp_ram_rd_en;
  output [0:0]E;
  output [0:0]ram_empty_fb_i_reg;
  input srst;
  input clk;
  input rd_en;
  input out;

  wire [0:0]E;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0__1;
  wire clk;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0__1;
  wire [1:0]next_fwft_state;
  wire out;
  wire [0:0]ram_empty_fb_i_reg;
  wire rd_en;
  wire srst;
  wire tmp_ram_rd_en;
  (* DONT_TOUCH *) wire user_valid;

  assign almost_empty = aempty_fwft_i;
  assign empty = empty_fwft_i;
  LUT5 #(
    .INIT(32'hFFFF4555)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_1 
       (.I0(out),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .I4(srst),
        .O(tmp_ram_rd_en));
  LUT5 #(
    .INIT(32'hFFCB8000)) 
    aempty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(out),
        .I4(aempty_fwft_fb_i),
        .O(aempty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_fb_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_i),
        .S(srst));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_i),
        .O(empty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_fb_i),
        .S(srst));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_i),
        .S(srst));
  LUT4 #(
    .INIT(16'h4555)) 
    \gc1.count_d1[8]_i_1 
       (.I0(out),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(ram_empty_fb_i_reg));
  LUT3 #(
    .INIT(8'hA2)) 
    \goreg_bm.dout_i[1023]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(curr_fwft_state[0]),
        .I2(rd_en),
        .O(E));
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT4 #(
    .INIT(16'h20FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .I3(out),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(user_valid),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module fifo_generator_1024_rd_logic
   (almost_empty,
    empty,
    p_7_out,
    v1_reg,
    Q,
    tmp_ram_rd_en,
    \gc1.count_d1_reg[8] ,
    E,
    v1_reg_0,
    v1_reg_1,
    ram_empty_i_reg,
    ram_empty_i_reg_0,
    srst,
    clk,
    wr_en,
    out,
    rd_en,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[3].gms.ms_0 ,
    \gmux.gm[3].gms.ms_1 );
  output almost_empty;
  output empty;
  output p_7_out;
  output [3:0]v1_reg;
  output [8:0]Q;
  output tmp_ram_rd_en;
  output [0:0]\gc1.count_d1_reg[8] ;
  output [0:0]E;
  output [3:0]v1_reg_0;
  output [3:0]v1_reg_1;
  input ram_empty_i_reg;
  input [0:0]ram_empty_i_reg_0;
  input srst;
  input clk;
  input wr_en;
  input out;
  input rd_en;
  input [7:0]\gmux.gm[3].gms.ms ;
  input [7:0]\gmux.gm[3].gms.ms_0 ;
  input [7:0]\gmux.gm[3].gms.ms_1 ;

  wire [0:0]E;
  wire [8:0]Q;
  wire almost_empty;
  wire [3:0]\c2/v1_reg ;
  wire clk;
  wire empty;
  wire [0:0]\gc1.count_d1_reg[8] ;
  wire [7:0]\gmux.gm[3].gms.ms ;
  wire [7:0]\gmux.gm[3].gms.ms_0 ;
  wire [7:0]\gmux.gm[3].gms.ms_1 ;
  wire out;
  wire p_2_out;
  wire p_7_out;
  wire ram_empty_i_reg;
  wire [0:0]ram_empty_i_reg_0;
  wire rd_en;
  wire rpntr_n_25;
  wire rpntr_n_26;
  wire rpntr_n_27;
  wire rpntr_n_28;
  wire srst;
  wire tmp_ram_rd_en;
  wire [3:0]v1_reg;
  wire [3:0]v1_reg_0;
  wire [3:0]v1_reg_1;
  wire wr_en;

  fifo_generator_1024_rd_fwft \gr1.gr1_int.rfwft 
       (.E(E),
        .almost_empty(almost_empty),
        .clk(clk),
        .empty(empty),
        .out(p_2_out),
        .ram_empty_fb_i_reg(p_7_out),
        .rd_en(rd_en),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_generator_1024_rd_status_flags_ss \grss.rsts 
       (.E(p_7_out),
        .clk(clk),
        .\gmux.gm[1].gms.ms (rpntr_n_25),
        .\gmux.gm[2].gms.ms (rpntr_n_26),
        .\gmux.gm[3].gms.ms (rpntr_n_27),
        .\gmux.gm[4].gms.ms (rpntr_n_28),
        .out(p_2_out),
        .ram_empty_i_reg_0(ram_empty_i_reg),
        .ram_empty_i_reg_1(ram_empty_i_reg_0),
        .ram_empty_i_reg_2(out),
        .srst(srst),
        .v1_reg(\c2/v1_reg ),
        .wr_en(wr_en));
  fifo_generator_1024_rd_bin_cntr rpntr
       (.E(p_7_out),
        .Q(Q),
        .clk(clk),
        .\gc1.count_d1_reg[8]_0 (\gc1.count_d1_reg[8] ),
        .\gc1.count_d2_reg[0]_0 (rpntr_n_25),
        .\gc1.count_d2_reg[2]_0 (rpntr_n_26),
        .\gc1.count_d2_reg[4]_0 (rpntr_n_27),
        .\gc1.count_d2_reg[6]_0 (rpntr_n_28),
        .\gmux.gm[3].gms.ms (\gmux.gm[3].gms.ms ),
        .\gmux.gm[3].gms.ms_0 (\gmux.gm[3].gms.ms_0 ),
        .\gmux.gm[3].gms.ms_1 (\gmux.gm[3].gms.ms_1 ),
        .srst(srst),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(v1_reg_1),
        .v1_reg_2(\c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_ss" *) 
module fifo_generator_1024_rd_status_flags_ss
   (out,
    \gmux.gm[1].gms.ms ,
    \gmux.gm[2].gms.ms ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[4].gms.ms ,
    ram_empty_i_reg_0,
    v1_reg,
    ram_empty_i_reg_1,
    srst,
    clk,
    wr_en,
    ram_empty_i_reg_2,
    E);
  output out;
  input \gmux.gm[1].gms.ms ;
  input \gmux.gm[2].gms.ms ;
  input \gmux.gm[3].gms.ms ;
  input \gmux.gm[4].gms.ms ;
  input ram_empty_i_reg_0;
  input [3:0]v1_reg;
  input [0:0]ram_empty_i_reg_1;
  input srst;
  input clk;
  input wr_en;
  input ram_empty_i_reg_2;
  input [0:0]E;

  wire [0:0]E;
  wire clk;
  wire comp0;
  wire \gmux.gm[1].gms.ms ;
  wire \gmux.gm[2].gms.ms ;
  wire \gmux.gm[3].gms.ms ;
  wire \gmux.gm[4].gms.ms ;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_empty_i0__3;
  wire ram_empty_i_reg_0;
  wire [0:0]ram_empty_i_reg_1;
  wire ram_empty_i_reg_2;
  wire srst;
  wire [3:0]v1_reg;
  wire wr_en;

  assign out = ram_empty_fb_i;
  fifo_generator_1024_compare_2 c1
       (.comp0(comp0),
        .\gmux.gm[1].gms.ms_0 (\gmux.gm[1].gms.ms ),
        .\gmux.gm[2].gms.ms_0 (\gmux.gm[2].gms.ms ),
        .\gmux.gm[3].gms.ms_0 (\gmux.gm[3].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .ram_empty_i_reg(ram_empty_i_reg_0));
  fifo_generator_1024_compare_3 c2
       (.E(E),
        .comp0(comp0),
        .out(ram_empty_fb_i),
        .ram_empty_i0__3(ram_empty_i0__3),
        .ram_empty_i_reg(ram_empty_i_reg_1),
        .ram_empty_i_reg_0(ram_empty_i_reg_2),
        .v1_reg(v1_reg),
        .wr_en(wr_en));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i0__3),
        .Q(ram_empty_fb_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i0__3),
        .Q(ram_empty_i),
        .S(srst));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module fifo_generator_1024_wr_bin_cntr
   (Q,
    v1_reg,
    \gcc0.gc1.gsym.count_d2_reg[8]_0 ,
    \gcc0.gc1.gsym.count_d2_reg[8]_1 ,
    v1_reg_0,
    v1_reg_1,
    \gcc0.gc1.gsym.count_d2_reg[8]_2 ,
    \gcc0.gc1.gsym.count_d1_reg[7]_0 ,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 ,
    srst,
    E,
    clk);
  output [7:0]Q;
  output [0:0]v1_reg;
  output [8:0]\gcc0.gc1.gsym.count_d2_reg[8]_0 ;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[8]_1 ;
  output [0:0]v1_reg_0;
  output [0:0]v1_reg_1;
  output \gcc0.gc1.gsym.count_d2_reg[8]_2 ;
  output [7:0]\gcc0.gc1.gsym.count_d1_reg[7]_0 ;
  input [0:0]\gmux.gm[4].gms.ms ;
  input [0:0]\gmux.gm[4].gms.ms_0 ;
  input srst;
  input [0:0]E;
  input clk;

  wire [0:0]E;
  wire [7:0]Q;
  wire clk;
  wire \gcc0.gc1.gsym.count[8]_i_2_n_0 ;
  wire [7:0]\gcc0.gc1.gsym.count_d1_reg[7]_0 ;
  wire [8:0]\gcc0.gc1.gsym.count_d2_reg[8]_0 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[8]_1 ;
  wire \gcc0.gc1.gsym.count_d2_reg[8]_2 ;
  wire [0:0]\gmux.gm[4].gms.ms ;
  wire [0:0]\gmux.gm[4].gms.ms_0 ;
  wire [8:8]p_12_out;
  wire [8:0]plusOp__0;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [0:0]v1_reg_1;
  wire [8:8]wr_pntr_plus2;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gcc0.gc1.gsym.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gcc0.gc1.gsym.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gcc0.gc1.gsym.count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gcc0.gc1.gsym.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gcc0.gc1.gsym.count[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gcc0.gc1.gsym.count[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(plusOp__0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \gcc0.gc1.gsym.count[6]_i_1 
       (.I0(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I1(Q[6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gcc0.gc1.gsym.count[7]_i_1 
       (.I0(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gcc0.gc1.gsym.count[8]_i_1 
       (.I0(Q[6]),
        .I1(\gcc0.gc1.gsym.count[8]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(wr_pntr_plus2),
        .O(plusOp__0[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gcc0.gc1.gsym.count[8]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\gcc0.gc1.gsym.count[8]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(Q[0]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(Q[1]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(Q[2]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(Q[3]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(Q[4]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(Q[5]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(Q[6]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(Q[7]),
        .Q(\gcc0.gc1.gsym.count_d1_reg[7]_0 [7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(wr_pntr_plus2),
        .Q(p_12_out),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [0]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [1]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [2]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [3]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [4]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [5]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [6]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_d1_reg[7]_0 [7]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[8] 
       (.C(clk),
        .CE(E),
        .D(p_12_out),
        .Q(\gcc0.gc1.gsym.count_d2_reg[8]_0 [8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(Q[0]),
        .R(srst));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(Q[1]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(Q[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(Q[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(Q[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(Q[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(Q[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(Q[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2),
        .R(srst));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[8]_0 [8]),
        .I1(\gmux.gm[4].gms.ms ),
        .O(v1_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[8]_0 [8]),
        .I1(\gmux.gm[4].gms.ms_0 ),
        .O(\gcc0.gc1.gsym.count_d2_reg[8]_1 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(p_12_out),
        .I1(\gmux.gm[4].gms.ms ),
        .O(v1_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(wr_pntr_plus2),
        .I1(\gmux.gm[4].gms.ms ),
        .O(v1_reg_1));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[4].gms.ms_i_1__3 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[8]_0 [8]),
        .I1(\gmux.gm[4].gms.ms ),
        .O(\gcc0.gc1.gsym.count_d2_reg[8]_2 ));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module fifo_generator_1024_wr_logic
   (out,
    full,
    almost_full,
    Q,
    \gcc0.gc1.gsym.count_d2_reg[8] ,
    \gcc0.gc1.gsym.count_d2_reg[8]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[7] ,
    \gcc0.gc1.gsym.count_d2_reg[8]_1 ,
    WEBWE,
    wr_en_0,
    wr_en_1,
    wr_en_2,
    wr_en_3,
    wr_en_4,
    wr_en_5,
    wr_en_6,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[4].gms.ms_0 ,
    \gmux.gm[4].gms.ms_1 ,
    srst,
    clk,
    wr_en,
    p_7_out,
    \gmux.gm[4].gms.ms_2 ,
    \gmux.gm[4].gms.ms_3 );
  output out;
  output full;
  output almost_full;
  output [7:0]Q;
  output [8:0]\gcc0.gc1.gsym.count_d2_reg[8] ;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[8]_0 ;
  output [7:0]\gcc0.gc1.gsym.count_d1_reg[7] ;
  output \gcc0.gc1.gsym.count_d2_reg[8]_1 ;
  output [1:0]WEBWE;
  output [1:0]wr_en_0;
  output [1:0]wr_en_1;
  output [1:0]wr_en_2;
  output [1:0]wr_en_3;
  output [1:0]wr_en_4;
  output wr_en_5;
  output wr_en_6;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [3:0]\gmux.gm[4].gms.ms_1 ;
  input srst;
  input clk;
  input wr_en;
  input p_7_out;
  input [0:0]\gmux.gm[4].gms.ms_2 ;
  input [0:0]\gmux.gm[4].gms.ms_3 ;

  wire [7:0]Q;
  wire [1:0]WEBWE;
  wire almost_full;
  wire [4:4]\c0/v1_reg ;
  wire [4:4]\c1/v1_reg ;
  wire clk;
  wire full;
  wire [4:4]\gaf.c2/v1_reg ;
  wire [7:0]\gcc0.gc1.gsym.count_d1_reg[7] ;
  wire [8:0]\gcc0.gc1.gsym.count_d2_reg[8] ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[8]_0 ;
  wire \gcc0.gc1.gsym.count_d2_reg[8]_1 ;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire [3:0]\gmux.gm[4].gms.ms_1 ;
  wire [0:0]\gmux.gm[4].gms.ms_2 ;
  wire [0:0]\gmux.gm[4].gms.ms_3 ;
  wire out;
  wire p_17_out;
  wire p_7_out;
  wire srst;
  wire wr_en;
  wire [1:0]wr_en_0;
  wire [1:0]wr_en_1;
  wire [1:0]wr_en_2;
  wire [1:0]wr_en_3;
  wire [1:0]wr_en_4;
  wire wr_en_5;
  wire wr_en_6;

  fifo_generator_1024_wr_status_flags_ss \gwss.wsts 
       (.E(p_17_out),
        .WEBWE(WEBWE),
        .almost_full(almost_full),
        .clk(clk),
        .full(full),
        .\gmux.gm[4].gms.ms (\gmux.gm[4].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .\gmux.gm[4].gms.ms_1 (\gmux.gm[4].gms.ms_1 ),
        .out(out),
        .p_7_out(p_7_out),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ),
        .wr_en(wr_en),
        .wr_en_0(wr_en_0),
        .wr_en_1(wr_en_1),
        .wr_en_2(wr_en_2),
        .wr_en_3(wr_en_3),
        .wr_en_4(wr_en_4),
        .wr_en_5(wr_en_5),
        .wr_en_6(wr_en_6));
  fifo_generator_1024_wr_bin_cntr wpntr
       (.E(p_17_out),
        .Q(Q),
        .clk(clk),
        .\gcc0.gc1.gsym.count_d1_reg[7]_0 (\gcc0.gc1.gsym.count_d1_reg[7] ),
        .\gcc0.gc1.gsym.count_d2_reg[8]_0 (\gcc0.gc1.gsym.count_d2_reg[8] ),
        .\gcc0.gc1.gsym.count_d2_reg[8]_1 (\gcc0.gc1.gsym.count_d2_reg[8]_0 ),
        .\gcc0.gc1.gsym.count_d2_reg[8]_2 (\gcc0.gc1.gsym.count_d2_reg[8]_1 ),
        .\gmux.gm[4].gms.ms (\gmux.gm[4].gms.ms_2 ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_3 ),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_ss" *) 
module fifo_generator_1024_wr_status_flags_ss
   (out,
    full,
    almost_full,
    E,
    WEBWE,
    wr_en_0,
    wr_en_1,
    wr_en_2,
    wr_en_3,
    wr_en_4,
    wr_en_5,
    wr_en_6,
    \gmux.gm[4].gms.ms ,
    v1_reg,
    \gmux.gm[4].gms.ms_0 ,
    v1_reg_0,
    \gmux.gm[4].gms.ms_1 ,
    v1_reg_1,
    srst,
    clk,
    wr_en,
    p_7_out);
  output out;
  output full;
  output almost_full;
  output [0:0]E;
  output [1:0]WEBWE;
  output [1:0]wr_en_0;
  output [1:0]wr_en_1;
  output [1:0]wr_en_2;
  output [1:0]wr_en_3;
  output [1:0]wr_en_4;
  output wr_en_5;
  output wr_en_6;
  input [3:0]\gmux.gm[4].gms.ms ;
  input [0:0]v1_reg;
  input [3:0]\gmux.gm[4].gms.ms_0 ;
  input [0:0]v1_reg_0;
  input [3:0]\gmux.gm[4].gms.ms_1 ;
  input [0:0]v1_reg_1;
  input srst;
  input clk;
  input wr_en;
  input p_7_out;

  wire [0:0]E;
  wire [1:0]WEBWE;
  wire clk;
  wire comp0;
  wire comp1;
  wire [3:0]\gmux.gm[4].gms.ms ;
  wire [3:0]\gmux.gm[4].gms.ms_0 ;
  wire [3:0]\gmux.gm[4].gms.ms_1 ;
  wire p_2_out;
  wire p_7_out;
  (* DONT_TOUCH *) wire ram_afull_fb;
  (* DONT_TOUCH *) wire ram_afull_i;
  wire ram_full_comb;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [0:0]v1_reg_1;
  wire wr_en;
  wire [1:0]wr_en_0;
  wire [1:0]wr_en_1;
  wire [1:0]wr_en_2;
  wire [1:0]wr_en_3;
  wire [1:0]wr_en_4;
  wire wr_en_5;
  wire wr_en_6;

  assign almost_full = ram_afull_i;
  assign full = ram_full_i;
  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_2 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_5));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM18.ram_i_3 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_1[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(WEBWE[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__0 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(WEBWE[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__1 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_0[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__2 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_0[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__3 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_1[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__4 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_2[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__5 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_2[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__6 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_3[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__7 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_4[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__8 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_4[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_1__9 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_6));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram_i_2 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_3[0]));
  fifo_generator_1024_compare c0
       (.comp0(comp0),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .v1_reg(v1_reg));
  fifo_generator_1024_compare_0 c1
       (.comp0(comp0),
        .comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_0 ),
        .out(ram_full_fb_i),
        .p_7_out(p_7_out),
        .ram_full_comb(ram_full_comb),
        .v1_reg_0(v1_reg_0),
        .wr_en(wr_en));
  fifo_generator_1024_compare_1 \gaf.c2 
       (.almost_full(ram_afull_i),
        .comp1(comp1),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms_1 ),
        .out(ram_full_fb_i),
        .p_2_out(p_2_out),
        .p_7_out(p_7_out),
        .v1_reg_1(v1_reg_1),
        .wr_en(wr_en));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gaf.gaf0.ram_afull_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(p_2_out),
        .Q(ram_afull_i),
        .R(srst));
  LUT2 #(
    .INIT(4'h2)) 
    \gcc0.gc1.gsym.count_d1[8]_i_1 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(E));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(ram_afull_fb));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_fb_i),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_i),
        .R(srst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
