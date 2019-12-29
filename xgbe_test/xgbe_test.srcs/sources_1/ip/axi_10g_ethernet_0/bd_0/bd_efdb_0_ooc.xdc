################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name dclk -period 10 [get_ports dclk]
create_clock -name txusrclk -period 3.103 [get_ports txusrclk]
create_clock -name txusrclk2 -period 3.103 [get_ports txusrclk2]
create_clock -name coreclk -period 6.400 [get_ports coreclk]
create_clock -name qplloutclk -period 10 [get_ports qplloutclk]
create_clock -name qplloutrefclk -period 6.400 [get_ports qplloutrefclk]

################################################################################