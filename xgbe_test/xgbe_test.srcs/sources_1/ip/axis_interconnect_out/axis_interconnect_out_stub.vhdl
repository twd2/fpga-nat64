-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Nov 23 18:44:13 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axis_interconnect_out/axis_interconnect_out_stub.vhdl
-- Design      : axis_interconnect_out
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axis_interconnect_out is
  Port ( 
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    S00_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_ARESETN : in STD_LOGIC;
    S00_AXIS_TVALID : in STD_LOGIC;
    S00_AXIS_TREADY : out STD_LOGIC;
    S00_AXIS_TDATA : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    S00_AXIS_TKEEP : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S00_AXIS_TLAST : in STD_LOGIC;
    S00_AXIS_TDEST : in STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXIS_ACLK : in STD_LOGIC;
    M01_AXIS_ACLK : in STD_LOGIC;
    M02_AXIS_ACLK : in STD_LOGIC;
    M03_AXIS_ACLK : in STD_LOGIC;
    M04_AXIS_ACLK : in STD_LOGIC;
    M00_AXIS_ARESETN : in STD_LOGIC;
    M01_AXIS_ARESETN : in STD_LOGIC;
    M02_AXIS_ARESETN : in STD_LOGIC;
    M03_AXIS_ARESETN : in STD_LOGIC;
    M04_AXIS_ARESETN : in STD_LOGIC;
    M00_AXIS_TVALID : out STD_LOGIC;
    M01_AXIS_TVALID : out STD_LOGIC;
    M02_AXIS_TVALID : out STD_LOGIC;
    M03_AXIS_TVALID : out STD_LOGIC;
    M04_AXIS_TVALID : out STD_LOGIC;
    M00_AXIS_TREADY : in STD_LOGIC;
    M01_AXIS_TREADY : in STD_LOGIC;
    M02_AXIS_TREADY : in STD_LOGIC;
    M03_AXIS_TREADY : in STD_LOGIC;
    M04_AXIS_TREADY : in STD_LOGIC;
    M00_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M01_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M02_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M03_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M04_AXIS_TDATA : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    M00_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M01_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M02_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M03_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M04_AXIS_TKEEP : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M00_AXIS_TLAST : out STD_LOGIC;
    M01_AXIS_TLAST : out STD_LOGIC;
    M02_AXIS_TLAST : out STD_LOGIC;
    M03_AXIS_TLAST : out STD_LOGIC;
    M04_AXIS_TLAST : out STD_LOGIC;
    M00_AXIS_TDEST : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXIS_TDEST : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXIS_TDEST : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXIS_TDEST : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXIS_TDEST : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_DECODE_ERR : out STD_LOGIC
  );

end axis_interconnect_out;

architecture stub of axis_interconnect_out is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ACLK,ARESETN,S00_AXIS_ACLK,S00_AXIS_ARESETN,S00_AXIS_TVALID,S00_AXIS_TREADY,S00_AXIS_TDATA[1023:0],S00_AXIS_TKEEP[127:0],S00_AXIS_TLAST,S00_AXIS_TDEST[2:0],M00_AXIS_ACLK,M01_AXIS_ACLK,M02_AXIS_ACLK,M03_AXIS_ACLK,M04_AXIS_ACLK,M00_AXIS_ARESETN,M01_AXIS_ARESETN,M02_AXIS_ARESETN,M03_AXIS_ARESETN,M04_AXIS_ARESETN,M00_AXIS_TVALID,M01_AXIS_TVALID,M02_AXIS_TVALID,M03_AXIS_TVALID,M04_AXIS_TVALID,M00_AXIS_TREADY,M01_AXIS_TREADY,M02_AXIS_TREADY,M03_AXIS_TREADY,M04_AXIS_TREADY,M00_AXIS_TDATA[1023:0],M01_AXIS_TDATA[1023:0],M02_AXIS_TDATA[1023:0],M03_AXIS_TDATA[1023:0],M04_AXIS_TDATA[1023:0],M00_AXIS_TKEEP[127:0],M01_AXIS_TKEEP[127:0],M02_AXIS_TKEEP[127:0],M03_AXIS_TKEEP[127:0],M04_AXIS_TKEEP[127:0],M00_AXIS_TLAST,M01_AXIS_TLAST,M02_AXIS_TLAST,M03_AXIS_TLAST,M04_AXIS_TLAST,M00_AXIS_TDEST[2:0],M01_AXIS_TDEST[2:0],M02_AXIS_TDEST[2:0],M03_AXIS_TDEST[2:0],M04_AXIS_TDEST[2:0],S00_DECODE_ERR";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_interconnect_v1_1_17_axis_interconnect_16x16_top,Vivado 2019.1";
begin
end;
