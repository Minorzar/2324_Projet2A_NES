-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

-- DATE "01/23/2024 16:46:30"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU IS
    PORT (
	i_clk : IN std_logic;
	i_irq : IN std_logic;
	i_ready : IN std_logic;
	i_test_vector : IN std_logic_vector(60 DOWNTO 0);
	o_address_bus : BUFFER std_logic_vector(15 DOWNTO 0);
	b_read_write : BUFFER std_logic;
	io_data_bus : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END CPU;

-- Design Ports Information
-- i_irq	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_ready	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[21]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[22]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[23]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[24]	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[25]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[26]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[27]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[28]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[29]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[30]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[31]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[32]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[33]	=>  Location: PIN_AJ17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[37]	=>  Location: PIN_AC20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[38]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[0]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[1]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[2]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[4]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[5]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[6]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[7]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[8]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[9]	=>  Location: PIN_AK8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[10]	=>  Location: PIN_AK7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[11]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[12]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[13]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[14]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_address_bus[15]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_read_write	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[35]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[34]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[3]	=>  Location: PIN_AJ25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[36]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[0]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[1]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[2]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[3]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[4]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[5]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[6]	=>  Location: PIN_AG2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io_data_bus[7]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[60]	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[11]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[1]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[2]	=>  Location: PIN_AK3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[15]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[5]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[18]	=>  Location: PIN_AG1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[9]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[19]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[20]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[4]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[16]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[41]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[43]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[7]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[8]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[39]	=>  Location: PIN_AJ4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[44]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[42]	=>  Location: PIN_AK9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[10]	=>  Location: PIN_AJ2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[46]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[14]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[0]	=>  Location: PIN_AK2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[40]	=>  Location: PIN_AK4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[12]	=>  Location: PIN_AJ1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[13]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[47]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[48]	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[49]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[17]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[50]	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[51]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[52]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[53]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[54]	=>  Location: PIN_AH2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[55]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[56]	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[57]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[58]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[45]	=>  Location: PIN_AJ9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_test_vector[59]	=>  Location: PIN_AJ5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CPU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_i_irq : std_logic;
SIGNAL ww_i_ready : std_logic;
SIGNAL ww_i_test_vector : std_logic_vector(60 DOWNTO 0);
SIGNAL ww_o_address_bus : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b_read_write : std_logic;
SIGNAL ww_io_data_bus : std_logic_vector(7 DOWNTO 0);
SIGNAL \i_irq~input_o\ : std_logic;
SIGNAL \i_ready~input_o\ : std_logic;
SIGNAL \i_test_vector[21]~input_o\ : std_logic;
SIGNAL \i_test_vector[22]~input_o\ : std_logic;
SIGNAL \i_test_vector[23]~input_o\ : std_logic;
SIGNAL \i_test_vector[24]~input_o\ : std_logic;
SIGNAL \i_test_vector[25]~input_o\ : std_logic;
SIGNAL \i_test_vector[26]~input_o\ : std_logic;
SIGNAL \i_test_vector[27]~input_o\ : std_logic;
SIGNAL \i_test_vector[28]~input_o\ : std_logic;
SIGNAL \i_test_vector[29]~input_o\ : std_logic;
SIGNAL \i_test_vector[30]~input_o\ : std_logic;
SIGNAL \i_test_vector[31]~input_o\ : std_logic;
SIGNAL \i_test_vector[32]~input_o\ : std_logic;
SIGNAL \i_test_vector[33]~input_o\ : std_logic;
SIGNAL \i_test_vector[37]~input_o\ : std_logic;
SIGNAL \i_test_vector[38]~input_o\ : std_logic;
SIGNAL \i_test_vector[35]~input_o\ : std_logic;
SIGNAL \i_test_vector[34]~input_o\ : std_logic;
SIGNAL \i_test_vector[3]~input_o\ : std_logic;
SIGNAL \i_test_vector[36]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \i_test_vector[17]~input_o\ : std_logic;
SIGNAL \adl_bus[7]~12_combout\ : std_logic;
SIGNAL \d_bus[0]~23_combout\ : std_logic;
SIGNAL \d_bus[0]~en_q\ : std_logic;
SIGNAL \i_test_vector[0]~input_o\ : std_logic;
SIGNAL \i_test_vector[40]~input_o\ : std_logic;
SIGNAL \x_register|reg_xy[0]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[42]~input_o\ : std_logic;
SIGNAL \i_test_vector[41]~input_o\ : std_logic;
SIGNAL \y_register|reg_xy[0]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[44]~input_o\ : std_logic;
SIGNAL \i_test_vector[43]~input_o\ : std_logic;
SIGNAL \s_bus[0]~0_combout\ : std_logic;
SIGNAL \i_test_vector[39]~input_o\ : std_logic;
SIGNAL \io_data_bus[0]~input_o\ : std_logic;
SIGNAL \d_bus[0]~1_combout\ : std_logic;
SIGNAL \i_test_vector[10]~input_o\ : std_logic;
SIGNAL \i_test_vector[14]~input_o\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[0]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[2]~input_o\ : std_logic;
SIGNAL \i_test_vector[15]~input_o\ : std_logic;
SIGNAL \i_test_vector[16]~input_o\ : std_logic;
SIGNAL \adh_bus[0]~8_combout\ : std_logic;
SIGNAL \adh_bus[0]~0_combout\ : std_logic;
SIGNAL \i_test_vector[12]~input_o\ : std_logic;
SIGNAL \i_test_vector[13]~input_o\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[7]~0_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~1_sumout\ : std_logic;
SIGNAL \i_test_vector[9]~input_o\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[0]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[11]~input_o\ : std_logic;
SIGNAL \i_test_vector[1]~input_o\ : std_logic;
SIGNAL \i_test_vector[18]~input_o\ : std_logic;
SIGNAL \adl_bus[0]~8_combout\ : std_logic;
SIGNAL \adl_bus[0]~en_q\ : std_logic;
SIGNAL \adl_bus[0]~0_combout\ : std_logic;
SIGNAL \i_test_vector[7]~input_o\ : std_logic;
SIGNAL \i_test_vector[8]~input_o\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[5]~0_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~2\ : std_logic;
SIGNAL \program_counter_low|Add0~5_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[1]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[19]~input_o\ : std_logic;
SIGNAL \adl_bus[1]~9_combout\ : std_logic;
SIGNAL \adl_bus[1]~en_q\ : std_logic;
SIGNAL \io_data_bus[1]~input_o\ : std_logic;
SIGNAL \adl_bus[1]~1_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~6\ : std_logic;
SIGNAL \program_counter_low|Add0~9_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[2]~feeder_combout\ : std_logic;
SIGNAL \io_data_bus[2]~input_o\ : std_logic;
SIGNAL \i_test_vector[20]~input_o\ : std_logic;
SIGNAL \adl_bus[2]~10_combout\ : std_logic;
SIGNAL \adl_bus[2]~en_q\ : std_logic;
SIGNAL \adl_bus[2]~2_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~10\ : std_logic;
SIGNAL \program_counter_low|Add0~13_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[3]~feeder_combout\ : std_logic;
SIGNAL \i_test_vector[4]~input_o\ : std_logic;
SIGNAL \adl_bus[3]~11_combout\ : std_logic;
SIGNAL \adl_bus[3]~en_q\ : std_logic;
SIGNAL \io_data_bus[3]~input_o\ : std_logic;
SIGNAL \adl_bus[3]~3_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~14\ : std_logic;
SIGNAL \program_counter_low|Add0~17_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[4]~feeder_combout\ : std_logic;
SIGNAL \io_data_bus[4]~input_o\ : std_logic;
SIGNAL \adl_bus[4]~4_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~18\ : std_logic;
SIGNAL \program_counter_low|Add0~21_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[5]~feeder_combout\ : std_logic;
SIGNAL \io_data_bus[5]~input_o\ : std_logic;
SIGNAL \adl_bus[5]~5_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~22\ : std_logic;
SIGNAL \program_counter_low|Add0~25_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[6]~feeder_combout\ : std_logic;
SIGNAL \io_data_bus[6]~input_o\ : std_logic;
SIGNAL \adl_bus[6]~6_combout\ : std_logic;
SIGNAL \program_counter_low|Add0~26\ : std_logic;
SIGNAL \program_counter_low|Add0~29_sumout\ : std_logic;
SIGNAL \program_counter_low|reg_pcl_select[7]~feeder_combout\ : std_logic;
SIGNAL \io_data_bus[7]~input_o\ : std_logic;
SIGNAL \adl_bus[7]~7_combout\ : std_logic;
SIGNAL \program_counter_low|o_carry~0_combout\ : std_logic;
SIGNAL \program_counter_low|o_carry~1_combout\ : std_logic;
SIGNAL \program_counter_low|o_carry~q\ : std_logic;
SIGNAL \program_counter_high|Add0~1_sumout\ : std_logic;
SIGNAL \i_test_vector[46]~input_o\ : std_logic;
SIGNAL \i_test_vector[47]~input_o\ : std_logic;
SIGNAL \i_test_vector[49]~input_o\ : std_logic;
SIGNAL \i_test_vector[48]~input_o\ : std_logic;
SIGNAL \p_register|reg_p~0_combout\ : std_logic;
SIGNAL \p_register|reg_p~1_combout\ : std_logic;
SIGNAL \d_bus[0]~0_combout\ : std_logic;
SIGNAL \d_bus[0]~2_combout\ : std_logic;
SIGNAL \i_test_vector[60]~input_o\ : std_logic;
SIGNAL \data_output_register_buffer|o_data_bus~0_combout\ : std_logic;
SIGNAL \d_bus[1]~4_combout\ : std_logic;
SIGNAL \i_test_vector[51]~input_o\ : std_logic;
SIGNAL \i_test_vector[50]~input_o\ : std_logic;
SIGNAL \p_register|reg_p~2_combout\ : std_logic;
SIGNAL \d_bus[0]~24_combout\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[1]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[1]~1_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~2\ : std_logic;
SIGNAL \program_counter_high|Add0~5_sumout\ : std_logic;
SIGNAL \program_counter_high|reg_pch[1]~DUPLICATE_q\ : std_logic;
SIGNAL \d_bus[1]~25_combout\ : std_logic;
SIGNAL \p_register|reg_p~3_combout\ : std_logic;
SIGNAL \p_register|reg_p~17_combout\ : std_logic;
SIGNAL \i_test_vector[56]~input_o\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[2]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[2]~2_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~6\ : std_logic;
SIGNAL \program_counter_high|Add0~9_sumout\ : std_logic;
SIGNAL \d_bus[2]~6_combout\ : std_logic;
SIGNAL \i_test_vector[52]~input_o\ : std_logic;
SIGNAL \d_bus[2]~7_combout\ : std_logic;
SIGNAL \i_test_vector[53]~input_o\ : std_logic;
SIGNAL \p_register|reg_p~13_combout\ : std_logic;
SIGNAL \p_register|reg_p[2]~23_combout\ : std_logic;
SIGNAL \i_test_vector[57]~input_o\ : std_logic;
SIGNAL \i_test_vector[58]~input_o\ : std_logic;
SIGNAL \p_register|reg_p~6_combout\ : std_logic;
SIGNAL \d_bus[6]~18_combout\ : std_logic;
SIGNAL \p_register|reg_p~7_combout\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[6]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[6]~6_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~10\ : std_logic;
SIGNAL \program_counter_high|Add0~13_sumout\ : std_logic;
SIGNAL \program_counter_high|reg_pch[3]~DUPLICATE_q\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[3]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[3]~3_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~14\ : std_logic;
SIGNAL \program_counter_high|Add0~17_sumout\ : std_logic;
SIGNAL \program_counter_high|reg_pch[4]~DUPLICATE_q\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[4]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[4]~4_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~18\ : std_logic;
SIGNAL \program_counter_high|Add0~21_sumout\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[5]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[5]~5_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~22\ : std_logic;
SIGNAL \program_counter_high|Add0~25_sumout\ : std_logic;
SIGNAL \d_bus[6]~17_combout\ : std_logic;
SIGNAL \d_bus[6]~19_combout\ : std_logic;
SIGNAL \d_bus[2]~8_combout\ : std_logic;
SIGNAL \d_bus[3]~10_combout\ : std_logic;
SIGNAL \i_test_vector[54]~input_o\ : std_logic;
SIGNAL \i_test_vector[55]~input_o\ : std_logic;
SIGNAL \p_register|reg_p~9_combout\ : std_logic;
SIGNAL \p_register|reg_p[3]~24_combout\ : std_logic;
SIGNAL \d_bus[3]~9_combout\ : std_logic;
SIGNAL \d_bus[3]~11_combout\ : std_logic;
SIGNAL \d_bus[5]~15_combout\ : std_logic;
SIGNAL \d_bus[4]~13_combout\ : std_logic;
SIGNAL \program_counter_high|reg_pch_select[7]~feeder_combout\ : std_logic;
SIGNAL \adh_bus[7]~7_combout\ : std_logic;
SIGNAL \program_counter_high|Add0~26\ : std_logic;
SIGNAL \program_counter_high|Add0~29_sumout\ : std_logic;
SIGNAL \d_bus[7]~26_combout\ : std_logic;
SIGNAL \i_test_vector[59]~input_o\ : std_logic;
SIGNAL \p_register|reg_p[7]~8_combout\ : std_logic;
SIGNAL \i_test_vector[45]~input_o\ : std_logic;
SIGNAL \x_register|reg_xy[7]~feeder_combout\ : std_logic;
SIGNAL \s_bus[7]~1_combout\ : std_logic;
SIGNAL \s_bus[7]~2_combout\ : std_logic;
SIGNAL \ac_register|reg_ac[7]~feeder_combout\ : std_logic;
SIGNAL \d_bus[7]~21_combout\ : std_logic;
SIGNAL \d_bus[4]~27_combout\ : std_logic;
SIGNAL \d_bus[5]~28_combout\ : std_logic;
SIGNAL \p_register|reg_p~4_combout\ : std_logic;
SIGNAL \p_register|reg_p~5_combout\ : std_logic;
SIGNAL \d_bus[1]~3_combout\ : std_logic;
SIGNAL \d_bus[1]~5_combout\ : std_logic;
SIGNAL \d_bus[4]~12_combout\ : std_logic;
SIGNAL \d_bus[4]~14_combout\ : std_logic;
SIGNAL \d_bus[5]~16_combout\ : std_logic;
SIGNAL \d_bus[7]~20_combout\ : std_logic;
SIGNAL \d_bus[7]~22_combout\ : std_logic;
SIGNAL \i_test_vector[6]~input_o\ : std_logic;
SIGNAL \address_bus_low_register|process_0~0_combout\ : std_logic;
SIGNAL \i_test_vector[5]~input_o\ : std_logic;
SIGNAL \address_bus_high_register|process_0~0_combout\ : std_logic;
SIGNAL \program_counter_low|pcl_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \input_data_latch|reg_dl\ : std_logic_vector(7 DOWNTO 0);
SIGNAL adh_bus : std_logic_vector(7 DOWNTO 0);
SIGNAL \address_bus_low_register|reg_ablh\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \program_counter_low|reg_pcl_select\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \program_counter_high|reg_pch_select\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \address_bus_high_register|reg_ablh\ : std_logic_vector(7 DOWNTO 0);
SIGNAL adl_bus : std_logic_vector(7 DOWNTO 0);
SIGNAL \program_counter_high|reg_pch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ac_register|reg_ac\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \y_register|reg_xy\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \x_register|reg_xy\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \data_output_register_buffer|reg_data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \p_register|reg_p\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \program_counter_high|ALT_INV_reg_pch[4]~DUPLICATE_q\ : std_logic;
SIGNAL \program_counter_high|ALT_INV_reg_pch[3]~DUPLICATE_q\ : std_logic;
SIGNAL \program_counter_high|ALT_INV_reg_pch[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[59]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[45]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[58]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[57]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[56]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[55]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[54]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[53]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[52]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[51]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[50]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[49]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[48]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[47]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[40]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[46]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[43]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[41]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_i_test_vector[60]~input_o\ : std_logic;
SIGNAL \ALT_INV_s_bus[7]~2_combout\ : std_logic;
SIGNAL \ALT_INV_s_bus[7]~1_combout\ : std_logic;
SIGNAL \y_register|ALT_INV_reg_xy\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \x_register|ALT_INV_reg_xy\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \p_register|ALT_INV_reg_p~6_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~4_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[5]~28_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[4]~27_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[7]~26_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~3_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~2_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[1]~25_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[0]~24_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~0_combout\ : std_logic;
SIGNAL \program_counter_low|ALT_INV_o_carry~0_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[7]~21_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ac_register|ALT_INV_reg_ac\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_d_bus[7]~20_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[6]~19_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[6]~18_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[6]~17_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[5]~15_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[4]~13_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[4]~12_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[3]~11_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[3]~10_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[3]~9_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[2]~8_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[2]~7_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[2]~6_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[1]~4_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[1]~3_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[0]~1_combout\ : std_logic;
SIGNAL \ALT_INV_d_bus[0]~en_q\ : std_logic;
SIGNAL \ALT_INV_d_bus[0]~0_combout\ : std_logic;
SIGNAL \program_counter_low|ALT_INV_o_carry~q\ : std_logic;
SIGNAL \ALT_INV_s_bus[0]~0_combout\ : std_logic;
SIGNAL \program_counter_high|ALT_INV_reg_pch\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \input_data_latch|ALT_INV_reg_dl\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_adl_bus[3]~en_q\ : std_logic;
SIGNAL \ALT_INV_adl_bus[2]~en_q\ : std_logic;
SIGNAL \ALT_INV_adl_bus[1]~en_q\ : std_logic;
SIGNAL \ALT_INV_adl_bus[0]~en_q\ : std_logic;
SIGNAL ALT_INV_adl_bus : std_logic_vector(7 DOWNTO 7);
SIGNAL \p_register|ALT_INV_reg_p~17_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~13_combout\ : std_logic;
SIGNAL \p_register|ALT_INV_reg_p~9_combout\ : std_logic;
SIGNAL \program_counter_high|ALT_INV_reg_pch_select\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \program_counter_low|ALT_INV_reg_pcl_select\ : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_adh_bus : std_logic_vector(0 DOWNTO 0);
SIGNAL \program_counter_low|ALT_INV_pcl_reg\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_i_clk <= i_clk;
ww_i_irq <= i_irq;
ww_i_ready <= i_ready;
ww_i_test_vector <= i_test_vector;
o_address_bus <= ww_o_address_bus;
b_read_write <= ww_b_read_write;
io_data_bus <= ww_io_data_bus;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\program_counter_high|ALT_INV_reg_pch[4]~DUPLICATE_q\ <= NOT \program_counter_high|reg_pch[4]~DUPLICATE_q\;
\program_counter_high|ALT_INV_reg_pch[3]~DUPLICATE_q\ <= NOT \program_counter_high|reg_pch[3]~DUPLICATE_q\;
\program_counter_high|ALT_INV_reg_pch[1]~DUPLICATE_q\ <= NOT \program_counter_high|reg_pch[1]~DUPLICATE_q\;
\ALT_INV_i_test_vector[59]~input_o\ <= NOT \i_test_vector[59]~input_o\;
\ALT_INV_i_test_vector[45]~input_o\ <= NOT \i_test_vector[45]~input_o\;
\ALT_INV_i_test_vector[58]~input_o\ <= NOT \i_test_vector[58]~input_o\;
\ALT_INV_i_test_vector[57]~input_o\ <= NOT \i_test_vector[57]~input_o\;
\ALT_INV_i_test_vector[56]~input_o\ <= NOT \i_test_vector[56]~input_o\;
\ALT_INV_i_test_vector[55]~input_o\ <= NOT \i_test_vector[55]~input_o\;
\ALT_INV_i_test_vector[54]~input_o\ <= NOT \i_test_vector[54]~input_o\;
\ALT_INV_i_test_vector[53]~input_o\ <= NOT \i_test_vector[53]~input_o\;
\ALT_INV_i_test_vector[52]~input_o\ <= NOT \i_test_vector[52]~input_o\;
\ALT_INV_i_test_vector[51]~input_o\ <= NOT \i_test_vector[51]~input_o\;
\ALT_INV_i_test_vector[50]~input_o\ <= NOT \i_test_vector[50]~input_o\;
\ALT_INV_i_test_vector[17]~input_o\ <= NOT \i_test_vector[17]~input_o\;
\ALT_INV_i_test_vector[49]~input_o\ <= NOT \i_test_vector[49]~input_o\;
\ALT_INV_i_test_vector[48]~input_o\ <= NOT \i_test_vector[48]~input_o\;
\ALT_INV_i_test_vector[47]~input_o\ <= NOT \i_test_vector[47]~input_o\;
\ALT_INV_i_test_vector[13]~input_o\ <= NOT \i_test_vector[13]~input_o\;
\ALT_INV_i_test_vector[12]~input_o\ <= NOT \i_test_vector[12]~input_o\;
\ALT_INV_i_test_vector[40]~input_o\ <= NOT \i_test_vector[40]~input_o\;
\ALT_INV_i_test_vector[0]~input_o\ <= NOT \i_test_vector[0]~input_o\;
\ALT_INV_i_test_vector[14]~input_o\ <= NOT \i_test_vector[14]~input_o\;
\ALT_INV_i_test_vector[46]~input_o\ <= NOT \i_test_vector[46]~input_o\;
\ALT_INV_i_test_vector[10]~input_o\ <= NOT \i_test_vector[10]~input_o\;
\ALT_INV_i_test_vector[8]~input_o\ <= NOT \i_test_vector[8]~input_o\;
\ALT_INV_i_test_vector[7]~input_o\ <= NOT \i_test_vector[7]~input_o\;
\ALT_INV_i_test_vector[43]~input_o\ <= NOT \i_test_vector[43]~input_o\;
\ALT_INV_i_test_vector[41]~input_o\ <= NOT \i_test_vector[41]~input_o\;
\ALT_INV_i_test_vector[16]~input_o\ <= NOT \i_test_vector[16]~input_o\;
\ALT_INV_i_test_vector[4]~input_o\ <= NOT \i_test_vector[4]~input_o\;
\ALT_INV_i_test_vector[20]~input_o\ <= NOT \i_test_vector[20]~input_o\;
\ALT_INV_i_test_vector[19]~input_o\ <= NOT \i_test_vector[19]~input_o\;
\ALT_INV_i_test_vector[9]~input_o\ <= NOT \i_test_vector[9]~input_o\;
\ALT_INV_i_test_vector[18]~input_o\ <= NOT \i_test_vector[18]~input_o\;
\ALT_INV_i_test_vector[5]~input_o\ <= NOT \i_test_vector[5]~input_o\;
\ALT_INV_i_test_vector[15]~input_o\ <= NOT \i_test_vector[15]~input_o\;
\ALT_INV_i_test_vector[2]~input_o\ <= NOT \i_test_vector[2]~input_o\;
\ALT_INV_i_test_vector[6]~input_o\ <= NOT \i_test_vector[6]~input_o\;
\ALT_INV_i_test_vector[1]~input_o\ <= NOT \i_test_vector[1]~input_o\;
\ALT_INV_i_test_vector[11]~input_o\ <= NOT \i_test_vector[11]~input_o\;
\ALT_INV_i_test_vector[60]~input_o\ <= NOT \i_test_vector[60]~input_o\;
\ALT_INV_s_bus[7]~2_combout\ <= NOT \s_bus[7]~2_combout\;
\ALT_INV_s_bus[7]~1_combout\ <= NOT \s_bus[7]~1_combout\;
\y_register|ALT_INV_reg_xy\(7) <= NOT \y_register|reg_xy\(7);
\x_register|ALT_INV_reg_xy\(7) <= NOT \x_register|reg_xy\(7);
\p_register|ALT_INV_reg_p~6_combout\ <= NOT \p_register|reg_p~6_combout\;
\p_register|ALT_INV_reg_p~4_combout\ <= NOT \p_register|reg_p~4_combout\;
\ALT_INV_d_bus[5]~28_combout\ <= NOT \d_bus[5]~28_combout\;
\ALT_INV_d_bus[4]~27_combout\ <= NOT \d_bus[4]~27_combout\;
\ALT_INV_d_bus[7]~26_combout\ <= NOT \d_bus[7]~26_combout\;
\p_register|ALT_INV_reg_p~3_combout\ <= NOT \p_register|reg_p~3_combout\;
\p_register|ALT_INV_reg_p~2_combout\ <= NOT \p_register|reg_p~2_combout\;
\ALT_INV_d_bus[1]~25_combout\ <= NOT \d_bus[1]~25_combout\;
\ALT_INV_d_bus[0]~24_combout\ <= NOT \d_bus[0]~24_combout\;
\p_register|ALT_INV_reg_p~0_combout\ <= NOT \p_register|reg_p~0_combout\;
\program_counter_low|ALT_INV_o_carry~0_combout\ <= NOT \program_counter_low|o_carry~0_combout\;
\ALT_INV_d_bus[7]~21_combout\ <= NOT \d_bus[7]~21_combout\;
\p_register|ALT_INV_reg_p\(7) <= NOT \p_register|reg_p\(7);
\ac_register|ALT_INV_reg_ac\(7) <= NOT \ac_register|reg_ac\(7);
\ALT_INV_d_bus[7]~20_combout\ <= NOT \d_bus[7]~20_combout\;
\ALT_INV_d_bus[6]~19_combout\ <= NOT \d_bus[6]~19_combout\;
\ALT_INV_d_bus[6]~18_combout\ <= NOT \d_bus[6]~18_combout\;
\ALT_INV_d_bus[6]~17_combout\ <= NOT \d_bus[6]~17_combout\;
\p_register|ALT_INV_reg_p\(6) <= NOT \p_register|reg_p\(6);
\ALT_INV_d_bus[5]~15_combout\ <= NOT \d_bus[5]~15_combout\;
\ALT_INV_d_bus[4]~13_combout\ <= NOT \d_bus[4]~13_combout\;
\ALT_INV_d_bus[4]~12_combout\ <= NOT \d_bus[4]~12_combout\;
\ALT_INV_d_bus[3]~11_combout\ <= NOT \d_bus[3]~11_combout\;
\ALT_INV_d_bus[3]~10_combout\ <= NOT \d_bus[3]~10_combout\;
\ALT_INV_d_bus[3]~9_combout\ <= NOT \d_bus[3]~9_combout\;
\p_register|ALT_INV_reg_p\(3) <= NOT \p_register|reg_p\(3);
\ALT_INV_d_bus[2]~8_combout\ <= NOT \d_bus[2]~8_combout\;
\ALT_INV_d_bus[2]~7_combout\ <= NOT \d_bus[2]~7_combout\;
\ALT_INV_d_bus[2]~6_combout\ <= NOT \d_bus[2]~6_combout\;
\p_register|ALT_INV_reg_p\(2) <= NOT \p_register|reg_p\(2);
\ALT_INV_d_bus[1]~4_combout\ <= NOT \d_bus[1]~4_combout\;
\ALT_INV_d_bus[1]~3_combout\ <= NOT \d_bus[1]~3_combout\;
\p_register|ALT_INV_reg_p\(1) <= NOT \p_register|reg_p\(1);
\ALT_INV_d_bus[0]~1_combout\ <= NOT \d_bus[0]~1_combout\;
\ALT_INV_d_bus[0]~en_q\ <= NOT \d_bus[0]~en_q\;
\ALT_INV_d_bus[0]~0_combout\ <= NOT \d_bus[0]~0_combout\;
\p_register|ALT_INV_reg_p\(0) <= NOT \p_register|reg_p\(0);
\program_counter_low|ALT_INV_o_carry~q\ <= NOT \program_counter_low|o_carry~q\;
\ALT_INV_s_bus[0]~0_combout\ <= NOT \s_bus[0]~0_combout\;
\x_register|ALT_INV_reg_xy\(0) <= NOT \x_register|reg_xy\(0);
\y_register|ALT_INV_reg_xy\(0) <= NOT \y_register|reg_xy\(0);
\ac_register|ALT_INV_reg_ac\(0) <= NOT \ac_register|reg_ac\(0);
\program_counter_high|ALT_INV_reg_pch\(7) <= NOT \program_counter_high|reg_pch\(7);
\program_counter_high|ALT_INV_reg_pch\(6) <= NOT \program_counter_high|reg_pch\(6);
\program_counter_high|ALT_INV_reg_pch\(5) <= NOT \program_counter_high|reg_pch\(5);
\program_counter_high|ALT_INV_reg_pch\(4) <= NOT \program_counter_high|reg_pch\(4);
\program_counter_high|ALT_INV_reg_pch\(3) <= NOT \program_counter_high|reg_pch\(3);
\program_counter_high|ALT_INV_reg_pch\(2) <= NOT \program_counter_high|reg_pch\(2);
\program_counter_high|ALT_INV_reg_pch\(1) <= NOT \program_counter_high|reg_pch\(1);
\program_counter_high|ALT_INV_reg_pch\(0) <= NOT \program_counter_high|reg_pch\(0);
\input_data_latch|ALT_INV_reg_dl\(7) <= NOT \input_data_latch|reg_dl\(7);
\input_data_latch|ALT_INV_reg_dl\(6) <= NOT \input_data_latch|reg_dl\(6);
\input_data_latch|ALT_INV_reg_dl\(5) <= NOT \input_data_latch|reg_dl\(5);
\input_data_latch|ALT_INV_reg_dl\(4) <= NOT \input_data_latch|reg_dl\(4);
\ALT_INV_adl_bus[3]~en_q\ <= NOT \adl_bus[3]~en_q\;
\input_data_latch|ALT_INV_reg_dl\(3) <= NOT \input_data_latch|reg_dl\(3);
\input_data_latch|ALT_INV_reg_dl\(2) <= NOT \input_data_latch|reg_dl\(2);
\ALT_INV_adl_bus[2]~en_q\ <= NOT \adl_bus[2]~en_q\;
\input_data_latch|ALT_INV_reg_dl\(1) <= NOT \input_data_latch|reg_dl\(1);
\ALT_INV_adl_bus[1]~en_q\ <= NOT \adl_bus[1]~en_q\;
\input_data_latch|ALT_INV_reg_dl\(0) <= NOT \input_data_latch|reg_dl\(0);
\ALT_INV_adl_bus[0]~en_q\ <= NOT \adl_bus[0]~en_q\;
ALT_INV_adl_bus(7) <= NOT adl_bus(7);
\p_register|ALT_INV_reg_p~17_combout\ <= NOT \p_register|reg_p~17_combout\;
\p_register|ALT_INV_reg_p~13_combout\ <= NOT \p_register|reg_p~13_combout\;
\p_register|ALT_INV_reg_p~9_combout\ <= NOT \p_register|reg_p~9_combout\;
\program_counter_high|ALT_INV_reg_pch_select\(7) <= NOT \program_counter_high|reg_pch_select\(7);
\program_counter_high|ALT_INV_reg_pch_select\(6) <= NOT \program_counter_high|reg_pch_select\(6);
\program_counter_high|ALT_INV_reg_pch_select\(5) <= NOT \program_counter_high|reg_pch_select\(5);
\program_counter_high|ALT_INV_reg_pch_select\(4) <= NOT \program_counter_high|reg_pch_select\(4);
\program_counter_high|ALT_INV_reg_pch_select\(3) <= NOT \program_counter_high|reg_pch_select\(3);
\program_counter_high|ALT_INV_reg_pch_select\(2) <= NOT \program_counter_high|reg_pch_select\(2);
\program_counter_high|ALT_INV_reg_pch_select\(1) <= NOT \program_counter_high|reg_pch_select\(1);
\program_counter_high|ALT_INV_reg_pch_select\(0) <= NOT \program_counter_high|reg_pch_select\(0);
\program_counter_low|ALT_INV_reg_pcl_select\(7) <= NOT \program_counter_low|reg_pcl_select\(7);
\program_counter_low|ALT_INV_reg_pcl_select\(6) <= NOT \program_counter_low|reg_pcl_select\(6);
\program_counter_low|ALT_INV_reg_pcl_select\(5) <= NOT \program_counter_low|reg_pcl_select\(5);
\program_counter_low|ALT_INV_reg_pcl_select\(4) <= NOT \program_counter_low|reg_pcl_select\(4);
\program_counter_low|ALT_INV_reg_pcl_select\(3) <= NOT \program_counter_low|reg_pcl_select\(3);
\program_counter_low|ALT_INV_reg_pcl_select\(2) <= NOT \program_counter_low|reg_pcl_select\(2);
\program_counter_low|ALT_INV_reg_pcl_select\(1) <= NOT \program_counter_low|reg_pcl_select\(1);
\program_counter_low|ALT_INV_reg_pcl_select\(0) <= NOT \program_counter_low|reg_pcl_select\(0);
ALT_INV_adh_bus(0) <= NOT adh_bus(0);
\program_counter_low|ALT_INV_pcl_reg\(7) <= NOT \program_counter_low|pcl_reg\(7);
\program_counter_low|ALT_INV_pcl_reg\(6) <= NOT \program_counter_low|pcl_reg\(6);
\program_counter_low|ALT_INV_pcl_reg\(5) <= NOT \program_counter_low|pcl_reg\(5);
\program_counter_low|ALT_INV_pcl_reg\(4) <= NOT \program_counter_low|pcl_reg\(4);
\program_counter_low|ALT_INV_pcl_reg\(3) <= NOT \program_counter_low|pcl_reg\(3);
\program_counter_low|ALT_INV_pcl_reg\(2) <= NOT \program_counter_low|pcl_reg\(2);
\program_counter_low|ALT_INV_pcl_reg\(1) <= NOT \program_counter_low|pcl_reg\(1);
\program_counter_low|ALT_INV_pcl_reg\(0) <= NOT \program_counter_low|pcl_reg\(0);

-- Location: IOOBUF_X10_Y0_N76
\o_address_bus[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(0),
	devoe => ww_devoe,
	o => ww_o_address_bus(0));

-- Location: IOOBUF_X4_Y0_N19
\o_address_bus[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(1),
	devoe => ww_devoe,
	o => ww_o_address_bus(1));

-- Location: IOOBUF_X12_Y81_N2
\o_address_bus[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(2),
	devoe => ww_devoe,
	o => ww_o_address_bus(2));

-- Location: IOOBUF_X4_Y0_N53
\o_address_bus[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(3),
	devoe => ww_devoe,
	o => ww_o_address_bus(3));

-- Location: IOOBUF_X8_Y0_N36
\o_address_bus[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(4),
	devoe => ww_devoe,
	o => ww_o_address_bus(4));

-- Location: IOOBUF_X8_Y0_N53
\o_address_bus[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(5),
	devoe => ww_devoe,
	o => ww_o_address_bus(5));

-- Location: IOOBUF_X8_Y0_N19
\o_address_bus[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(6),
	devoe => ww_devoe,
	o => ww_o_address_bus(6));

-- Location: IOOBUF_X4_Y0_N36
\o_address_bus[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_low_register|reg_ablh\(7),
	devoe => ww_devoe,
	o => ww_o_address_bus(7));

-- Location: IOOBUF_X26_Y0_N93
\o_address_bus[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(0),
	devoe => ww_devoe,
	o => ww_o_address_bus(8));

-- Location: IOOBUF_X28_Y0_N53
\o_address_bus[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(1),
	devoe => ww_devoe,
	o => ww_o_address_bus(9));

-- Location: IOOBUF_X28_Y0_N36
\o_address_bus[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(2),
	devoe => ww_devoe,
	o => ww_o_address_bus(10));

-- Location: IOOBUF_X22_Y0_N19
\o_address_bus[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(3),
	devoe => ww_devoe,
	o => ww_o_address_bus(11));

-- Location: IOOBUF_X28_Y0_N19
\o_address_bus[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(4),
	devoe => ww_devoe,
	o => ww_o_address_bus(12));

-- Location: IOOBUF_X32_Y0_N36
\o_address_bus[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(5),
	devoe => ww_devoe,
	o => ww_o_address_bus(13));

-- Location: IOOBUF_X26_Y0_N59
\o_address_bus[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(6),
	devoe => ww_devoe,
	o => ww_o_address_bus(14));

-- Location: IOOBUF_X22_Y0_N2
\o_address_bus[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \address_bus_high_register|reg_ablh\(7),
	devoe => ww_devoe,
	o => ww_o_address_bus(15));

-- Location: IOOBUF_X36_Y0_N19
\b_read_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \i_test_vector[60]~input_o\,
	devoe => ww_devoe,
	o => ww_b_read_write);

-- Location: IOOBUF_X16_Y0_N2
\io_data_bus[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(0),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(0));

-- Location: IOOBUF_X18_Y0_N42
\io_data_bus[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(1),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(1));

-- Location: IOOBUF_X16_Y0_N53
\io_data_bus[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(2),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(2));

-- Location: IOOBUF_X16_Y0_N19
\io_data_bus[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(3),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(3));

-- Location: IOOBUF_X18_Y0_N93
\io_data_bus[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(4),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(4));

-- Location: IOOBUF_X18_Y0_N76
\io_data_bus[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(5),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(5));

-- Location: IOOBUF_X16_Y0_N36
\io_data_bus[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(6),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(6));

-- Location: IOOBUF_X18_Y0_N59
\io_data_bus[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data_output_register_buffer|reg_data_out\(7),
	oe => \data_output_register_buffer|o_data_bus~0_combout\,
	devoe => ww_devoe,
	o => ww_io_data_bus(7));

-- Location: IOIBUF_X89_Y25_N21
\i_clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G10
\i_clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~input_o\,
	outclk => \i_clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X24_Y0_N18
\i_test_vector[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(17),
	o => \i_test_vector[17]~input_o\);

-- Location: LABCELL_X18_Y3_N3
\adl_bus[7]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[7]~12_combout\ = !adl_bus(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_adl_bus(7),
	combout => \adl_bus[7]~12_combout\);

-- Location: FF_X18_Y3_N5
\adl_bus[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adl_bus(7));

-- Location: LABCELL_X19_Y3_N42
\d_bus[0]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[0]~23_combout\ = ( \i_test_vector[17]~input_o\ & ( adl_bus(7) ) ) # ( \i_test_vector[17]~input_o\ & ( !adl_bus(7) ) ) # ( !\i_test_vector[17]~input_o\ & ( !adl_bus(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_i_test_vector[17]~input_o\,
	dataf => ALT_INV_adl_bus(7),
	combout => \d_bus[0]~23_combout\);

