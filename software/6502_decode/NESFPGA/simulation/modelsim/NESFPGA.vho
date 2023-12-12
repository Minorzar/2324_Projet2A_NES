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
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "12/12/2023 17:20:36"

-- 
-- Device: Altera 10M08DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	predecode IS
    PORT (
	i_clk : IN std_logic;
	i_instruction : IN std_logic_vector(7 DOWNTO 0);
	i_status_register : IN std_logic_vector(7 DOWNTO 0);
	o_active_instruction : BUFFER std_logic_vector(5 DOWNTO 0);
	o_addressing_mode : BUFFER std_logic_vector(2 DOWNTO 0);
	o_register_select : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END predecode;

-- Design Ports Information
-- i_status_register[0]	=>  Location: PIN_W6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[1]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[2]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[3]	=>  Location: PIN_M14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[5]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[6]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[7]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[0]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[2]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[3]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[4]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[5]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[1]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[2]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[0]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[1]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[0]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[2]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[5]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[3]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[7]	=>  Location: PIN_J8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[1]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[4]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[6]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF predecode IS
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
SIGNAL ww_i_instruction : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_i_status_register : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_active_instruction : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_o_addressing_mode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_o_register_select : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \i_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_status_register[0]~input_o\ : std_logic;
SIGNAL \i_status_register[1]~input_o\ : std_logic;
SIGNAL \i_status_register[2]~input_o\ : std_logic;
SIGNAL \i_status_register[3]~input_o\ : std_logic;
SIGNAL \i_status_register[4]~input_o\ : std_logic;
SIGNAL \i_status_register[5]~input_o\ : std_logic;
SIGNAL \i_status_register[6]~input_o\ : std_logic;
SIGNAL \i_status_register[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \o_active_instruction[0]~output_o\ : std_logic;
SIGNAL \o_active_instruction[1]~output_o\ : std_logic;
SIGNAL \o_active_instruction[2]~output_o\ : std_logic;
SIGNAL \o_active_instruction[3]~output_o\ : std_logic;
SIGNAL \o_active_instruction[4]~output_o\ : std_logic;
SIGNAL \o_active_instruction[5]~output_o\ : std_logic;
SIGNAL \o_addressing_mode[0]~output_o\ : std_logic;
SIGNAL \o_addressing_mode[1]~output_o\ : std_logic;
SIGNAL \o_addressing_mode[2]~output_o\ : std_logic;
SIGNAL \o_register_select[0]~output_o\ : std_logic;
SIGNAL \o_register_select[1]~output_o\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_instruction[5]~input_o\ : std_logic;
SIGNAL \i_instruction[6]~input_o\ : std_logic;
SIGNAL \i_instruction[1]~input_o\ : std_logic;
SIGNAL \i_instruction[7]~input_o\ : std_logic;
SIGNAL \i_instruction[4]~input_o\ : std_logic;
SIGNAL \Mux28~0_combout\ : std_logic;
SIGNAL \i_instruction[3]~input_o\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \Mux28~1_combout\ : std_logic;
SIGNAL \i_instruction[2]~input_o\ : std_logic;
SIGNAL \Mux28~2_combout\ : std_logic;
SIGNAL \i_instruction[0]~input_o\ : std_logic;
SIGNAL \o_active_instruction[0]~0_combout\ : std_logic;
SIGNAL \Mux28~3_combout\ : std_logic;
SIGNAL \Mux28~4_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \Mux28~5_combout\ : std_logic;
SIGNAL \o_active_instruction[0]~reg0_q\ : std_logic;
SIGNAL \Mux27~1_combout\ : std_logic;
SIGNAL \Mux27~2_combout\ : std_logic;
SIGNAL \Mux27~3_combout\ : std_logic;
SIGNAL \Mux27~6_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux27~4_combout\ : std_logic;
SIGNAL \Mux27~5_combout\ : std_logic;
SIGNAL \Mux27~7_combout\ : std_logic;
SIGNAL \o_active_instruction[1]~reg0_q\ : std_logic;
SIGNAL \Mux26~1_combout\ : std_logic;
SIGNAL \Mux26~3_combout\ : std_logic;
SIGNAL \Mux26~4_combout\ : std_logic;
SIGNAL \Mux27~8_combout\ : std_logic;
SIGNAL \Mux26~2_combout\ : std_logic;
SIGNAL \Mux26~5_combout\ : std_logic;
SIGNAL \o_active_instruction[2]~reg0_q\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \Mux25~1_combout\ : std_logic;
SIGNAL \Mux25~2_combout\ : std_logic;
SIGNAL \Mux25~3_combout\ : std_logic;
SIGNAL \o_active_instruction[3]~reg0_q\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux24~1_combout\ : std_logic;
SIGNAL \Mux23~5_combout\ : std_logic;
SIGNAL \Mux24~3_combout\ : std_logic;
SIGNAL \Mux24~4_combout\ : std_logic;
SIGNAL \Mux24~2_combout\ : std_logic;
SIGNAL \o_active_instruction[4]~reg0_q\ : std_logic;
SIGNAL \Mux23~2_combout\ : std_logic;
SIGNAL \Mux23~3_combout\ : std_logic;
SIGNAL \Mux23~4_combout\ : std_logic;
SIGNAL \o_active_instruction[5]~reg0_q\ : std_logic;
SIGNAL \Mux31~2_combout\ : std_logic;
SIGNAL \Mux31~3_combout\ : std_logic;
SIGNAL \o_addressing_mode[0]~reg0_q\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \Mux30~1_combout\ : std_logic;
SIGNAL \o_addressing_mode[1]~reg0_q\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[2]~reg0_q\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \Mux33~1_combout\ : std_logic;
SIGNAL \o_register_select[0]~reg0_q\ : std_logic;
SIGNAL \Mux32~0_combout\ : std_logic;
SIGNAL \o_register_select[1]~reg0_q\ : std_logic;
SIGNAL s_aaa : std_logic_vector(2 DOWNTO 0);
SIGNAL s_bbb : std_logic_vector(2 DOWNTO 0);
SIGNAL s_cc : std_logic_vector(1 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_clk <= i_clk;
ww_i_instruction <= i_instruction;
ww_i_status_register <= i_status_register;
o_active_instruction <= ww_o_active_instruction;
o_addressing_mode <= ww_o_addressing_mode;
o_register_select <= ww_o_register_select;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\i_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y12_N16
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X11_Y25_N23
\o_active_instruction[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[0]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[0]~output_o\);

-- Location: IOOBUF_X11_Y25_N30
\o_active_instruction[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[1]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[1]~output_o\);

-- Location: IOOBUF_X10_Y21_N23
\o_active_instruction[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[2]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[2]~output_o\);

-- Location: IOOBUF_X13_Y25_N9
\o_active_instruction[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[3]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[3]~output_o\);

-- Location: IOOBUF_X10_Y21_N9
\o_active_instruction[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[4]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[4]~output_o\);

-- Location: IOOBUF_X15_Y25_N30
\o_active_instruction[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_active_instruction[5]~reg0_q\,
	devoe => ww_devoe,
	o => \o_active_instruction[5]~output_o\);

-- Location: IOOBUF_X15_Y25_N2
\o_addressing_mode[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[0]~reg0_q\,
	devoe => ww_devoe,
	o => \o_addressing_mode[0]~output_o\);

-- Location: IOOBUF_X13_Y25_N30
\o_addressing_mode[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[1]~reg0_q\,
	devoe => ww_devoe,
	o => \o_addressing_mode[1]~output_o\);

-- Location: IOOBUF_X13_Y25_N2
\o_addressing_mode[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[2]~reg0_q\,
	devoe => ww_devoe,
	o => \o_addressing_mode[2]~output_o\);

-- Location: IOOBUF_X15_Y25_N16
\o_register_select[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_register_select[0]~reg0_q\,
	devoe => ww_devoe,
	o => \o_register_select[0]~output_o\);

-- Location: IOOBUF_X15_Y25_N9
\o_register_select[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_register_select[1]~reg0_q\,
	devoe => ww_devoe,
	o => \o_register_select[1]~output_o\);

-- Location: IOIBUF_X0_Y6_N15
\i_clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G3
\i_clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X10_Y22_N15
\i_instruction[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(5),
	o => \i_instruction[5]~input_o\);

-- Location: IOIBUF_X10_Y22_N8
\i_instruction[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(6),
	o => \i_instruction[6]~input_o\);

-- Location: IOIBUF_X10_Y22_N22
\i_instruction[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(1),
	o => \i_instruction[1]~input_o\);

-- Location: IOIBUF_X10_Y21_N15
\i_instruction[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(7),
	o => \i_instruction[7]~input_o\);

-- Location: IOIBUF_X13_Y25_N22
\i_instruction[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(4),
	o => \i_instruction[4]~input_o\);

-- Location: LCCOMB_X11_Y22_N2
\Mux28~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~0_combout\ = ((\i_instruction[7]~input_o\ & ((\i_instruction[6]~input_o\) # (!\i_instruction[4]~input_o\)))) # (!\i_instruction[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux28~0_combout\);

-- Location: IOIBUF_X10_Y22_N1
\i_instruction[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(3),
	o => \i_instruction[3]~input_o\);

-- Location: LCCOMB_X11_Y22_N24
\Mux26~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = (!\i_instruction[3]~input_o\ & (!\i_instruction[1]~input_o\ & (!\i_instruction[7]~input_o\ & !\i_instruction[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux26~0_combout\);

-- Location: LCCOMB_X11_Y22_N4
\Mux28~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~1_combout\ = (!\i_instruction[5]~input_o\ & ((\Mux26~0_combout\) # ((\Mux28~0_combout\ & \i_instruction[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datab => \Mux28~0_combout\,
	datac => \i_instruction[3]~input_o\,
	datad => \Mux26~0_combout\,
	combout => \Mux28~1_combout\);

-- Location: FF_X12_Y22_N3
\s_aaa[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_aaa(0));

-- Location: IOIBUF_X11_Y25_N15
\i_instruction[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(2),
	o => \i_instruction[2]~input_o\);

-- Location: FF_X12_Y22_N7
\s_bbb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(0));

-- Location: FF_X12_Y22_N27
\s_bbb[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(2));

-- Location: FF_X12_Y22_N5
\s_bbb[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(1));

-- Location: FF_X12_Y22_N19
\s_cc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cc(1));

-- Location: LCCOMB_X12_Y22_N16
\Mux28~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~2_combout\ = (!s_cc(1) & ((s_bbb(0)) # ((!s_bbb(2) & !s_bbb(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(0),
	datab => s_bbb(2),
	datac => s_bbb(1),
	datad => s_cc(1),
	combout => \Mux28~2_combout\);

-- Location: IOIBUF_X13_Y25_N15
\i_instruction[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_instruction(0),
	o => \i_instruction[0]~input_o\);

-- Location: FF_X12_Y22_N9
\s_cc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cc(0));

-- Location: LCCOMB_X12_Y22_N28
\o_active_instruction[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_active_instruction[0]~0_combout\ = s_cc(0) $ (s_cc(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cc(0),
	datad => s_cc(1),
	combout => \o_active_instruction[0]~0_combout\);

-- Location: FF_X12_Y22_N11
\s_aaa[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_aaa(2));

-- Location: FF_X12_Y22_N21
\s_aaa[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	asdata => \i_instruction[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_aaa(1));

-- Location: LCCOMB_X12_Y22_N20
\Mux28~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~3_combout\ = (s_aaa(2) & (s_cc(1) $ (((!s_cc(0)))))) # (!s_aaa(2) & (s_aaa(1) & (s_cc(1) $ (!s_cc(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_aaa(2),
	datab => s_cc(1),
	datac => s_aaa(1),
	datad => s_cc(0),
	combout => \Mux28~3_combout\);

-- Location: LCCOMB_X12_Y22_N30
\Mux28~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~4_combout\ = (s_aaa(0) & (((\o_active_instruction[0]~0_combout\)))) # (!s_aaa(0) & (\Mux28~2_combout\ & ((\Mux28~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_aaa(0),
	datab => \Mux28~2_combout\,
	datac => \o_active_instruction[0]~0_combout\,
	datad => \Mux28~3_combout\,
	combout => \Mux28~4_combout\);

-- Location: LCCOMB_X12_Y22_N24
\Mux24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (!\i_instruction[0]~input_o\ & (!\i_instruction[2]~input_o\ & (s_bbb(1) & !s_bbb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \i_instruction[2]~input_o\,
	datac => s_bbb(1),
	datad => s_bbb(0),
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X12_Y22_N2
\Mux27~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = (!s_cc(0) & (!s_cc(1) & \Mux24~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => s_cc(1),
	datad => \Mux24~0_combout\,
	combout => \Mux27~0_combout\);

-- Location: LCCOMB_X11_Y22_N28
\Mux28~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~5_combout\ = (\Mux28~4_combout\) # ((\Mux28~1_combout\ & \Mux27~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux28~1_combout\,
	datac => \Mux28~4_combout\,
	datad => \Mux27~0_combout\,
	combout => \Mux28~5_combout\);

-- Location: FF_X11_Y22_N29
\o_active_instruction[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux28~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[0]~reg0_q\);

-- Location: LCCOMB_X11_Y22_N26
\Mux27~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~1_combout\ = (\i_instruction[3]~input_o\ & ((\i_instruction[6]~input_o\ $ (!\i_instruction[5]~input_o\)))) # (!\i_instruction[3]~input_o\ & (!\i_instruction[7]~input_o\ & (\i_instruction[6]~input_o\ $ (!\i_instruction[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux27~1_combout\);

-- Location: LCCOMB_X11_Y22_N0
\Mux27~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~2_combout\ = (!\i_instruction[1]~input_o\ & (\Mux27~1_combout\ & ((\i_instruction[3]~input_o\) # (!\i_instruction[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \Mux27~1_combout\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux27~2_combout\);

-- Location: LCCOMB_X13_Y22_N14
\Mux27~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~3_combout\ = (!s_cc(0) & (\Mux27~2_combout\ & (!s_cc(1) & \Mux24~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => \Mux27~2_combout\,
	datac => s_cc(1),
	datad => \Mux24~0_combout\,
	combout => \Mux27~3_combout\);

-- Location: LCCOMB_X12_Y22_N10
\Mux27~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~6_combout\ = (s_aaa(0) & (s_aaa(1))) # (!s_aaa(0) & (!s_aaa(1) & (s_aaa(2) & !\o_active_instruction[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_aaa(0),
	datab => s_aaa(1),
	datac => s_aaa(2),
	datad => \o_active_instruction[0]~0_combout\,
	combout => \Mux27~6_combout\);

-- Location: LCCOMB_X11_Y22_N14
\Mux15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\i_instruction[7]~input_o\ & ((\i_instruction[5]~input_o\ & (\i_instruction[6]~input_o\ & !\i_instruction[4]~input_o\)) # (!\i_instruction[5]~input_o\ & (\i_instruction[6]~input_o\ $ (!\i_instruction[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X11_Y22_N20
\Mux27~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~4_combout\ = (\i_instruction[3]~input_o\ & (\i_instruction[1]~input_o\ & \Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \Mux15~0_combout\,
	combout => \Mux27~4_combout\);

-- Location: LCCOMB_X12_Y22_N0
\Mux27~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~5_combout\ = (\Mux27~4_combout\ & ((\Mux27~0_combout\) # ((s_aaa(1) & \o_active_instruction[0]~0_combout\)))) # (!\Mux27~4_combout\ & (s_aaa(1) & (\o_active_instruction[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux27~4_combout\,
	datab => s_aaa(1),
	datac => \o_active_instruction[0]~0_combout\,
	datad => \Mux27~0_combout\,
	combout => \Mux27~5_combout\);

-- Location: LCCOMB_X12_Y22_N12
\Mux27~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~7_combout\ = (\Mux27~3_combout\) # ((\Mux27~5_combout\) # ((\Mux28~2_combout\ & \Mux27~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~2_combout\,
	datab => \Mux27~3_combout\,
	datac => \Mux27~6_combout\,
	datad => \Mux27~5_combout\,
	combout => \Mux27~7_combout\);

-- Location: FF_X12_Y22_N13
\o_active_instruction[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux27~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[1]~reg0_q\);

-- Location: LCCOMB_X11_Y22_N30
\Mux26~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~1_combout\ = (!\i_instruction[5]~input_o\ & (!\i_instruction[6]~input_o\ & \Mux26~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \Mux26~0_combout\,
	combout => \Mux26~1_combout\);

-- Location: LCCOMB_X11_Y22_N16
\Mux26~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~3_combout\ = (\i_instruction[5]~input_o\ & (((!\i_instruction[4]~input_o\)) # (!\i_instruction[1]~input_o\))) # (!\i_instruction[5]~input_o\ & (((\i_instruction[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux26~3_combout\);

-- Location: LCCOMB_X11_Y22_N22
\Mux26~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~4_combout\ = (\i_instruction[3]~input_o\ & ((\i_instruction[1]~input_o\ & (\i_instruction[7]~input_o\ & \Mux26~3_combout\)) # (!\i_instruction[1]~input_o\ & (\i_instruction[7]~input_o\ $ (\Mux26~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \Mux26~3_combout\,
	combout => \Mux26~4_combout\);

-- Location: LCCOMB_X12_Y22_N26
\Mux27~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~8_combout\ = (!s_aaa(0) & !s_aaa(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_aaa(0),
	datad => s_aaa(1),
	combout => \Mux27~8_combout\);

-- Location: LCCOMB_X12_Y22_N14
\Mux26~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~2_combout\ = (s_aaa(2) & ((\o_active_instruction[0]~0_combout\) # ((!\Mux27~8_combout\ & \Mux28~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux27~8_combout\,
	datab => s_aaa(2),
	datac => \o_active_instruction[0]~0_combout\,
	datad => \Mux28~2_combout\,
	combout => \Mux26~2_combout\);

-- Location: LCCOMB_X11_Y22_N18
\Mux26~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~5_combout\ = (\Mux26~2_combout\) # ((\Mux27~0_combout\ & ((\Mux26~1_combout\) # (\Mux26~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux26~1_combout\,
	datab => \Mux26~4_combout\,
	datac => \Mux26~2_combout\,
	datad => \Mux27~0_combout\,
	combout => \Mux26~5_combout\);

-- Location: FF_X11_Y22_N19
\o_active_instruction[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux26~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[2]~reg0_q\);

-- Location: LCCOMB_X11_Y22_N12
\Mux25~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = (\i_instruction[5]~input_o\ & ((\i_instruction[6]~input_o\) # (!\i_instruction[1]~input_o\))) # (!\i_instruction[5]~input_o\ & (\i_instruction[6]~input_o\ & !\i_instruction[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux25~0_combout\);

-- Location: LCCOMB_X11_Y22_N6
\Mux25~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux25~1_combout\ = (\i_instruction[1]~input_o\ & (\Mux25~0_combout\ & (\i_instruction[7]~input_o\ & \i_instruction[4]~input_o\))) # (!\i_instruction[1]~input_o\ & (\i_instruction[4]~input_o\ $ (((\Mux25~0_combout\ & \i_instruction[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux25~0_combout\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux25~1_combout\);

-- Location: LCCOMB_X13_Y22_N12
\Mux25~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux25~2_combout\ = (\Mux26~1_combout\) # ((\Mux25~1_combout\ & \i_instruction[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux25~1_combout\,
	datac => \i_instruction[3]~input_o\,
	datad => \Mux26~1_combout\,
	combout => \Mux25~2_combout\);

-- Location: LCCOMB_X13_Y22_N8
\Mux25~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux25~3_combout\ = (!s_cc(0) & ((s_cc(1)) # ((\Mux24~0_combout\ & \Mux25~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(1),
	datab => \Mux24~0_combout\,
	datac => \Mux25~2_combout\,
	datad => s_cc(0),
	combout => \Mux25~3_combout\);

-- Location: FF_X13_Y22_N9
\o_active_instruction[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux25~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[3]~reg0_q\);

-- Location: LCCOMB_X11_Y22_N8
\Mux12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\i_instruction[4]~input_o\ & ((\i_instruction[6]~input_o\) # ((\i_instruction[5]~input_o\ & !\i_instruction[1]~input_o\)))) # (!\i_instruction[4]~input_o\ & (((\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[4]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X11_Y22_N10
\Mux24~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~1_combout\ = (\i_instruction[3]~input_o\ & (\Mux12~0_combout\ & \i_instruction[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \Mux12~0_combout\,
	datac => \i_instruction[7]~input_o\,
	combout => \Mux24~1_combout\);

-- Location: LCCOMB_X12_Y22_N6
\Mux23~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~5_combout\ = (!s_cc(0) & (!s_cc(1) & \Mux24~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => s_cc(1),
	datad => \Mux24~0_combout\,
	combout => \Mux23~5_combout\);

-- Location: LCCOMB_X12_Y22_N4
\Mux24~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~3_combout\ = (!s_cc(1) & ((s_bbb(0)) # ((!s_bbb(1) & !s_bbb(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(0),
	datab => s_cc(1),
	datac => s_bbb(1),
	datad => s_bbb(2),
	combout => \Mux24~3_combout\);

-- Location: LCCOMB_X12_Y22_N8
\Mux24~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~4_combout\ = (\Mux24~3_combout\ & (!s_cc(0) & ((s_aaa(2)) # (!\Mux27~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux27~8_combout\,
	datab => \Mux24~3_combout\,
	datac => s_cc(0),
	datad => s_aaa(2),
	combout => \Mux24~4_combout\);

-- Location: LCCOMB_X12_Y22_N22
\Mux24~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~2_combout\ = (\Mux24~4_combout\) # ((\Mux23~5_combout\ & ((\Mux24~1_combout\) # (\Mux26~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux24~1_combout\,
	datab => \Mux26~1_combout\,
	datac => \Mux23~5_combout\,
	datad => \Mux24~4_combout\,
	combout => \Mux24~2_combout\);

-- Location: FF_X12_Y22_N23
\o_active_instruction[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux24~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[4]~reg0_q\);

-- Location: LCCOMB_X13_Y22_N10
\Mux23~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~2_combout\ = (\i_instruction[6]~input_o\) # ((!\i_instruction[3]~input_o\ & \i_instruction[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datac => \i_instruction[3]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux23~2_combout\);

-- Location: LCCOMB_X13_Y22_N16
\Mux23~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~3_combout\ = (\i_instruction[3]~input_o\ & (\i_instruction[7]~input_o\ & ((\Mux23~2_combout\) # (!\i_instruction[4]~input_o\)))) # (!\i_instruction[3]~input_o\ & (!\i_instruction[4]~input_o\ & (!\i_instruction[7]~input_o\ & \Mux23~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[4]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \Mux23~2_combout\,
	combout => \Mux23~3_combout\);

-- Location: LCCOMB_X13_Y22_N30
\Mux23~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~4_combout\ = (\Mux23~5_combout\ & ((\i_instruction[1]~input_o\ & (\Mux23~3_combout\ & \i_instruction[3]~input_o\)) # (!\i_instruction[1]~input_o\ & ((\Mux23~3_combout\) # (\i_instruction[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[1]~input_o\,
	datab => \Mux23~3_combout\,
	datac => \i_instruction[3]~input_o\,
	datad => \Mux23~5_combout\,
	combout => \Mux23~4_combout\);

-- Location: FF_X13_Y22_N31
\o_active_instruction[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux23~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[5]~reg0_q\);

-- Location: LCCOMB_X12_Y22_N18
\Mux31~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux31~2_combout\ = (s_cc(0) & (!s_cc(1) & ((s_bbb(2)) # (!s_bbb(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(2),
	datab => s_cc(0),
	datac => s_cc(1),
	datad => s_bbb(1),
	combout => \Mux31~2_combout\);

-- Location: LCCOMB_X13_Y22_N24
\Mux31~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux31~3_combout\ = (\Mux31~2_combout\) # ((s_bbb(0) & ((!s_cc(0)) # (!s_cc(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(1),
	datab => s_bbb(0),
	datac => s_cc(0),
	datad => \Mux31~2_combout\,
	combout => \Mux31~3_combout\);

-- Location: FF_X13_Y22_N25
\o_addressing_mode[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux31~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[0]~reg0_q\);

-- Location: LCCOMB_X13_Y22_N26
\Mux30~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (s_bbb(0) & ((s_cc(0)))) # (!s_bbb(0) & (s_bbb(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_bbb(0),
	datac => s_bbb(2),
	datad => s_cc(0),
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X13_Y22_N6
\Mux30~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux30~1_combout\ = (s_cc(0) & (!s_cc(1) & ((!s_bbb(1)) # (!\Mux30~0_combout\)))) # (!s_cc(0) & (((!\Mux30~0_combout\ & !s_bbb(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => s_cc(1),
	datac => \Mux30~0_combout\,
	datad => s_bbb(1),
	combout => \Mux30~1_combout\);

-- Location: FF_X13_Y22_N7
\o_addressing_mode[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux30~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[1]~reg0_q\);

-- Location: LCCOMB_X13_Y22_N28
\Mux29~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (!s_bbb(1) & ((s_cc(0) & (!s_cc(1))) # (!s_cc(0) & ((s_bbb(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(1),
	datab => s_bbb(1),
	datac => s_bbb(0),
	datad => s_cc(0),
	combout => \Mux29~0_combout\);

-- Location: FF_X13_Y22_N29
\o_addressing_mode[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux29~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[2]~reg0_q\);

-- Location: LCCOMB_X13_Y22_N20
\Mux33~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (s_bbb(0) & (((s_bbb(2))))) # (!s_bbb(0) & (s_cc(0) & (!s_bbb(2) & !s_bbb(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => s_bbb(0),
	datac => s_bbb(2),
	datad => s_bbb(1),
	combout => \Mux33~0_combout\);

-- Location: LCCOMB_X13_Y22_N2
\Mux33~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~1_combout\ = (\Mux33~0_combout\ & ((!s_cc(1)) # (!s_cc(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datac => s_cc(1),
	datad => \Mux33~0_combout\,
	combout => \Mux33~1_combout\);

-- Location: FF_X13_Y22_N3
\o_register_select[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux33~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[0]~reg0_q\);

-- Location: LCCOMB_X13_Y22_N0
\Mux32~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux32~0_combout\ = (s_bbb(2) & (!s_bbb(0) & (!s_cc(1) & s_cc(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(2),
	datab => s_bbb(0),
	datac => s_cc(1),
	datad => s_cc(0),
	combout => \Mux32~0_combout\);

-- Location: FF_X13_Y22_N1
\o_register_select[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux32~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[1]~reg0_q\);

-- Location: IOIBUF_X3_Y0_N8
\i_status_register[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(0),
	o => \i_status_register[0]~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\i_status_register[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(1),
	o => \i_status_register[1]~input_o\);

-- Location: IOIBUF_X31_Y9_N15
\i_status_register[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(2),
	o => \i_status_register[2]~input_o\);

-- Location: IOIBUF_X31_Y13_N15
\i_status_register[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(3),
	o => \i_status_register[3]~input_o\);

-- Location: IOIBUF_X13_Y0_N1
\i_status_register[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(4),
	o => \i_status_register[4]~input_o\);

-- Location: IOIBUF_X27_Y25_N8
\i_status_register[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(5),
	o => \i_status_register[5]~input_o\);

-- Location: IOIBUF_X29_Y25_N22
\i_status_register[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(6),
	o => \i_status_register[6]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\i_status_register[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_status_register(7),
	o => \i_status_register[7]~input_o\);

-- Location: UNVM_X0_Y11_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X10_Y24_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_o_active_instruction(0) <= \o_active_instruction[0]~output_o\;

ww_o_active_instruction(1) <= \o_active_instruction[1]~output_o\;

ww_o_active_instruction(2) <= \o_active_instruction[2]~output_o\;

ww_o_active_instruction(3) <= \o_active_instruction[3]~output_o\;

ww_o_active_instruction(4) <= \o_active_instruction[4]~output_o\;

ww_o_active_instruction(5) <= \o_active_instruction[5]~output_o\;

ww_o_addressing_mode(0) <= \o_addressing_mode[0]~output_o\;

ww_o_addressing_mode(1) <= \o_addressing_mode[1]~output_o\;

ww_o_addressing_mode(2) <= \o_addressing_mode[2]~output_o\;

ww_o_register_select(0) <= \o_register_select[0]~output_o\;

ww_o_register_select(1) <= \o_register_select[1]~output_o\;
END structure;


