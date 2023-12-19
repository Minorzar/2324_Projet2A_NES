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

-- DATE "12/19/2023 14:18:18"

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
-- i_instruction[5]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[6]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[7]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[1]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[2]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[3]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[5]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[6]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[7]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[0]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[1]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[2]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[3]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[4]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[5]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[0]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[1]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[2]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[0]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[1]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[0]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[4]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[3]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[1]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[2]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \i_instruction[5]~input_o\ : std_logic;
SIGNAL \i_instruction[6]~input_o\ : std_logic;
SIGNAL \i_instruction[7]~input_o\ : std_logic;
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
SIGNAL \i_instruction[2]~input_o\ : std_logic;
SIGNAL \s_bbb[0]~feeder_combout\ : std_logic;
SIGNAL \i_instruction[1]~input_o\ : std_logic;
SIGNAL \s_cc[1]~feeder_combout\ : std_logic;
SIGNAL \i_instruction[0]~input_o\ : std_logic;
SIGNAL \s_cc[0]~feeder_combout\ : std_logic;
SIGNAL \i_instruction[3]~input_o\ : std_logic;
SIGNAL \s_bbb[1]~feeder_combout\ : std_logic;
SIGNAL \i_instruction[4]~input_o\ : std_logic;
SIGNAL \s_bbb[2]~feeder_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \o_addressing_mode[0]~reg0_q\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \o_addressing_mode[1]~reg0_q\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[2]~reg0_q\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \o_register_select[0]~reg0_q\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \o_register_select[1]~reg0_q\ : std_logic;
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

-- Location: LCCOMB_X11_Y22_N20
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

-- Location: IOOBUF_X17_Y25_N23
\o_active_instruction[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[0]~output_o\);

-- Location: IOOBUF_X6_Y0_N30
\o_active_instruction[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[1]~output_o\);

-- Location: IOOBUF_X19_Y0_N30
\o_active_instruction[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[2]~output_o\);

-- Location: IOOBUF_X3_Y10_N2
\o_active_instruction[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[3]~output_o\);

-- Location: IOOBUF_X31_Y11_N16
\o_active_instruction[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[4]~output_o\);

-- Location: IOOBUF_X10_Y15_N23
\o_active_instruction[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_active_instruction[5]~output_o\);

-- Location: IOOBUF_X10_Y19_N16
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

-- Location: IOOBUF_X10_Y19_N2
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

-- Location: IOOBUF_X10_Y18_N2
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

-- Location: IOOBUF_X10_Y18_N9
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

-- Location: IOOBUF_X10_Y17_N2
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

-- Location: IOIBUF_X10_Y18_N15
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

