// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  8 23:43:21 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/blk_mem_gen_for_amc/blk_mem_gen_for_amc_stub.v
// Design      : blk_mem_gen_for_amc
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module blk_mem_gen_for_amc(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[139:0],addra[9:0],dina[1119:0],douta[1119:0],clkb,web[139:0],addrb[9:0],dinb[1119:0],doutb[1119:0]" */;
  input clka;
  input [139:0]wea;
  input [9:0]addra;
  input [1119:0]dina;
  output [1119:0]douta;
  input clkb;
  input [139:0]web;
  input [9:0]addrb;
  input [1119:0]dinb;
  output [1119:0]doutb;
endmodule
