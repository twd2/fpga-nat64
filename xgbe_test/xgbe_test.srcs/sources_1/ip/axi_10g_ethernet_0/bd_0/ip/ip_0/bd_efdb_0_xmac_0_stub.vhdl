-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Nov  8 23:52:38 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               g:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axi_10g_ethernet_0/bd_0/ip/ip_0/bd_efdb_0_xmac_0_stub.vhdl
-- Design      : bd_efdb_0_xmac_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_efdb_0_xmac_0 is
  Port ( 
    tx_clk0 : in STD_LOGIC;
    reset : in STD_LOGIC;
    tx_axis_aresetn : in STD_LOGIC;
    tx_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    tx_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_tvalid : in STD_LOGIC;
    tx_axis_tlast : in STD_LOGIC;
    tx_axis_tuser : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_tready : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    tx_statistics_valid : out STD_LOGIC;
    pause_val : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pause_req : in STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    rx_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rx_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_axis_tvalid : out STD_LOGIC;
    rx_axis_tuser : out STD_LOGIC;
    rx_axis_tlast : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 );
    rx_statistics_valid : out STD_LOGIC;
    tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_dcm_locked : in STD_LOGIC;
    xgmii_txd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_clk0 : in STD_LOGIC;
    rx_dcm_locked : in STD_LOGIC;
    xgmii_rxd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end bd_efdb_0_xmac_0;

architecture stub of bd_efdb_0_xmac_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "tx_clk0,reset,tx_axis_aresetn,tx_axis_tdata[63:0],tx_axis_tkeep[7:0],tx_axis_tvalid,tx_axis_tlast,tx_axis_tuser,tx_ifg_delay[7:0],tx_axis_tready,tx_statistics_vector[25:0],tx_statistics_valid,pause_val[15:0],pause_req,rx_axis_aresetn,rx_axis_tdata[63:0],rx_axis_tkeep[7:0],rx_axis_tvalid,rx_axis_tuser,rx_axis_tlast,rx_statistics_vector[29:0],rx_statistics_valid,tx_configuration_vector[79:0],rx_configuration_vector[79:0],status_vector[2:0],tx_dcm_locked,xgmii_txd[63:0],xgmii_txc[7:0],rx_clk0,rx_dcm_locked,xgmii_rxd[63:0],xgmii_rxc[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ten_gig_eth_mac_v15_1_7,Vivado 2019.1";
begin
end;
