#
#create_clock -name bscan_refclk -period 20 [get_pins "*/bscan/tckbuf/O"]
create_clock -name bscan_refclk -period 20 [get_pins -hier  -filter {NAME=~ "*/bscan/tckbuf/O"}]
