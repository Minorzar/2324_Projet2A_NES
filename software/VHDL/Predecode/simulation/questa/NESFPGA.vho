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

-- DATE "12/05/2023 14:20:21"

-- 
-- Device: Altera 10M08DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	predecode IS
    PORT (
	i_instruction : IN std_logic_vector(7 DOWNTO 0);
	i_status_register : IN std_logic_vector(7 DOWNTO 0);
	o_active_instruction : BUFFER std_logic_vector(5 DOWNTO 0);
	o_addressing_mode : BUFFER std_logic_vector(2 DOWNTO 0);
	o_register_select : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END predecode;

-- Design Ports Information
-- i_status_register[2]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[3]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[4]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[5]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[0]	=>  Location: PIN_T1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[1]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[2]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[3]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[4]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_active_instruction[5]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[0]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[1]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_addressing_mode[2]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[0]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_register_select[1]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[6]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[0]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[1]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[3]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[0]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[2]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_status_register[7]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[1]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[6]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[7]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[4]	=>  Location: PIN_W5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_instruction[5]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_i_instruction : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_i_status_register : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_active_instruction : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_o_addressing_mode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_o_register_select : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Mux45~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_status_register[2]~input_o\ : std_logic;
SIGNAL \i_status_register[3]~input_o\ : std_logic;
SIGNAL \i_status_register[4]~input_o\ : std_logic;
SIGNAL \i_status_register[5]~input_o\ : std_logic;
SIGNAL \i_status_register[6]~input_o\ : std_logic;
SIGNAL \i_status_register[0]~input_o\ : std_logic;
SIGNAL \i_status_register[1]~input_o\ : std_logic;
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
SIGNAL \i_instruction[6]~input_o\ : std_logic;
SIGNAL \i_instruction[7]~input_o\ : std_logic;
SIGNAL \Mux34~0_combout\ : std_logic;
SIGNAL \i_instruction[4]~input_o\ : std_logic;
SIGNAL \i_instruction[5]~input_o\ : std_logic;
SIGNAL \Mux34~1_combout\ : std_logic;
SIGNAL \i_status_register[7]~input_o\ : std_logic;
SIGNAL \i_instruction[2]~input_o\ : std_logic;
SIGNAL \i_instruction[0]~input_o\ : std_logic;
SIGNAL \i_instruction[1]~input_o\ : std_logic;
SIGNAL \Mux32~0_combout\ : std_logic;
SIGNAL \i_instruction[3]~input_o\ : std_logic;
SIGNAL \Mux34~2_combout\ : std_logic;
SIGNAL \Mux32~1_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux32~2_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \Mux24~1_combout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Mux39~1_combout\ : std_logic;
SIGNAL \Mux45~0_combout\ : std_logic;
SIGNAL \Mux45~1_combout\ : std_logic;
SIGNAL \Mux45~1clkctrl_outclk\ : std_logic;
SIGNAL \o_addressing_mode[0]$latch~combout\ : std_logic;
SIGNAL \Mux41~0_combout\ : std_logic;
SIGNAL \Mux41~1_combout\ : std_logic;
SIGNAL \o_addressing_mode[1]$latch~combout\ : std_logic;
SIGNAL \Mux44~0_combout\ : std_logic;
SIGNAL \o_addressing_mode[2]$latch~combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Mux35~1_combout\ : std_logic;
SIGNAL \o_register_select[0]$latch~combout\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \o_register_select[1]$latch~combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_instruction <= i_instruction;
ww_i_status_register <= i_status_register;
o_active_instruction <= ww_o_active_instruction;
o_addressing_mode <= ww_o_addressing_mode;
o_register_select <= ww_o_register_select;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\Mux45~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Mux45~1_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y14_N24
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

-- Location: IOOBUF_X0_Y4_N2
\o_active_instruction[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux34~2_combout\,
	devoe => ww_devoe,
	o => \o_active_instruction[0]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\o_active_instruction[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux33~0_combout\,
	devoe => ww_devoe,
	o => \o_active_instruction[1]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\o_active_instruction[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux32~2_combout\,
	devoe => ww_devoe,
	o => \o_active_instruction[2]~output_o\);

-- Location: IOOBUF_X0_Y3_N23
\o_active_instruction[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux31~0_combout\,
	devoe => ww_devoe,
	o => \o_active_instruction[3]~output_o\);

-- Location: IOOBUF_X0_Y3_N9
\o_active_instruction[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux30~0_combout\,
	devoe => ww_devoe,
	o => \o_active_instruction[4]~output_o\);

-- Location: IOOBUF_X0_Y3_N2
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

-- Location: IOOBUF_X0_Y6_N9
\o_addressing_mode[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[0]$latch~combout\,
	devoe => ww_devoe,
	o => \o_addressing_mode[0]~output_o\);

-- Location: IOOBUF_X0_Y5_N23
\o_addressing_mode[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[1]$latch~combout\,
	devoe => ww_devoe,
	o => \o_addressing_mode[1]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\o_addressing_mode[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_addressing_mode[2]$latch~combout\,
	devoe => ww_devoe,
	o => \o_addressing_mode[2]~output_o\);

-- Location: IOOBUF_X1_Y10_N2
\o_register_select[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_register_select[0]$latch~combout\,
	devoe => ww_devoe,
	o => \o_register_select[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N2
\o_register_select[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_register_select[1]$latch~combout\,
	devoe => ww_devoe,
	o => \o_register_select[1]~output_o\);

-- Location: IOIBUF_X0_Y7_N15
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

-- Location: IOIBUF_X0_Y5_N15
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

-- Location: LCCOMB_X2_Y4_N22
\Mux34~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~0_combout\ = \i_instruction[6]~input_o\ $ (\i_instruction[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datac => \i_instruction[7]~input_o\,
	combout => \Mux34~0_combout\);

-- Location: IOIBUF_X3_Y0_N15
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

-- Location: IOIBUF_X0_Y4_N22
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

-- Location: LCCOMB_X2_Y4_N20
\Mux34~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~1_combout\ = (!\i_instruction[7]~input_o\ & (!\i_instruction[6]~input_o\ & ((\i_instruction[4]~input_o\) # (\i_instruction[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[7]~input_o\,
	datab => \i_instruction[4]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[5]~input_o\,
	combout => \Mux34~1_combout\);

-- Location: IOIBUF_X0_Y4_N15
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

-- Location: IOIBUF_X0_Y8_N1
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

-- Location: IOIBUF_X0_Y6_N22
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

-- Location: IOIBUF_X3_Y10_N1
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

-- Location: LCCOMB_X2_Y4_N4
\Mux32~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux32~0_combout\ = (\i_instruction[0]~input_o\) # ((!\i_instruction[1]~input_o\ & ((!\i_instruction[2]~input_o\) # (!\i_status_register[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_status_register[7]~input_o\,
	datab => \i_instruction[2]~input_o\,
	datac => \i_instruction[0]~input_o\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux32~0_combout\);

-- Location: IOIBUF_X3_Y0_N29
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

-- Location: LCCOMB_X2_Y4_N14
\Mux34~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~2_combout\ = (\i_instruction[3]~input_o\ & (\Mux34~0_combout\)) # (!\i_instruction[3]~input_o\ & (((\Mux34~1_combout\ & \Mux32~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux34~0_combout\,
	datab => \Mux34~1_combout\,
	datac => \Mux32~0_combout\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux34~2_combout\);

-- Location: LCCOMB_X2_Y4_N24
\Mux32~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux32~1_combout\ = (\Mux32~0_combout\ & !\i_instruction[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux32~0_combout\,
	datac => \i_instruction[7]~input_o\,
	combout => \Mux32~1_combout\);

-- Location: LCCOMB_X2_Y4_N18
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\i_instruction[4]~input_o\ & ((\i_instruction[3]~input_o\))) # (!\i_instruction[4]~input_o\ & (\i_instruction[5]~input_o\ & !\i_instruction[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_instruction[4]~input_o\,
	datac => \i_instruction[5]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X2_Y4_N12
\Mux33~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (\Mux34~0_combout\ & (((\i_instruction[4]~input_o\)))) # (!\Mux34~0_combout\ & (\Mux32~1_combout\ & ((\Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux34~0_combout\,
	datab => \Mux32~1_combout\,
	datac => \i_instruction[4]~input_o\,
	datad => \Mux10~0_combout\,
	combout => \Mux33~0_combout\);

-- Location: LCCOMB_X2_Y4_N26
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (!\i_instruction[4]~input_o\ & !\i_instruction[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_instruction[4]~input_o\,
	datad => \i_instruction[3]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X2_Y4_N8
\Mux32~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux32~2_combout\ = (\i_instruction[5]~input_o\ & ((\Mux34~0_combout\) # ((!\Mux9~0_combout\ & \Mux32~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux34~0_combout\,
	datab => \i_instruction[5]~input_o\,
	datac => \Mux9~0_combout\,
	datad => \Mux32~1_combout\,
	combout => \Mux32~2_combout\);

-- Location: LCCOMB_X2_Y4_N30
\Mux24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (\i_status_register[7]~input_o\ & (\i_instruction[2]~input_o\ & (!\i_instruction[0]~input_o\ & !\i_instruction[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_status_register[7]~input_o\,
	datab => \i_instruction[2]~input_o\,
	datac => \i_instruction[0]~input_o\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X2_Y4_N16
\Mux31~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = (!\i_instruction[6]~input_o\ & ((\Mux24~0_combout\) # (\i_instruction[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datac => \Mux24~0_combout\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux31~0_combout\);

-- Location: LCCOMB_X2_Y4_N10
\Mux24~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~1_combout\ = (\Mux9~0_combout\ & (\i_instruction[5]~input_o\ & ((\i_instruction[0]~input_o\) # (!\i_instruction[1]~input_o\)))) # (!\Mux9~0_combout\ & (((\i_instruction[0]~input_o\) # (!\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \i_instruction[5]~input_o\,
	datac => \i_instruction[0]~input_o\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux24~1_combout\);

-- Location: LCCOMB_X2_Y4_N28
\Mux30~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (!\i_instruction[6]~input_o\ & (!\i_instruction[7]~input_o\ & ((\Mux24~0_combout\) # (\Mux24~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[7]~input_o\,
	datac => \Mux24~0_combout\,
	datad => \Mux24~1_combout\,
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X1_Y6_N0
\Mux39~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = (\i_instruction[0]~input_o\) # ((\i_instruction[2]~input_o\ & \i_instruction[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datab => \i_instruction[2]~input_o\,
	datac => \i_instruction[6]~input_o\,
	combout => \Mux39~0_combout\);

-- Location: LCCOMB_X1_Y6_N6
\Mux39~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux39~1_combout\ = (\Mux39~0_combout\ & (((!\i_instruction[7]~input_o\)) # (!\i_instruction[6]~input_o\))) # (!\Mux39~0_combout\ & (!\i_instruction[7]~input_o\ & (\i_instruction[6]~input_o\ $ (\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \Mux39~0_combout\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux39~1_combout\);

-- Location: LCCOMB_X1_Y9_N18
\Mux45~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux45~0_combout\ = (\i_instruction[7]~input_o\) # ((\i_instruction[0]~input_o\) # ((!\i_instruction[2]~input_o\ & !\i_instruction[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[2]~input_o\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[7]~input_o\,
	datad => \i_instruction[0]~input_o\,
	combout => \Mux45~0_combout\);

-- Location: LCCOMB_X1_Y9_N28
\Mux45~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux45~1_combout\ = (\i_instruction[6]~input_o\) # (\Mux45~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_instruction[6]~input_o\,
	datad => \Mux45~0_combout\,
	combout => \Mux45~1_combout\);

-- Location: CLKCTRL_G2
\Mux45~1clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Mux45~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Mux45~1clkctrl_outclk\);

-- Location: LCCOMB_X1_Y6_N22
\o_addressing_mode[0]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_addressing_mode[0]$latch~combout\ = (GLOBAL(\Mux45~1clkctrl_outclk\) & (\Mux39~1_combout\)) # (!GLOBAL(\Mux45~1clkctrl_outclk\) & ((\o_addressing_mode[0]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux39~1_combout\,
	datac => \o_addressing_mode[0]$latch~combout\,
	datad => \Mux45~1clkctrl_outclk\,
	combout => \o_addressing_mode[0]$latch~combout\);

-- Location: LCCOMB_X1_Y6_N16
\Mux41~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux41~0_combout\ = (\i_instruction[0]~input_o\ & ((!\i_instruction[7]~input_o\))) # (!\i_instruction[0]~input_o\ & (\i_instruction[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux41~0_combout\);

-- Location: LCCOMB_X1_Y6_N10
\Mux41~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux41~1_combout\ = (\Mux41~0_combout\ & (!\i_instruction[1]~input_o\ & ((!\i_instruction[7]~input_o\)))) # (!\Mux41~0_combout\ & ((\i_instruction[6]~input_o\ & ((!\i_instruction[7]~input_o\))) # (!\i_instruction[6]~input_o\ & 
-- (!\i_instruction[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux41~0_combout\,
	datab => \i_instruction[1]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux41~1_combout\);

-- Location: LCCOMB_X1_Y6_N4
\o_addressing_mode[1]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_addressing_mode[1]$latch~combout\ = (GLOBAL(\Mux45~1clkctrl_outclk\) & (\Mux41~1_combout\)) # (!GLOBAL(\Mux45~1clkctrl_outclk\) & ((\o_addressing_mode[1]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux41~1_combout\,
	datac => \o_addressing_mode[1]$latch~combout\,
	datad => \Mux45~1clkctrl_outclk\,
	combout => \o_addressing_mode[1]$latch~combout\);

-- Location: LCCOMB_X1_Y6_N20
\Mux44~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux44~0_combout\ = (\i_instruction[1]~input_o\) # ((\i_instruction[6]~input_o\ & (\i_instruction[7]~input_o\)) # (!\i_instruction[6]~input_o\ & ((!\i_instruction[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[7]~input_o\,
	datab => \i_instruction[0]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux44~0_combout\);

-- Location: LCCOMB_X1_Y6_N26
\o_addressing_mode[2]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_addressing_mode[2]$latch~combout\ = (GLOBAL(\Mux45~1clkctrl_outclk\) & (!\Mux44~0_combout\)) # (!GLOBAL(\Mux45~1clkctrl_outclk\) & ((\o_addressing_mode[2]$latch~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux44~0_combout\,
	datac => \o_addressing_mode[2]$latch~combout\,
	datad => \Mux45~1clkctrl_outclk\,
	combout => \o_addressing_mode[2]$latch~combout\);

-- Location: LCCOMB_X1_Y6_N30
\Mux35~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = (\i_instruction[0]~input_o\ & (!\i_instruction[6]~input_o\ & \i_instruction[7]~input_o\)) # (!\i_instruction[0]~input_o\ & (\i_instruction[6]~input_o\ & !\i_instruction[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[0]~input_o\,
	datac => \i_instruction[6]~input_o\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X2_Y6_N20
\Mux35~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~1_combout\ = (\i_instruction[2]~input_o\ & (\i_instruction[7]~input_o\ $ ((!\Mux35~0_combout\)))) # (!\i_instruction[2]~input_o\ & (!\i_instruction[7]~input_o\ & (\Mux35~0_combout\ & !\i_instruction[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[7]~input_o\,
	datab => \i_instruction[2]~input_o\,
	datac => \Mux35~0_combout\,
	datad => \i_instruction[1]~input_o\,
	combout => \Mux35~1_combout\);

-- Location: LCCOMB_X2_Y6_N14
\o_register_select[0]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_register_select[0]$latch~combout\ = (GLOBAL(\Mux45~1clkctrl_outclk\) & ((\Mux35~1_combout\))) # (!GLOBAL(\Mux45~1clkctrl_outclk\) & (\o_register_select[0]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \o_register_select[0]$latch~combout\,
	datac => \Mux35~1_combout\,
	datad => \Mux45~1clkctrl_outclk\,
	combout => \o_register_select[0]$latch~combout\);

-- Location: LCCOMB_X1_Y6_N24
\Mux37~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = (\i_instruction[6]~input_o\ & (!\i_instruction[0]~input_o\ & (\i_instruction[2]~input_o\ & !\i_instruction[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_instruction[6]~input_o\,
	datab => \i_instruction[0]~input_o\,
	datac => \i_instruction[2]~input_o\,
	datad => \i_instruction[7]~input_o\,
	combout => \Mux37~0_combout\);

-- Location: LCCOMB_X1_Y6_N28
\o_register_select[1]$latch\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_register_select[1]$latch~combout\ = (GLOBAL(\Mux45~1clkctrl_outclk\) & ((\Mux37~0_combout\))) # (!GLOBAL(\Mux45~1clkctrl_outclk\) & (\o_register_select[1]$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \o_register_select[1]$latch~combout\,
	datac => \Mux37~0_combout\,
	datad => \Mux45~1clkctrl_outclk\,
	combout => \o_register_select[1]$latch~combout\);

-- Location: IOIBUF_X29_Y0_N29
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

-- Location: IOIBUF_X17_Y0_N22
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

-- Location: IOIBUF_X0_Y5_N1
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

-- Location: IOIBUF_X31_Y5_N15
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

-- Location: IOIBUF_X17_Y0_N1
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

-- Location: IOIBUF_X27_Y25_N15
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

-- Location: IOIBUF_X10_Y15_N1
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


