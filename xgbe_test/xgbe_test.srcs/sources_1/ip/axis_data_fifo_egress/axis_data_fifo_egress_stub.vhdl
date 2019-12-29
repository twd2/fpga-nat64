-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Nov 23 22:41:17 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top axis_data_fifo_egress -prefix
--               axis_data_fifo_egress_ axis_data_fifo_egress_stub.vhdl
-- Design      : axis_data_fifo_egress
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axis_data_fifo_egress is
  Port ( 
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    prog_full : out STD_LOGIC
  );

end axis_data_fifo_egress;

architecture stub of axis_data_fifo_egress is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axis_aresetn,s_axis_aclk,s_axis_tvalid,s_axis_tready,s_axis_tdata[1023:0],s_axis_tkeep[127:0],s_axis_tlast,m_axis_tvalid,m_axis_tready,m_axis_tdata[1023:0],m_axis_tkeep[127:0],m_axis_tlast,prog_full";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_data_fifo_v2_0_1_top,Vivado 2019.1";
begin
end;
