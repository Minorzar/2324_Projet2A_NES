transcript on
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

vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_xy_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_stack_pointer.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_random_control_logic_test.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_program_counter_low.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_program_counter_high.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_p_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_input_data_latch.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_data_output_register_buffer.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_clock_generator.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_b_input_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_ALU.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_address_bus_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_adder_hold_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_ac_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU_a_input_register.vhd}
vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/CPU.vhd}

vcom -93 -work work {D:/Git/Projet/2324_Projet2A_NES/software/VHDL/CPU/Quartus_CPU/../testbench/CPU_clock_generator_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_hssi -L rtl_work -L work -voptargs="+acc"  clock_tb

add wave *
view structure
view signals
run -all
