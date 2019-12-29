-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Fri Nov  8 23:54:20 2019
-- Host        : twd2-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axi_10g_ethernet_0/axi_10g_ethernet_0_sim_netlist.vhdl
-- Design      : axi_10g_ethernet_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k420tiffg901-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 : entity is "bd_efdb_0_dcm_locked_driver_0,xlconstant_v1_1_6_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 : entity is "bd_efdb_0_dcm_locked_driver_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 : entity is "xlconstant_v1_1_6_xlconstant,Vivado 2019.1";
end axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0;

architecture STRUCTURE of axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  dout(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 : entity is "bd_efdb_0_pma_pmd_type_driver_0,xlconstant_v1_1_6_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 : entity is "bd_efdb_0_pma_pmd_type_driver_0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 : entity is "xlconstant_v1_1_6_xlconstant,Vivado 2019.1";
end axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0;

architecture STRUCTURE of axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  dout(2) <= \<const1>\;
  dout(1) <= \<const0>\;
  dout(0) <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0_bd_efdb_0 is
  port (
    areset : in STD_LOGIC;
    areset_coreclk : in STD_LOGIC;
    coreclk : in STD_LOGIC;
    dclk : in STD_LOGIC;
    gtrxreset : in STD_LOGIC;
    gttxreset : in STD_LOGIC;
    m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_rx_tlast : out STD_LOGIC;
    m_axis_rx_tuser : out STD_LOGIC;
    m_axis_rx_tvalid : out STD_LOGIC;
    mac_rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    mac_tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    pcs_pma_configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    pcs_pma_status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    pcspma_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qplllock : in STD_LOGIC;
    qplloutclk : in STD_LOGIC;
    qplloutrefclk : in STD_LOGIC;
    reset_counter_done : in STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    rx_resetdone : out STD_LOGIC;
    rx_statistics_valid : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 );
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    s_axis_pause_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_pause_tvalid : in STD_LOGIC;
    s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tx_tlast : in STD_LOGIC;
    s_axis_tx_tready : out STD_LOGIC;
    s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tx_tvalid : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    sim_speedup_control : in STD_LOGIC;
    tx_axis_aresetn : in STD_LOGIC;
    tx_disable : out STD_LOGIC;
    tx_fault : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_resetdone : out STD_LOGIC;
    tx_statistics_valid : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    txn : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    txp : out STD_LOGIC;
    txuserrdy : in STD_LOGIC;
    txusrclk : in STD_LOGIC;
    txusrclk2 : in STD_LOGIC
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of axi_10g_ethernet_0_bd_efdb_0 : entity is "axi_10g_ethernet_0.hwdef";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_10g_ethernet_0_bd_efdb_0 : entity is "bd_efdb_0";
end axi_10g_ethernet_0_bd_efdb_0;

architecture STRUCTURE of axi_10g_ethernet_0_bd_efdb_0 is
  component axi_10g_ethernet_0_bd_efdb_0_xmac_0 is
  port (
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
  end component axi_10g_ethernet_0_bd_efdb_0_xmac_0;
  component axi_10g_ethernet_0_bd_efdb_0_xpcs_0 is
  port (
    dclk : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    coreclk : in STD_LOGIC;
    txusrclk : in STD_LOGIC;
    txusrclk2 : in STD_LOGIC;
    txoutclk : out STD_LOGIC;
    areset : in STD_LOGIC;
    areset_coreclk : in STD_LOGIC;
    gttxreset : in STD_LOGIC;
    gtrxreset : in STD_LOGIC;
    sim_speedup_control : in STD_LOGIC;
    txuserrdy : in STD_LOGIC;
    qplllock : in STD_LOGIC;
    qplloutclk : in STD_LOGIC;
    qplloutrefclk : in STD_LOGIC;
    reset_counter_done : in STD_LOGIC;
    xgmii_txd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_txc : in STD_LOGIC_VECTOR ( 7 downto 0 );
    xgmii_rxd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xgmii_rxc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    core_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_resetdone : out STD_LOGIC;
    rx_resetdone : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    tx_fault : in STD_LOGIC;
    drp_req : out STD_LOGIC;
    drp_gnt : in STD_LOGIC;
    drp_den_o : out STD_LOGIC;
    drp_dwe_o : out STD_LOGIC;
    drp_daddr_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_di_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_drdy_o : out STD_LOGIC;
    drp_drpdo_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_den_i : in STD_LOGIC;
    drp_dwe_i : in STD_LOGIC;
    drp_daddr_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_di_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drp_drdy_i : in STD_LOGIC;
    drp_drpdo_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pma_pmd_type : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_disable : out STD_LOGIC
  );
  end component axi_10g_ethernet_0_bd_efdb_0_xpcs_0;
  signal dcm_locked_driver_dout : STD_LOGIC;
  signal pma_pmd_type_driver_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xmac_xgmii_xgmac_RXC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xmac_xgmii_xgmac_RXD : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xmac_xgmii_xgmac_TXC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xmac_xgmii_xgmac_TXD : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xpcs_core_gt_drp_interface_DADDR : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DEN : STD_LOGIC;
  signal xpcs_core_gt_drp_interface_DI : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DO : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xpcs_core_gt_drp_interface_DRDY : STD_LOGIC;
  signal xpcs_core_gt_drp_interface_DWE : STD_LOGIC;
  signal xpcs_drp_req : STD_LOGIC;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dcm_locked_driver : label is "bd_efdb_0_dcm_locked_driver_0,xlconstant_v1_1_6_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dcm_locked_driver : label is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dcm_locked_driver : label is "xlconstant_v1_1_6_xlconstant,Vivado 2019.1";
  attribute CHECK_LICENSE_TYPE of pma_pmd_type_driver : label is "bd_efdb_0_pma_pmd_type_driver_0,xlconstant_v1_1_6_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings of pma_pmd_type_driver : label is "yes";
  attribute X_CORE_INFO of pma_pmd_type_driver : label is "xlconstant_v1_1_6_xlconstant,Vivado 2019.1";
  attribute X_CORE_INFO of xmac : label is "ten_gig_eth_mac_v15_1_7,Vivado 2019.1";
  attribute X_CORE_INFO of xpcs : label is "ten_gig_eth_pcs_pma_v6_0_15,Vivado 2019.1";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of areset : signal is "xilinx.com:signal:reset:1.0 RST.ARESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of areset : signal is "XIL_INTERFACENAME RST.ARESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of areset_coreclk : signal is "xilinx.com:signal:reset:1.0 RST.ARESET_CORECLK RST";
  attribute X_INTERFACE_PARAMETER of areset_coreclk : signal is "XIL_INTERFACENAME RST.ARESET_CORECLK, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of coreclk : signal is "xilinx.com:signal:clock:1.0 CLK.CORECLK CLK";
  attribute X_INTERFACE_PARAMETER of coreclk : signal is "XIL_INTERFACENAME CLK.CORECLK, ASSOCIATED_ASYNC_RESET rx_axis_aresetn:tx_axis_aresetn, ASSOCIATED_BUSIF m_axis_rx:s_axis_pause:s_axis_tx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of dclk : signal is "xilinx.com:signal:clock:1.0 CLK.DCLK CLK";
  attribute X_INTERFACE_PARAMETER of dclk : signal is "XIL_INTERFACENAME CLK.DCLK, CLK_DOMAIN bd_efdb_0_dclk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of gtrxreset : signal is "xilinx.com:signal:reset:1.0 RST.GTRXRESET RST";
  attribute X_INTERFACE_PARAMETER of gtrxreset : signal is "XIL_INTERFACENAME RST.GTRXRESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of gttxreset : signal is "xilinx.com:signal:reset:1.0 RST.GTTXRESET RST";
  attribute X_INTERFACE_PARAMETER of gttxreset : signal is "XIL_INTERFACENAME RST.GTTXRESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of m_axis_rx_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TLAST";
  attribute X_INTERFACE_INFO of m_axis_rx_tuser : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TUSER";
  attribute X_INTERFACE_INFO of m_axis_rx_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TVALID";
  attribute X_INTERFACE_INFO of qplloutclk : signal is "xilinx.com:signal:clock:1.0 CLK.QPLLOUTCLK CLK";
  attribute X_INTERFACE_PARAMETER of qplloutclk : signal is "XIL_INTERFACENAME CLK.QPLLOUTCLK, CLK_DOMAIN bd_efdb_0_qplloutclk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of qplloutrefclk : signal is "xilinx.com:signal:clock:1.0 CLK.QPLLOUTREFCLK CLK";
  attribute X_INTERFACE_PARAMETER of qplloutrefclk : signal is "XIL_INTERFACENAME CLK.QPLLOUTREFCLK, CLK_DOMAIN bd_efdb_0_qplloutrefclk, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of rx_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.RX_AXIS_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of rx_axis_aresetn : signal is "XIL_INTERFACENAME RST.RX_AXIS_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of rx_statistics_valid : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics valid";
  attribute X_INTERFACE_INFO of rxrecclk_out : signal is "xilinx.com:signal:clock:1.0 CLK.RXRECCLK_OUT CLK";
  attribute X_INTERFACE_PARAMETER of rxrecclk_out : signal is "XIL_INTERFACENAME CLK.RXRECCLK_OUT, CLK_DOMAIN bd_efdb_0_xpcs_0_rxrecclk_out, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of s_axis_pause_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_pause TVALID";
  attribute X_INTERFACE_INFO of s_axis_tx_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TLAST";
  attribute X_INTERFACE_INFO of s_axis_tx_tready : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TREADY";
  attribute X_INTERFACE_INFO of s_axis_tx_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TVALID";
  attribute X_INTERFACE_INFO of tx_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.TX_AXIS_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of tx_axis_aresetn : signal is "XIL_INTERFACENAME RST.TX_AXIS_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of tx_statistics_valid : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics valid";
  attribute X_INTERFACE_INFO of txoutclk : signal is "xilinx.com:signal:clock:1.0 CLK.TXOUTCLK CLK";
  attribute X_INTERFACE_PARAMETER of txoutclk : signal is "XIL_INTERFACENAME CLK.TXOUTCLK, CLK_DOMAIN bd_efdb_0_xpcs_0_txoutclk, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of txusrclk : signal is "xilinx.com:signal:clock:1.0 CLK.TXUSRCLK CLK";
  attribute X_INTERFACE_PARAMETER of txusrclk : signal is "XIL_INTERFACENAME CLK.TXUSRCLK, CLK_DOMAIN bd_efdb_0_txusrclk, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of txusrclk2 : signal is "xilinx.com:signal:clock:1.0 CLK.TXUSRCLK2 CLK";
  attribute X_INTERFACE_PARAMETER of txusrclk2 : signal is "XIL_INTERFACENAME CLK.TXUSRCLK2, CLK_DOMAIN bd_efdb_0_txusrclk2, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of m_axis_rx_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TDATA";
  attribute X_INTERFACE_PARAMETER of m_axis_rx_tdata : signal is "XIL_INTERFACENAME m_axis_rx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1";
  attribute X_INTERFACE_INFO of m_axis_rx_tkeep : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP";
  attribute X_INTERFACE_INFO of rx_statistics_vector : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics vector";
  attribute X_INTERFACE_INFO of s_axis_pause_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_pause TDATA";
  attribute X_INTERFACE_PARAMETER of s_axis_pause_tdata : signal is "XIL_INTERFACENAME s_axis_pause, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axis_tx_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TDATA";
  attribute X_INTERFACE_PARAMETER of s_axis_tx_tdata : signal is "XIL_INTERFACENAME s_axis_tx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1";
  attribute X_INTERFACE_INFO of s_axis_tx_tkeep : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP";
  attribute X_INTERFACE_INFO of s_axis_tx_tuser : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TUSER";
  attribute X_INTERFACE_INFO of tx_statistics_vector : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics vector";
begin
dcm_locked_driver: entity work.axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0
     port map (
      dout(0) => dcm_locked_driver_dout
    );
pma_pmd_type_driver: entity work.axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0
     port map (
      dout(2 downto 0) => pma_pmd_type_driver_dout(2 downto 0)
    );
xmac: component axi_10g_ethernet_0_bd_efdb_0_xmac_0
     port map (
      pause_req => s_axis_pause_tvalid,
      pause_val(15 downto 0) => s_axis_pause_tdata(15 downto 0),
      reset => areset,
      rx_axis_aresetn => rx_axis_aresetn,
      rx_axis_tdata(63 downto 0) => m_axis_rx_tdata(63 downto 0),
      rx_axis_tkeep(7 downto 0) => m_axis_rx_tkeep(7 downto 0),
      rx_axis_tlast => m_axis_rx_tlast,
      rx_axis_tuser => m_axis_rx_tuser,
      rx_axis_tvalid => m_axis_rx_tvalid,
      rx_clk0 => coreclk,
      rx_configuration_vector(79 downto 0) => mac_rx_configuration_vector(79 downto 0),
      rx_dcm_locked => dcm_locked_driver_dout,
      rx_statistics_valid => rx_statistics_valid,
      rx_statistics_vector(29 downto 0) => rx_statistics_vector(29 downto 0),
      status_vector(2 downto 0) => mac_status_vector(2 downto 0),
      tx_axis_aresetn => tx_axis_aresetn,
      tx_axis_tdata(63 downto 0) => s_axis_tx_tdata(63 downto 0),
      tx_axis_tkeep(7 downto 0) => s_axis_tx_tkeep(7 downto 0),
      tx_axis_tlast => s_axis_tx_tlast,
      tx_axis_tready => s_axis_tx_tready,
      tx_axis_tuser => s_axis_tx_tuser(0),
      tx_axis_tvalid => s_axis_tx_tvalid,
      tx_clk0 => coreclk,
      tx_configuration_vector(79 downto 0) => mac_tx_configuration_vector(79 downto 0),
      tx_dcm_locked => dcm_locked_driver_dout,
      tx_ifg_delay(7 downto 0) => tx_ifg_delay(7 downto 0),
      tx_statistics_valid => tx_statistics_valid,
      tx_statistics_vector(25 downto 0) => tx_statistics_vector(25 downto 0),
      xgmii_rxc(7 downto 0) => xmac_xgmii_xgmac_RXC(7 downto 0),
      xgmii_rxd(63 downto 0) => xmac_xgmii_xgmac_RXD(63 downto 0),
      xgmii_txc(7 downto 0) => xmac_xgmii_xgmac_TXC(7 downto 0),
      xgmii_txd(63 downto 0) => xmac_xgmii_xgmac_TXD(63 downto 0)
    );
xpcs: component axi_10g_ethernet_0_bd_efdb_0_xpcs_0
     port map (
      areset => areset,
      areset_coreclk => areset_coreclk,
      configuration_vector(535 downto 0) => pcs_pma_configuration_vector(535 downto 0),
      core_status(7 downto 0) => pcspma_status(7 downto 0),
      coreclk => coreclk,
      dclk => dclk,
      drp_daddr_i(15 downto 0) => xpcs_core_gt_drp_interface_DADDR(15 downto 0),
      drp_daddr_o(15 downto 0) => xpcs_core_gt_drp_interface_DADDR(15 downto 0),
      drp_den_i => xpcs_core_gt_drp_interface_DEN,
      drp_den_o => xpcs_core_gt_drp_interface_DEN,
      drp_di_i(15 downto 0) => xpcs_core_gt_drp_interface_DI(15 downto 0),
      drp_di_o(15 downto 0) => xpcs_core_gt_drp_interface_DI(15 downto 0),
      drp_drdy_i => xpcs_core_gt_drp_interface_DRDY,
      drp_drdy_o => xpcs_core_gt_drp_interface_DRDY,
      drp_drpdo_i(15 downto 0) => xpcs_core_gt_drp_interface_DO(15 downto 0),
      drp_drpdo_o(15 downto 0) => xpcs_core_gt_drp_interface_DO(15 downto 0),
      drp_dwe_i => xpcs_core_gt_drp_interface_DWE,
      drp_dwe_o => xpcs_core_gt_drp_interface_DWE,
      drp_gnt => xpcs_drp_req,
      drp_req => xpcs_drp_req,
      gtrxreset => gtrxreset,
      gttxreset => gttxreset,
      pma_pmd_type(2 downto 0) => pma_pmd_type_driver_dout(2 downto 0),
      qplllock => qplllock,
      qplloutclk => qplloutclk,
      qplloutrefclk => qplloutrefclk,
      reset_counter_done => reset_counter_done,
      rx_resetdone => rx_resetdone,
      rxn => rxn,
      rxp => rxp,
      rxrecclk_out => rxrecclk_out,
      signal_detect => signal_detect,
      sim_speedup_control => sim_speedup_control,
      status_vector(447 downto 0) => pcs_pma_status_vector(447 downto 0),
      tx_disable => tx_disable,
      tx_fault => tx_fault,
      tx_resetdone => tx_resetdone,
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      txuserrdy => txuserrdy,
      txusrclk => txusrclk,
      txusrclk2 => txusrclk2,
      xgmii_rxc(7 downto 0) => xmac_xgmii_xgmac_RXC(7 downto 0),
      xgmii_rxd(63 downto 0) => xmac_xgmii_xgmac_RXD(63 downto 0),
      xgmii_txc(7 downto 0) => xmac_xgmii_xgmac_TXC(7 downto 0),
      xgmii_txd(63 downto 0) => xmac_xgmii_xgmac_TXD(63 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_10g_ethernet_0 is
  port (
    tx_axis_aresetn : in STD_LOGIC;
    rx_axis_aresetn : in STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dclk : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    tx_fault : in STD_LOGIC;
    tx_disable : out STD_LOGIC;
    pcspma_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sim_speedup_control : in STD_LOGIC;
    rxrecclk_out : out STD_LOGIC;
    mac_tx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_rx_configuration_vector : in STD_LOGIC_VECTOR ( 79 downto 0 );
    mac_status_vector : out STD_LOGIC_VECTOR ( 2 downto 0 );
    pcs_pma_configuration_vector : in STD_LOGIC_VECTOR ( 535 downto 0 );
    pcs_pma_status_vector : out STD_LOGIC_VECTOR ( 447 downto 0 );
    areset_coreclk : in STD_LOGIC;
    txusrclk : in STD_LOGIC;
    txusrclk2 : in STD_LOGIC;
    txoutclk : out STD_LOGIC;
    txuserrdy : in STD_LOGIC;
    tx_resetdone : out STD_LOGIC;
    rx_resetdone : out STD_LOGIC;
    coreclk : in STD_LOGIC;
    areset : in STD_LOGIC;
    gttxreset : in STD_LOGIC;
    gtrxreset : in STD_LOGIC;
    qplllock : in STD_LOGIC;
    qplloutclk : in STD_LOGIC;
    qplloutrefclk : in STD_LOGIC;
    reset_counter_done : in STD_LOGIC;
    s_axis_tx_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tx_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tx_tlast : in STD_LOGIC;
    s_axis_tx_tready : out STD_LOGIC;
    s_axis_tx_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tx_tvalid : in STD_LOGIC;
    s_axis_pause_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_pause_tvalid : in STD_LOGIC;
    m_axis_rx_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_rx_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_rx_tlast : out STD_LOGIC;
    m_axis_rx_tuser : out STD_LOGIC;
    m_axis_rx_tvalid : out STD_LOGIC;
    tx_statistics_valid : out STD_LOGIC;
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 25 downto 0 );
    rx_statistics_valid : out STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 29 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axi_10g_ethernet_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_10g_ethernet_0 : entity is "axi_10g_ethernet_0,bd_efdb_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_10g_ethernet_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_10g_ethernet_0 : entity is "bd_efdb_0,Vivado 2019.1";
end axi_10g_ethernet_0;

architecture STRUCTURE of axi_10g_ethernet_0 is
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of inst : label is "axi_10g_ethernet_0.hwdef";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of areset : signal is "xilinx.com:signal:reset:1.0 RST.areset RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of areset : signal is "XIL_INTERFACENAME RST.areset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of areset_coreclk : signal is "xilinx.com:signal:reset:1.0 RST.areset_coreclk RST";
  attribute X_INTERFACE_PARAMETER of areset_coreclk : signal is "XIL_INTERFACENAME RST.areset_coreclk, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of coreclk : signal is "xilinx.com:signal:clock:1.0 CLK.coreclk CLK";
  attribute X_INTERFACE_PARAMETER of coreclk : signal is "XIL_INTERFACENAME CLK.coreclk, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, ASSOCIATED_BUSIF m_axis_rx:s_axis_pause:s_axis_tx, INSERT_VIP 0, ASSOCIATED_ASYNC_RESET rx_axis_aresetn:tx_axis_aresetn";
  attribute X_INTERFACE_INFO of dclk : signal is "xilinx.com:signal:clock:1.0 CLK.dclk CLK";
  attribute X_INTERFACE_PARAMETER of dclk : signal is "XIL_INTERFACENAME CLK.dclk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_dclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of gtrxreset : signal is "xilinx.com:signal:reset:1.0 RST.gtrxreset RST";
  attribute X_INTERFACE_PARAMETER of gtrxreset : signal is "XIL_INTERFACENAME RST.gtrxreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of gttxreset : signal is "xilinx.com:signal:reset:1.0 RST.gttxreset RST";
  attribute X_INTERFACE_PARAMETER of gttxreset : signal is "XIL_INTERFACENAME RST.gttxreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_rx_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TLAST";
  attribute X_INTERFACE_INFO of m_axis_rx_tuser : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TUSER";
  attribute X_INTERFACE_INFO of m_axis_rx_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TVALID";
  attribute X_INTERFACE_PARAMETER of m_axis_rx_tvalid : signal is "XIL_INTERFACENAME m_axis_rx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of qplloutclk : signal is "xilinx.com:signal:clock:1.0 CLK.qplloutclk CLK";
  attribute X_INTERFACE_PARAMETER of qplloutclk : signal is "XIL_INTERFACENAME CLK.qplloutclk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_qplloutclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of qplloutrefclk : signal is "xilinx.com:signal:clock:1.0 CLK.qplloutrefclk CLK";
  attribute X_INTERFACE_PARAMETER of qplloutrefclk : signal is "XIL_INTERFACENAME CLK.qplloutrefclk, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_qplloutrefclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rx_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.rx_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of rx_axis_aresetn : signal is "XIL_INTERFACENAME RST.rx_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rx_statistics_valid : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics valid";
  attribute X_INTERFACE_INFO of rxrecclk_out : signal is "xilinx.com:signal:clock:1.0 CLK.rxrecclk_out CLK";
  attribute X_INTERFACE_PARAMETER of rxrecclk_out : signal is "XIL_INTERFACENAME CLK.rxrecclk_out, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_xpcs_0_rxrecclk_out, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_pause_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_pause TVALID";
  attribute X_INTERFACE_PARAMETER of s_axis_pause_tvalid : signal is "XIL_INTERFACENAME s_axis_pause, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tx_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TLAST";
  attribute X_INTERFACE_INFO of s_axis_tx_tready : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TREADY";
  attribute X_INTERFACE_INFO of s_axis_tx_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TVALID";
  attribute X_INTERFACE_PARAMETER of s_axis_tx_tvalid : signal is "XIL_INTERFACENAME s_axis_tx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of tx_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.tx_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of tx_axis_aresetn : signal is "XIL_INTERFACENAME RST.tx_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of tx_statistics_valid : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics valid";
  attribute X_INTERFACE_INFO of txoutclk : signal is "xilinx.com:signal:clock:1.0 CLK.txoutclk CLK";
  attribute X_INTERFACE_PARAMETER of txoutclk : signal is "XIL_INTERFACENAME CLK.txoutclk, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_xpcs_0_txoutclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of txusrclk : signal is "xilinx.com:signal:clock:1.0 CLK.txusrclk CLK";
  attribute X_INTERFACE_PARAMETER of txusrclk : signal is "XIL_INTERFACENAME CLK.txusrclk, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_txusrclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of txusrclk2 : signal is "xilinx.com:signal:clock:1.0 CLK.txusrclk2 CLK";
  attribute X_INTERFACE_PARAMETER of txusrclk2 : signal is "XIL_INTERFACENAME CLK.txusrclk2, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_txusrclk2, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_rx_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TDATA";
  attribute X_INTERFACE_INFO of m_axis_rx_tkeep : signal is "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP";
  attribute X_INTERFACE_INFO of rx_statistics_vector : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics vector";
  attribute X_INTERFACE_INFO of s_axis_pause_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_pause TDATA";
  attribute X_INTERFACE_INFO of s_axis_tx_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TDATA";
  attribute X_INTERFACE_INFO of s_axis_tx_tkeep : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP";
  attribute X_INTERFACE_INFO of s_axis_tx_tuser : signal is "xilinx.com:interface:axis:1.0 s_axis_tx TUSER";
  attribute X_INTERFACE_INFO of tx_statistics_vector : signal is "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics vector";
begin
inst: entity work.axi_10g_ethernet_0_bd_efdb_0
     port map (
      areset => areset,
      areset_coreclk => areset_coreclk,
      coreclk => coreclk,
      dclk => dclk,
      gtrxreset => gtrxreset,
      gttxreset => gttxreset,
      m_axis_rx_tdata(63 downto 0) => m_axis_rx_tdata(63 downto 0),
      m_axis_rx_tkeep(7 downto 0) => m_axis_rx_tkeep(7 downto 0),
      m_axis_rx_tlast => m_axis_rx_tlast,
      m_axis_rx_tuser => m_axis_rx_tuser,
      m_axis_rx_tvalid => m_axis_rx_tvalid,
      mac_rx_configuration_vector(79 downto 0) => mac_rx_configuration_vector(79 downto 0),
      mac_status_vector(2 downto 0) => mac_status_vector(2 downto 0),
      mac_tx_configuration_vector(79 downto 0) => mac_tx_configuration_vector(79 downto 0),
      pcs_pma_configuration_vector(535 downto 0) => pcs_pma_configuration_vector(535 downto 0),
      pcs_pma_status_vector(447 downto 0) => pcs_pma_status_vector(447 downto 0),
      pcspma_status(7 downto 0) => pcspma_status(7 downto 0),
      qplllock => qplllock,
      qplloutclk => qplloutclk,
      qplloutrefclk => qplloutrefclk,
      reset_counter_done => reset_counter_done,
      rx_axis_aresetn => rx_axis_aresetn,
      rx_resetdone => rx_resetdone,
      rx_statistics_valid => rx_statistics_valid,
      rx_statistics_vector(29 downto 0) => rx_statistics_vector(29 downto 0),
      rxn => rxn,
      rxp => rxp,
      rxrecclk_out => rxrecclk_out,
      s_axis_pause_tdata(15 downto 0) => s_axis_pause_tdata(15 downto 0),
      s_axis_pause_tvalid => s_axis_pause_tvalid,
      s_axis_tx_tdata(63 downto 0) => s_axis_tx_tdata(63 downto 0),
      s_axis_tx_tkeep(7 downto 0) => s_axis_tx_tkeep(7 downto 0),
      s_axis_tx_tlast => s_axis_tx_tlast,
      s_axis_tx_tready => s_axis_tx_tready,
      s_axis_tx_tuser(0) => s_axis_tx_tuser(0),
      s_axis_tx_tvalid => s_axis_tx_tvalid,
      signal_detect => signal_detect,
      sim_speedup_control => sim_speedup_control,
      tx_axis_aresetn => tx_axis_aresetn,
      tx_disable => tx_disable,
      tx_fault => tx_fault,
      tx_ifg_delay(7 downto 0) => tx_ifg_delay(7 downto 0),
      tx_resetdone => tx_resetdone,
      tx_statistics_valid => tx_statistics_valid,
      tx_statistics_vector(25 downto 0) => tx_statistics_vector(25 downto 0),
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      txuserrdy => txuserrdy,
      txusrclk => txusrclk,
      txusrclk2 => txusrclk2
    );
end STRUCTURE;
