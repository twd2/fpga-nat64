
################################################################
# This is a generated script based on design: bd_efdb_0
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_efdb_0_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k420tiffg901-2L
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_efdb_0

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design -bdsource SBD $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set m_axis_rx [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_rx ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $m_axis_rx

  set rx_statistics [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_ten_gig_eth_mac:statistics_rtl:2.0 rx_statistics ]

  set s_axis_pause [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_pause ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $s_axis_pause

  set s_axis_tx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_tx ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $s_axis_tx

  set tx_statistics [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_ten_gig_eth_mac:statistics_rtl:2.0 tx_statistics ]


  # Create ports
  set areset [ create_bd_port -dir I -type rst areset ]
  set areset_coreclk [ create_bd_port -dir I -type rst areset_coreclk ]
  set coreclk [ create_bd_port -dir I -type clk coreclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_ASYNC_RESET {rx_axis_aresetn:tx_axis_aresetn} \
   CONFIG.ASSOCIATED_BUSIF {m_axis_rx:s_axis_pause:s_axis_tx} \
   CONFIG.FREQ_HZ {156250000} \
 ] $coreclk
  set dclk [ create_bd_port -dir I -type clk dclk ]
  set gtrxreset [ create_bd_port -dir I -type rst gtrxreset ]
  set gttxreset [ create_bd_port -dir I -type rst gttxreset ]
  set mac_rx_configuration_vector [ create_bd_port -dir I -from 79 -to 0 mac_rx_configuration_vector ]
  set mac_status_vector [ create_bd_port -dir O -from 2 -to 0 mac_status_vector ]
  set mac_tx_configuration_vector [ create_bd_port -dir I -from 79 -to 0 mac_tx_configuration_vector ]
  set pcs_pma_configuration_vector [ create_bd_port -dir I -from 535 -to 0 pcs_pma_configuration_vector ]
  set pcs_pma_status_vector [ create_bd_port -dir O -from 447 -to 0 pcs_pma_status_vector ]
  set pcspma_status [ create_bd_port -dir O -from 7 -to 0 pcspma_status ]
  set qplllock [ create_bd_port -dir I qplllock ]
  set qplloutclk [ create_bd_port -dir I -type clk qplloutclk ]
  set qplloutrefclk [ create_bd_port -dir I -type clk qplloutrefclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $qplloutrefclk
  set reset_counter_done [ create_bd_port -dir I reset_counter_done ]
  set rx_axis_aresetn [ create_bd_port -dir I -type rst rx_axis_aresetn ]
  set rx_resetdone [ create_bd_port -dir O rx_resetdone ]
  set rxn [ create_bd_port -dir I rxn ]
  set rxp [ create_bd_port -dir I rxp ]
  set rxrecclk_out [ create_bd_port -dir O -type clk rxrecclk_out ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
 ] $rxrecclk_out
  set signal_detect [ create_bd_port -dir I signal_detect ]
  set sim_speedup_control [ create_bd_port -dir I sim_speedup_control ]
  set tx_axis_aresetn [ create_bd_port -dir I -type rst tx_axis_aresetn ]
  set tx_disable [ create_bd_port -dir O tx_disable ]
  set tx_fault [ create_bd_port -dir I tx_fault ]
  set tx_ifg_delay [ create_bd_port -dir I -from 7 -to 0 tx_ifg_delay ]
  set tx_resetdone [ create_bd_port -dir O tx_resetdone ]
  set txn [ create_bd_port -dir O txn ]
  set txoutclk [ create_bd_port -dir O -type clk txoutclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
 ] $txoutclk
  set txp [ create_bd_port -dir O txp ]
  set txuserrdy [ create_bd_port -dir I txuserrdy ]
  set txusrclk [ create_bd_port -dir I -type clk txusrclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
 ] $txusrclk
  set txusrclk2 [ create_bd_port -dir I -type clk txusrclk2 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {322265625} \
 ] $txusrclk2

  # Create instance: dcm_locked_driver, and set properties
  set dcm_locked_driver [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 dcm_locked_driver ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
   CONFIG.CONST_WIDTH {1} \
 ] $dcm_locked_driver

  # Create instance: pma_pmd_type_driver, and set properties
  set pma_pmd_type_driver [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 pma_pmd_type_driver ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {5} \
   CONFIG.CONST_WIDTH {3} \
 ] $pma_pmd_type_driver

  # Create instance: xmac, and set properties
  set xmac [ create_bd_cell -type ip -vlnv xilinx.com:ip:ten_gig_eth_mac:15.1 xmac ]
  set_property -dict [ list \
   CONFIG.Data_Rate {10Gbps} \
   CONFIG.Enable_Priority_Flow_Control {false} \
   CONFIG.IEEE_1588 {None} \
   CONFIG.Low_Latency_32_bit_MAC {64bit} \
   CONFIG.Management_Frequency {200.00} \
   CONFIG.Management_Interface {false} \
   CONFIG.Physical_Interface {Internal} \
   CONFIG.Statistics_Gathering {false} \
   CONFIG.Timer_Format {Time_of_day} \
   CONFIG.gt_type {GTHE3} \
 ] $xmac

  # Create instance: xpcs, and set properties
  set xpcs [ create_bd_cell -type ip -vlnv xilinx.com:ip:ten_gig_eth_pcs_pma:6.0 xpcs ]
  set_property -dict [ list \
   CONFIG.DClkRate {100.00} \
   CONFIG.IEEE_1588 {None} \
   CONFIG.Locations {X0Y0} \
   CONFIG.MDIO_Management {false} \
   CONFIG.RefClk {clk0} \
   CONFIG.RefClkRate {156.25} \
   CONFIG.SupportLevel {0} \
   CONFIG.Timer_Format {Time_of_day} \
   CONFIG.TransceiverControl {false} \
   CONFIG.TransceiverInExample {false} \
   CONFIG.autonegotiation {false} \
   CONFIG.base_kr {BASE-R} \
   CONFIG.baser32 {64bit} \
   CONFIG.fec {false} \
   CONFIG.no_ebuff {false} \
   CONFIG.speed10_25 {10Gig} \
   CONFIG.vu_gt_type {GTH} \
 ] $xpcs

  # Create interface connections
  connect_bd_intf_net -intf_net s_axis_pause_1 [get_bd_intf_ports s_axis_pause] [get_bd_intf_pins xmac/s_axis_pause]
  connect_bd_intf_net -intf_net s_axis_tx_1 [get_bd_intf_ports s_axis_tx] [get_bd_intf_pins xmac/s_axis_tx]
  connect_bd_intf_net -intf_net xmac_m_axis_rx [get_bd_intf_ports m_axis_rx] [get_bd_intf_pins xmac/m_axis_rx]
  connect_bd_intf_net -intf_net xmac_rx_statistics [get_bd_intf_ports rx_statistics] [get_bd_intf_pins xmac/rx_statistics]
  connect_bd_intf_net -intf_net xmac_tx_statistics [get_bd_intf_ports tx_statistics] [get_bd_intf_pins xmac/tx_statistics]
  connect_bd_intf_net -intf_net xmac_xgmii_xgmac [get_bd_intf_pins xmac/xgmii_xgmac] [get_bd_intf_pins xpcs/xgmii_interface]
  connect_bd_intf_net -intf_net xpcs_core_gt_drp_interface [get_bd_intf_pins xpcs/core_gt_drp_interface] [get_bd_intf_pins xpcs/user_gt_drp_interface]

  # Create port connections
  connect_bd_net -net areset_1 [get_bd_ports areset] [get_bd_pins xmac/reset] [get_bd_pins xpcs/areset]
  connect_bd_net -net areset_coreclk_1 [get_bd_ports areset_coreclk] [get_bd_pins xpcs/areset_coreclk]
  connect_bd_net -net coreclk_1 [get_bd_ports coreclk] [get_bd_pins xmac/rx_clk0] [get_bd_pins xmac/tx_clk0] [get_bd_pins xpcs/coreclk]
  connect_bd_net -net dclk_1 [get_bd_ports dclk] [get_bd_pins xpcs/dclk]
  connect_bd_net -net dcm_locked_driver_dout [get_bd_pins dcm_locked_driver/dout] [get_bd_pins xmac/rx_dcm_locked] [get_bd_pins xmac/tx_dcm_locked]
  connect_bd_net -net gtrxreset_1 [get_bd_ports gtrxreset] [get_bd_pins xpcs/gtrxreset]
  connect_bd_net -net gttxreset_1 [get_bd_ports gttxreset] [get_bd_pins xpcs/gttxreset]
  connect_bd_net -net mac_rx_configuration_vector_1 [get_bd_ports mac_rx_configuration_vector] [get_bd_pins xmac/rx_configuration_vector]
  connect_bd_net -net mac_tx_configuration_vector_1 [get_bd_ports mac_tx_configuration_vector] [get_bd_pins xmac/tx_configuration_vector]
  connect_bd_net -net pcs_pma_configuration_vector_1 [get_bd_ports pcs_pma_configuration_vector] [get_bd_pins xpcs/configuration_vector]
  connect_bd_net -net pma_pmd_type_driver_dout [get_bd_pins pma_pmd_type_driver/dout] [get_bd_pins xpcs/pma_pmd_type]
  connect_bd_net -net qplllock_1 [get_bd_ports qplllock] [get_bd_pins xpcs/qplllock]
  connect_bd_net -net qplloutclk_1 [get_bd_ports qplloutclk] [get_bd_pins xpcs/qplloutclk]
  connect_bd_net -net qplloutrefclk_1 [get_bd_ports qplloutrefclk] [get_bd_pins xpcs/qplloutrefclk]
  connect_bd_net -net reset_counter_done_1 [get_bd_ports reset_counter_done] [get_bd_pins xpcs/reset_counter_done]
  connect_bd_net -net rx_axis_aresetn_1 [get_bd_ports rx_axis_aresetn] [get_bd_pins xmac/rx_axis_aresetn]
  connect_bd_net -net rxn_1 [get_bd_ports rxn] [get_bd_pins xpcs/rxn]
  connect_bd_net -net rxp_1 [get_bd_ports rxp] [get_bd_pins xpcs/rxp]
  connect_bd_net -net signal_detect_1 [get_bd_ports signal_detect] [get_bd_pins xpcs/signal_detect]
  connect_bd_net -net sim_speedup_control_1 [get_bd_ports sim_speedup_control] [get_bd_pins xpcs/sim_speedup_control]
  connect_bd_net -net tx_axis_aresetn_1 [get_bd_ports tx_axis_aresetn] [get_bd_pins xmac/tx_axis_aresetn]
  connect_bd_net -net tx_fault_1 [get_bd_ports tx_fault] [get_bd_pins xpcs/tx_fault]
  connect_bd_net -net tx_ifg_delay_1 [get_bd_ports tx_ifg_delay] [get_bd_pins xmac/tx_ifg_delay]
  connect_bd_net -net txuserrdy_1 [get_bd_ports txuserrdy] [get_bd_pins xpcs/txuserrdy]
  connect_bd_net -net txusrclk2_1 [get_bd_ports txusrclk2] [get_bd_pins xpcs/txusrclk2]
  connect_bd_net -net txusrclk_1 [get_bd_ports txusrclk] [get_bd_pins xpcs/txusrclk]
  connect_bd_net -net xmac_status_vector [get_bd_ports mac_status_vector] [get_bd_pins xmac/status_vector]
  connect_bd_net -net xpcs_core_status [get_bd_ports pcspma_status] [get_bd_pins xpcs/core_status]
  connect_bd_net -net xpcs_drp_req [get_bd_pins xpcs/drp_gnt] [get_bd_pins xpcs/drp_req]
  connect_bd_net -net xpcs_rx_resetdone [get_bd_ports rx_resetdone] [get_bd_pins xpcs/rx_resetdone]
  connect_bd_net -net xpcs_rxrecclk_out [get_bd_ports rxrecclk_out] [get_bd_pins xpcs/rxrecclk_out]
  connect_bd_net -net xpcs_status_vector [get_bd_ports pcs_pma_status_vector] [get_bd_pins xpcs/status_vector]
  connect_bd_net -net xpcs_tx_disable [get_bd_ports tx_disable] [get_bd_pins xpcs/tx_disable]
  connect_bd_net -net xpcs_tx_resetdone [get_bd_ports tx_resetdone] [get_bd_pins xpcs/tx_resetdone]
  connect_bd_net -net xpcs_txn [get_bd_ports txn] [get_bd_pins xpcs/txn]
  connect_bd_net -net xpcs_txoutclk [get_bd_ports txoutclk] [get_bd_pins xpcs/txoutclk]
  connect_bd_net -net xpcs_txp [get_bd_ports txp] [get_bd_pins xpcs/txp]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


