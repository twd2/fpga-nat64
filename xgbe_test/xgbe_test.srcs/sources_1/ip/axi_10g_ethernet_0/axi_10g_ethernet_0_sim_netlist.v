// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  8 23:54:20 2019
// Host        : twd2-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               G:/Program/cpld_fpga/fpga-nat64/xgbe_test/xgbe_test.srcs/sources_1/ip/axi_10g_ethernet_0/axi_10g_ethernet_0_sim_netlist.v
// Design      : axi_10g_ethernet_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k420tiffg901-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axi_10g_ethernet_0,bd_efdb_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "bd_efdb_0,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module axi_10g_ethernet_0
   (tx_axis_aresetn,
    rx_axis_aresetn,
    tx_ifg_delay,
    dclk,
    txp,
    txn,
    rxp,
    rxn,
    signal_detect,
    tx_fault,
    tx_disable,
    pcspma_status,
    sim_speedup_control,
    rxrecclk_out,
    mac_tx_configuration_vector,
    mac_rx_configuration_vector,
    mac_status_vector,
    pcs_pma_configuration_vector,
    pcs_pma_status_vector,
    areset_coreclk,
    txusrclk,
    txusrclk2,
    txoutclk,
    txuserrdy,
    tx_resetdone,
    rx_resetdone,
    coreclk,
    areset,
    gttxreset,
    gtrxreset,
    qplllock,
    qplloutclk,
    qplloutrefclk,
    reset_counter_done,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tready,
    s_axis_tx_tuser,
    s_axis_tx_tvalid,
    s_axis_pause_tdata,
    s_axis_pause_tvalid,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_tuser,
    m_axis_rx_tvalid,
    tx_statistics_valid,
    tx_statistics_vector,
    rx_statistics_valid,
    rx_statistics_vector);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.tx_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.tx_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input tx_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.rx_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.rx_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rx_axis_aresetn;
  input [7:0]tx_ifg_delay;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.dclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.dclk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_dclk, INSERT_VIP 0" *) input dclk;
  output txp;
  output txn;
  input rxp;
  input rxn;
  input signal_detect;
  input tx_fault;
  output tx_disable;
  output [7:0]pcspma_status;
  input sim_speedup_control;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.rxrecclk_out CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.rxrecclk_out, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_xpcs_0_rxrecclk_out, INSERT_VIP 0" *) output rxrecclk_out;
  input [79:0]mac_tx_configuration_vector;
  input [79:0]mac_rx_configuration_vector;
  output [2:0]mac_status_vector;
  input [535:0]pcs_pma_configuration_vector;
  output [447:0]pcs_pma_status_vector;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.areset_coreclk RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.areset_coreclk, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input areset_coreclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.txusrclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.txusrclk, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_txusrclk, INSERT_VIP 0" *) input txusrclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.txusrclk2 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.txusrclk2, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_txusrclk2, INSERT_VIP 0" *) input txusrclk2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.txoutclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.txoutclk, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN bd_efdb_0_xpcs_0_txoutclk, INSERT_VIP 0" *) output txoutclk;
  input txuserrdy;
  output tx_resetdone;
  output rx_resetdone;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.coreclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.coreclk, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, ASSOCIATED_BUSIF m_axis_rx:s_axis_pause:s_axis_tx, INSERT_VIP 0, ASSOCIATED_ASYNC_RESET rx_axis_aresetn:tx_axis_aresetn" *) input coreclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.areset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.areset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input areset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.gttxreset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.gttxreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input gttxreset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.gtrxreset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.gtrxreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input gtrxreset;
  input qplllock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.qplloutclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.qplloutclk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_qplloutclk, INSERT_VIP 0" *) input qplloutclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.qplloutrefclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.qplloutrefclk, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_qplloutrefclk, INSERT_VIP 0" *) input qplloutrefclk;
  input reset_counter_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TDATA" *) input [63:0]s_axis_tx_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP" *) input [7:0]s_axis_tx_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TLAST" *) input s_axis_tx_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TREADY" *) output s_axis_tx_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TUSER" *) input [0:0]s_axis_tx_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_tx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tx_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_pause TDATA" *) input [15:0]s_axis_pause_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_pause TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_pause, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_pause_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TDATA" *) output [63:0]m_axis_rx_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP" *) output [7:0]m_axis_rx_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TLAST" *) output m_axis_rx_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TUSER" *) output m_axis_rx_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN bd_efdb_0_coreclk, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_rx_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics valid" *) output tx_statistics_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics vector" *) output [25:0]tx_statistics_vector;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics valid" *) output rx_statistics_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics vector" *) output [29:0]rx_statistics_vector;

  wire areset;
  wire areset_coreclk;
  wire coreclk;
  wire dclk;
  wire gtrxreset;
  wire gttxreset;
  wire [63:0]m_axis_rx_tdata;
  wire [7:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tuser;
  wire m_axis_rx_tvalid;
  wire [79:0]mac_rx_configuration_vector;
  wire [2:0]mac_status_vector;
  wire [79:0]mac_tx_configuration_vector;
  wire [535:0]pcs_pma_configuration_vector;
  wire [447:0]pcs_pma_status_vector;
  wire [7:0]pcspma_status;
  wire qplllock;
  wire qplloutclk;
  wire qplloutrefclk;
  wire reset_counter_done;
  wire rx_axis_aresetn;
  wire rx_resetdone;
  wire rx_statistics_valid;
  wire [29:0]rx_statistics_vector;
  wire rxn;
  wire rxp;
  wire rxrecclk_out;
  wire [15:0]s_axis_pause_tdata;
  wire s_axis_pause_tvalid;
  wire [63:0]s_axis_tx_tdata;
  wire [7:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tready;
  wire [0:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire signal_detect;
  wire sim_speedup_control;
  wire tx_axis_aresetn;
  wire tx_disable;
  wire tx_fault;
  wire [7:0]tx_ifg_delay;
  wire tx_resetdone;
  wire tx_statistics_valid;
  wire [25:0]tx_statistics_vector;
  wire txn;
  wire txoutclk;
  wire txp;
  wire txuserrdy;
  wire txusrclk;
  wire txusrclk2;

  (* HW_HANDOFF = "axi_10g_ethernet_0.hwdef" *) 
  axi_10g_ethernet_0_bd_efdb_0 inst
       (.areset(areset),
        .areset_coreclk(areset_coreclk),
        .coreclk(coreclk),
        .dclk(dclk),
        .gtrxreset(gtrxreset),
        .gttxreset(gttxreset),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tuser(m_axis_rx_tuser),
        .m_axis_rx_tvalid(m_axis_rx_tvalid),
        .mac_rx_configuration_vector(mac_rx_configuration_vector),
        .mac_status_vector(mac_status_vector),
        .mac_tx_configuration_vector(mac_tx_configuration_vector),
        .pcs_pma_configuration_vector(pcs_pma_configuration_vector),
        .pcs_pma_status_vector(pcs_pma_status_vector),
        .pcspma_status(pcspma_status),
        .qplllock(qplllock),
        .qplloutclk(qplloutclk),
        .qplloutrefclk(qplloutrefclk),
        .reset_counter_done(reset_counter_done),
        .rx_axis_aresetn(rx_axis_aresetn),
        .rx_resetdone(rx_resetdone),
        .rx_statistics_valid(rx_statistics_valid),
        .rx_statistics_vector(rx_statistics_vector),
        .rxn(rxn),
        .rxp(rxp),
        .rxrecclk_out(rxrecclk_out),
        .s_axis_pause_tdata(s_axis_pause_tdata),
        .s_axis_pause_tvalid(s_axis_pause_tvalid),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tready(s_axis_tx_tready),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .signal_detect(signal_detect),
        .sim_speedup_control(sim_speedup_control),
        .tx_axis_aresetn(tx_axis_aresetn),
        .tx_disable(tx_disable),
        .tx_fault(tx_fault),
        .tx_ifg_delay(tx_ifg_delay),
        .tx_resetdone(tx_resetdone),
        .tx_statistics_valid(tx_statistics_valid),
        .tx_statistics_vector(tx_statistics_vector),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .txuserrdy(txuserrdy),
        .txusrclk(txusrclk),
        .txusrclk2(txusrclk2));
endmodule

(* HW_HANDOFF = "axi_10g_ethernet_0.hwdef" *) (* ORIG_REF_NAME = "bd_efdb_0" *) 
module axi_10g_ethernet_0_bd_efdb_0
   (areset,
    areset_coreclk,
    coreclk,
    dclk,
    gtrxreset,
    gttxreset,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_tuser,
    m_axis_rx_tvalid,
    mac_rx_configuration_vector,
    mac_status_vector,
    mac_tx_configuration_vector,
    pcs_pma_configuration_vector,
    pcs_pma_status_vector,
    pcspma_status,
    qplllock,
    qplloutclk,
    qplloutrefclk,
    reset_counter_done,
    rx_axis_aresetn,
    rx_resetdone,
    rx_statistics_valid,
    rx_statistics_vector,
    rxn,
    rxp,
    rxrecclk_out,
    s_axis_pause_tdata,
    s_axis_pause_tvalid,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tready,
    s_axis_tx_tuser,
    s_axis_tx_tvalid,
    signal_detect,
    sim_speedup_control,
    tx_axis_aresetn,
    tx_disable,
    tx_fault,
    tx_ifg_delay,
    tx_resetdone,
    tx_statistics_valid,
    tx_statistics_vector,
    txn,
    txoutclk,
    txp,
    txuserrdy,
    txusrclk,
    txusrclk2);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input areset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESET_CORECLK RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESET_CORECLK, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input areset_coreclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CORECLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CORECLK, ASSOCIATED_ASYNC_RESET rx_axis_aresetn:tx_axis_aresetn, ASSOCIATED_BUSIF m_axis_rx:s_axis_pause:s_axis_tx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0.000" *) input coreclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DCLK, CLK_DOMAIN bd_efdb_0_dclk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input dclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.GTRXRESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.GTRXRESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input gtrxreset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.GTTXRESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.GTTXRESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input gttxreset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) output [63:0]m_axis_rx_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP" *) output [7:0]m_axis_rx_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TLAST" *) output m_axis_rx_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TUSER" *) output m_axis_rx_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rx TVALID" *) output m_axis_rx_tvalid;
  input [79:0]mac_rx_configuration_vector;
  output [2:0]mac_status_vector;
  input [79:0]mac_tx_configuration_vector;
  input [535:0]pcs_pma_configuration_vector;
  output [447:0]pcs_pma_status_vector;
  output [7:0]pcspma_status;
  input qplllock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QPLLOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QPLLOUTCLK, CLK_DOMAIN bd_efdb_0_qplloutclk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input qplloutclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QPLLOUTREFCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QPLLOUTREFCLK, CLK_DOMAIN bd_efdb_0_qplloutrefclk, FREQ_HZ 156250000, INSERT_VIP 0, PHASE 0.000" *) input qplloutrefclk;
  input reset_counter_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RX_AXIS_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RX_AXIS_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rx_axis_aresetn;
  output rx_resetdone;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics valid" *) output rx_statistics_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 rx_statistics vector" *) output [29:0]rx_statistics_vector;
  input rxn;
  input rxp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RXRECCLK_OUT CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RXRECCLK_OUT, CLK_DOMAIN bd_efdb_0_xpcs_0_rxrecclk_out, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000" *) output rxrecclk_out;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_pause TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_pause, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [15:0]s_axis_pause_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_pause TVALID" *) input s_axis_pause_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_tx, CLK_DOMAIN bd_efdb_0_coreclk, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) input [63:0]s_axis_tx_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP" *) input [7:0]s_axis_tx_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TLAST" *) input s_axis_tx_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TREADY" *) output s_axis_tx_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TUSER" *) input [0:0]s_axis_tx_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_tx TVALID" *) input s_axis_tx_tvalid;
  input signal_detect;
  input sim_speedup_control;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.TX_AXIS_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.TX_AXIS_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input tx_axis_aresetn;
  output tx_disable;
  input tx_fault;
  input [7:0]tx_ifg_delay;
  output tx_resetdone;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics valid" *) output tx_statistics_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_ten_gig_eth_mac:statistics:2.0 tx_statistics vector" *) output [25:0]tx_statistics_vector;
  output txn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TXOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TXOUTCLK, CLK_DOMAIN bd_efdb_0_xpcs_0_txoutclk, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000" *) output txoutclk;
  output txp;
  input txuserrdy;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TXUSRCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TXUSRCLK, CLK_DOMAIN bd_efdb_0_txusrclk, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000" *) input txusrclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TXUSRCLK2 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TXUSRCLK2, CLK_DOMAIN bd_efdb_0_txusrclk2, FREQ_HZ 322265625, INSERT_VIP 0, PHASE 0.000" *) input txusrclk2;

  wire areset;
  wire areset_coreclk;
  wire coreclk;
  wire dclk;
  wire dcm_locked_driver_dout;
  wire gtrxreset;
  wire gttxreset;
  wire [63:0]m_axis_rx_tdata;
  wire [7:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tuser;
  wire m_axis_rx_tvalid;
  wire [79:0]mac_rx_configuration_vector;
  wire [2:0]mac_status_vector;
  wire [79:0]mac_tx_configuration_vector;
  wire [535:0]pcs_pma_configuration_vector;
  wire [447:0]pcs_pma_status_vector;
  wire [7:0]pcspma_status;
  wire [2:0]pma_pmd_type_driver_dout;
  wire qplllock;
  wire qplloutclk;
  wire qplloutrefclk;
  wire reset_counter_done;
  wire rx_axis_aresetn;
  wire rx_resetdone;
  wire rx_statistics_valid;
  wire [29:0]rx_statistics_vector;
  wire rxn;
  wire rxp;
  wire rxrecclk_out;
  wire [15:0]s_axis_pause_tdata;
  wire s_axis_pause_tvalid;
  wire [63:0]s_axis_tx_tdata;
  wire [7:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tready;
  wire [0:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire signal_detect;
  wire sim_speedup_control;
  wire tx_axis_aresetn;
  wire tx_disable;
  wire tx_fault;
  wire [7:0]tx_ifg_delay;
  wire tx_resetdone;
  wire tx_statistics_valid;
  wire [25:0]tx_statistics_vector;
  wire txn;
  wire txoutclk;
  wire txp;
  wire txuserrdy;
  wire txusrclk;
  wire txusrclk2;
  wire [7:0]xmac_xgmii_xgmac_RXC;
  wire [63:0]xmac_xgmii_xgmac_RXD;
  wire [7:0]xmac_xgmii_xgmac_TXC;
  wire [63:0]xmac_xgmii_xgmac_TXD;
  wire [15:0]xpcs_core_gt_drp_interface_DADDR;
  wire xpcs_core_gt_drp_interface_DEN;
  wire [15:0]xpcs_core_gt_drp_interface_DI;
  wire [15:0]xpcs_core_gt_drp_interface_DO;
  wire xpcs_core_gt_drp_interface_DRDY;
  wire xpcs_core_gt_drp_interface_DWE;
  wire xpcs_drp_req;

  (* CHECK_LICENSE_TYPE = "bd_efdb_0_dcm_locked_driver_0,xlconstant_v1_1_6_xlconstant,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "xlconstant_v1_1_6_xlconstant,Vivado 2019.1" *) 
  axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0 dcm_locked_driver
       (.dout(dcm_locked_driver_dout));
  (* CHECK_LICENSE_TYPE = "bd_efdb_0_pma_pmd_type_driver_0,xlconstant_v1_1_6_xlconstant,{}" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* X_CORE_INFO = "xlconstant_v1_1_6_xlconstant,Vivado 2019.1" *) 
  axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0 pma_pmd_type_driver
       (.dout(pma_pmd_type_driver_dout));
  (* X_CORE_INFO = "ten_gig_eth_mac_v15_1_7,Vivado 2019.1" *) 
  axi_10g_ethernet_0_bd_efdb_0_xmac_0 xmac
       (.pause_req(s_axis_pause_tvalid),
        .pause_val(s_axis_pause_tdata),
        .reset(areset),
        .rx_axis_aresetn(rx_axis_aresetn),
        .rx_axis_tdata(m_axis_rx_tdata),
        .rx_axis_tkeep(m_axis_rx_tkeep),
        .rx_axis_tlast(m_axis_rx_tlast),
        .rx_axis_tuser(m_axis_rx_tuser),
        .rx_axis_tvalid(m_axis_rx_tvalid),
        .rx_clk0(coreclk),
        .rx_configuration_vector(mac_rx_configuration_vector),
        .rx_dcm_locked(dcm_locked_driver_dout),
        .rx_statistics_valid(rx_statistics_valid),
        .rx_statistics_vector(rx_statistics_vector),
        .status_vector(mac_status_vector),
        .tx_axis_aresetn(tx_axis_aresetn),
        .tx_axis_tdata(s_axis_tx_tdata),
        .tx_axis_tkeep(s_axis_tx_tkeep),
        .tx_axis_tlast(s_axis_tx_tlast),
        .tx_axis_tready(s_axis_tx_tready),
        .tx_axis_tuser(s_axis_tx_tuser),
        .tx_axis_tvalid(s_axis_tx_tvalid),
        .tx_clk0(coreclk),
        .tx_configuration_vector(mac_tx_configuration_vector),
        .tx_dcm_locked(dcm_locked_driver_dout),
        .tx_ifg_delay(tx_ifg_delay),
        .tx_statistics_valid(tx_statistics_valid),
        .tx_statistics_vector(tx_statistics_vector),
        .xgmii_rxc(xmac_xgmii_xgmac_RXC),
        .xgmii_rxd(xmac_xgmii_xgmac_RXD),
        .xgmii_txc(xmac_xgmii_xgmac_TXC),
        .xgmii_txd(xmac_xgmii_xgmac_TXD));
  (* X_CORE_INFO = "ten_gig_eth_pcs_pma_v6_0_15,Vivado 2019.1" *) 
  axi_10g_ethernet_0_bd_efdb_0_xpcs_0 xpcs
       (.areset(areset),
        .areset_coreclk(areset_coreclk),
        .configuration_vector(pcs_pma_configuration_vector),
        .core_status(pcspma_status),
        .coreclk(coreclk),
        .dclk(dclk),
        .drp_daddr_i(xpcs_core_gt_drp_interface_DADDR),
        .drp_daddr_o(xpcs_core_gt_drp_interface_DADDR),
        .drp_den_i(xpcs_core_gt_drp_interface_DEN),
        .drp_den_o(xpcs_core_gt_drp_interface_DEN),
        .drp_di_i(xpcs_core_gt_drp_interface_DI),
        .drp_di_o(xpcs_core_gt_drp_interface_DI),
        .drp_drdy_i(xpcs_core_gt_drp_interface_DRDY),
        .drp_drdy_o(xpcs_core_gt_drp_interface_DRDY),
        .drp_drpdo_i(xpcs_core_gt_drp_interface_DO),
        .drp_drpdo_o(xpcs_core_gt_drp_interface_DO),
        .drp_dwe_i(xpcs_core_gt_drp_interface_DWE),
        .drp_dwe_o(xpcs_core_gt_drp_interface_DWE),
        .drp_gnt(xpcs_drp_req),
        .drp_req(xpcs_drp_req),
        .gtrxreset(gtrxreset),
        .gttxreset(gttxreset),
        .pma_pmd_type(pma_pmd_type_driver_dout),
        .qplllock(qplllock),
        .qplloutclk(qplloutclk),
        .qplloutrefclk(qplloutrefclk),
        .reset_counter_done(reset_counter_done),
        .rx_resetdone(rx_resetdone),
        .rxn(rxn),
        .rxp(rxp),
        .rxrecclk_out(rxrecclk_out),
        .signal_detect(signal_detect),
        .sim_speedup_control(sim_speedup_control),
        .status_vector(pcs_pma_status_vector),
        .tx_disable(tx_disable),
        .tx_fault(tx_fault),
        .tx_resetdone(tx_resetdone),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .txuserrdy(txuserrdy),
        .txusrclk(txusrclk),
        .txusrclk2(txusrclk2),
        .xgmii_rxc(xmac_xgmii_xgmac_RXC),
        .xgmii_rxd(xmac_xgmii_xgmac_RXD),
        .xgmii_txc(xmac_xgmii_xgmac_TXC),
        .xgmii_txd(xmac_xgmii_xgmac_TXD));
endmodule

(* CHECK_LICENSE_TYPE = "bd_efdb_0_dcm_locked_driver_0,xlconstant_v1_1_6_xlconstant,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "bd_efdb_0_dcm_locked_driver_0" *) 
(* X_CORE_INFO = "xlconstant_v1_1_6_xlconstant,Vivado 2019.1" *) 
module axi_10g_ethernet_0_bd_efdb_0_dcm_locked_driver_0
   (dout);
  output [0:0]dout;

  wire \<const1> ;

  assign dout[0] = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
endmodule

(* CHECK_LICENSE_TYPE = "bd_efdb_0_pma_pmd_type_driver_0,xlconstant_v1_1_6_xlconstant,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "bd_efdb_0_pma_pmd_type_driver_0" *) 
(* X_CORE_INFO = "xlconstant_v1_1_6_xlconstant,Vivado 2019.1" *) 
module axi_10g_ethernet_0_bd_efdb_0_pma_pmd_type_driver_0
   (dout);
  output [2:0]dout;

  wire \<const0> ;
  wire \<const1> ;

  assign dout[2] = \<const1> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "bd_efdb_0_xmac_0" *) (* X_CORE_INFO = "ten_gig_eth_mac_v15_1_7,Vivado 2019.1" *) 
module axi_10g_ethernet_0_bd_efdb_0_xmac_0
   (tx_clk0,
    reset,
    tx_axis_aresetn,
    tx_axis_tdata,
    tx_axis_tkeep,
    tx_axis_tvalid,
    tx_axis_tlast,
    tx_axis_tuser,
    tx_ifg_delay,
    tx_axis_tready,
    tx_statistics_vector,
    tx_statistics_valid,
    pause_val,
    pause_req,
    rx_axis_aresetn,
    rx_axis_tdata,
    rx_axis_tkeep,
    rx_axis_tvalid,
    rx_axis_tuser,
    rx_axis_tlast,
    rx_statistics_vector,
    rx_statistics_valid,
    tx_configuration_vector,
    rx_configuration_vector,
    status_vector,
    tx_dcm_locked,
    xgmii_txd,
    xgmii_txc,
    rx_clk0,
    rx_dcm_locked,
    xgmii_rxd,
    xgmii_rxc);
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

(* ORIG_REF_NAME = "bd_efdb_0_xpcs_0" *) (* X_CORE_INFO = "ten_gig_eth_pcs_pma_v6_0_15,Vivado 2019.1" *) 
module axi_10g_ethernet_0_bd_efdb_0_xpcs_0
   (dclk,
    rxrecclk_out,
    coreclk,
    txusrclk,
    txusrclk2,
    txoutclk,
    areset,
    areset_coreclk,
    gttxreset,
    gtrxreset,
    sim_speedup_control,
    txuserrdy,
    qplllock,
    qplloutclk,
    qplloutrefclk,
    reset_counter_done,
    xgmii_txd,
    xgmii_txc,
    xgmii_rxd,
    xgmii_rxc,
    txp,
    txn,
    rxp,
    rxn,
    configuration_vector,
    status_vector,
    core_status,
    tx_resetdone,
    rx_resetdone,
    signal_detect,
    tx_fault,
    drp_req,
    drp_gnt,
    drp_den_o,
    drp_dwe_o,
    drp_daddr_o,
    drp_di_o,
    drp_drdy_o,
    drp_drpdo_o,
    drp_den_i,
    drp_dwe_i,
    drp_daddr_i,
    drp_di_i,
    drp_drdy_i,
    drp_drpdo_i,
    pma_pmd_type,
    tx_disable);
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
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
