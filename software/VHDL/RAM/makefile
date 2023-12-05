all:

	ghdl -a RAM_RW.vhd
	ghdl -a RAM_RWtb.vhd
	ghdl -e RAM_RWtb
	ghdl -r RAM_RWtb --wave=RAM_RWtb.ghw