-- Location: LCCOMB_X11_Y18_N28
\s_bbb[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_bbb[0]~feeder_combout\ = \i_instruction[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_instruction[2]~input_o\,
	combout => \s_bbb[0]~feeder_combout\);

-- Location: FF_X11_Y18_N29
\s_bbb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_bbb[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(0));

-- Location: IOIBUF_X10_Y18_N22
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

-- Location: LCCOMB_X11_Y18_N20
\s_cc[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cc[1]~feeder_combout\ = \i_instruction[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_instruction[1]~input_o\,
	combout => \s_cc[1]~feeder_combout\);

-- Location: FF_X11_Y18_N21
\s_cc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cc[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cc(1));

-- Location: IOIBUF_X10_Y19_N22
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

-- Location: LCCOMB_X11_Y18_N30
\s_cc[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cc[0]~feeder_combout\ = \i_instruction[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_instruction[0]~input_o\,
	combout => \s_cc[0]~feeder_combout\);

-- Location: FF_X11_Y18_N31
\s_cc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cc[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cc(0));

-- Location: IOIBUF_X10_Y19_N8
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

-- Location: LCCOMB_X11_Y18_N6
\s_bbb[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_bbb[1]~feeder_combout\ = \i_instruction[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_instruction[3]~input_o\,
	combout => \s_bbb[1]~feeder_combout\);

-- Location: FF_X11_Y18_N7
\s_bbb[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_bbb[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(1));

-- Location: IOIBUF_X10_Y17_N8
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

-- Location: LCCOMB_X11_Y18_N4
\s_bbb[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_bbb[2]~feeder_combout\ = \i_instruction[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \i_instruction[4]~input_o\,
	combout => \s_bbb[2]~feeder_combout\);

-- Location: FF_X11_Y18_N5
\s_bbb[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_bbb[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_bbb(2));

-- Location: LCCOMB_X11_Y18_N2
\Mux9~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = (s_cc(0) & (!s_cc(1) & ((s_bbb(2)) # (!s_bbb(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(1),
	datab => s_bbb(2),
	datac => s_cc(0),
	datad => s_cc(1),
	combout => \Mux9~2_combout\);

-- Location: LCCOMB_X11_Y18_N0
\Mux9~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = (\Mux9~2_combout\) # ((s_bbb(0) & ((!s_cc(0)) # (!s_cc(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(0),
	datab => s_cc(1),
	datac => s_cc(0),
	datad => \Mux9~2_combout\,
	combout => \Mux9~3_combout\);

-- Location: FF_X11_Y18_N1
\o_addressing_mode[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux9~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[0]~reg0_q\);

-- Location: LCCOMB_X11_Y18_N10
\Mux8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (s_cc(0) & (((!s_bbb(0) & !s_bbb(2))) # (!s_bbb(1)))) # (!s_cc(0) & (!s_bbb(1) & ((s_bbb(0)) # (!s_bbb(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cc(0),
	datab => s_bbb(0),
	datac => s_bbb(2),
	datad => s_bbb(1),
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X11_Y18_N26
\Mux8~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\ & ((!s_cc(0)) # (!s_cc(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_cc(1),
	datac => s_cc(0),
	datad => \Mux8~0_combout\,
	combout => \Mux8~1_combout\);

-- Location: FF_X11_Y18_N27
\o_addressing_mode[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[1]~reg0_q\);

-- Location: LCCOMB_X11_Y18_N12
\Mux7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (!s_bbb(1) & ((s_cc(0) & ((!s_cc(1)))) # (!s_cc(0) & (s_bbb(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(0),
	datab => s_bbb(1),
	datac => s_cc(0),
	datad => s_cc(1),
	combout => \Mux7~0_combout\);

-- Location: FF_X11_Y18_N13
\o_addressing_mode[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[2]~reg0_q\);

-- Location: LCCOMB_X11_Y18_N16
\Mux11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (s_bbb(2) & (((s_bbb(0))))) # (!s_bbb(2) & (!s_bbb(1) & (s_cc(0) & !s_bbb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(1),
	datab => s_bbb(2),
	datac => s_cc(0),
	datad => s_bbb(0),
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X11_Y18_N18
\Mux11~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\Mux11~0_combout\ & ((s_cc(0) & ((!s_cc(1)))) # (!s_cc(0) & (s_bbb(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(0),
	datab => s_cc(1),
	datac => s_cc(0),
	datad => \Mux11~0_combout\,
	combout => \Mux11~1_combout\);

-- Location: FF_X11_Y18_N19
\o_register_select[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[0]~reg0_q\);

-- Location: LCCOMB_X11_Y18_N24
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (s_bbb(2) & (!s_cc(1) & (s_cc(0) & !s_bbb(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_bbb(2),
	datab => s_cc(1),
	datac => s_cc(0),
	datad => s_bbb(0),
	combout => \Mux10~0_combout\);

-- Location: FF_X11_Y18_N25
\o_register_select[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[1]~reg0_q\);

-- Location: IOIBUF_X27_Y0_N22
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

-- Location: IOIBUF_X17_Y25_N15
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

-- Location: IOIBUF_X6_Y10_N15
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

-- Location: IOIBUF_X27_Y25_N1
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

-- Location: IOIBUF_X9_Y0_N15
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

-- Location: IOIBUF_X3_Y10_N29
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

-- Location: IOIBUF_X31_Y4_N15
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

-- Location: IOIBUF_X29_Y25_N1
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

-- Location: IOIBUF_X13_Y25_N8
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

-- Location: IOIBUF_X11_Y0_N15
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

-- Location: IOIBUF_X24_Y25_N29
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


