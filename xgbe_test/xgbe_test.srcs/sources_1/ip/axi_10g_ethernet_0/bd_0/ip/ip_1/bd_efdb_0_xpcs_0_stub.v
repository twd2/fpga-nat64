// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  8 23:53:20 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               g:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_1/bd_efdb_0_xpcs_0_stub.v
// Design      : bd_efdb_0_xpcs_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ten_gig_eth_pcs_pma_v6_0_15,Vivado 2019.1" *)
module bd_efdb_0_xpcs_0(dclk, rxrecclk_out, coreclk, txusrclk, txusrclk2, 
  txoutclk, areset, areset_coreclk, gttxreset, gtrxreset, sim_speedup_control, txuserrdy, 
  qplllock, qplloutclk, qplloutrefclk, reset_counter_done, xgmii_txd, xgmii_txc, xgmii_rxd, 
  xgmii_rxc, txp, txn, rxp, rxn, configuration_vector, status_vector, core_status, tx_resetdone, 
  rx_resetdone, signal_detect, tx_fault, drp_req, drp_gnt, drp_den_o, drp_dwe_o, drp_daddr_o, 
  drp_di_o, drp_drdy_o, drp_drpdo_o, drp_den_i, drp_dwe_i, drp_daddr_i, drp_di_i, drp_drdy_i, 
  drp_drpdo_i, pma_pmd_type, tx_disable)
/* synthesis syn_black_box black_box_pad_pin="dclk,rxrecclk_out,coreclk,txusrclk,txusrclk2,txoutclk,areset,areset_coreclk,gttxreset,gtrxreset,sim_speedup_control,txuserrdy,qplllock,qplloutclk,qplloutrefclk,reset_counter_done,xgmii_txd[63:0],xgmii_txc[7:0],xgmii_rxd[63:0],xgmii_rxc[7:0],txp,txn,rxp,rxn,configuration_vector[535:0],status_vector[447:0],core_status[7:0],tx_resetdone,rx_resetdone,signal_detect,tx_fault,drp_req,drp_gnt,drp_den_o,drp_dwe_o,drp_daddr_o[15:0],drp_di_o[15:0],drp_drdy_o,drp_drpdo_o[15:0],drp_den_i,drp_dwe_i,drp_daddr_i[15:0],drp_di_i[15:0],drp_drdy_i,drp_drpdo_i[15:0],pma_pmd_type[2:0],tx_disable" */;
  input dclk;
  output rxrecclk_out;
  input coreclk;
  input txusrclk;
  input txusrclk2;
  output txoutclk;
  input areset;
  input areset_coreclk;
  input gttxreset;
  input gtrxreset;
  input sim_speedup_control;
  input txuserrdy;
  input qplllock;
  input qplloutclk;
  input qplloutrefclk;
  input reset_counter_done;
  input [63:0]xgmii_txd;
  input [7:0]xgmii_txc;
  output [63:0]xgmii_rxd;
  output [7:0]xgmii_rxc;
  output txp;
  output txn;
  input rxp;
  input rxn;
  input [535:0]configuration_vector;
  output [447:0]status_vector;
  output [7:0]core_status;
  output tx_resetdone;
  output rx_resetdone;
  input signal_detect;
  input tx_fault;
  output drp_req;
  input drp_gnt;
  output drp_den_o;
  output drp_dwe_o;
  output [15:0]drp_daddr_o;
  output [15:0]drp_di_o;
  output drp_drdy_o;
  output [15:0]drp_drpdo_o;
  input drp_den_i;
  input drp_dwe_i;
  input [15:0]drp_daddr_i;
  input [15:0]drp_di_i;
  input drp_drdy_i;
  input [15:0]drp_drpdo_i;
  input [2:0]pma_pmd_type;
  output tx_disable;
endmodule
