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

-- DATE "12/12/2023 13:38:55"

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
-- i_status_register[2]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[3]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[4]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[5]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[0]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[1]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[2]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[3]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[4]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[5]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[0]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[1]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[2]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[0]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[1]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[5]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[3]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[4]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[0]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[2]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[0]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[1]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[6]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[7]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[6]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[7]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[1]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \i_status_register[2]~input_o\ : std_logic;
SIGNAL \i_status_register[3]~input_o\ : std_logic;
SIGNAL \i_status_register[4]~input_o\ : std_logic;
SIGNAL \i_status_register[5]~input_o\ : std_logic;
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
SIGNAL \i_instruction[0]~input_o\ : std_logic;
SIGNAL \i_instruction[1]~input_o\ : std_logic;
SIGNAL \i_instruction[4]~input_o\ : std_logic;
SIGNAL \i_status_register[0]~input_o\ : std_logic;
SIGNAL \i_instruction[2]~input_o\ : std_logic;
SIGNAL \i_instruction[3]~input_o\ : std_logic;
SIGNAL \Mux38~0_combout\ : std_logic;
SIGNAL \Mux38~1_combout\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \i_instruction[6]~input_o\ : std_logic;
SIGNAL \i_instruction[7]~input_o\ : std_logic;
SIGNAL \Mux36~0_combout\ : std_logic;
SIGNAL \Mux38~2_combout\ : std_logic;
SIGNAL \o_active_instruction[0]~reg0_q\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \Mux37~1_combout\ : std_logic;
SIGNAL \o_active_instruction[1]~reg0_q\ : std_logic;
SIGNAL \Mux36~1_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux36~2_combout\ : std_logic;
SIGNAL \Mux36~3_combout\ : std_logic;
SIGNAL \o_active_instruction[2]~reg0_q\ : std_logic;
SIGNAL \Mux35~1_combout\ : std_logic;
SIGNAL \i_status_register[1]~input_o\ : std_logic;
SIGNAL \Mux35~4_combout\ : std_logic;
SIGNAL \Mux35~5_combout\ : std_logic;
SIGNAL \i_status_register[7]~input_o\ : std_logic;
SIGNAL \i_status_register[6]~input_o\ : std_logic;
SIGNAL \Mux35~2_combout\ : std_logic;
SIGNAL \Mux35~3_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Mux35~6_combout\ : std_logic;
SIGNAL \o_active_instruction[3]~reg0_q\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux34~0_combout\ : std_logic;
SIGNAL \Mux36~4_combout\ : std_logic;
SIGNAL \Mux34~1_combout\ : std_logic;
SIGNAL \o_active_instruction[4]~reg0_q\ : std_logic;
SIGNAL \Mux33~1_combout\ : std_logic;
SIGNAL \o_active_instruction[5]~reg0_q\ : std_logic;
SIGNAL \Mux41~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[0]~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[0]~reg0_q\ : std_logic;
SIGNAL \Mux40~2_combout\ : std_logic;
SIGNAL \Mux40~3_combout\ : std_logic;
SIGNAL \Mux40~6_combout\ : std_logic;
SIGNAL \Mux40~5_combout\ : std_logic;
SIGNAL \o_addressing_mode[1]~reg0_q\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[2]~reg0_q\ : std_logic;
SIGNAL \Mux40~4_combout\ : std_logic;
SIGNAL \o_register_select[0]~0_combout\ : std_logic;
SIGNAL \o_register_select[0]~1_combout\ : std_logic;
SIGNAL \o_register_select[0]~2_combout\ : std_logic;
SIGNAL \o_register_select[0]~reg0_q\ : std_logic;
SIGNAL \Mux42~0_combout\ : std_logic;
SIGNAL \o_register_select[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_i_instruction[0]~input_o\ : std_logic;

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
\ALT_INV_i_instruction[0]~input_o\ <= NOT \i_instruction[0]~input_o\;
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

-- Location: IOOBUF_X17_Y25_N23
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

-- Location: IOOBUF_X10_Y22_N2
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

-- Location: IOOBUF_X15_Y25_N16
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

-- Location: IOOBUF_X22_Y25_N23
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

-- Location: IOOBUF_X17_Y25_N9
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

-- Location: IOOBUF_X15_Y25_N2
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

-- Location: IOOBUF_X15_Y25_N9
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

-- Location: IOOBUF_X15_Y25_N30
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

-- Location: IOOBUF_X10_Y22_N23
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

-- Location: IOOBUF_X17_Y25_N30
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

-- Location: IOIBUF_X22_Y25_N1
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

-- Location: IOIBUF_X19_Y25_N15
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

-- Location: IOIBUF_X15_Y25_N22
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

-- Location: IOIBUF_X13_Y25_N15
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

-- Location: IOIBUF_X17_Y25_N15
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

-- Location: IOIBUF_X13_Y25_N22
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

-- Location: IOIBUF_X13_Y25_N8
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

-- Location: LCCOMB_X16_Y23_N0
\Mux38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux38~0_combout\ = (!\i_instruction[2]~input_o\ & ((\i_instruction[3]~input_o\) # ((\i_instruction[4]~input_o\ & !\i_status_register[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[4]~input_o\,
	datab => \i_status_register[0]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux38~0_combout\);

-- Location: LCCOMB_X17_Y23_N28
\Mux38~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux38~1_combout\ = (\i_instruction[5]~input_o\ & (\i_instruction[0]~input_o\ $ ((\i_instruction[1]~input_o\)))) # (!\i_instruction[5]~input_o\ & (!\i_instruction[0]~input_o\ & (!\i_instruction[1]~input_o\ & \Mux38~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \Mux38~0_combout\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux38~1_combout\);

-- Location: LCCOMB_X17_Y23_N26
\Mux33~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (!\i_instruction[1]~input_o\ & !\i_instruction[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_instruction[1]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux33~0_combout\);

-- Location: IOIBUF_X19_Y25_N8
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

-- Location: IOIBUF_X19_Y25_N1
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

-- Location: LCCOMB_X17_Y23_N0
\Mux36~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~0_combout\ = (!\i_instruction[6]~input_o\ & !\i_instruction[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datac => \i_instruction[7]~input_o\,
	combout => \Mux36~0_combout\);

-- Location: LCCOMB_X17_Y23_N10
\Mux38~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux38~2_combout\ = (\Mux38~1_combout\) # ((!\i_instruction[5]~input_o\ & (\Mux33~0_combout\ & !\Mux36~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[5]~input_o\,
	datab => \Mux38~1_combout\,
	datac => \Mux33~0_combout\,
	datad => \Mux36~0_combout\,
	combout => \Mux38~2_combout\);

-- Location: FF_X17_Y23_N11
\o_active_instruction[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux38~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[0]~reg0_q\);

-- Location: LCCOMB_X17_Y23_N2
\Mux37~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = (\i_instruction[0]~input_o\ & (((!\i_instruction[6]~input_o\)) # (!\i_instruction[1]~input_o\))) # (!\i_instruction[0]~input_o\ & ((\i_instruction[1]~input_o\) # ((\i_instruction[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux37~0_combout\);

-- Location: LCCOMB_X17_Y23_N12
\Mux37~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux37~1_combout\ = (\i_instruction[6]~input_o\ & (((\Mux37~0_combout\)))) # (!\i_instruction[6]~input_o\ & (!\Mux37~0_combout\ & ((\Mux38~0_combout\) # (\i_instruction[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux38~0_combout\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \Mux37~0_combout\,
	combout => \Mux37~1_combout\);

-- Location: FF_X17_Y23_N13
\o_active_instruction[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux37~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[1]~reg0_q\);

-- Location: LCCOMB_X17_Y23_N16
\Mux36~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~1_combout\ = (\i_instruction[6]~input_o\) # (\i_instruction[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux36~1_combout\);

-- Location: LCCOMB_X16_Y23_N14
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\i_instruction[2]~input_o\ & \i_instruction[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[2]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X17_Y23_N22
\Mux36~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~2_combout\ = (\Mux36~1_combout\ & ((\i_instruction[7]~input_o\ $ (\Mux1~0_combout\)))) # (!\Mux36~1_combout\ & ((\i_instruction[7]~input_o\ & ((\Mux1~0_combout\))) # (!\i_instruction[7]~input_o\ & (\Mux38~0_combout\ & !\Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux38~0_combout\,
	datab => \Mux36~1_combout\,
	datac => \i_instruction[7]~input_o\,
	datad => \Mux1~0_combout\,
	combout => \Mux36~2_combout\);

-- Location: LCCOMB_X16_Y23_N18
\Mux36~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~3_combout\ = (\i_instruction[0]~input_o\ & (\i_instruction[7]~input_o\ & (!\i_instruction[1]~input_o\))) # (!\i_instruction[0]~input_o\ & ((\i_instruction[1]~input_o\ & (\i_instruction[7]~input_o\)) # (!\i_instruction[1]~input_o\ & 
-- ((\Mux36~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_instruction[1]~input_o\,
	datad => \Mux36~2_combout\,
	combout => \Mux36~3_combout\);

-- Location: FF_X16_Y23_N19
\o_active_instruction[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux36~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[2]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N28
\Mux35~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~1_combout\ = (\i_instruction[4]~input_o\ & (!\i_instruction[2]~input_o\ & !\i_instruction[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[4]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux35~1_combout\);

-- Location: IOIBUF_X17_Y25_N1
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

-- Location: LCCOMB_X17_Y23_N30
\Mux35~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~4_combout\ = (\i_instruction[6]~input_o\ & (!\i_instruction[7]~input_o\ & (\i_status_register[1]~input_o\ $ (!\i_instruction[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_status_register[1]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux35~4_combout\);

-- Location: LCCOMB_X17_Y23_N4
\Mux35~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~5_combout\ = (\Mux35~4_combout\) # ((\Mux36~0_combout\ & (\i_status_register[0]~input_o\ & \i_instruction[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux35~4_combout\,
	datab => \Mux36~0_combout\,
	datac => \i_status_register[0]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux35~5_combout\);

-- Location: IOIBUF_X19_Y25_N22
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

-- Location: IOIBUF_X19_Y25_N29
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

-- Location: LCCOMB_X18_Y24_N28
\Mux35~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~2_combout\ = (\i_instruction[6]~input_o\ & ((\i_status_register[6]~input_o\))) # (!\i_instruction[6]~input_o\ & (\i_status_register[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_instruction[6]~input_o\,
	datac => \i_status_register[7]~input_o\,
	datad => \i_status_register[6]~input_o\,
	combout => \Mux35~2_combout\);

-- Location: LCCOMB_X18_Y24_N30
\Mux35~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~3_combout\ = (\i_instruction[7]~input_o\ & (\Mux35~2_combout\ $ (!\i_instruction[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux35~2_combout\,
	datac => \i_instruction[5]~input_o\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux35~3_combout\);

-- Location: LCCOMB_X17_Y23_N24
\Mux18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = \i_instruction[4]~input_o\ $ (((\i_instruction[7]~input_o\ & ((\i_instruction[6]~input_o\) # (\i_instruction[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X18_Y23_N18
\Mux35~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = (\i_instruction[1]~input_o\) # ((!\i_instruction[0]~input_o\ & (\Mux1~0_combout\ & \Mux18~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \Mux1~0_combout\,
	datac => \i_instruction[1]~input_o\,
	datad => \Mux18~0_combout\,
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X18_Y23_N0
\Mux35~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~6_combout\ = (\Mux35~0_combout\) # ((\Mux35~1_combout\ & ((\Mux35~5_combout\) # (\Mux35~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux35~1_combout\,
	datab => \Mux35~5_combout\,
	datac => \Mux35~3_combout\,
	datad => \Mux35~0_combout\,
	combout => \Mux35~6_combout\);

-- Location: FF_X18_Y23_N1
\o_active_instruction[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux35~6_combout\,
	sclr => \i_instruction[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[3]~reg0_q\);

-- Location: LCCOMB_X17_Y23_N18
\Mux17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\i_instruction[4]~input_o\ & ((\i_instruction[6]~input_o\) # ((!\i_instruction[1]~input_o\ & \i_instruction[5]~input_o\)))) # (!\i_instruction[4]~input_o\ & (((\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X17_Y23_N8
\Mux34~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~0_combout\ = (\i_status_register[0]~input_o\ & (((\i_instruction[7]~input_o\ & \Mux17~0_combout\)))) # (!\i_status_register[0]~input_o\ & ((\Mux35~1_combout\) # ((\i_instruction[7]~input_o\ & \Mux17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_status_register[0]~input_o\,
	datab => \Mux35~1_combout\,
	datac => \i_instruction[7]~input_o\,
	datad => \Mux17~0_combout\,
	combout => \Mux34~0_combout\);

-- Location: LCCOMB_X17_Y23_N6
\Mux36~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~4_combout\ = (!\i_instruction[6]~input_o\ & (!\i_instruction[7]~input_o\ & !\i_instruction[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux36~4_combout\);

-- Location: LCCOMB_X17_Y23_N14
\Mux34~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~1_combout\ = (\Mux33~0_combout\ & ((\Mux34~0_combout\) # ((!\Mux1~0_combout\ & !\Mux36~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~0_combout\,
	datab => \Mux34~0_combout\,
	datac => \Mux33~0_combout\,
	datad => \Mux36~4_combout\,
	combout => \Mux34~1_combout\);

-- Location: FF_X17_Y23_N15
\o_active_instruction[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux34~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_active_instruction[4]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N4
\Mux33~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~1_combout\ = (\i_instruction[3]~input_o\ & (!\i_instruction[1]~input_o\ & (!\i_instruction[2]~input_o\ & !\i_instruction[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux33~1_combout\);

-- Location: FF_X16_Y23_N5
\o_active_instruction[5]~reg0\ : dffeas
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
	q => \o_active_instruction[5]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N16
\Mux41~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux41~0_combout\ = (!\i_instruction[1]~input_o\ & ((\i_instruction[4]~input_o\) # ((\i_instruction[2]~input_o\) # (!\i_instruction[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[4]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux41~0_combout\);

-- Location: LCCOMB_X16_Y23_N6
\o_addressing_mode[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_addressing_mode[0]~0_combout\ = ((\i_instruction[2]~input_o\) # ((!\i_instruction[4]~input_o\ & !\i_instruction[3]~input_o\))) # (!\Mux33~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[4]~input_o\,
	datab => \Mux33~0_combout\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \o_addressing_mode[0]~0_combout\);

-- Location: FF_X16_Y23_N17
\o_addressing_mode[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux41~0_combout\,
	asdata => \i_instruction[2]~input_o\,
	sload => \ALT_INV_i_instruction[0]~input_o\,
	ena => \o_addressing_mode[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[0]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N8
\Mux40~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~2_combout\ = (!\i_instruction[3]~input_o\ & ((!\i_instruction[0]~input_o\) # (!\i_instruction[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux40~2_combout\);

-- Location: LCCOMB_X16_Y23_N26
\Mux40~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~3_combout\ = (\Mux40~2_combout\ & ((\i_instruction[2]~input_o\) # ((\i_instruction[0]~input_o\) # (!\i_instruction[4]~input_o\)))) # (!\Mux40~2_combout\ & (((!\i_instruction[4]~input_o\ & \i_instruction[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[2]~input_o\,
	datab => \Mux40~2_combout\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux40~3_combout\);

-- Location: LCCOMB_X16_Y23_N2
\Mux40~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~6_combout\ = (!\i_instruction[1]~input_o\ & (!\i_instruction[2]~input_o\ & ((\Mux40~3_combout\) # (!\i_instruction[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux40~6_combout\);

-- Location: LCCOMB_X16_Y23_N10
\Mux40~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~5_combout\ = (\Mux40~3_combout\ & ((\Mux40~2_combout\) # ((\Mux40~6_combout\)))) # (!\Mux40~3_combout\ & (((\o_addressing_mode[1]~reg0_q\ & \Mux40~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~3_combout\,
	datab => \Mux40~2_combout\,
	datac => \o_addressing_mode[1]~reg0_q\,
	datad => \Mux40~6_combout\,
	combout => \Mux40~5_combout\);

-- Location: FF_X16_Y23_N11
\o_addressing_mode[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux40~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[1]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N12
\Mux39~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = (!\i_instruction[3]~input_o\ & ((\i_instruction[0]~input_o\ & (!\i_instruction[1]~input_o\)) # (!\i_instruction[0]~input_o\ & ((\i_instruction[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux39~0_combout\);

-- Location: FF_X16_Y23_N13
\o_addressing_mode[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux39~0_combout\,
	ena => \o_addressing_mode[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_addressing_mode[2]~reg0_q\);

-- Location: LCCOMB_X16_Y23_N24
\Mux40~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~4_combout\ = (!\i_instruction[1]~input_o\ & !\i_instruction[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[2]~input_o\,
	combout => \Mux40~4_combout\);

-- Location: LCCOMB_X16_Y23_N22
\o_register_select[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_register_select[0]~0_combout\ = (!\i_instruction[3]~input_o\ & (\Mux40~4_combout\ & (!\i_instruction[4]~input_o\ & \i_instruction[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[3]~input_o\,
	datab => \Mux40~4_combout\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \o_register_select[0]~0_combout\);

-- Location: LCCOMB_X16_Y23_N20
\o_register_select[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_register_select[0]~1_combout\ = (\i_instruction[2]~input_o\ & (\i_instruction[4]~input_o\ & ((!\i_instruction[0]~input_o\) # (!\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[2]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \o_register_select[0]~1_combout\);

-- Location: LCCOMB_X16_Y23_N30
\o_register_select[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_register_select[0]~2_combout\ = (\o_register_select[0]~0_combout\) # ((\o_register_select[0]~1_combout\) # ((\o_register_select[0]~reg0_q\ & !\o_addressing_mode[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_register_select[0]~0_combout\,
	datab => \o_register_select[0]~1_combout\,
	datac => \o_register_select[0]~reg0_q\,
	datad => \o_addressing_mode[0]~0_combout\,
	combout => \o_register_select[0]~2_combout\);

-- Location: FF_X16_Y23_N31
\o_register_select[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \o_register_select[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[0]~reg0_q\);

-- Location: LCCOMB_X17_Y23_N20
\Mux42~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux42~0_combout\ = (!\i_instruction[2]~input_o\ & (\i_instruction[4]~input_o\ & \i_instruction[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[2]~input_o\,
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux42~0_combout\);

-- Location: FF_X17_Y23_N21
\o_register_select[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \Mux42~0_combout\,
	sclr => \i_instruction[1]~input_o\,
	ena => \o_addressing_mode[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_register_select[1]~reg0_q\);

-- Location: IOIBUF_X24_Y25_N29
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

-- Location: IOIBUF_X0_Y7_N22
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

-- Location: IOIBUF_X31_Y19_N15
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

-- Location: IOIBUF_X29_Y0_N8
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


