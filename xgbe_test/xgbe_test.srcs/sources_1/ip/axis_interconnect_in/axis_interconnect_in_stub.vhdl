-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sun Dec  8 01:02:55 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axis_interconnect_in/axis_interconnect_in_stub.vhdl
-- Design      : axis_interconnect_in
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axis_interconnect_in is
  Port ( 
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    S00_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S02_AXIS_ACLK : in STD_LOGIC;
    S03_AXIS_ACLK : in STD_LOGIC;
    S04_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_ARESETN : in STD_LOGIC;
    S01_AXIS_ARESETN : in STD_LOGIC;
    S02_AXIS_ARESETN : in STD_LOGIC;
    S03_AXIS_ARESETN : in STD_LOGIC;
    S04_AXIS_ARESETN : in STD_LOGIC;
    S00_AXIS_TVALID : in STD_LOGIC;
    S01_AXIS_TVALID : in STD_LOGIC;
    S02_AXIS_TVALID : in STD_LOGIC;
    S03_AXIS_TVALID : in STD_LOGIC;
    S04_AXIS_TVALID : in STD_LOGIC;
    S00_AXIS_TREADY : out STD_LOGIC;
    S01_AXIS_TREADY : out STD_LOGIC;
    S02_AXIS_TREADY : out STD_LOGIC;
    S03_AXIS_TREADY : out STD_LOGIC;
    S04_AXIS_TREADY : out STD_LOGIC;
    S00_AXIS_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S01_AXIS_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S02_AXIS_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S03_AXIS_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S04_AXIS_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S03_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S04_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXIS_TLAST : in STD_LOGIC;
    S01_AXIS_TLAST : in STD_LOGIC;
    S02_AXIS_TLAST : in STD_LOGIC;
    S03_AXIS_TLAST : in STD_LOGIC;
    S04_AXIS_TLAST : in STD_LOGIC;
    S00_AXIS_TID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXIS_TID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S02_AXIS_TID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S03_AXIS_TID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S04_AXIS_TID : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXIS_TUSER : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXIS_TUSER : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S02_AXIS_TUSER : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S03_AXIS_TUSER : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S04_AXIS_TUSER : in STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXIS_ACLK : in STD_LOGIC;
    M00_AXIS_ARESETN : in STD_LOGIC;
    M00_AXIS_TVALID : out STD_LOGIC;
    M00_AXIS_TREADY : in STD_LOGIC;
    M00_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M00_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXIS_TLAST : out STD_LOGIC;
    M00_AXIS_TID : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXIS_TUSER : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S01_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S02_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S03_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S04_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S00_FIFO_DATA_COUNT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_FIFO_DATA_COUNT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S02_FIFO_DATA_COUNT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S03_FIFO_DATA_COUNT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S04_FIFO_DATA_COUNT : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end axis_interconnect_in;

architecture stub of axis_interconnect_in is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ACLK,ARESETN,S00_AXIS_ACLK,S01_AXIS_ACLK,S02_AXIS_ACLK,S03_AXIS_ACLK,S04_AXIS_ACLK,S00_AXIS_ARESETN,S01_AXIS_ARESETN,S02_AXIS_ARESETN,S03_AXIS_ARESETN,S04_AXIS_ARESETN,S00_AXIS_TVALID,S01_AXIS_TVALID,S02_AXIS_TVALID,S03_AXIS_TVALID,S04_AXIS_TVALID,S00_AXIS_TREADY,S01_AXIS_TREADY,S02_AXIS_TREADY,S03_AXIS_TREADY,S04_AXIS_TREADY,S00_AXIS_TDATA[63:0],S01_AXIS_TDATA[63:0],S02_AXIS_TDATA[63:0],S03_AXIS_TDATA[63:0],S04_AXIS_TDATA[63:0],S00_AXIS_TKEEP[7:0],S01_AXIS_TKEEP[7:0],S02_AXIS_TKEEP[7:0],S03_AXIS_TKEEP[7:0],S04_AXIS_TKEEP[7:0],S00_AXIS_TLAST,S01_AXIS_TLAST,S02_AXIS_TLAST,S03_AXIS_TLAST,S04_AXIS_TLAST,S00_AXIS_TID[2:0],S01_AXIS_TID[2:0],S02_AXIS_TID[2:0],S03_AXIS_TID[2:0],S04_AXIS_TID[2:0],S00_AXIS_TUSER[7:0],S01_AXIS_TUSER[7:0],S02_AXIS_TUSER[7:0],S03_AXIS_TUSER[7:0],S04_AXIS_TUSER[7:0],M00_AXIS_ACLK,M00_AXIS_ARESETN,M00_AXIS_TVALID,M00_AXIS_TREADY,M00_AXIS_TDATA[1023:0],M00_AXIS_TKEEP[127:0],M00_AXIS_TLAST,M00_AXIS_TID[2:0],M00_AXIS_TUSER[127:0],S00_ARB_REQ_SUPPRESS,S01_ARB_REQ_SUPPRESS,S02_ARB_REQ_SUPPRESS,S03_ARB_REQ_SUPPRESS,S04_ARB_REQ_SUPPRESS,S00_FIFO_DATA_COUNT[31:0],S01_FIFO_DATA_COUNT[31:0],S02_FIFO_DATA_COUNT[31:0],S03_FIFO_DATA_COUNT[31:0],S04_FIFO_DATA_COUNT[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_interconnect_v1_1_17_axis_interconnect_16x16_top,Vivado 2019.1";
begin
end;
