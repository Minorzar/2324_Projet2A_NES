transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/media/sf_2324_Projet2A_NES/software/6502_decode/NESFPGA/VHDL/Decode/predecode.vhd}

vcom -93 -work work {/media/sf_2324_Projet2A_NES/software/6502_decode/NESFPGA/simulation/tb_predecode.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  predecode_test

add wave *
view structure
view signals
run 10 us
