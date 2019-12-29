# This constraints file contains default clock frequencies to be used during creation of a
# Synthesis Design Checkpoint (DCP).
# This constraints file is not used in top-down/global synthesis (not the default flow of Vivado).

create_clock -period 10.000 [get_ports {dclk}]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports dclk]
create_clock -period 6.400 [get_ports {coreclk}]
set_property HD.CLK_SRC BUFGCTRL_X0Y1 [get_ports coreclk]

