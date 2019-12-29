# 100MHz
set_property PACKAGE_PIN AC27 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

# Key 2
set_property PACKAGE_PIN AK16 [get_ports nRST]
set_property IOSTANDARD LVCMOS33 [get_ports nRST]
set_false_path -from [get_ports nRST]

set_property PACKAGE_PIN AJ22 [get_ports {nLED[0]}]
set_property PACKAGE_PIN AJ21 [get_ports {nLED[1]}]
set_property PACKAGE_PIN AK21 [get_ports {nLED[2]}]
set_property PACKAGE_PIN AK20 [get_ports {nLED[3]}]
set_property PACKAGE_PIN AK19 [get_ports {nLED[4]}]
set_property PACKAGE_PIN AJ19 [get_ports {nLED[5]}]
set_property PACKAGE_PIN AK18 [get_ports {nLED[6]}]
set_property PACKAGE_PIN AJ18 [get_ports {nLED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {nLED[*]}]

# GTX clock 156.25MHz
set_property PACKAGE_PIN E8 [get_ports gtrefclk0_p]
set_property PACKAGE_PIN E7 [get_ports gtrefclk0_n]

# SFP+ A
set_property PACKAGE_PIN B24 [get_ports {sfp_tx_disable[0]}]
set_property PACKAGE_PIN A23 [get_ports {sfp_rate[0]}]
set_property PACKAGE_PIN C11 [get_ports {sfp_rx_n[0]}]
set_property PACKAGE_PIN C12 [get_ports {sfp_rx_p[0]}]
set_property PACKAGE_PIN A11 [get_ports {sfp_tx_n[0]}]
set_property PACKAGE_PIN A12 [get_ports {sfp_tx_p[0]}]

# SFP+ B
set_property PACKAGE_PIN A22 [get_ports {sfp_tx_disable[1]}]
set_property PACKAGE_PIN A20 [get_ports {sfp_rate[1]}]
set_property PACKAGE_PIN D9 [get_ports {sfp_rx_n[1]}]
set_property PACKAGE_PIN D10 [get_ports {sfp_rx_p[1]}]
set_property PACKAGE_PIN A7 [get_ports {sfp_tx_n[1]}]
set_property PACKAGE_PIN A8 [get_ports {sfp_tx_p[1]}]

# SFP+ C
set_property PACKAGE_PIN A25 [get_ports {sfp_tx_disable[2]}]
set_property PACKAGE_PIN A27 [get_ports {sfp_rate[2]}]
set_property PACKAGE_PIN D5 [get_ports {sfp_rx_n[2]}]
set_property PACKAGE_PIN D6 [get_ports {sfp_rx_p[2]}]
set_property PACKAGE_PIN A3 [get_ports {sfp_tx_n[2]}]
set_property PACKAGE_PIN A4 [get_ports {sfp_tx_p[2]}]

# SFP+ D
set_property PACKAGE_PIN B27 [get_ports {sfp_tx_disable[3]}]
set_property PACKAGE_PIN E28 [get_ports {sfp_rate[3]}]
set_property PACKAGE_PIN E3 [get_ports {sfp_rx_n[3]}]
set_property PACKAGE_PIN E4 [get_ports {sfp_rx_p[3]}]
set_property PACKAGE_PIN B1 [get_ports {sfp_tx_n[3]}]
set_property PACKAGE_PIN B2 [get_ports {sfp_tx_p[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sfp_tx_disable[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sfp_rate[*]}]

set_property PACKAGE_PIN A30 [get_ports UART_RX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_RX]
set_property PULLUP TRUE [get_ports UART_RX]
set_property PACKAGE_PIN B29 [get_ports UART_TX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TX]

create_clock -period 6.400 -name coreclk -waveform {0.000 3.200} [get_nets eth_coreclk]
create_clock -period 6.400 -name CLK -waveform {0.000 3.200} [get_nets CLK]
create_clock -period 6.400 -name clk -waveform {0.000 3.200} [get_nets clk]

set_clock_groups -name async_clock -asynchronous -group [get_clocks coreclk] -group [get_clocks gen_eth[0].axi_10g_ethernet_0_inst/inst/xpcs/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK] -group [get_clocks gen_eth[2].axi_10g_ethernet_0_inst/inst/xpcs/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CCLK_TRISTATE TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
