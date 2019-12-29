-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Nov  8 23:43:21 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/blk_mem_gen_for_amc/blk_mem_gen_for_amc_stub.vhdl
-- Design      : blk_mem_gen_for_amc
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_gen_for_amc is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 139 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 1119 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 1119 downto 0 );
    clkb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 139 downto 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 1119 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 1119 downto 0 )
  );

end blk_mem_gen_for_amc;

architecture stub of blk_mem_gen_for_amc is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[139:0],addra[9:0],dina[1119:0],douta[1119:0],clkb,web[139:0],addrb[9:0],dinb[1119:0],doutb[1119:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_3,Vivado 2019.1";
begin
end;
