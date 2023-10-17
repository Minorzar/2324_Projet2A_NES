all:

	ghdl -a counting_N.vhd
	ghdl -a comparater.vhd
	ghdl -a counting_tb.vhd
	ghdl -e counting_tb
	ghdl -r counting_tb --wave=counting_tb.ghw