-- Location: FF_X16_Y3_N29
\d_bus[0]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \d_bus[0]~23_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \d_bus[0]~en_q\);

-- Location: IOIBUF_X20_Y0_N35
\i_test_vector[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(0),
	o => \i_test_vector[0]~input_o\);

-- Location: IOIBUF_X22_Y0_N52
\i_test_vector[40]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(40),
	o => \i_test_vector[40]~input_o\);

-- Location: LABCELL_X19_Y3_N57
\x_register|reg_xy[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \x_register|reg_xy[0]~feeder_combout\ = ( \s_bus[0]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_s_bus[0]~0_combout\,
	combout => \x_register|reg_xy[0]~feeder_combout\);

-- Location: IOIBUF_X30_Y0_N52
\i_test_vector[42]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(42),
	o => \i_test_vector[42]~input_o\);

-- Location: FF_X19_Y3_N58
\x_register|reg_xy[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \x_register|reg_xy[0]~feeder_combout\,
	ena => \i_test_vector[42]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \x_register|reg_xy\(0));

-- Location: IOIBUF_X30_Y0_N18
\i_test_vector[41]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(41),
	o => \i_test_vector[41]~input_o\);

-- Location: LABCELL_X19_Y3_N48
\y_register|reg_xy[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \y_register|reg_xy[0]~feeder_combout\ = ( \s_bus[0]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_s_bus[0]~0_combout\,
	combout => \y_register|reg_xy[0]~feeder_combout\);

-- Location: IOIBUF_X24_Y0_N1
\i_test_vector[44]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(44),
	o => \i_test_vector[44]~input_o\);

