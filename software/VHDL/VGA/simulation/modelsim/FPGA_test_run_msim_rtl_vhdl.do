transcript on
if ![file isdirectory FPGA_test_iputf_libs] {
	file mkdir FPGA_test_iputf_libs
}

if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_standard_functions.vhd}
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/alt_dspbuilder_package.vhd}
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_europa_support_lib.vhd}
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/altera_lnsim
vmap altera_lnsim ./vhdl_libs/altera_lnsim
vlog -sv -work altera_lnsim {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv}
vcom -93 -work altera_lnsim {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim_components.vhd}

vlib vhdl_libs/cyclonev
vmap cyclonev ./vhdl_libs/cyclonev
vlog -vlog01compat -work cyclonev {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vcom -93 -work cyclonev {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.vhd}
vcom -93 -work cyclonev {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_components.vhd}

vlib vhdl_libs/cyclonev_hssi
vmap cyclonev_hssi ./vhdl_libs/cyclonev_hssi
vcom -93 -work cyclonev_hssi {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_components.vhd}
vlog -vlog01compat -work cyclonev_hssi {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vcom -93 -work cyclonev_hssi {d:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/PLL25_sim/PLL25.vho"

vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/H_sync.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/V_sync.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/VGA_comm.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/VGA_Sync.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/VGA_ctrl.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/VGA_final.vhd}

vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/Proc_Quartus/VGA_ctrl_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_hssi -L rtl_work -L work -voptargs="+acc"  VGA_test

add wave *
view structure
view signals
run 100 ns
