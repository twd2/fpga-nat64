// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  8 23:52:38 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               g:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_0/bd_efdb_0_xmac_0_stub.v
// Design      : bd_efdb_0_xmac_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ten_gig_eth_mac_v15_1_7,Vivado 2019.1" *)
module bd_efdb_0_xmac_0(tx_clk0, reset, tx_axis_aresetn, tx_axis_tdata, 
  tx_axis_tkeep, tx_axis_tvalid, tx_axis_tlast, tx_axis_tuser, tx_ifg_delay, tx_axis_tready, 
  tx_statistics_vector, tx_statistics_valid, pause_val, pause_req, rx_axis_aresetn, 
  rx_axis_tdata, rx_axis_tkeep, rx_axis_tvalid, rx_axis_tuser, rx_axis_tlast, 
  rx_statistics_vector, rx_statistics_valid, tx_configuration_vector, 
  rx_configuration_vector, status_vector, tx_dcm_locked, xgmii_txd, xgmii_txc, rx_clk0, 
  rx_dcm_locked, xgmii_rxd, xgmii_rxc)
/* synthesis syn_black_box black_box_pad_pin="tx_clk0,reset,tx_axis_aresetn,tx_axis_tdata[63:0],tx_axis_tkeep[7:0],tx_axis_tvalid,tx_axis_tlast,tx_axis_tuser,tx_ifg_delay[7:0],tx_axis_tready,tx_statistics_vector[25:0],tx_statistics_valid,pause_val[15:0],pause_req,rx_axis_aresetn,rx_axis_tdata[63:0],rx_axis_tkeep[7:0],rx_axis_tvalid,rx_axis_tuser,rx_axis_tlast,rx_statistics_vector[29:0],rx_statistics_valid,tx_configuration_vector[79:0],rx_configuration_vector[79:0],status_vector[2:0],tx_dcm_locked,xgmii_txd[63:0],xgmii_txc[7:0],rx_clk0,rx_dcm_locked,xgmii_rxd[63:0],xgmii_rxc[7:0]" */;
  input tx_clk0;
  input reset;
  input tx_axis_aresetn;
  input [63:0]tx_axis_tdata;
  input [7:0]tx_axis_tkeep;
  input tx_axis_tvalid;
  input tx_axis_tlast;
  input tx_axis_tuser;
  input [7:0]tx_ifg_delay;
  output tx_axis_tready;
  output [25:0]tx_statistics_vector;
  output tx_statistics_valid;
  input [15:0]pause_val;
  input pause_req;
  input rx_axis_aresetn;
  output [63:0]rx_axis_tdata;
  output [7:0]rx_axis_tkeep;
  output rx_axis_tvalid;
  output rx_axis_tuser;
  output rx_axis_tlast;
  output [29:0]rx_statistics_vector;
  output rx_statistics_valid;
  input [79:0]tx_configuration_vector;
  input [79:0]rx_configuration_vector;
  output [2:0]status_vector;
  input tx_dcm_locked;
  output [63:0]xgmii_txd;
  output [7:0]xgmii_txc;
  input rx_clk0;
  input rx_dcm_locked;
  input [63:0]xgmii_rxd;
  input [7:0]xgmii_rxc;
endmodule
