// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Nov 23 22:41:17 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top axis_data_fifo_egress -prefix
//               axis_data_fifo_egress_ axis_data_fifo_egress_stub.v
// Design      : axis_data_fifo_egress
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_data_fifo_v2_0_1_top,Vivado 2019.1" *)
module axis_data_fifo_egress(s_axis_aresetn, s_axis_aclk, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, s_axis_tkeep, s_axis_tlast, m_axis_tvalid, m_axis_tready, 
  m_axis_tdata, m_axis_tkeep, m_axis_tlast, prog_full)
/* synthesis syn_black_box black_box_pad_pin="s_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[1023:0],s_axis_tkeep[127:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[1023:0],m_axis_tkeep[127:0],m_axis_tlast,prog_full" */;
  input s_axis_aresetn;
  input s_axis_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [1023:0]s_axis_tdata;
  input [127:0]s_axis_tkeep;
  input s_axis_tlast;
  output m_axis_tvalid;
  input m_axis_tready;
  output [1023:0]m_axis_tdata;
  output [127:0]m_axis_tkeep;
  output m_axis_tlast;
  output prog_full;
endmodule