-- Location: FF_X19_Y3_N50
\y_register|reg_xy[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \y_register|reg_xy[0]~feeder_combout\,
	ena => \i_test_vector[44]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_register|reg_xy\(0));

-- Location: IOIBUF_X24_Y0_N52
\i_test_vector[43]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(43),
	o => \i_test_vector[43]~input_o\);

-- Location: LABCELL_X19_Y3_N12
\s_bus[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_bus[0]~0_combout\ = ( \ac_register|reg_ac\(0) & ( adl_bus(7) ) ) # ( !\ac_register|reg_ac\(0) & ( adl_bus(7) ) ) # ( \ac_register|reg_ac\(0) & ( !adl_bus(7) & ( ((!\i_test_vector[43]~input_o\ & ((\y_register|reg_xy\(0)))) # (\i_test_vector[43]~input_o\ 
-- & (\x_register|reg_xy\(0)))) # (\i_test_vector[41]~input_o\) ) ) ) # ( !\ac_register|reg_ac\(0) & ( !adl_bus(7) & ( (!\i_test_vector[41]~input_o\ & ((!\i_test_vector[43]~input_o\ & ((\y_register|reg_xy\(0)))) # (\i_test_vector[43]~input_o\ & 
-- (\x_register|reg_xy\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001000100001111110111011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \x_register|ALT_INV_reg_xy\(0),
	datab => \ALT_INV_i_test_vector[41]~input_o\,
	datac => \y_register|ALT_INV_reg_xy\(0),
	datad => \ALT_INV_i_test_vector[43]~input_o\,
	datae => \ac_register|ALT_INV_reg_ac\(0),
	dataf => ALT_INV_adl_bus(7),
	combout => \s_bus[0]~0_combout\);

-- Location: IOIBUF_X22_Y0_N35
\i_test_vector[39]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(39),
	o => \i_test_vector[39]~input_o\);

-- Location: FF_X16_Y3_N59
\ac_register|reg_ac[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \s_bus[0]~0_combout\,
	sload => VCC,
	ena => \i_test_vector[39]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac_register|reg_ac\(0));

-- Location: IOIBUF_X16_Y0_N1
\io_data_bus[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(0),
	o => \io_data_bus[0]~input_o\);

-- Location: FF_X16_Y3_N35
\input_data_latch|reg_dl[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[0]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(0));

