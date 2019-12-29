# This constraints file contains default clock frequencies to be used during 
# out-of-context flows such as OOC Synthesis and Hierarchical Designs. For 
# best results the frequencies should be modified to match the target 
# frequencies. This constraints file is not used in normal top-down 
# synthesis (the default flow of Vivado)

create_clock -name gtx_clk -period 6.4000 [get_ports tx_clk0]

create_clock -name xgmii_rx_clk -period 6.4000 [get_ports rx_clk0]

