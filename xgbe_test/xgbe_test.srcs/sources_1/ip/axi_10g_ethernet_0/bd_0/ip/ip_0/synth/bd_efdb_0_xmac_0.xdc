#######################################################
# Ten Gigabit Ethernet MAC core constraints           #
#######################################################

# ignore paths to reset syncs
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells {bd_efdb_0_xmac_0_core/reset_gen/sync_rx_rst/reset_async*_reg}]]
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells {bd_efdb_0_xmac_0_core/reset_gen/sync_tx_rst/reset_async*_reg}]]

# Flow control clock domain crossings

set_max_delay 6.4000 -datapath_only -from [get_cells bd_efdb_0_xmac_0_core/rx/rx_pause_control/pause_quanta_reg[*]] -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_cntl/pause_tx_quanta_reg[*]]



# Ignore paths to synchronisers
set_false_path -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_mux_final/rs_disable_s/data_sync0_reg]
set_false_path -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_mux_final/rs_local_fault_s/data_sync0_reg]
set_false_path -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_mux_final/rs_remote_fault_s/data_sync0_reg]
set_false_path -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_mux_final/rs_link_intr_fault_s/data_sync0_reg]
set_false_path -to [get_cells bd_efdb_0_xmac_0_core/tx/tx_cntl/rx_to_tx_pause_req/data_sync0_reg]