-- Location: LABCELL_X16_Y3_N57
\d_bus[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[0]~1_combout\ = ( \input_data_latch|reg_dl\(0) & ( (!\d_bus[0]~en_q\ & (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[40]~input_o\) # (!\ac_register|reg_ac\(0))))) ) ) # ( !\input_data_latch|reg_dl\(0) & ( (!\d_bus[0]~en_q\ & 
-- ((!\i_test_vector[40]~input_o\) # (!\ac_register|reg_ac\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010100000101010101010000010001000100000001000100010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~en_q\,
	datab => \ALT_INV_i_test_vector[0]~input_o\,
	datac => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \ac_register|ALT_INV_reg_ac\(0),
	dataf => \input_data_latch|ALT_INV_reg_dl\(0),
	combout => \d_bus[0]~1_combout\);

-- Location: IOIBUF_X14_Y0_N18
\i_test_vector[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(10),
	o => \i_test_vector[10]~input_o\);

-- Location: IOIBUF_X20_Y0_N18
\i_test_vector[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(14),
	o => \i_test_vector[14]~input_o\);

-- Location: MLABCELL_X15_Y3_N0
\program_counter_high|reg_pch_select[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[0]~feeder_combout\ = \program_counter_high|reg_pch\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \program_counter_high|ALT_INV_reg_pch\(0),
	combout => \program_counter_high|reg_pch_select[0]~feeder_combout\);

-- Location: IOIBUF_X20_Y0_N52
\i_test_vector[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(2),
	o => \i_test_vector[2]~input_o\);

-- Location: IOIBUF_X10_Y0_N92
\i_test_vector[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(15),
	o => \i_test_vector[15]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\i_test_vector[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(16),
	o => \i_test_vector[16]~input_o\);

-- Location: LABCELL_X17_Y2_N0
\adh_bus[0]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[0]~8_combout\ = ( \s_bus[0]~0_combout\ & ( \i_test_vector[16]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[16]~input_o\,
	dataf => \ALT_INV_s_bus[0]~0_combout\,
	combout => \adh_bus[0]~8_combout\);

-- Location: FF_X17_Y2_N2
\adh_bus[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[0]~8_combout\,
	asdata => VCC,
	sload => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adh_bus(0));

-- Location: LABCELL_X16_Y2_N24
\adh_bus[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[0]~0_combout\ = ( \program_counter_high|reg_pch\(0) & ( (!\i_test_vector[2]~input_o\ & (((adh_bus(0))) # (\i_test_vector[15]~input_o\))) # (\i_test_vector[2]~input_o\ & (((\input_data_latch|reg_dl\(0))))) ) ) # ( 
-- !\program_counter_high|reg_pch\(0) & ( (!\i_test_vector[2]~input_o\ & (!\i_test_vector[15]~input_o\ & (adh_bus(0)))) # (\i_test_vector[2]~input_o\ & (((\input_data_latch|reg_dl\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001011101000010000101110100101010011111110010101001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datac => ALT_INV_adh_bus(0),
	datad => \input_data_latch|ALT_INV_reg_dl\(0),
	dataf => \program_counter_high|ALT_INV_reg_pch\(0),
	combout => \adh_bus[0]~0_combout\);

-- Location: IOIBUF_X14_Y0_N1
\i_test_vector[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(12),
	o => \i_test_vector[12]~input_o\);

-- Location: IOIBUF_X32_Y0_N1
\i_test_vector[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(13),
	o => \i_test_vector[13]~input_o\);

-- Location: LABCELL_X16_Y2_N42
\program_counter_high|reg_pch_select[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[7]~0_combout\ = ( \i_test_vector[13]~input_o\ ) # ( !\i_test_vector[13]~input_o\ & ( \i_test_vector[12]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[12]~input_o\,
	dataf => \ALT_INV_i_test_vector[13]~input_o\,
	combout => \program_counter_high|reg_pch_select[7]~0_combout\);

-- Location: FF_X15_Y3_N2
\program_counter_high|reg_pch_select[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[0]~feeder_combout\,
	asdata => \adh_bus[0]~0_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(0));

-- Location: LABCELL_X17_Y3_N0
\program_counter_low|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~1_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(0) ) + ( VCC ) + ( !VCC ))
-- \program_counter_low|Add0~2\ = CARRY(( \program_counter_low|reg_pcl_select\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(0),
	cin => GND,
	sumout => \program_counter_low|Add0~1_sumout\,
	cout => \program_counter_low|Add0~2\);

-- Location: IOIBUF_X12_Y0_N35
\i_test_vector[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(9),
	o => \i_test_vector[9]~input_o\);

-- Location: FF_X17_Y3_N2
\program_counter_low|pcl_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~1_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(0),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(0));

-- Location: LABCELL_X13_Y3_N57
\program_counter_low|reg_pcl_select[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[0]~feeder_combout\ = \program_counter_low|pcl_reg\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_pcl_reg\(0),
	combout => \program_counter_low|reg_pcl_select[0]~feeder_combout\);

-- Location: IOIBUF_X12_Y0_N18
\i_test_vector[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(11),
	o => \i_test_vector[11]~input_o\);

-- Location: IOIBUF_X6_Y0_N35
\i_test_vector[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(1),
	o => \i_test_vector[1]~input_o\);

-- Location: IOIBUF_X10_Y0_N41
\i_test_vector[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(18),
	o => \i_test_vector[18]~input_o\);

-- Location: LABCELL_X12_Y1_N15
\adl_bus[0]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[0]~8_combout\ = ( adl_bus(7) & ( \i_test_vector[18]~input_o\ ) ) # ( !adl_bus(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000011110000111111111111111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[18]~input_o\,
	datae => ALT_INV_adl_bus(7),
	combout => \adl_bus[0]~8_combout\);

-- Location: FF_X12_Y1_N16
\adl_bus[0]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \adl_bus[0]~en_q\);

-- Location: LABCELL_X13_Y3_N24
\adl_bus[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[0]~0_combout\ = ( \program_counter_low|pcl_reg\(0) & ( adl_bus(7) & ( (((\i_test_vector[1]~input_o\ & \input_data_latch|reg_dl\(0))) # (\adl_bus[0]~en_q\)) # (\i_test_vector[11]~input_o\) ) ) ) # ( !\program_counter_low|pcl_reg\(0) & ( adl_bus(7) 
-- & ( ((\i_test_vector[1]~input_o\ & \input_data_latch|reg_dl\(0))) # (\adl_bus[0]~en_q\) ) ) ) # ( \program_counter_low|pcl_reg\(0) & ( !adl_bus(7) & ( ((\i_test_vector[1]~input_o\ & \input_data_latch|reg_dl\(0))) # (\i_test_vector[11]~input_o\) ) ) ) # ( 
-- !\program_counter_low|pcl_reg\(0) & ( !adl_bus(7) & ( (\i_test_vector[1]~input_o\ & \input_data_latch|reg_dl\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011010101110101011100000011111111110101011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[11]~input_o\,
	datab => \ALT_INV_i_test_vector[1]~input_o\,
	datac => \input_data_latch|ALT_INV_reg_dl\(0),
	datad => \ALT_INV_adl_bus[0]~en_q\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(0),
	dataf => ALT_INV_adl_bus(7),
	combout => \adl_bus[0]~0_combout\);

-- Location: IOIBUF_X8_Y0_N1
\i_test_vector[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(7),
	o => \i_test_vector[7]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\i_test_vector[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(8),
	o => \i_test_vector[8]~input_o\);

-- Location: LABCELL_X12_Y3_N15
\program_counter_low|reg_pcl_select[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[5]~0_combout\ = ( \i_test_vector[8]~input_o\ & ( \i_test_vector[7]~input_o\ ) ) # ( !\i_test_vector[8]~input_o\ & ( \i_test_vector[7]~input_o\ ) ) # ( \i_test_vector[8]~input_o\ & ( !\i_test_vector[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_i_test_vector[8]~input_o\,
	dataf => \ALT_INV_i_test_vector[7]~input_o\,
	combout => \program_counter_low|reg_pcl_select[5]~0_combout\);

-- Location: FF_X13_Y3_N59
\program_counter_low|reg_pcl_select[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[0]~feeder_combout\,
	asdata => \adl_bus[0]~0_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(0));

-- Location: LABCELL_X17_Y3_N3
\program_counter_low|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~5_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(1) ) + ( GND ) + ( \program_counter_low|Add0~2\ ))
-- \program_counter_low|Add0~6\ = CARRY(( \program_counter_low|reg_pcl_select\(1) ) + ( GND ) + ( \program_counter_low|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(1),
	cin => \program_counter_low|Add0~2\,
	sumout => \program_counter_low|Add0~5_sumout\,
	cout => \program_counter_low|Add0~6\);

-- Location: FF_X17_Y3_N5
\program_counter_low|pcl_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~5_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(1),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(1));

-- Location: LABCELL_X13_Y3_N6
\program_counter_low|reg_pcl_select[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[1]~feeder_combout\ = \program_counter_low|pcl_reg\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_low|ALT_INV_pcl_reg\(1),
	combout => \program_counter_low|reg_pcl_select[1]~feeder_combout\);

-- Location: IOIBUF_X4_Y0_N1
\i_test_vector[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(19),
	o => \i_test_vector[19]~input_o\);

-- Location: LABCELL_X13_Y3_N39
\adl_bus[1]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[1]~9_combout\ = ( adl_bus(7) & ( \i_test_vector[19]~input_o\ ) ) # ( !adl_bus(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[19]~input_o\,
	dataf => ALT_INV_adl_bus(7),
	combout => \adl_bus[1]~9_combout\);

-- Location: FF_X13_Y3_N40
\adl_bus[1]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \adl_bus[1]~en_q\);

-- Location: IOIBUF_X18_Y0_N41
\io_data_bus[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(1),
	o => \io_data_bus[1]~input_o\);

-- Location: FF_X16_Y3_N53
\input_data_latch|reg_dl[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[1]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(1));

-- Location: LABCELL_X13_Y3_N0
\adl_bus[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[1]~1_combout\ = ( \adl_bus[1]~en_q\ & ( \input_data_latch|reg_dl\(1) & ( (((\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(1))) # (\i_test_vector[1]~input_o\)) # (adl_bus(7)) ) ) ) # ( !\adl_bus[1]~en_q\ & ( 
-- \input_data_latch|reg_dl\(1) & ( ((\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(1))) # (\i_test_vector[1]~input_o\) ) ) ) # ( \adl_bus[1]~en_q\ & ( !\input_data_latch|reg_dl\(1) & ( ((\i_test_vector[11]~input_o\ & 
-- \program_counter_low|pcl_reg\(1))) # (adl_bus(7)) ) ) ) # ( !\adl_bus[1]~en_q\ & ( !\input_data_latch|reg_dl\(1) & ( (\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101001101110011011100000101111111110011011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[11]~input_o\,
	datab => ALT_INV_adl_bus(7),
	datac => \program_counter_low|ALT_INV_pcl_reg\(1),
	datad => \ALT_INV_i_test_vector[1]~input_o\,
	datae => \ALT_INV_adl_bus[1]~en_q\,
	dataf => \input_data_latch|ALT_INV_reg_dl\(1),
	combout => \adl_bus[1]~1_combout\);

-- Location: FF_X13_Y3_N8
\program_counter_low|reg_pcl_select[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[1]~feeder_combout\,
	asdata => \adl_bus[1]~1_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(1));

-- Location: LABCELL_X17_Y3_N6
\program_counter_low|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~9_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(2) ) + ( GND ) + ( \program_counter_low|Add0~6\ ))
-- \program_counter_low|Add0~10\ = CARRY(( \program_counter_low|reg_pcl_select\(2) ) + ( GND ) + ( \program_counter_low|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(2),
	cin => \program_counter_low|Add0~6\,
	sumout => \program_counter_low|Add0~9_sumout\,
	cout => \program_counter_low|Add0~10\);

-- Location: FF_X17_Y3_N8
\program_counter_low|pcl_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~9_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(2),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(2));

-- Location: LABCELL_X12_Y3_N42
\program_counter_low|reg_pcl_select[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[2]~feeder_combout\ = ( \program_counter_low|pcl_reg\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \program_counter_low|ALT_INV_pcl_reg\(2),
	combout => \program_counter_low|reg_pcl_select[2]~feeder_combout\);

-- Location: IOIBUF_X16_Y0_N52
\io_data_bus[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(2),
	o => \io_data_bus[2]~input_o\);

-- Location: FF_X16_Y3_N50
\input_data_latch|reg_dl[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[2]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(2));

-- Location: IOIBUF_X6_Y0_N52
\i_test_vector[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(20),
	o => \i_test_vector[20]~input_o\);

-- Location: LABCELL_X12_Y3_N57
\adl_bus[2]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[2]~10_combout\ = ( adl_bus(7) & ( \i_test_vector[20]~input_o\ ) ) # ( !adl_bus(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000011110000111111111111111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[20]~input_o\,
	datae => ALT_INV_adl_bus(7),
	combout => \adl_bus[2]~10_combout\);

-- Location: FF_X12_Y3_N58
\adl_bus[2]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \adl_bus[2]~en_q\);

-- Location: LABCELL_X12_Y3_N24
\adl_bus[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[2]~2_combout\ = ( \input_data_latch|reg_dl\(2) & ( \adl_bus[2]~en_q\ & ( (((\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(2))) # (\i_test_vector[1]~input_o\)) # (adl_bus(7)) ) ) ) # ( !\input_data_latch|reg_dl\(2) & ( 
-- \adl_bus[2]~en_q\ & ( ((\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(2))) # (adl_bus(7)) ) ) ) # ( \input_data_latch|reg_dl\(2) & ( !\adl_bus[2]~en_q\ & ( ((\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(2))) # 
-- (\i_test_vector[1]~input_o\) ) ) ) # ( !\input_data_latch|reg_dl\(2) & ( !\adl_bus[2]~en_q\ & ( (\i_test_vector[11]~input_o\ & \program_counter_low|pcl_reg\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100011111111100011111000111110001111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[11]~input_o\,
	datab => \program_counter_low|ALT_INV_pcl_reg\(2),
	datac => ALT_INV_adl_bus(7),
	datad => \ALT_INV_i_test_vector[1]~input_o\,
	datae => \input_data_latch|ALT_INV_reg_dl\(2),
	dataf => \ALT_INV_adl_bus[2]~en_q\,
	combout => \adl_bus[2]~2_combout\);

-- Location: FF_X12_Y3_N44
\program_counter_low|reg_pcl_select[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[2]~feeder_combout\,
	asdata => \adl_bus[2]~2_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(2));

-- Location: LABCELL_X17_Y3_N9
\program_counter_low|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~13_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(3) ) + ( GND ) + ( \program_counter_low|Add0~10\ ))
-- \program_counter_low|Add0~14\ = CARRY(( \program_counter_low|reg_pcl_select\(3) ) + ( GND ) + ( \program_counter_low|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(3),
	cin => \program_counter_low|Add0~10\,
	sumout => \program_counter_low|Add0~13_sumout\,
	cout => \program_counter_low|Add0~14\);

-- Location: FF_X17_Y3_N11
\program_counter_low|pcl_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~13_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(3),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(3));

-- Location: LABCELL_X13_Y3_N45
\program_counter_low|reg_pcl_select[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[3]~feeder_combout\ = \program_counter_low|pcl_reg\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_pcl_reg\(3),
	combout => \program_counter_low|reg_pcl_select[3]~feeder_combout\);

-- Location: IOIBUF_X6_Y0_N1
\i_test_vector[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(4),
	o => \i_test_vector[4]~input_o\);

-- Location: LABCELL_X13_Y3_N36
\adl_bus[3]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[3]~11_combout\ = ( \i_test_vector[16]~input_o\ & ( !adl_bus(7) ) ) # ( !\i_test_vector[16]~input_o\ & ( (!adl_bus(7)) # (\i_test_vector[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111111001111110011111100111111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_adl_bus(7),
	datac => \ALT_INV_i_test_vector[4]~input_o\,
	dataf => \ALT_INV_i_test_vector[16]~input_o\,
	combout => \adl_bus[3]~11_combout\);

-- Location: FF_X13_Y3_N38
\adl_bus[3]~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \adl_bus[3]~en_q\);

-- Location: IOIBUF_X16_Y0_N18
\io_data_bus[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(3),
	o => \io_data_bus[3]~input_o\);

-- Location: FF_X16_Y3_N11
\input_data_latch|reg_dl[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[3]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(3));

-- Location: LABCELL_X13_Y3_N21
\adl_bus[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[3]~3_combout\ = ( \program_counter_low|pcl_reg\(3) & ( \input_data_latch|reg_dl\(3) & ( (((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\)) # (\i_test_vector[1]~input_o\) ) ) ) # ( !\program_counter_low|pcl_reg\(3) & ( 
-- \input_data_latch|reg_dl\(3) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[1]~input_o\) ) ) ) # ( \program_counter_low|pcl_reg\(3) & ( !\input_data_latch|reg_dl\(3) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\) ) ) ) # 
-- ( !\program_counter_low|pcl_reg\(3) & ( !\input_data_latch|reg_dl\(3) & ( (\adl_bus[3]~en_q\ & adl_bus(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001011111111100110111001101110011011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adl_bus[3]~en_q\,
	datab => \ALT_INV_i_test_vector[1]~input_o\,
	datac => ALT_INV_adl_bus(7),
	datad => \ALT_INV_i_test_vector[11]~input_o\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(3),
	dataf => \input_data_latch|ALT_INV_reg_dl\(3),
	combout => \adl_bus[3]~3_combout\);

-- Location: FF_X13_Y3_N47
\program_counter_low|reg_pcl_select[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[3]~feeder_combout\,
	asdata => \adl_bus[3]~3_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(3));

-- Location: LABCELL_X17_Y3_N12
\program_counter_low|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~17_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(4) ) + ( GND ) + ( \program_counter_low|Add0~14\ ))
-- \program_counter_low|Add0~18\ = CARRY(( \program_counter_low|reg_pcl_select\(4) ) + ( GND ) + ( \program_counter_low|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(4),
	cin => \program_counter_low|Add0~14\,
	sumout => \program_counter_low|Add0~17_sumout\,
	cout => \program_counter_low|Add0~18\);

-- Location: FF_X17_Y3_N14
\program_counter_low|pcl_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~17_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(4),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(4));

-- Location: LABCELL_X13_Y3_N30
\program_counter_low|reg_pcl_select[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[4]~feeder_combout\ = \program_counter_low|pcl_reg\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \program_counter_low|ALT_INV_pcl_reg\(4),
	combout => \program_counter_low|reg_pcl_select[4]~feeder_combout\);

-- Location: IOIBUF_X18_Y0_N92
\io_data_bus[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(4),
	o => \io_data_bus[4]~input_o\);

-- Location: FF_X17_Y3_N35
\input_data_latch|reg_dl[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[4]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(4));

-- Location: LABCELL_X13_Y3_N12
\adl_bus[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[4]~4_combout\ = ( \adl_bus[3]~en_q\ & ( \program_counter_low|pcl_reg\(4) & ( (((\input_data_latch|reg_dl\(4) & \i_test_vector[1]~input_o\)) # (adl_bus(7))) # (\i_test_vector[11]~input_o\) ) ) ) # ( !\adl_bus[3]~en_q\ & ( 
-- \program_counter_low|pcl_reg\(4) & ( ((\input_data_latch|reg_dl\(4) & \i_test_vector[1]~input_o\)) # (\i_test_vector[11]~input_o\) ) ) ) # ( \adl_bus[3]~en_q\ & ( !\program_counter_low|pcl_reg\(4) & ( ((\input_data_latch|reg_dl\(4) & 
-- \i_test_vector[1]~input_o\)) # (adl_bus(7)) ) ) ) # ( !\adl_bus[3]~en_q\ & ( !\program_counter_low|pcl_reg\(4) & ( (\input_data_latch|reg_dl\(4) & \i_test_vector[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100011111111100011111000111110001111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_data_latch|ALT_INV_reg_dl\(4),
	datab => \ALT_INV_i_test_vector[1]~input_o\,
	datac => \ALT_INV_i_test_vector[11]~input_o\,
	datad => ALT_INV_adl_bus(7),
	datae => \ALT_INV_adl_bus[3]~en_q\,
	dataf => \program_counter_low|ALT_INV_pcl_reg\(4),
	combout => \adl_bus[4]~4_combout\);

-- Location: FF_X13_Y3_N32
\program_counter_low|reg_pcl_select[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[4]~feeder_combout\,
	asdata => \adl_bus[4]~4_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(4));

-- Location: LABCELL_X17_Y3_N15
\program_counter_low|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~21_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(5) ) + ( GND ) + ( \program_counter_low|Add0~18\ ))
-- \program_counter_low|Add0~22\ = CARRY(( \program_counter_low|reg_pcl_select\(5) ) + ( GND ) + ( \program_counter_low|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(5),
	cin => \program_counter_low|Add0~18\,
	sumout => \program_counter_low|Add0~21_sumout\,
	cout => \program_counter_low|Add0~22\);

-- Location: FF_X17_Y3_N17
\program_counter_low|pcl_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~21_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(5),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(5));

-- Location: LABCELL_X13_Y3_N33
\program_counter_low|reg_pcl_select[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[5]~feeder_combout\ = \program_counter_low|pcl_reg\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_pcl_reg\(5),
	combout => \program_counter_low|reg_pcl_select[5]~feeder_combout\);

-- Location: IOIBUF_X18_Y0_N75
\io_data_bus[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(5),
	o => \io_data_bus[5]~input_o\);

-- Location: FF_X17_Y3_N50
\input_data_latch|reg_dl[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[5]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(5));

-- Location: LABCELL_X13_Y3_N51
\adl_bus[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[5]~5_combout\ = ( \program_counter_low|pcl_reg\(5) & ( \input_data_latch|reg_dl\(5) & ( (((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\)) # (\i_test_vector[1]~input_o\) ) ) ) # ( !\program_counter_low|pcl_reg\(5) & ( 
-- \input_data_latch|reg_dl\(5) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[1]~input_o\) ) ) ) # ( \program_counter_low|pcl_reg\(5) & ( !\input_data_latch|reg_dl\(5) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\) ) ) ) # 
-- ( !\program_counter_low|pcl_reg\(5) & ( !\input_data_latch|reg_dl\(5) & ( (\adl_bus[3]~en_q\ & adl_bus(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100011111111100011111000111110001111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adl_bus[3]~en_q\,
	datab => ALT_INV_adl_bus(7),
	datac => \ALT_INV_i_test_vector[1]~input_o\,
	datad => \ALT_INV_i_test_vector[11]~input_o\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(5),
	dataf => \input_data_latch|ALT_INV_reg_dl\(5),
	combout => \adl_bus[5]~5_combout\);

-- Location: FF_X13_Y3_N35
\program_counter_low|reg_pcl_select[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[5]~feeder_combout\,
	asdata => \adl_bus[5]~5_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(5));

-- Location: LABCELL_X17_Y3_N18
\program_counter_low|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~25_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(6) ) + ( GND ) + ( \program_counter_low|Add0~22\ ))
-- \program_counter_low|Add0~26\ = CARRY(( \program_counter_low|reg_pcl_select\(6) ) + ( GND ) + ( \program_counter_low|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_low|ALT_INV_reg_pcl_select\(6),
	cin => \program_counter_low|Add0~22\,
	sumout => \program_counter_low|Add0~25_sumout\,
	cout => \program_counter_low|Add0~26\);

-- Location: FF_X17_Y3_N20
\program_counter_low|pcl_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~25_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(6),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(6));

-- Location: LABCELL_X13_Y3_N54
\program_counter_low|reg_pcl_select[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[6]~feeder_combout\ = \program_counter_low|pcl_reg\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_pcl_reg\(6),
	combout => \program_counter_low|reg_pcl_select[6]~feeder_combout\);

-- Location: IOIBUF_X16_Y0_N35
\io_data_bus[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(6),
	o => \io_data_bus[6]~input_o\);

-- Location: FF_X16_Y3_N5
\input_data_latch|reg_dl[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[6]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(6));

-- Location: LABCELL_X13_Y3_N18
\adl_bus[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[6]~6_combout\ = ( \program_counter_low|pcl_reg\(6) & ( \input_data_latch|reg_dl\(6) & ( (((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\)) # (\i_test_vector[1]~input_o\) ) ) ) # ( !\program_counter_low|pcl_reg\(6) & ( 
-- \input_data_latch|reg_dl\(6) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[1]~input_o\) ) ) ) # ( \program_counter_low|pcl_reg\(6) & ( !\input_data_latch|reg_dl\(6) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\) ) ) ) # 
-- ( !\program_counter_low|pcl_reg\(6) & ( !\input_data_latch|reg_dl\(6) & ( (\adl_bus[3]~en_q\ & adl_bus(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000011110101111100110011011101110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adl_bus[3]~en_q\,
	datab => \ALT_INV_i_test_vector[1]~input_o\,
	datac => \ALT_INV_i_test_vector[11]~input_o\,
	datad => ALT_INV_adl_bus(7),
	datae => \program_counter_low|ALT_INV_pcl_reg\(6),
	dataf => \input_data_latch|ALT_INV_reg_dl\(6),
	combout => \adl_bus[6]~6_combout\);

-- Location: FF_X13_Y3_N56
\program_counter_low|reg_pcl_select[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[6]~feeder_combout\,
	asdata => \adl_bus[6]~6_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(6));

-- Location: LABCELL_X17_Y3_N21
\program_counter_low|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|Add0~29_sumout\ = SUM(( \program_counter_low|reg_pcl_select\(7) ) + ( GND ) + ( \program_counter_low|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(7),
	cin => \program_counter_low|Add0~26\,
	sumout => \program_counter_low|Add0~29_sumout\);

-- Location: FF_X17_Y3_N23
\program_counter_low|pcl_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|Add0~29_sumout\,
	asdata => \program_counter_low|reg_pcl_select\(7),
	sload => \ALT_INV_i_test_vector[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|pcl_reg\(7));

-- Location: LABCELL_X13_Y3_N42
\program_counter_low|reg_pcl_select[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|reg_pcl_select[7]~feeder_combout\ = \program_counter_low|pcl_reg\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_low|ALT_INV_pcl_reg\(7),
	combout => \program_counter_low|reg_pcl_select[7]~feeder_combout\);

-- Location: IOIBUF_X18_Y0_N58
\io_data_bus[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io_data_bus(7),
	o => \io_data_bus[7]~input_o\);

-- Location: FF_X17_Y3_N53
\input_data_latch|reg_dl[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \io_data_bus[7]~input_o\,
	sload => VCC,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \input_data_latch|reg_dl\(7));

-- Location: LABCELL_X13_Y3_N48
\adl_bus[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \adl_bus[7]~7_combout\ = ( \program_counter_low|pcl_reg\(7) & ( \input_data_latch|reg_dl\(7) & ( (((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[1]~input_o\)) # (\i_test_vector[11]~input_o\) ) ) ) # ( !\program_counter_low|pcl_reg\(7) & ( 
-- \input_data_latch|reg_dl\(7) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[1]~input_o\) ) ) ) # ( \program_counter_low|pcl_reg\(7) & ( !\input_data_latch|reg_dl\(7) & ( ((\adl_bus[3]~en_q\ & adl_bus(7))) # (\i_test_vector[11]~input_o\) ) ) ) # 
-- ( !\program_counter_low|pcl_reg\(7) & ( !\input_data_latch|reg_dl\(7) & ( (\adl_bus[3]~en_q\ & adl_bus(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000111110001111100010001111111110001111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adl_bus[3]~en_q\,
	datab => ALT_INV_adl_bus(7),
	datac => \ALT_INV_i_test_vector[11]~input_o\,
	datad => \ALT_INV_i_test_vector[1]~input_o\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(7),
	dataf => \input_data_latch|ALT_INV_reg_dl\(7),
	combout => \adl_bus[7]~7_combout\);

-- Location: FF_X13_Y3_N44
\program_counter_low|reg_pcl_select[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|reg_pcl_select[7]~feeder_combout\,
	asdata => \adl_bus[7]~7_combout\,
	sload => \ALT_INV_i_test_vector[7]~input_o\,
	ena => \program_counter_low|reg_pcl_select[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|reg_pcl_select\(7));

-- Location: LABCELL_X13_Y3_N9
\program_counter_low|o_carry~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|o_carry~0_combout\ = ( \program_counter_low|reg_pcl_select\(2) & ( (\program_counter_low|reg_pcl_select\(5) & (\i_test_vector[9]~input_o\ & (\program_counter_low|reg_pcl_select\(3) & \program_counter_low|reg_pcl_select\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_reg_pcl_select\(5),
	datab => \ALT_INV_i_test_vector[9]~input_o\,
	datac => \program_counter_low|ALT_INV_reg_pcl_select\(3),
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(4),
	dataf => \program_counter_low|ALT_INV_reg_pcl_select\(2),
	combout => \program_counter_low|o_carry~0_combout\);

-- Location: MLABCELL_X15_Y3_N6
\program_counter_low|o_carry~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_low|o_carry~1_combout\ = ( \program_counter_low|o_carry~0_combout\ & ( (\program_counter_low|reg_pcl_select\(6) & (\program_counter_low|reg_pcl_select\(0) & (\program_counter_low|reg_pcl_select\(7) & 
-- \program_counter_low|reg_pcl_select\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_reg_pcl_select\(6),
	datab => \program_counter_low|ALT_INV_reg_pcl_select\(0),
	datac => \program_counter_low|ALT_INV_reg_pcl_select\(7),
	datad => \program_counter_low|ALT_INV_reg_pcl_select\(1),
	dataf => \program_counter_low|ALT_INV_o_carry~0_combout\,
	combout => \program_counter_low|o_carry~1_combout\);

-- Location: FF_X15_Y3_N7
\program_counter_low|o_carry\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_low|o_carry~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_low|o_carry~q\);

-- Location: MLABCELL_X15_Y3_N30
\program_counter_high|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~1_sumout\ = SUM(( \program_counter_low|o_carry~q\ ) + ( \program_counter_high|reg_pch_select\(0) ) + ( !VCC ))
-- \program_counter_high|Add0~2\ = CARRY(( \program_counter_low|o_carry~q\ ) + ( \program_counter_high|reg_pch_select\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch_select\(0),
	datad => \program_counter_low|ALT_INV_o_carry~q\,
	cin => GND,
	sumout => \program_counter_high|Add0~1_sumout\,
	cout => \program_counter_high|Add0~2\);

-- Location: FF_X15_Y3_N32
\program_counter_high|reg_pch[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(0));

-- Location: IOIBUF_X20_Y0_N1
\i_test_vector[46]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(46),
	o => \i_test_vector[46]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\i_test_vector[47]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(47),
	o => \i_test_vector[47]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\i_test_vector[49]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(49),
	o => \i_test_vector[49]~input_o\);

-- Location: IOIBUF_X14_Y0_N35
\i_test_vector[48]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(48),
	o => \i_test_vector[48]~input_o\);

-- Location: MLABCELL_X15_Y2_N51
\p_register|reg_p~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~0_combout\ = ( !\i_test_vector[48]~input_o\ & ( !\p_register|reg_p\(0) & ( (!\i_test_vector[47]~input_o\ & !\i_test_vector[49]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[47]~input_o\,
	datac => \ALT_INV_i_test_vector[49]~input_o\,
	datae => \ALT_INV_i_test_vector[48]~input_o\,
	dataf => \p_register|ALT_INV_reg_p\(0),
	combout => \p_register|reg_p~0_combout\);

-- Location: MLABCELL_X15_Y3_N12
\p_register|reg_p~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~1_combout\ = ( \i_test_vector[47]~input_o\ & ( !\p_register|reg_p~0_combout\ & ( (\d_bus[0]~1_combout\ & (!\d_bus[0]~0_combout\ & ((!\i_test_vector[10]~input_o\) # (!\program_counter_low|pcl_reg\(0))))) ) ) ) # ( 
-- !\i_test_vector[47]~input_o\ & ( !\p_register|reg_p~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111010100000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~1_combout\,
	datab => \ALT_INV_i_test_vector[10]~input_o\,
	datac => \ALT_INV_d_bus[0]~0_combout\,
	datad => \program_counter_low|ALT_INV_pcl_reg\(0),
	datae => \ALT_INV_i_test_vector[47]~input_o\,
	dataf => \p_register|ALT_INV_reg_p~0_combout\,
	combout => \p_register|reg_p~1_combout\);

-- Location: FF_X15_Y3_N14
\p_register|reg_p[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(0));

-- Location: MLABCELL_X15_Y3_N54
\d_bus[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[0]~0_combout\ = ( \p_register|reg_p\(0) & ( (\i_test_vector[14]~input_o\ & \program_counter_high|reg_pch\(0)) ) ) # ( !\p_register|reg_p\(0) & ( ((\i_test_vector[14]~input_o\ & \program_counter_high|reg_pch\(0))) # (\i_test_vector[46]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[14]~input_o\,
	datab => \program_counter_high|ALT_INV_reg_pch\(0),
	datac => \ALT_INV_i_test_vector[46]~input_o\,
	dataf => \p_register|ALT_INV_reg_p\(0),
	combout => \d_bus[0]~0_combout\);

-- Location: MLABCELL_X15_Y3_N27
\d_bus[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[0]~2_combout\ = ( \program_counter_low|pcl_reg\(0) & ( (!\d_bus[0]~1_combout\) # ((\d_bus[0]~0_combout\) # (\i_test_vector[10]~input_o\)) ) ) # ( !\program_counter_low|pcl_reg\(0) & ( (!\d_bus[0]~1_combout\) # (\d_bus[0]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111111101010101111111110101111111111111010111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~1_combout\,
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datad => \ALT_INV_d_bus[0]~0_combout\,
	dataf => \program_counter_low|ALT_INV_pcl_reg\(0),
	combout => \d_bus[0]~2_combout\);

-- Location: FF_X15_Y3_N28
\data_output_register_buffer|reg_data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[0]~2_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(0));

-- Location: IOIBUF_X34_Y0_N92
\i_test_vector[60]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(60),
	o => \i_test_vector[60]~input_o\);

-- Location: LABCELL_X19_Y1_N24
\data_output_register_buffer|o_data_bus~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_output_register_buffer|o_data_bus~0_combout\ = ( !\i_test_vector[60]~input_o\ & ( !adl_bus(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_i_test_vector[60]~input_o\,
	dataf => ALT_INV_adl_bus(7),
	combout => \data_output_register_buffer|o_data_bus~0_combout\);

-- Location: LABCELL_X16_Y3_N42
\d_bus[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[1]~4_combout\ = ( \input_data_latch|reg_dl\(1) & ( (((\i_test_vector[40]~input_o\ & \ac_register|reg_ac\(0))) # (\i_test_vector[0]~input_o\)) # (\d_bus[0]~en_q\) ) ) # ( !\input_data_latch|reg_dl\(1) & ( ((\i_test_vector[40]~input_o\ & 
-- \ac_register|reg_ac\(0))) # (\d_bus[0]~en_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011111010101010101111101110111011111110111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~en_q\,
	datab => \ALT_INV_i_test_vector[0]~input_o\,
	datac => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \ac_register|ALT_INV_reg_ac\(0),
	dataf => \input_data_latch|ALT_INV_reg_dl\(1),
	combout => \d_bus[1]~4_combout\);

-- Location: IOIBUF_X26_Y0_N41
\i_test_vector[51]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(51),
	o => \i_test_vector[51]~input_o\);

-- Location: IOIBUF_X34_Y0_N41
\i_test_vector[50]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(50),
	o => \i_test_vector[50]~input_o\);

-- Location: MLABCELL_X15_Y3_N3
\p_register|reg_p~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~2_combout\ = (\i_test_vector[51]~input_o\ & !\i_test_vector[50]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[51]~input_o\,
	datad => \ALT_INV_i_test_vector[50]~input_o\,
	combout => \p_register|reg_p~2_combout\);

-- Location: LABCELL_X16_Y3_N33
\d_bus[0]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[0]~24_combout\ = ( \program_counter_low|pcl_reg\(0) & ( \i_test_vector[10]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	dataf => \program_counter_low|ALT_INV_pcl_reg\(0),
	combout => \d_bus[0]~24_combout\);

-- Location: LABCELL_X16_Y2_N57
\program_counter_high|reg_pch_select[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[1]~feeder_combout\ = \program_counter_high|reg_pch[1]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch[1]~DUPLICATE_q\,
	combout => \program_counter_high|reg_pch_select[1]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N27
\adh_bus[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[1]~1_combout\ = ( \input_data_latch|reg_dl\(1) & ( ((!\i_test_vector[15]~input_o\) # (\program_counter_high|reg_pch[1]~DUPLICATE_q\)) # (\i_test_vector[2]~input_o\) ) ) # ( !\input_data_latch|reg_dl\(1) & ( (!\i_test_vector[2]~input_o\ & 
-- ((!\i_test_vector[15]~input_o\) # (\program_counter_high|reg_pch[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010101010100010001010101011011101111111111101110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datad => \program_counter_high|ALT_INV_reg_pch[1]~DUPLICATE_q\,
	dataf => \input_data_latch|ALT_INV_reg_dl\(1),
	combout => \adh_bus[1]~1_combout\);

-- Location: FF_X16_Y2_N58
\program_counter_high|reg_pch_select[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[1]~feeder_combout\,
	asdata => \adh_bus[1]~1_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(1));

-- Location: MLABCELL_X15_Y3_N33
\program_counter_high|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~5_sumout\ = SUM(( \program_counter_high|reg_pch_select\(1) ) + ( GND ) + ( \program_counter_high|Add0~2\ ))
-- \program_counter_high|Add0~6\ = CARRY(( \program_counter_high|reg_pch_select\(1) ) + ( GND ) + ( \program_counter_high|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_high|ALT_INV_reg_pch_select\(1),
	cin => \program_counter_high|Add0~2\,
	sumout => \program_counter_high|Add0~5_sumout\,
	cout => \program_counter_high|Add0~6\);

-- Location: FF_X15_Y3_N34
\program_counter_high|reg_pch[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch[1]~DUPLICATE_q\);

-- Location: LABCELL_X18_Y3_N30
\d_bus[1]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[1]~25_combout\ = ( \program_counter_high|reg_pch[1]~DUPLICATE_q\ & ( \p_register|reg_p\(1) & ( (!\i_test_vector[14]~input_o\ & ((!\i_test_vector[10]~input_o\) # (!\program_counter_low|pcl_reg\(1)))) ) ) ) # ( 
-- !\program_counter_high|reg_pch[1]~DUPLICATE_q\ & ( \p_register|reg_p\(1) & ( (!\i_test_vector[10]~input_o\) # (!\program_counter_low|pcl_reg\(1)) ) ) ) # ( \program_counter_high|reg_pch[1]~DUPLICATE_q\ & ( !\p_register|reg_p\(1) & ( 
-- (!\i_test_vector[46]~input_o\ & (!\i_test_vector[14]~input_o\ & ((!\i_test_vector[10]~input_o\) # (!\program_counter_low|pcl_reg\(1))))) ) ) ) # ( !\program_counter_high|reg_pch[1]~DUPLICATE_q\ & ( !\p_register|reg_p\(1) & ( (!\i_test_vector[46]~input_o\ 
-- & ((!\i_test_vector[10]~input_o\) # (!\program_counter_low|pcl_reg\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010001000101000001000000011111111110011001111000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[46]~input_o\,
	datab => \ALT_INV_i_test_vector[10]~input_o\,
	datac => \ALT_INV_i_test_vector[14]~input_o\,
	datad => \program_counter_low|ALT_INV_pcl_reg\(1),
	datae => \program_counter_high|ALT_INV_reg_pch[1]~DUPLICATE_q\,
	dataf => \p_register|ALT_INV_reg_p\(1),
	combout => \d_bus[1]~25_combout\);

-- Location: LABCELL_X16_Y3_N51
\p_register|reg_p~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~3_combout\ = ( !\d_bus[0]~24_combout\ & ( \d_bus[1]~25_combout\ & ( (!\d_bus[0]~0_combout\ & (!\d_bus[1]~4_combout\ & (\p_register|reg_p~2_combout\ & \d_bus[0]~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~0_combout\,
	datab => \ALT_INV_d_bus[1]~4_combout\,
	datac => \p_register|ALT_INV_reg_p~2_combout\,
	datad => \ALT_INV_d_bus[0]~1_combout\,
	datae => \ALT_INV_d_bus[0]~24_combout\,
	dataf => \ALT_INV_d_bus[1]~25_combout\,
	combout => \p_register|reg_p~3_combout\);

-- Location: LABCELL_X16_Y3_N12
\p_register|reg_p~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~17_combout\ = ( !\i_test_vector[50]~input_o\ & ( (((!\i_test_vector[51]~input_o\ & ((!\p_register|reg_p\(1)))))) ) ) # ( \i_test_vector[50]~input_o\ & ( (((\program_counter_low|pcl_reg\(1) & (\i_test_vector[10]~input_o\))) # 
-- (\d_bus[1]~3_combout\)) # (\d_bus[1]~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1111000011110000001101111111111100000000000000000011011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_pcl_reg\(1),
	datab => \ALT_INV_d_bus[1]~4_combout\,
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datad => \ALT_INV_d_bus[1]~3_combout\,
	datae => \ALT_INV_i_test_vector[50]~input_o\,
	dataf => \p_register|ALT_INV_reg_p\(1),
	datag => \ALT_INV_i_test_vector[51]~input_o\,
	combout => \p_register|reg_p~17_combout\);

-- Location: IOIBUF_X36_Y0_N52
\i_test_vector[56]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(56),
	o => \i_test_vector[56]~input_o\);

-- Location: LABCELL_X16_Y2_N18
\program_counter_high|reg_pch_select[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[2]~feeder_combout\ = ( \program_counter_high|reg_pch\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \program_counter_high|ALT_INV_reg_pch\(2),
	combout => \program_counter_high|reg_pch_select[2]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N6
\adh_bus[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[2]~2_combout\ = ( \program_counter_high|reg_pch\(2) & ( (!\i_test_vector[2]~input_o\) # (\input_data_latch|reg_dl\(2)) ) ) # ( !\program_counter_high|reg_pch\(2) & ( (!\i_test_vector[2]~input_o\ & (!\i_test_vector[15]~input_o\)) # 
-- (\i_test_vector[2]~input_o\ & ((\input_data_latch|reg_dl\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100011011101100010001101110110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datad => \input_data_latch|ALT_INV_reg_dl\(2),
	dataf => \program_counter_high|ALT_INV_reg_pch\(2),
	combout => \adh_bus[2]~2_combout\);

-- Location: FF_X16_Y2_N19
\program_counter_high|reg_pch_select[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[2]~feeder_combout\,
	asdata => \adh_bus[2]~2_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(2));

-- Location: MLABCELL_X15_Y3_N36
\program_counter_high|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~9_sumout\ = SUM(( \program_counter_high|reg_pch_select\(2) ) + ( GND ) + ( \program_counter_high|Add0~6\ ))
-- \program_counter_high|Add0~10\ = CARRY(( \program_counter_high|reg_pch_select\(2) ) + ( GND ) + ( \program_counter_high|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_high|ALT_INV_reg_pch_select\(2),
	cin => \program_counter_high|Add0~6\,
	sumout => \program_counter_high|Add0~9_sumout\,
	cout => \program_counter_high|Add0~10\);

-- Location: FF_X15_Y3_N37
\program_counter_high|reg_pch[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(2));

-- Location: LABCELL_X16_Y3_N0
\d_bus[2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[2]~6_combout\ = ( \i_test_vector[46]~input_o\ & ( (!\p_register|reg_p\(2)) # ((\i_test_vector[14]~input_o\ & \program_counter_high|reg_pch\(2))) ) ) # ( !\i_test_vector[46]~input_o\ & ( (\i_test_vector[14]~input_o\ & 
-- \program_counter_high|reg_pch\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111111111000000111111111100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[14]~input_o\,
	datac => \program_counter_high|ALT_INV_reg_pch\(2),
	datad => \p_register|ALT_INV_reg_p\(2),
	dataf => \ALT_INV_i_test_vector[46]~input_o\,
	combout => \d_bus[2]~6_combout\);

-- Location: IOIBUF_X28_Y0_N1
\i_test_vector[52]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(52),
	o => \i_test_vector[52]~input_o\);

-- Location: LABCELL_X16_Y3_N45
\d_bus[2]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[2]~7_combout\ = ( \input_data_latch|reg_dl\(2) & ( (((\i_test_vector[40]~input_o\ & \ac_register|reg_ac\(0))) # (\i_test_vector[0]~input_o\)) # (\d_bus[0]~en_q\) ) ) # ( !\input_data_latch|reg_dl\(2) & ( ((\i_test_vector[40]~input_o\ & 
-- \ac_register|reg_ac\(0))) # (\d_bus[0]~en_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011111010101010101111101110111011111110111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~en_q\,
	datab => \ALT_INV_i_test_vector[0]~input_o\,
	datac => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \ac_register|ALT_INV_reg_ac\(0),
	dataf => \input_data_latch|ALT_INV_reg_dl\(2),
	combout => \d_bus[2]~7_combout\);

-- Location: IOIBUF_X32_Y0_N52
\i_test_vector[53]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(53),
	o => \i_test_vector[53]~input_o\);

-- Location: LABCELL_X17_Y3_N24
\p_register|reg_p~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~13_combout\ = ( !\i_test_vector[52]~input_o\ & ( (!\p_register|reg_p\(2) & (((!\i_test_vector[53]~input_o\)))) ) ) # ( \i_test_vector[52]~input_o\ & ( ((((\program_counter_low|pcl_reg\(2) & \i_test_vector[10]~input_o\)) # 
-- (\d_bus[2]~7_combout\)) # (\d_bus[2]~6_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1010000010100000000000111111111110100000101000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \p_register|ALT_INV_reg_p\(2),
	datab => \program_counter_low|ALT_INV_pcl_reg\(2),
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datad => \ALT_INV_d_bus[2]~6_combout\,
	datae => \ALT_INV_i_test_vector[52]~input_o\,
	dataf => \ALT_INV_d_bus[2]~7_combout\,
	datag => \ALT_INV_i_test_vector[53]~input_o\,
	combout => \p_register|reg_p~13_combout\);

-- Location: LABCELL_X17_Y3_N54
\p_register|reg_p[2]~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p[2]~23_combout\ = ( !\p_register|reg_p~13_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \p_register|ALT_INV_reg_p~13_combout\,
	combout => \p_register|reg_p[2]~23_combout\);

-- Location: FF_X17_Y3_N56
\p_register|reg_p[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p[2]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(2));

-- Location: IOIBUF_X32_Y0_N18
\i_test_vector[57]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(57),
	o => \i_test_vector[57]~input_o\);

-- Location: IOIBUF_X34_Y0_N58
\i_test_vector[58]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(58),
	o => \i_test_vector[58]~input_o\);

-- Location: LABCELL_X17_Y3_N57
\p_register|reg_p~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~6_combout\ = ( \i_test_vector[58]~input_o\ & ( (!\p_register|reg_p\(2) & (!\i_test_vector[56]~input_o\ & !\i_test_vector[57]~input_o\)) ) ) # ( !\i_test_vector[58]~input_o\ & ( (!\i_test_vector[56]~input_o\ & 
-- (!\i_test_vector[57]~input_o\ & !\p_register|reg_p\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \p_register|ALT_INV_reg_p\(2),
	datab => \ALT_INV_i_test_vector[56]~input_o\,
	datac => \ALT_INV_i_test_vector[57]~input_o\,
	datad => \p_register|ALT_INV_reg_p\(6),
	dataf => \ALT_INV_i_test_vector[58]~input_o\,
	combout => \p_register|reg_p~6_combout\);

-- Location: LABCELL_X16_Y3_N9
\d_bus[6]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[6]~18_combout\ = ( \i_test_vector[40]~input_o\ & ( (!\ac_register|reg_ac\(0) & (!\d_bus[0]~en_q\ & ((!\input_data_latch|reg_dl\(6)) # (!\i_test_vector[0]~input_o\)))) ) ) # ( !\i_test_vector[40]~input_o\ & ( (!\d_bus[0]~en_q\ & 
-- ((!\input_data_latch|reg_dl\(6)) # (!\i_test_vector[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101000000000111110100000000011001000000000001100100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \input_data_latch|ALT_INV_reg_dl\(6),
	datab => \ac_register|ALT_INV_reg_ac\(0),
	datac => \ALT_INV_i_test_vector[0]~input_o\,
	datad => \ALT_INV_d_bus[0]~en_q\,
	dataf => \ALT_INV_i_test_vector[40]~input_o\,
	combout => \d_bus[6]~18_combout\);

-- Location: LABCELL_X17_Y3_N36
\p_register|reg_p~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~7_combout\ = ( \d_bus[6]~18_combout\ & ( \d_bus[6]~17_combout\ & ( (!\i_test_vector[56]~input_o\ & !\p_register|reg_p~6_combout\) ) ) ) # ( !\d_bus[6]~18_combout\ & ( \d_bus[6]~17_combout\ & ( (!\i_test_vector[56]~input_o\ & 
-- !\p_register|reg_p~6_combout\) ) ) ) # ( \d_bus[6]~18_combout\ & ( !\d_bus[6]~17_combout\ & ( (!\p_register|reg_p~6_combout\ & ((!\i_test_vector[10]~input_o\) # ((!\i_test_vector[56]~input_o\) # (!\program_counter_low|pcl_reg\(6))))) ) ) ) # ( 
-- !\d_bus[6]~18_combout\ & ( !\d_bus[6]~17_combout\ & ( (!\i_test_vector[56]~input_o\ & !\p_register|reg_p~6_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000111111100000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	datab => \ALT_INV_i_test_vector[56]~input_o\,
	datac => \program_counter_low|ALT_INV_pcl_reg\(6),
	datad => \p_register|ALT_INV_reg_p~6_combout\,
	datae => \ALT_INV_d_bus[6]~18_combout\,
	dataf => \ALT_INV_d_bus[6]~17_combout\,
	combout => \p_register|reg_p~7_combout\);

-- Location: FF_X17_Y3_N38
\p_register|reg_p[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(6));

-- Location: LABCELL_X16_Y2_N30
\program_counter_high|reg_pch_select[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[6]~feeder_combout\ = \program_counter_high|reg_pch\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch\(6),
	combout => \program_counter_high|reg_pch_select[6]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N36
\adh_bus[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[6]~6_combout\ = ( \program_counter_high|reg_pch\(6) & ( (!\i_test_vector[2]~input_o\) # (\input_data_latch|reg_dl\(6)) ) ) # ( !\program_counter_high|reg_pch\(6) & ( (!\i_test_vector[2]~input_o\ & (!\i_test_vector[15]~input_o\)) # 
-- (\i_test_vector[2]~input_o\ & ((\input_data_latch|reg_dl\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100011011101100010001101110110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datad => \input_data_latch|ALT_INV_reg_dl\(6),
	dataf => \program_counter_high|ALT_INV_reg_pch\(6),
	combout => \adh_bus[6]~6_combout\);

-- Location: FF_X16_Y2_N31
\program_counter_high|reg_pch_select[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[6]~feeder_combout\,
	asdata => \adh_bus[6]~6_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(6));

-- Location: MLABCELL_X15_Y3_N39
\program_counter_high|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~13_sumout\ = SUM(( \program_counter_high|reg_pch_select\(3) ) + ( GND ) + ( \program_counter_high|Add0~10\ ))
-- \program_counter_high|Add0~14\ = CARRY(( \program_counter_high|reg_pch_select\(3) ) + ( GND ) + ( \program_counter_high|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_high|ALT_INV_reg_pch_select\(3),
	cin => \program_counter_high|Add0~10\,
	sumout => \program_counter_high|Add0~13_sumout\,
	cout => \program_counter_high|Add0~14\);

-- Location: FF_X15_Y3_N40
\program_counter_high|reg_pch[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch[3]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y2_N15
\program_counter_high|reg_pch_select[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[3]~feeder_combout\ = \program_counter_high|reg_pch[3]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_high|ALT_INV_reg_pch[3]~DUPLICATE_q\,
	combout => \program_counter_high|reg_pch_select[3]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N9
\adh_bus[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[3]~3_combout\ = ( \program_counter_high|reg_pch[3]~DUPLICATE_q\ & ( (!\i_test_vector[2]~input_o\) # (\input_data_latch|reg_dl\(3)) ) ) # ( !\program_counter_high|reg_pch[3]~DUPLICATE_q\ & ( (!\i_test_vector[2]~input_o\ & 
-- (!\i_test_vector[15]~input_o\)) # (\i_test_vector[2]~input_o\ & ((\input_data_latch|reg_dl\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100011011101100010001101110110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datad => \input_data_latch|ALT_INV_reg_dl\(3),
	dataf => \program_counter_high|ALT_INV_reg_pch[3]~DUPLICATE_q\,
	combout => \adh_bus[3]~3_combout\);

-- Location: FF_X16_Y2_N16
\program_counter_high|reg_pch_select[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[3]~feeder_combout\,
	asdata => \adh_bus[3]~3_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(3));

-- Location: MLABCELL_X15_Y3_N42
\program_counter_high|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~17_sumout\ = SUM(( \program_counter_high|reg_pch_select\(4) ) + ( GND ) + ( \program_counter_high|Add0~14\ ))
-- \program_counter_high|Add0~18\ = CARRY(( \program_counter_high|reg_pch_select\(4) ) + ( GND ) + ( \program_counter_high|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch_select\(4),
	cin => \program_counter_high|Add0~14\,
	sumout => \program_counter_high|Add0~17_sumout\,
	cout => \program_counter_high|Add0~18\);

-- Location: FF_X15_Y3_N44
\program_counter_high|reg_pch[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch[4]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y2_N48
\program_counter_high|reg_pch_select[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[4]~feeder_combout\ = ( \program_counter_high|reg_pch[4]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \program_counter_high|ALT_INV_reg_pch[4]~DUPLICATE_q\,
	combout => \program_counter_high|reg_pch_select[4]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N0
\adh_bus[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[4]~4_combout\ = ( \input_data_latch|reg_dl\(4) & ( \program_counter_high|reg_pch[4]~DUPLICATE_q\ ) ) # ( !\input_data_latch|reg_dl\(4) & ( \program_counter_high|reg_pch[4]~DUPLICATE_q\ & ( !\i_test_vector[2]~input_o\ ) ) ) # ( 
-- \input_data_latch|reg_dl\(4) & ( !\program_counter_high|reg_pch[4]~DUPLICATE_q\ & ( (!\i_test_vector[15]~input_o\) # (\i_test_vector[2]~input_o\) ) ) ) # ( !\input_data_latch|reg_dl\(4) & ( !\program_counter_high|reg_pch[4]~DUPLICATE_q\ & ( 
-- (!\i_test_vector[15]~input_o\ & !\i_test_vector[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110011111100111111110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datac => \ALT_INV_i_test_vector[2]~input_o\,
	datae => \input_data_latch|ALT_INV_reg_dl\(4),
	dataf => \program_counter_high|ALT_INV_reg_pch[4]~DUPLICATE_q\,
	combout => \adh_bus[4]~4_combout\);

-- Location: FF_X16_Y2_N49
\program_counter_high|reg_pch_select[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[4]~feeder_combout\,
	asdata => \adh_bus[4]~4_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(4));

-- Location: MLABCELL_X15_Y3_N45
\program_counter_high|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~21_sumout\ = SUM(( \program_counter_high|reg_pch_select\(5) ) + ( GND ) + ( \program_counter_high|Add0~18\ ))
-- \program_counter_high|Add0~22\ = CARRY(( \program_counter_high|reg_pch_select\(5) ) + ( GND ) + ( \program_counter_high|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch_select\(5),
	cin => \program_counter_high|Add0~18\,
	sumout => \program_counter_high|Add0~21_sumout\,
	cout => \program_counter_high|Add0~22\);

-- Location: FF_X15_Y3_N46
\program_counter_high|reg_pch[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(5));

-- Location: LABCELL_X16_Y2_N51
\program_counter_high|reg_pch_select[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[5]~feeder_combout\ = ( \program_counter_high|reg_pch\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \program_counter_high|ALT_INV_reg_pch\(5),
	combout => \program_counter_high|reg_pch_select[5]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N45
\adh_bus[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[5]~5_combout\ = ( \program_counter_high|reg_pch\(5) & ( (!\i_test_vector[2]~input_o\) # (\input_data_latch|reg_dl\(5)) ) ) # ( !\program_counter_high|reg_pch\(5) & ( (!\i_test_vector[2]~input_o\ & (!\i_test_vector[15]~input_o\)) # 
-- (\i_test_vector[2]~input_o\ & ((\input_data_latch|reg_dl\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011110101101000001111010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datac => \ALT_INV_i_test_vector[15]~input_o\,
	datad => \input_data_latch|ALT_INV_reg_dl\(5),
	dataf => \program_counter_high|ALT_INV_reg_pch\(5),
	combout => \adh_bus[5]~5_combout\);

-- Location: FF_X16_Y2_N52
\program_counter_high|reg_pch_select[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[5]~feeder_combout\,
	asdata => \adh_bus[5]~5_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(5));

-- Location: MLABCELL_X15_Y3_N48
\program_counter_high|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~25_sumout\ = SUM(( \program_counter_high|reg_pch_select\(6) ) + ( GND ) + ( \program_counter_high|Add0~22\ ))
-- \program_counter_high|Add0~26\ = CARRY(( \program_counter_high|reg_pch_select\(6) ) + ( GND ) + ( \program_counter_high|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch_select\(6),
	cin => \program_counter_high|Add0~22\,
	sumout => \program_counter_high|Add0~25_sumout\,
	cout => \program_counter_high|Add0~26\);

-- Location: FF_X15_Y3_N49
\program_counter_high|reg_pch[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(6));

-- Location: LABCELL_X16_Y3_N18
\d_bus[6]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[6]~17_combout\ = ( \i_test_vector[46]~input_o\ & ( (!\p_register|reg_p\(6)) # ((\i_test_vector[14]~input_o\ & \program_counter_high|reg_pch\(6))) ) ) # ( !\i_test_vector[46]~input_o\ & ( (\i_test_vector[14]~input_o\ & 
-- \program_counter_high|reg_pch\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001111110000111100111111000011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[14]~input_o\,
	datac => \p_register|ALT_INV_reg_p\(6),
	datad => \program_counter_high|ALT_INV_reg_pch\(6),
	dataf => \ALT_INV_i_test_vector[46]~input_o\,
	combout => \d_bus[6]~17_combout\);

-- Location: LABCELL_X16_Y3_N21
\d_bus[6]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[6]~19_combout\ = ( \d_bus[6]~18_combout\ & ( ((\program_counter_low|pcl_reg\(6) & \i_test_vector[10]~input_o\)) # (\d_bus[6]~17_combout\) ) ) # ( !\d_bus[6]~18_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101010101010111110101010101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[6]~17_combout\,
	datac => \program_counter_low|ALT_INV_pcl_reg\(6),
	datad => \ALT_INV_i_test_vector[10]~input_o\,
	dataf => \ALT_INV_d_bus[6]~18_combout\,
	combout => \d_bus[6]~19_combout\);

-- Location: LABCELL_X16_Y3_N30
\d_bus[2]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[2]~8_combout\ = ( \d_bus[2]~6_combout\ ) # ( !\d_bus[2]~6_combout\ & ( ((\i_test_vector[10]~input_o\ & \program_counter_low|pcl_reg\(2))) # (\d_bus[2]~7_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	datac => \program_counter_low|ALT_INV_pcl_reg\(2),
	datad => \ALT_INV_d_bus[2]~7_combout\,
	dataf => \ALT_INV_d_bus[2]~6_combout\,
	combout => \d_bus[2]~8_combout\);

-- Location: LABCELL_X16_Y3_N54
\d_bus[3]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[3]~10_combout\ = ( \input_data_latch|reg_dl\(3) & ( (((\i_test_vector[40]~input_o\ & \ac_register|reg_ac\(0))) # (\i_test_vector[0]~input_o\)) # (\d_bus[0]~en_q\) ) ) # ( !\input_data_latch|reg_dl\(3) & ( ((\i_test_vector[40]~input_o\ & 
-- \ac_register|reg_ac\(0))) # (\d_bus[0]~en_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011111010101010101111101110111011111110111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[0]~en_q\,
	datab => \ALT_INV_i_test_vector[0]~input_o\,
	datac => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \ac_register|ALT_INV_reg_ac\(0),
	dataf => \input_data_latch|ALT_INV_reg_dl\(3),
	combout => \d_bus[3]~10_combout\);

-- Location: IOIBUF_X10_Y0_N58
\i_test_vector[54]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(54),
	o => \i_test_vector[54]~input_o\);

-- Location: IOIBUF_X12_Y0_N52
\i_test_vector[55]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(55),
	o => \i_test_vector[55]~input_o\);

-- Location: MLABCELL_X15_Y3_N18
\p_register|reg_p~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~9_combout\ = ( !\i_test_vector[54]~input_o\ & ( (((!\i_test_vector[55]~input_o\ & ((!\p_register|reg_p\(3)))))) ) ) # ( \i_test_vector[54]~input_o\ & ( (((\program_counter_low|pcl_reg\(3) & (\i_test_vector[10]~input_o\))) # 
-- (\d_bus[3]~10_combout\)) # (\d_bus[3]~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1111000011110000010101111111111100000000000000000101011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[3]~9_combout\,
	datab => \program_counter_low|ALT_INV_pcl_reg\(3),
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datad => \ALT_INV_d_bus[3]~10_combout\,
	datae => \ALT_INV_i_test_vector[54]~input_o\,
	dataf => \p_register|ALT_INV_reg_p\(3),
	datag => \ALT_INV_i_test_vector[55]~input_o\,
	combout => \p_register|reg_p~9_combout\);

-- Location: MLABCELL_X15_Y3_N9
\p_register|reg_p[3]~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p[3]~24_combout\ = ( !\p_register|reg_p~9_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \p_register|ALT_INV_reg_p~9_combout\,
	combout => \p_register|reg_p[3]~24_combout\);

-- Location: FF_X15_Y3_N11
\p_register|reg_p[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p[3]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(3));

-- Location: FF_X15_Y3_N41
\program_counter_high|reg_pch[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(3));

-- Location: MLABCELL_X15_Y3_N24
\d_bus[3]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[3]~9_combout\ = ( \program_counter_high|reg_pch\(3) & ( ((!\p_register|reg_p\(3) & \i_test_vector[46]~input_o\)) # (\i_test_vector[14]~input_o\) ) ) # ( !\program_counter_high|reg_pch\(3) & ( (!\p_register|reg_p\(3) & \i_test_vector[46]~input_o\) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001111110011110000111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \p_register|ALT_INV_reg_p\(3),
	datac => \ALT_INV_i_test_vector[14]~input_o\,
	datad => \ALT_INV_i_test_vector[46]~input_o\,
	dataf => \program_counter_high|ALT_INV_reg_pch\(3),
	combout => \d_bus[3]~9_combout\);

-- Location: LABCELL_X16_Y3_N36
\d_bus[3]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[3]~11_combout\ = ( \d_bus[3]~9_combout\ ) # ( !\d_bus[3]~9_combout\ & ( ((\program_counter_low|pcl_reg\(3) & \i_test_vector[10]~input_o\)) # (\d_bus[3]~10_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_pcl_reg\(3),
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datad => \ALT_INV_d_bus[3]~10_combout\,
	dataf => \ALT_INV_d_bus[3]~9_combout\,
	combout => \d_bus[3]~11_combout\);

-- Location: LABCELL_X16_Y3_N39
\d_bus[5]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[5]~15_combout\ = ( !\program_counter_high|reg_pch\(5) & ( \i_test_vector[14]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[14]~input_o\,
	dataf => \program_counter_high|ALT_INV_reg_pch\(5),
	combout => \d_bus[5]~15_combout\);

-- Location: FF_X15_Y3_N43
\program_counter_high|reg_pch[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(4));

-- Location: LABCELL_X16_Y3_N6
\d_bus[4]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[4]~13_combout\ = (\i_test_vector[14]~input_o\ & !\program_counter_high|reg_pch\(4))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[14]~input_o\,
	datad => \program_counter_high|ALT_INV_reg_pch\(4),
	combout => \d_bus[4]~13_combout\);

-- Location: LABCELL_X16_Y2_N33
\program_counter_high|reg_pch_select[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|reg_pch_select[7]~feeder_combout\ = \program_counter_high|reg_pch\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \program_counter_high|ALT_INV_reg_pch\(7),
	combout => \program_counter_high|reg_pch_select[7]~feeder_combout\);

-- Location: LABCELL_X16_Y2_N39
\adh_bus[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \adh_bus[7]~7_combout\ = (!\i_test_vector[2]~input_o\ & ((!\i_test_vector[15]~input_o\) # ((\program_counter_high|reg_pch\(7))))) # (\i_test_vector[2]~input_o\ & (\input_data_latch|reg_dl\(7) & ((!\i_test_vector[15]~input_o\) # 
-- (\program_counter_high|reg_pch\(7)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110010101111100011001010111110001100101011111000110010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[2]~input_o\,
	datab => \ALT_INV_i_test_vector[15]~input_o\,
	datac => \input_data_latch|ALT_INV_reg_dl\(7),
	datad => \program_counter_high|ALT_INV_reg_pch\(7),
	combout => \adh_bus[7]~7_combout\);

-- Location: FF_X16_Y2_N35
\program_counter_high|reg_pch_select[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|reg_pch_select[7]~feeder_combout\,
	asdata => \adh_bus[7]~7_combout\,
	sload => \ALT_INV_i_test_vector[12]~input_o\,
	ena => \program_counter_high|reg_pch_select[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch_select\(7));

-- Location: MLABCELL_X15_Y3_N51
\program_counter_high|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \program_counter_high|Add0~29_sumout\ = SUM(( \program_counter_high|reg_pch_select\(7) ) + ( GND ) + ( \program_counter_high|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \program_counter_high|ALT_INV_reg_pch_select\(7),
	cin => \program_counter_high|Add0~26\,
	sumout => \program_counter_high|Add0~29_sumout\);

-- Location: FF_X15_Y3_N53
\program_counter_high|reg_pch[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(7));

-- Location: LABCELL_X17_Y3_N51
\d_bus[7]~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[7]~26_combout\ = ( \input_data_latch|reg_dl\(7) & ( \program_counter_high|reg_pch\(7) & ( (!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(7)) ) ) ) # ( !\input_data_latch|reg_dl\(7) & ( \program_counter_high|reg_pch\(7) & ( 
-- (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(7)))) ) ) ) # ( \input_data_latch|reg_dl\(7) & ( !\program_counter_high|reg_pch\(7) & ( (!\i_test_vector[14]~input_o\ & ((!\i_test_vector[10]~input_o\) # 
-- (\program_counter_low|pcl_reg\(7)))) ) ) ) # ( !\input_data_latch|reg_dl\(7) & ( !\program_counter_high|reg_pch\(7) & ( (!\i_test_vector[0]~input_o\ & (!\i_test_vector[14]~input_o\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(7))))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000011000000101000001111000010001000110011001010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	datab => \ALT_INV_i_test_vector[0]~input_o\,
	datac => \ALT_INV_i_test_vector[14]~input_o\,
	datad => \program_counter_low|ALT_INV_pcl_reg\(7),
	datae => \input_data_latch|ALT_INV_reg_dl\(7),
	dataf => \program_counter_high|ALT_INV_reg_pch\(7),
	combout => \d_bus[7]~26_combout\);

-- Location: IOIBUF_X24_Y0_N35
\i_test_vector[59]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(59),
	o => \i_test_vector[59]~input_o\);

-- Location: LABCELL_X18_Y3_N42
\p_register|reg_p[7]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p[7]~8_combout\ = ( \p_register|reg_p\(7) & ( \d_bus[7]~21_combout\ ) ) # ( !\p_register|reg_p\(7) & ( \d_bus[7]~21_combout\ & ( \i_test_vector[59]~input_o\ ) ) ) # ( \p_register|reg_p\(7) & ( !\d_bus[7]~21_combout\ & ( 
-- (!\d_bus[7]~26_combout\) # (!\i_test_vector[59]~input_o\) ) ) ) # ( !\p_register|reg_p\(7) & ( !\d_bus[7]~21_combout\ & ( (!\d_bus[7]~26_combout\ & \i_test_vector[59]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010111110101111101000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[7]~26_combout\,
	datac => \ALT_INV_i_test_vector[59]~input_o\,
	datae => \p_register|ALT_INV_reg_p\(7),
	dataf => \ALT_INV_d_bus[7]~21_combout\,
	combout => \p_register|reg_p[7]~8_combout\);

-- Location: FF_X18_Y3_N44
\p_register|reg_p[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p[7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(7));

-- Location: IOIBUF_X30_Y0_N35
\i_test_vector[45]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(45),
	o => \i_test_vector[45]~input_o\);

-- Location: LABCELL_X19_Y3_N54
\x_register|reg_xy[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \x_register|reg_xy[7]~feeder_combout\ = ( \s_bus[7]~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_s_bus[7]~2_combout\,
	combout => \x_register|reg_xy[7]~feeder_combout\);

-- Location: FF_X19_Y3_N56
\x_register|reg_xy[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \x_register|reg_xy[7]~feeder_combout\,
	ena => \i_test_vector[42]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \x_register|reg_xy\(7));

-- Location: FF_X19_Y3_N38
\y_register|reg_xy[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	asdata => \s_bus[7]~2_combout\,
	sload => VCC,
	ena => \i_test_vector[44]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y_register|reg_xy\(7));

-- Location: LABCELL_X19_Y3_N33
\s_bus[7]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_bus[7]~1_combout\ = ( \ac_register|reg_ac\(7) & ( !adl_bus(7) & ( !\i_test_vector[41]~input_o\ ) ) ) # ( !\ac_register|reg_ac\(7) & ( !adl_bus(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[41]~input_o\,
	datae => \ac_register|ALT_INV_reg_ac\(7),
	dataf => ALT_INV_adl_bus(7),
	combout => \s_bus[7]~1_combout\);

-- Location: LABCELL_X19_Y3_N39
\s_bus[7]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_bus[7]~2_combout\ = ( \y_register|reg_xy\(7) & ( \s_bus[7]~1_combout\ & ( ((\i_test_vector[43]~input_o\ & \x_register|reg_xy\(7))) # (\i_test_vector[45]~input_o\) ) ) ) # ( !\y_register|reg_xy\(7) & ( \s_bus[7]~1_combout\ & ( 
-- (\i_test_vector[43]~input_o\ & \x_register|reg_xy\(7)) ) ) ) # ( \y_register|reg_xy\(7) & ( !\s_bus[7]~1_combout\ ) ) # ( !\y_register|reg_xy\(7) & ( !\s_bus[7]~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000011110101010101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[45]~input_o\,
	datac => \ALT_INV_i_test_vector[43]~input_o\,
	datad => \x_register|ALT_INV_reg_xy\(7),
	datae => \y_register|ALT_INV_reg_xy\(7),
	dataf => \ALT_INV_s_bus[7]~1_combout\,
	combout => \s_bus[7]~2_combout\);

-- Location: LABCELL_X18_Y3_N12
\ac_register|reg_ac[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ac_register|reg_ac[7]~feeder_combout\ = ( \s_bus[7]~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_s_bus[7]~2_combout\,
	combout => \ac_register|reg_ac[7]~feeder_combout\);

-- Location: FF_X18_Y3_N14
\ac_register|reg_ac[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \ac_register|reg_ac[7]~feeder_combout\,
	ena => \i_test_vector[39]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac_register|reg_ac\(7));

-- Location: LABCELL_X18_Y3_N48
\d_bus[7]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[7]~21_combout\ = ( \i_test_vector[46]~input_o\ & ( \ac_register|reg_ac\(7) & ( \p_register|reg_p\(7) ) ) ) # ( \i_test_vector[46]~input_o\ & ( !\ac_register|reg_ac\(7) & ( (\p_register|reg_p\(7)) # (\i_test_vector[40]~input_o\) ) ) ) # ( 
-- !\i_test_vector[46]~input_o\ & ( !\ac_register|reg_ac\(7) & ( \i_test_vector[40]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \p_register|ALT_INV_reg_p\(7),
	datae => \ALT_INV_i_test_vector[46]~input_o\,
	dataf => \ac_register|ALT_INV_reg_ac\(7),
	combout => \d_bus[7]~21_combout\);

-- Location: LABCELL_X17_Y3_N45
\d_bus[4]~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[4]~27_combout\ = ( \program_counter_low|pcl_reg\(4) & ( \input_data_latch|reg_dl\(4) & ( (!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0)) ) ) ) # ( !\program_counter_low|pcl_reg\(4) & ( \input_data_latch|reg_dl\(4) & ( 
-- (!\i_test_vector[10]~input_o\ & ((!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0)))) ) ) ) # ( \program_counter_low|pcl_reg\(4) & ( !\input_data_latch|reg_dl\(4) & ( (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[40]~input_o\) # 
-- (\ac_register|reg_ac\(0)))) ) ) ) # ( !\program_counter_low|pcl_reg\(4) & ( !\input_data_latch|reg_dl\(4) & ( (!\i_test_vector[10]~input_o\ & (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000100000111100000011000010101010001000101111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	datab => \ac_register|ALT_INV_reg_ac\(0),
	datac => \ALT_INV_i_test_vector[0]~input_o\,
	datad => \ALT_INV_i_test_vector[40]~input_o\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(4),
	dataf => \input_data_latch|ALT_INV_reg_dl\(4),
	combout => \d_bus[4]~27_combout\);

-- Location: LABCELL_X17_Y3_N42
\d_bus[5]~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[5]~28_combout\ = ( \program_counter_low|pcl_reg\(5) & ( \input_data_latch|reg_dl\(5) & ( (!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0)) ) ) ) # ( !\program_counter_low|pcl_reg\(5) & ( \input_data_latch|reg_dl\(5) & ( 
-- (!\i_test_vector[10]~input_o\ & ((!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0)))) ) ) ) # ( \program_counter_low|pcl_reg\(5) & ( !\input_data_latch|reg_dl\(5) & ( (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[40]~input_o\) # 
-- (\ac_register|reg_ac\(0)))) ) ) ) # ( !\program_counter_low|pcl_reg\(5) & ( !\input_data_latch|reg_dl\(5) & ( (!\i_test_vector[10]~input_o\ & (!\i_test_vector[0]~input_o\ & ((!\i_test_vector[40]~input_o\) # (\ac_register|reg_ac\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001000000000111100110000000010100010101000101111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[10]~input_o\,
	datab => \ac_register|ALT_INV_reg_ac\(0),
	datac => \ALT_INV_i_test_vector[40]~input_o\,
	datad => \ALT_INV_i_test_vector[0]~input_o\,
	datae => \program_counter_low|ALT_INV_pcl_reg\(5),
	dataf => \input_data_latch|ALT_INV_reg_dl\(5),
	combout => \d_bus[5]~28_combout\);

-- Location: LABCELL_X17_Y3_N30
\p_register|reg_p~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~4_combout\ = ( \d_bus[4]~27_combout\ & ( \d_bus[5]~28_combout\ & ( (\d_bus[5]~15_combout\ & (\d_bus[4]~13_combout\ & ((!\d_bus[7]~26_combout\) # (\d_bus[7]~21_combout\)))) ) ) ) # ( !\d_bus[4]~27_combout\ & ( \d_bus[5]~28_combout\ & ( 
-- (\d_bus[5]~15_combout\ & ((!\d_bus[7]~26_combout\) # (\d_bus[7]~21_combout\))) ) ) ) # ( \d_bus[4]~27_combout\ & ( !\d_bus[5]~28_combout\ & ( (\d_bus[4]~13_combout\ & ((!\d_bus[7]~26_combout\) # (\d_bus[7]~21_combout\))) ) ) ) # ( !\d_bus[4]~27_combout\ & 
-- ( !\d_bus[5]~28_combout\ & ( (!\d_bus[7]~26_combout\) # (\d_bus[7]~21_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111111001100000011001101010000010101010001000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_d_bus[5]~15_combout\,
	datab => \ALT_INV_d_bus[4]~13_combout\,
	datac => \ALT_INV_d_bus[7]~26_combout\,
	datad => \ALT_INV_d_bus[7]~21_combout\,
	datae => \ALT_INV_d_bus[4]~27_combout\,
	dataf => \ALT_INV_d_bus[5]~28_combout\,
	combout => \p_register|reg_p~4_combout\);

-- Location: LABCELL_X16_Y3_N24
\p_register|reg_p~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \p_register|reg_p~5_combout\ = ( \d_bus[3]~11_combout\ & ( \p_register|reg_p~4_combout\ & ( !\p_register|reg_p~17_combout\ ) ) ) # ( !\d_bus[3]~11_combout\ & ( \p_register|reg_p~4_combout\ & ( (!\p_register|reg_p~17_combout\ & 
-- ((!\p_register|reg_p~3_combout\) # ((\d_bus[2]~8_combout\) # (\d_bus[6]~19_combout\)))) ) ) ) # ( \d_bus[3]~11_combout\ & ( !\p_register|reg_p~4_combout\ & ( !\p_register|reg_p~17_combout\ ) ) ) # ( !\d_bus[3]~11_combout\ & ( !\p_register|reg_p~4_combout\ 
-- & ( !\p_register|reg_p~17_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110010001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \p_register|ALT_INV_reg_p~3_combout\,
	datab => \p_register|ALT_INV_reg_p~17_combout\,
	datac => \ALT_INV_d_bus[6]~19_combout\,
	datad => \ALT_INV_d_bus[2]~8_combout\,
	datae => \ALT_INV_d_bus[3]~11_combout\,
	dataf => \p_register|ALT_INV_reg_p~4_combout\,
	combout => \p_register|reg_p~5_combout\);

-- Location: FF_X16_Y3_N26
\p_register|reg_p[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \p_register|reg_p~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_register|reg_p\(1));

-- Location: FF_X15_Y3_N35
\program_counter_high|reg_pch[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \program_counter_high|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \program_counter_high|reg_pch\(1));

-- Location: MLABCELL_X15_Y3_N57
\d_bus[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[1]~3_combout\ = ( \program_counter_high|reg_pch\(1) & ( ((!\p_register|reg_p\(1) & \i_test_vector[46]~input_o\)) # (\i_test_vector[14]~input_o\) ) ) # ( !\program_counter_high|reg_pch\(1) & ( (!\p_register|reg_p\(1) & \i_test_vector[46]~input_o\) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000001010101111101010101010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[14]~input_o\,
	datac => \p_register|ALT_INV_reg_p\(1),
	datad => \ALT_INV_i_test_vector[46]~input_o\,
	dataf => \program_counter_high|ALT_INV_reg_pch\(1),
	combout => \d_bus[1]~3_combout\);

-- Location: LABCELL_X18_Y3_N39
\d_bus[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[1]~5_combout\ = ( \d_bus[1]~3_combout\ & ( \d_bus[1]~4_combout\ ) ) # ( !\d_bus[1]~3_combout\ & ( \d_bus[1]~4_combout\ ) ) # ( \d_bus[1]~3_combout\ & ( !\d_bus[1]~4_combout\ ) ) # ( !\d_bus[1]~3_combout\ & ( !\d_bus[1]~4_combout\ & ( 
-- (\program_counter_low|pcl_reg\(1) & \i_test_vector[10]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \program_counter_low|ALT_INV_pcl_reg\(1),
	datac => \ALT_INV_i_test_vector[10]~input_o\,
	datae => \ALT_INV_d_bus[1]~3_combout\,
	dataf => \ALT_INV_d_bus[1]~4_combout\,
	combout => \d_bus[1]~5_combout\);

-- Location: FF_X18_Y3_N40
\data_output_register_buffer|reg_data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[1]~5_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(1));

-- Location: FF_X16_Y3_N31
\data_output_register_buffer|reg_data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[2]~8_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(2));

-- Location: FF_X16_Y3_N37
\data_output_register_buffer|reg_data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[3]~11_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(3));

-- Location: LABCELL_X18_Y3_N0
\d_bus[4]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[4]~12_combout\ = ( !\ac_register|reg_ac\(0) & ( \i_test_vector[40]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_i_test_vector[40]~input_o\,
	dataf => \ac_register|ALT_INV_reg_ac\(0),
	combout => \d_bus[4]~12_combout\);

-- Location: LABCELL_X18_Y3_N6
\d_bus[4]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[4]~14_combout\ = ( !\d_bus[4]~13_combout\ & ( \i_test_vector[0]~input_o\ & ( (\input_data_latch|reg_dl\(4) & (!\d_bus[4]~12_combout\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(4))))) ) ) ) # ( !\d_bus[4]~13_combout\ & ( 
-- !\i_test_vector[0]~input_o\ & ( (!\d_bus[4]~12_combout\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000001010000000000000000000000110000000100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \program_counter_low|ALT_INV_pcl_reg\(4),
	datab => \input_data_latch|ALT_INV_reg_dl\(4),
	datac => \ALT_INV_d_bus[4]~12_combout\,
	datad => \ALT_INV_i_test_vector[10]~input_o\,
	datae => \ALT_INV_d_bus[4]~13_combout\,
	dataf => \ALT_INV_i_test_vector[0]~input_o\,
	combout => \d_bus[4]~14_combout\);

-- Location: FF_X18_Y3_N7
\data_output_register_buffer|reg_data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[4]~14_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(4));

-- Location: LABCELL_X18_Y3_N24
\d_bus[5]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[5]~16_combout\ = ( \input_data_latch|reg_dl\(5) & ( !\d_bus[5]~15_combout\ & ( (!\d_bus[4]~12_combout\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(5)))) ) ) ) # ( !\input_data_latch|reg_dl\(5) & ( !\d_bus[5]~15_combout\ & ( 
-- (!\i_test_vector[0]~input_o\ & (!\d_bus[4]~12_combout\ & ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010100000110000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[0]~input_o\,
	datab => \ALT_INV_i_test_vector[10]~input_o\,
	datac => \ALT_INV_d_bus[4]~12_combout\,
	datad => \program_counter_low|ALT_INV_pcl_reg\(5),
	datae => \input_data_latch|ALT_INV_reg_dl\(5),
	dataf => \ALT_INV_d_bus[5]~15_combout\,
	combout => \d_bus[5]~16_combout\);

-- Location: FF_X18_Y3_N25
\data_output_register_buffer|reg_data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[5]~16_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(5));

-- Location: FF_X16_Y3_N22
\data_output_register_buffer|reg_data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[6]~19_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(6));

-- Location: LABCELL_X16_Y3_N3
\d_bus[7]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[7]~20_combout\ = ( !\input_data_latch|reg_dl\(7) & ( \i_test_vector[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[0]~input_o\,
	dataf => \input_data_latch|ALT_INV_reg_dl\(7),
	combout => \d_bus[7]~20_combout\);

-- Location: LABCELL_X18_Y3_N54
\d_bus[7]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \d_bus[7]~22_combout\ = ( !\d_bus[7]~20_combout\ & ( !\d_bus[7]~21_combout\ & ( (!\i_test_vector[14]~input_o\ & ((!\i_test_vector[10]~input_o\) # ((\program_counter_low|pcl_reg\(7))))) # (\i_test_vector[14]~input_o\ & (\program_counter_high|reg_pch\(7) & 
-- ((!\i_test_vector[10]~input_o\) # (\program_counter_low|pcl_reg\(7))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101011001111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_i_test_vector[14]~input_o\,
	datab => \ALT_INV_i_test_vector[10]~input_o\,
	datac => \program_counter_low|ALT_INV_pcl_reg\(7),
	datad => \program_counter_high|ALT_INV_reg_pch\(7),
	datae => \ALT_INV_d_bus[7]~20_combout\,
	dataf => \ALT_INV_d_bus[7]~21_combout\,
	combout => \d_bus[7]~22_combout\);

-- Location: FF_X18_Y3_N55
\data_output_register_buffer|reg_data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \d_bus[7]~22_combout\,
	ena => ALT_INV_adl_bus(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_output_register_buffer|reg_data_out\(7));

-- Location: IOIBUF_X36_Y0_N1
\i_test_vector[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(6),
	o => \i_test_vector[6]~input_o\);

-- Location: LABCELL_X18_Y3_N18
\address_bus_low_register|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \address_bus_low_register|process_0~0_combout\ = ( !adl_bus(7) & ( \i_test_vector[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_adl_bus(7),
	dataf => \ALT_INV_i_test_vector[6]~input_o\,
	combout => \address_bus_low_register|process_0~0_combout\);

-- Location: FF_X13_Y3_N25
\address_bus_low_register|reg_ablh[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[0]~0_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(0));

-- Location: FF_X13_Y3_N1
\address_bus_low_register|reg_ablh[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[1]~1_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(1));

-- Location: FF_X12_Y3_N25
\address_bus_low_register|reg_ablh[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[2]~2_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(2));

-- Location: FF_X13_Y3_N22
\address_bus_low_register|reg_ablh[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[3]~3_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(3));

-- Location: FF_X13_Y3_N13
\address_bus_low_register|reg_ablh[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[4]~4_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(4));

-- Location: FF_X13_Y3_N52
\address_bus_low_register|reg_ablh[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[5]~5_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(5));

-- Location: FF_X13_Y3_N19
\address_bus_low_register|reg_ablh[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[6]~6_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(6));

-- Location: FF_X13_Y3_N49
\address_bus_low_register|reg_ablh[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adl_bus[7]~7_combout\,
	ena => \address_bus_low_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_low_register|reg_ablh\(7));

-- Location: IOIBUF_X26_Y0_N75
\i_test_vector[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(5),
	o => \i_test_vector[5]~input_o\);

-- Location: LABCELL_X17_Y2_N54
\address_bus_high_register|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \address_bus_high_register|process_0~0_combout\ = ( !adl_bus(7) & ( \i_test_vector[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_i_test_vector[5]~input_o\,
	dataf => ALT_INV_adl_bus(7),
	combout => \address_bus_high_register|process_0~0_combout\);

-- Location: FF_X16_Y2_N26
\address_bus_high_register|reg_ablh[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[0]~0_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(0));

-- Location: FF_X16_Y2_N28
\address_bus_high_register|reg_ablh[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[1]~1_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(1));

-- Location: FF_X16_Y2_N8
\address_bus_high_register|reg_ablh[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[2]~2_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(2));

-- Location: FF_X16_Y2_N10
\address_bus_high_register|reg_ablh[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[3]~3_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(3));

-- Location: FF_X16_Y2_N1
\address_bus_high_register|reg_ablh[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[4]~4_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(4));

-- Location: FF_X16_Y2_N46
\address_bus_high_register|reg_ablh[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[5]~5_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(5));

-- Location: FF_X16_Y2_N37
\address_bus_high_register|reg_ablh[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[6]~6_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(6));

-- Location: FF_X16_Y2_N40
\address_bus_high_register|reg_ablh[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputCLKENA0_outclk\,
	d => \adh_bus[7]~7_combout\,
	ena => \address_bus_high_register|process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \address_bus_high_register|reg_ablh\(7));

-- Location: IOIBUF_X70_Y0_N35
\i_irq~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_irq,
	o => \i_irq~input_o\);

-- Location: IOIBUF_X20_Y81_N52
\i_ready~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_ready,
	o => \i_ready~input_o\);

-- Location: IOIBUF_X89_Y16_N21
\i_test_vector[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(21),
	o => \i_test_vector[21]~input_o\);

-- Location: IOIBUF_X22_Y81_N52
\i_test_vector[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(22),
	o => \i_test_vector[22]~input_o\);

-- Location: IOIBUF_X28_Y81_N18
\i_test_vector[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(23),
	o => \i_test_vector[23]~input_o\);

-- Location: IOIBUF_X76_Y0_N35
\i_test_vector[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(24),
	o => \i_test_vector[24]~input_o\);

-- Location: IOIBUF_X86_Y0_N35
\i_test_vector[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(25),
	o => \i_test_vector[25]~input_o\);

-- Location: IOIBUF_X38_Y81_N52
\i_test_vector[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(26),
	o => \i_test_vector[26]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\i_test_vector[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(27),
	o => \i_test_vector[27]~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\i_test_vector[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(28),
	o => \i_test_vector[28]~input_o\);

-- Location: IOIBUF_X6_Y81_N35
\i_test_vector[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(29),
	o => \i_test_vector[29]~input_o\);

-- Location: IOIBUF_X40_Y81_N52
\i_test_vector[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(30),
	o => \i_test_vector[30]~input_o\);

-- Location: IOIBUF_X26_Y81_N58
\i_test_vector[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(31),
	o => \i_test_vector[31]~input_o\);

-- Location: IOIBUF_X26_Y81_N75
\i_test_vector[32]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(32),
	o => \i_test_vector[32]~input_o\);

-- Location: IOIBUF_X58_Y0_N41
\i_test_vector[33]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(33),
	o => \i_test_vector[33]~input_o\);

-- Location: IOIBUF_X76_Y0_N1
\i_test_vector[37]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(37),
	o => \i_test_vector[37]~input_o\);

-- Location: IOIBUF_X50_Y0_N75
\i_test_vector[38]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(38),
	o => \i_test_vector[38]~input_o\);

-- Location: IOIBUF_X72_Y0_N18
\i_test_vector[35]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(35),
	o => \i_test_vector[35]~input_o\);

-- Location: IOIBUF_X30_Y81_N18
\i_test_vector[34]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(34),
	o => \i_test_vector[34]~input_o\);

-- Location: IOIBUF_X74_Y0_N92
\i_test_vector[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(3),
	o => \i_test_vector[3]~input_o\);

-- Location: IOIBUF_X89_Y13_N21
\i_test_vector[36]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_test_vector(36),
	o => \i_test_vector[36]~input_o\);

-- Location: LABCELL_X77_Y3_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


