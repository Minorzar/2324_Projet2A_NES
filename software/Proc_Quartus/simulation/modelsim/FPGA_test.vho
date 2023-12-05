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

-- DATE "12/05/2023 17:22:17"

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

ENTITY 	VGA_final IS
    PORT (
	i_clk50 : IN std_logic;
	i_reset : IN std_logic;
	o_led : BUFFER std_logic;
	o_HS : BUFFER std_logic;
	o_VS : BUFFER std_logic;
	o_R : BUFFER std_logic_vector(7 DOWNTO 0);
	o_G : BUFFER std_logic_vector(7 DOWNTO 0);
	o_B : BUFFER std_logic_vector(7 DOWNTO 0);
	o_BLANK_N : BUFFER std_logic;
	o_SYNC_N : BUFFER std_logic;
	o_CLK : BUFFER std_logic
	);
END VGA_final;

-- Design Ports Information
-- o_led	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_HS	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VS	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[1]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[3]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_R[7]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[0]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[1]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[3]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[4]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[5]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[6]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_G[7]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[0]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[1]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[2]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[4]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[6]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_B[7]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_BLANK_N	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_SYNC_N	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CLK	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_reset	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VGA_final IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk50 : std_logic;
SIGNAL ww_i_reset : std_logic;
SIGNAL ww_o_led : std_logic;
SIGNAL ww_o_HS : std_logic;
SIGNAL ww_o_VS : std_logic;
SIGNAL ww_o_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_BLANK_N : std_logic;
SIGNAL ww_o_SYNC_N : std_logic;
SIGNAL ww_o_CLK : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i_clk50~input_o\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \i_reset~input_o\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \p_blink:counter[0]~q\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \p_blink:counter[1]~q\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \p_blink:counter[2]~q\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \p_blink:counter[3]~q\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \p_blink:counter[4]~q\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \p_blink:counter[5]~q\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \p_blink:counter[6]~q\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \p_blink:counter[7]~q\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \p_blink:counter[8]~q\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \p_blink:counter[9]~q\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \p_blink:counter[10]~q\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \p_blink:counter[11]~q\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \p_blink:counter[12]~q\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \p_blink:counter[13]~q\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \p_blink:counter[14]~q\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \p_blink:counter[15]~q\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \p_blink:counter[16]~q\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \p_blink:counter[17]~q\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \p_blink:counter[18]~q\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \p_blink:counter[19]~q\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \p_blink:counter[20]~q\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \p_blink:counter[22]~q\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \p_blink:counter[23]~q\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \p_blink:counter[24]~q\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \p_blink:counter[21]~q\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \o_led~reg0_q\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~29_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|counter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~6\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~1_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~2\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~17_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~18\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~13_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal0~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal0~1_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~30\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~33_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~34\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~21_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~22\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~25_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~26\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~37_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~38\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~9_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~10\ : std_logic;
SIGNAL \ctrl|sync|u1|Add0~5_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal1~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|shs~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|shs~q\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~37_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~34\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~13_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal3~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~14\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~9_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~10\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~5_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~6\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~1_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~2\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~25_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~26\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~21_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~22\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~17_sumout\ : std_logic;
SIGNAL \ctrl|sync|o_blank~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Equal0~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Equal0~1_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~18\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~29_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Equal0~2_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~38\ : std_logic;
SIGNAL \ctrl|sync|u2|Add0~33_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|svs~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|svs~1_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|svs~q\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~1_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~2\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~5_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|svs~2_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~6\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~9_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~10\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~13_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~14\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~17_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~18\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~21_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Equal3~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~22\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~25_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~26\ : std_logic;
SIGNAL \ctrl|sync|u2|Add1~29_sumout\ : std_logic;
SIGNAL \ctrl|sync|u2|Equal3~1_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[0]~0_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[1]~1_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[2]~2_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[3]~3_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[4]~4_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[5]~5_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[6]~6_combout\ : std_logic;
SIGNAL \ctrl|comm|rR[7]~7_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~1_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~2\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~5_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~6\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~9_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~10\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~13_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal2~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~14\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~17_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~18\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~21_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~22\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~25_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~26\ : std_logic;
SIGNAL \ctrl|sync|u1|Add1~29_sumout\ : std_logic;
SIGNAL \ctrl|sync|u1|Equal2~1_combout\ : std_logic;
SIGNAL \ctrl|comm|rG[1]~feeder_combout\ : std_logic;
SIGNAL \ctrl|sync|o_blank~1_combout\ : std_logic;
SIGNAL \ctrl|sync|o_blank~2_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ctrl|sync|u2|svcount\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ctrl|sync|u1|counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ctrl|sync|u1|shcount\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ctrl|comm|rR\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ctrl|comm|rG\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ctrl|comm|rB\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk25|pll25_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_i_reset~input_o\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|ALT_INV_svs~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \ctrl|sync|ALT_INV_o_blank~2_combout\ : std_logic;
SIGNAL \ctrl|sync|ALT_INV_o_blank~1_combout\ : std_logic;
SIGNAL \ctrl|sync|ALT_INV_o_blank~0_combout\ : std_logic;
SIGNAL \ctrl|sync|u2|ALT_INV_svs~q\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_shs~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[0]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[1]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[2]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[3]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[4]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[5]~q\ : std_logic;
SIGNAL \ctrl|sync|u1|ALT_INV_shcount\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ctrl|sync|u2|ALT_INV_svcount\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ctrl|sync|u2|ALT_INV_counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ctrl|sync|u1|ALT_INV_counter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_Add0~77_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~73_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~69_sumout\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[11]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[12]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[13]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[14]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[6]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[7]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[8]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[9]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[10]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[24]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[15]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[19]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[20]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[21]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[22]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[23]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[16]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[17]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[18]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;

BEGIN

ww_i_clk50 <= i_clk50;
ww_i_reset <= i_reset;
o_led <= ww_o_led;
o_HS <= ww_o_HS;
o_VS <= ww_o_VS;
o_R <= ww_o_R;
o_G <= ww_o_G;
o_B <= ww_o_B;
o_BLANK_N <= ww_o_BLANK_N;
o_SYNC_N <= ww_o_SYNC_N;
o_CLK <= ww_o_CLK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \i_clk50~input_o\);

\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\ <= NOT \ctrl|sync|u1|counter[6]~DUPLICATE_q\;
\clk25|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ <= NOT \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\;
\clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0) <= NOT \clk25|pll25_inst|altera_pll_i|locked_wire\(0);
\ALT_INV_i_reset~input_o\ <= NOT \i_reset~input_o\;
\ctrl|sync|u1|ALT_INV_Equal2~0_combout\ <= NOT \ctrl|sync|u1|Equal2~0_combout\;
\ctrl|sync|u2|ALT_INV_Equal3~0_combout\ <= NOT \ctrl|sync|u2|Equal3~0_combout\;
\ctrl|sync|u2|ALT_INV_svs~0_combout\ <= NOT \ctrl|sync|u2|svs~0_combout\;
\ctrl|sync|u2|ALT_INV_Equal0~1_combout\ <= NOT \ctrl|sync|u2|Equal0~1_combout\;
\ctrl|sync|u2|ALT_INV_Equal0~0_combout\ <= NOT \ctrl|sync|u2|Equal0~0_combout\;
\ctrl|sync|u1|ALT_INV_Equal3~0_combout\ <= NOT \ctrl|sync|u1|Equal3~0_combout\;
\ctrl|sync|u1|ALT_INV_Equal1~0_combout\ <= NOT \ctrl|sync|u1|Equal1~0_combout\;
\ctrl|sync|u1|ALT_INV_Equal0~0_combout\ <= NOT \ctrl|sync|u1|Equal0~0_combout\;
\ALT_INV_LessThan1~3_combout\ <= NOT \LessThan1~3_combout\;
\ALT_INV_LessThan1~2_combout\ <= NOT \LessThan1~2_combout\;
\ALT_INV_LessThan1~1_combout\ <= NOT \LessThan1~1_combout\;
\ALT_INV_LessThan0~4_combout\ <= NOT \LessThan0~4_combout\;
\ALT_INV_LessThan0~3_combout\ <= NOT \LessThan0~3_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
\ctrl|sync|ALT_INV_o_blank~2_combout\ <= NOT \ctrl|sync|o_blank~2_combout\;
\ctrl|sync|ALT_INV_o_blank~1_combout\ <= NOT \ctrl|sync|o_blank~1_combout\;
\ctrl|sync|ALT_INV_o_blank~0_combout\ <= NOT \ctrl|sync|o_blank~0_combout\;
\ctrl|sync|u2|ALT_INV_svs~q\ <= NOT \ctrl|sync|u2|svs~q\;
\ctrl|sync|u1|ALT_INV_shs~q\ <= NOT \ctrl|sync|u1|shs~q\;
\ALT_INV_p_blink:counter[0]~q\ <= NOT \p_blink:counter[0]~q\;
\ALT_INV_p_blink:counter[1]~q\ <= NOT \p_blink:counter[1]~q\;
\ALT_INV_p_blink:counter[2]~q\ <= NOT \p_blink:counter[2]~q\;
\ALT_INV_p_blink:counter[3]~q\ <= NOT \p_blink:counter[3]~q\;
\ALT_INV_p_blink:counter[4]~q\ <= NOT \p_blink:counter[4]~q\;
\ALT_INV_p_blink:counter[5]~q\ <= NOT \p_blink:counter[5]~q\;
\ctrl|sync|u1|ALT_INV_shcount\(7) <= NOT \ctrl|sync|u1|shcount\(7);
\ctrl|sync|u1|ALT_INV_shcount\(6) <= NOT \ctrl|sync|u1|shcount\(6);
\ctrl|sync|u1|ALT_INV_shcount\(5) <= NOT \ctrl|sync|u1|shcount\(5);
\ctrl|sync|u1|ALT_INV_shcount\(4) <= NOT \ctrl|sync|u1|shcount\(4);
\ctrl|sync|u1|ALT_INV_shcount\(3) <= NOT \ctrl|sync|u1|shcount\(3);
\ctrl|sync|u1|ALT_INV_shcount\(2) <= NOT \ctrl|sync|u1|shcount\(2);
\ctrl|sync|u1|ALT_INV_shcount\(1) <= NOT \ctrl|sync|u1|shcount\(1);
\ctrl|sync|u1|ALT_INV_shcount\(0) <= NOT \ctrl|sync|u1|shcount\(0);
\ctrl|sync|u2|ALT_INV_svcount\(7) <= NOT \ctrl|sync|u2|svcount\(7);
\ctrl|sync|u2|ALT_INV_svcount\(6) <= NOT \ctrl|sync|u2|svcount\(6);
\ctrl|sync|u2|ALT_INV_svcount\(5) <= NOT \ctrl|sync|u2|svcount\(5);
\ctrl|sync|u2|ALT_INV_svcount\(4) <= NOT \ctrl|sync|u2|svcount\(4);
\ctrl|sync|u2|ALT_INV_svcount\(3) <= NOT \ctrl|sync|u2|svcount\(3);
\ctrl|sync|u2|ALT_INV_svcount\(2) <= NOT \ctrl|sync|u2|svcount\(2);
\ctrl|sync|u2|ALT_INV_svcount\(1) <= NOT \ctrl|sync|u2|svcount\(1);
\ctrl|sync|u2|ALT_INV_svcount\(0) <= NOT \ctrl|sync|u2|svcount\(0);
\ctrl|sync|u2|ALT_INV_counter\(0) <= NOT \ctrl|sync|u2|counter\(0);
\ctrl|sync|u2|ALT_INV_counter\(1) <= NOT \ctrl|sync|u2|counter\(1);
\ctrl|sync|u1|ALT_INV_counter\(4) <= NOT \ctrl|sync|u1|counter\(4);
\ctrl|sync|u1|ALT_INV_counter\(1) <= NOT \ctrl|sync|u1|counter\(1);
\ctrl|sync|u1|ALT_INV_counter\(0) <= NOT \ctrl|sync|u1|counter\(0);
\ctrl|sync|u1|ALT_INV_counter\(3) <= NOT \ctrl|sync|u1|counter\(3);
\ctrl|sync|u1|ALT_INV_counter\(2) <= NOT \ctrl|sync|u1|counter\(2);
\ALT_INV_Add0~77_sumout\ <= NOT \Add0~77_sumout\;
\ALT_INV_Add0~73_sumout\ <= NOT \Add0~73_sumout\;
\ALT_INV_Add0~69_sumout\ <= NOT \Add0~69_sumout\;
\ALT_INV_p_blink:counter[11]~q\ <= NOT \p_blink:counter[11]~q\;
\ALT_INV_p_blink:counter[12]~q\ <= NOT \p_blink:counter[12]~q\;
\ALT_INV_p_blink:counter[13]~q\ <= NOT \p_blink:counter[13]~q\;
\ALT_INV_p_blink:counter[14]~q\ <= NOT \p_blink:counter[14]~q\;
\ALT_INV_p_blink:counter[6]~q\ <= NOT \p_blink:counter[6]~q\;
\ALT_INV_p_blink:counter[7]~q\ <= NOT \p_blink:counter[7]~q\;
\ALT_INV_p_blink:counter[8]~q\ <= NOT \p_blink:counter[8]~q\;
\ALT_INV_p_blink:counter[9]~q\ <= NOT \p_blink:counter[9]~q\;
\ALT_INV_p_blink:counter[10]~q\ <= NOT \p_blink:counter[10]~q\;
\ALT_INV_p_blink:counter[24]~q\ <= NOT \p_blink:counter[24]~q\;
\ALT_INV_p_blink:counter[15]~q\ <= NOT \p_blink:counter[15]~q\;
\ALT_INV_p_blink:counter[19]~q\ <= NOT \p_blink:counter[19]~q\;
\ALT_INV_p_blink:counter[20]~q\ <= NOT \p_blink:counter[20]~q\;
\ALT_INV_p_blink:counter[21]~q\ <= NOT \p_blink:counter[21]~q\;
\ALT_INV_p_blink:counter[22]~q\ <= NOT \p_blink:counter[22]~q\;
\ALT_INV_p_blink:counter[23]~q\ <= NOT \p_blink:counter[23]~q\;
\ALT_INV_p_blink:counter[16]~q\ <= NOT \p_blink:counter[16]~q\;
\ALT_INV_p_blink:counter[17]~q\ <= NOT \p_blink:counter[17]~q\;
\ALT_INV_p_blink:counter[18]~q\ <= NOT \p_blink:counter[18]~q\;
\ALT_INV_Add0~65_sumout\ <= NOT \Add0~65_sumout\;
\ALT_INV_Add0~61_sumout\ <= NOT \Add0~61_sumout\;
\ALT_INV_Add0~57_sumout\ <= NOT \Add0~57_sumout\;
\ALT_INV_Add0~53_sumout\ <= NOT \Add0~53_sumout\;
\ALT_INV_Add0~49_sumout\ <= NOT \Add0~49_sumout\;
\ALT_INV_Add0~45_sumout\ <= NOT \Add0~45_sumout\;
\ALT_INV_Add0~41_sumout\ <= NOT \Add0~41_sumout\;
\ALT_INV_Add0~37_sumout\ <= NOT \Add0~37_sumout\;
\ALT_INV_Add0~33_sumout\ <= NOT \Add0~33_sumout\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\ctrl|sync|u1|ALT_INV_counter\(8) <= NOT \ctrl|sync|u1|counter\(8);
\ctrl|sync|u1|ALT_INV_counter\(9) <= NOT \ctrl|sync|u1|counter\(9);
\ctrl|sync|u1|ALT_INV_counter\(5) <= NOT \ctrl|sync|u1|counter\(5);
\ctrl|sync|u1|ALT_INV_counter\(6) <= NOT \ctrl|sync|u1|counter\(6);
\ctrl|sync|u1|ALT_INV_counter\(7) <= NOT \ctrl|sync|u1|counter\(7);
\ctrl|sync|u2|ALT_INV_counter\(9) <= NOT \ctrl|sync|u2|counter\(9);
\ctrl|sync|u2|ALT_INV_counter\(6) <= NOT \ctrl|sync|u2|counter\(6);
\ctrl|sync|u2|ALT_INV_counter\(7) <= NOT \ctrl|sync|u2|counter\(7);
\ctrl|sync|u2|ALT_INV_counter\(8) <= NOT \ctrl|sync|u2|counter\(8);
\ctrl|sync|u2|ALT_INV_counter\(2) <= NOT \ctrl|sync|u2|counter\(2);
\ctrl|sync|u2|ALT_INV_counter\(3) <= NOT \ctrl|sync|u2|counter\(3);
\ctrl|sync|u2|ALT_INV_counter\(4) <= NOT \ctrl|sync|u2|counter\(4);
\ctrl|sync|u2|ALT_INV_counter\(5) <= NOT \ctrl|sync|u2|counter\(5);

-- Location: IOOBUF_X52_Y0_N2
\o_led~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \o_led~reg0_q\,
	devoe => ww_devoe,
	o => ww_o_led);

-- Location: IOOBUF_X36_Y81_N53
\o_HS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|sync|u1|shs~q\,
	devoe => ww_devoe,
	o => ww_o_HS);

-- Location: IOOBUF_X34_Y81_N42
\o_VS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|sync|u2|svs~q\,
	devoe => ww_devoe,
	o => ww_o_VS);

-- Location: IOOBUF_X40_Y81_N53
\o_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(0),
	devoe => ww_devoe,
	o => ww_o_R(0));

-- Location: IOOBUF_X38_Y81_N2
\o_R[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(1),
	devoe => ww_devoe,
	o => ww_o_R(1));

-- Location: IOOBUF_X26_Y81_N59
\o_R[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(2),
	devoe => ww_devoe,
	o => ww_o_R(2));

-- Location: IOOBUF_X38_Y81_N19
\o_R[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(3),
	devoe => ww_devoe,
	o => ww_o_R(3));

-- Location: IOOBUF_X36_Y81_N36
\o_R[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(4),
	devoe => ww_devoe,
	o => ww_o_R(4));

-- Location: IOOBUF_X22_Y81_N19
\o_R[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(5),
	devoe => ww_devoe,
	o => ww_o_R(5));

-- Location: IOOBUF_X22_Y81_N2
\o_R[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(6),
	devoe => ww_devoe,
	o => ww_o_R(6));

-- Location: IOOBUF_X26_Y81_N42
\o_R[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rR\(7),
	devoe => ww_devoe,
	o => ww_o_R(7));

-- Location: IOOBUF_X4_Y81_N19
\o_G[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(0),
	devoe => ww_devoe,
	o => ww_o_G(0));

-- Location: IOOBUF_X4_Y81_N2
\o_G[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(1),
	devoe => ww_devoe,
	o => ww_o_G(1));

-- Location: IOOBUF_X20_Y81_N19
\o_G[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(2),
	devoe => ww_devoe,
	o => ww_o_G(2));

-- Location: IOOBUF_X6_Y81_N2
\o_G[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(3),
	devoe => ww_devoe,
	o => ww_o_G(3));

-- Location: IOOBUF_X10_Y81_N59
\o_G[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(4),
	devoe => ww_devoe,
	o => ww_o_G(4));

-- Location: IOOBUF_X10_Y81_N42
\o_G[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(5),
	devoe => ww_devoe,
	o => ww_o_G(5));

-- Location: IOOBUF_X18_Y81_N42
\o_G[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(6),
	devoe => ww_devoe,
	o => ww_o_G(6));

-- Location: IOOBUF_X18_Y81_N59
\o_G[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rG\(7),
	devoe => ww_devoe,
	o => ww_o_G(7));

-- Location: IOOBUF_X40_Y81_N36
\o_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(0),
	devoe => ww_devoe,
	o => ww_o_B(0));

-- Location: IOOBUF_X28_Y81_N19
\o_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(1),
	devoe => ww_devoe,
	o => ww_o_B(1));

-- Location: IOOBUF_X20_Y81_N2
\o_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(2),
	devoe => ww_devoe,
	o => ww_o_B(2));

-- Location: IOOBUF_X36_Y81_N19
\o_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(3),
	devoe => ww_devoe,
	o => ww_o_B(3));

-- Location: IOOBUF_X28_Y81_N2
\o_B[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(4),
	devoe => ww_devoe,
	o => ww_o_B(4));

-- Location: IOOBUF_X36_Y81_N2
\o_B[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(5),
	devoe => ww_devoe,
	o => ww_o_B(5));

-- Location: IOOBUF_X40_Y81_N19
\o_B[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(6),
	devoe => ww_devoe,
	o => ww_o_B(6));

-- Location: IOOBUF_X32_Y81_N19
\o_B[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|comm|rB\(7),
	devoe => ww_devoe,
	o => ww_o_B(7));

-- Location: IOOBUF_X6_Y81_N19
\o_BLANK_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ctrl|sync|ALT_INV_o_blank~2_combout\,
	devoe => ww_devoe,
	o => ww_o_BLANK_N);

-- Location: IOOBUF_X28_Y81_N36
\o_SYNC_N~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_SYNC_N);

-- Location: IOOBUF_X38_Y81_N36
\o_CLK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \clk25|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_o_CLK);

-- Location: IOIBUF_X32_Y0_N1
\i_clk50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk50,
	o => \i_clk50~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X36_Y0_N1
\i_reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_reset,
	o => \i_reset~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "300.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 6,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 6,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \clk25|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_i_reset~input_o\,
	refclkin => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \clk25|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \clk25|pll25_inst|altera_pll_i|locked_wire\(0),
	tclk => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 6,
	dprio0_cnt_lo_div => 6,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "25.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \clk25|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \clk25|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \clk25|pll25_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G6
\clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk25|pll25_inst|altera_pll_i|outclk_wire\(0),
	outclk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: MLABCELL_X39_Y3_N0
\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LABCELL_X37_Y3_N30
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \p_blink:counter[0]~q\ ) + ( VCC ) + ( !VCC ))
-- \Add0~98\ = CARRY(( \p_blink:counter[0]~q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[0]~q\,
	cin => GND,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X37_Y3_N32
\p_blink:counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~97_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[0]~q\);

-- Location: LABCELL_X37_Y3_N33
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \p_blink:counter[1]~q\ ) + ( GND ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( \p_blink:counter[1]~q\ ) + ( GND ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[1]~q\,
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X37_Y3_N35
\p_blink:counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~93_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[1]~q\);

-- Location: LABCELL_X37_Y3_N36
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( \p_blink:counter[2]~q\ ) + ( GND ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( \p_blink:counter[2]~q\ ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[2]~q\,
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X37_Y3_N38
\p_blink:counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~89_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[2]~q\);

-- Location: LABCELL_X37_Y3_N39
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \p_blink:counter[3]~q\ ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( \p_blink:counter[3]~q\ ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[3]~q\,
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X37_Y3_N41
\p_blink:counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~85_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[3]~q\);

-- Location: LABCELL_X37_Y3_N42
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( \p_blink:counter[4]~q\ ) + ( GND ) + ( \Add0~86\ ))
-- \Add0~82\ = CARRY(( \p_blink:counter[4]~q\ ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[4]~q\,
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X37_Y3_N44
\p_blink:counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~81_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[4]~q\);

-- Location: LABCELL_X37_Y3_N45
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( \p_blink:counter[5]~q\ ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~54\ = CARRY(( \p_blink:counter[5]~q\ ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[5]~q\,
	cin => \Add0~82\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X37_Y3_N46
\p_blink:counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~53_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[5]~q\);

-- Location: LABCELL_X37_Y3_N48
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \p_blink:counter[6]~q\ ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~58\ = CARRY(( \p_blink:counter[6]~q\ ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[6]~q\,
	cin => \Add0~54\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X37_Y3_N50
\p_blink:counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~57_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[6]~q\);

-- Location: LABCELL_X37_Y3_N51
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( \p_blink:counter[7]~q\ ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~62\ = CARRY(( \p_blink:counter[7]~q\ ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[7]~q\,
	cin => \Add0~58\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X37_Y3_N53
\p_blink:counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~61_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[7]~q\);

-- Location: LABCELL_X37_Y3_N54
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( \p_blink:counter[8]~q\ ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~66\ = CARRY(( \p_blink:counter[8]~q\ ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[8]~q\,
	cin => \Add0~62\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X37_Y3_N56
\p_blink:counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~65_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[8]~q\);

-- Location: LABCELL_X37_Y3_N57
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \p_blink:counter[9]~q\ ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~50\ = CARRY(( \p_blink:counter[9]~q\ ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[9]~q\,
	cin => \Add0~66\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X37_Y3_N59
\p_blink:counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~49_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[9]~q\);

-- Location: LABCELL_X37_Y2_N0
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( \p_blink:counter[10]~q\ ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~70\ = CARRY(( \p_blink:counter[10]~q\ ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[10]~q\,
	cin => \Add0~50\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X37_Y2_N2
\p_blink:counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~69_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[10]~q\);

-- Location: LABCELL_X37_Y2_N3
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \p_blink:counter[11]~q\ ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~74\ = CARRY(( \p_blink:counter[11]~q\ ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[11]~q\,
	cin => \Add0~70\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X37_Y2_N5
\p_blink:counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~73_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[11]~q\);

-- Location: LABCELL_X37_Y2_N6
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( \p_blink:counter[12]~q\ ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~78\ = CARRY(( \p_blink:counter[12]~q\ ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[12]~q\,
	cin => \Add0~74\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X37_Y2_N8
\p_blink:counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~77_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[12]~q\);

-- Location: LABCELL_X37_Y2_N9
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( \p_blink:counter[13]~q\ ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~46\ = CARRY(( \p_blink:counter[13]~q\ ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[13]~q\,
	cin => \Add0~78\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X37_Y2_N11
\p_blink:counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~45_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[13]~q\);

-- Location: LABCELL_X37_Y2_N12
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( \p_blink:counter[14]~q\ ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( \p_blink:counter[14]~q\ ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[14]~q\,
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X37_Y2_N14
\p_blink:counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~41_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[14]~q\);

-- Location: LABCELL_X37_Y2_N15
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( \p_blink:counter[15]~q\ ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~34\ = CARRY(( \p_blink:counter[15]~q\ ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[15]~q\,
	cin => \Add0~42\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X37_Y2_N17
\p_blink:counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~33_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[15]~q\);

-- Location: LABCELL_X37_Y2_N18
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( \p_blink:counter[16]~q\ ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( \p_blink:counter[16]~q\ ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[16]~q\,
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X37_Y2_N20
\p_blink:counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~37_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[16]~q\);

-- Location: LABCELL_X37_Y2_N21
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \p_blink:counter[17]~q\ ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~18\ = CARRY(( \p_blink:counter[17]~q\ ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[17]~q\,
	cin => \Add0~38\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X37_Y2_N23
\p_blink:counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~17_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[17]~q\);

-- Location: LABCELL_X37_Y2_N24
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \p_blink:counter[18]~q\ ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( \p_blink:counter[18]~q\ ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[18]~q\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X37_Y2_N26
\p_blink:counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~21_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[18]~q\);

-- Location: LABCELL_X37_Y2_N27
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \p_blink:counter[19]~q\ ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \p_blink:counter[19]~q\ ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[19]~q\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X37_Y2_N29
\p_blink:counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~25_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[19]~q\);

-- Location: LABCELL_X37_Y2_N30
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( \p_blink:counter[20]~q\ ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( \p_blink:counter[20]~q\ ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[20]~q\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X37_Y2_N32
\p_blink:counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~29_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[20]~q\);

-- Location: LABCELL_X37_Y2_N33
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \p_blink:counter[21]~q\ ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~10\ = CARRY(( \p_blink:counter[21]~q\ ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[21]~q\,
	cin => \Add0~30\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X37_Y2_N36
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \p_blink:counter[22]~q\ ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~2\ = CARRY(( \p_blink:counter[22]~q\ ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[22]~q\,
	cin => \Add0~10\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X37_Y2_N38
\p_blink:counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~1_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[22]~q\);

-- Location: LABCELL_X37_Y2_N39
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \p_blink:counter[23]~q\ ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~14\ = CARRY(( \p_blink:counter[23]~q\ ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[23]~q\,
	cin => \Add0~2\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X37_Y2_N41
\p_blink:counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~13_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[23]~q\);

-- Location: MLABCELL_X39_Y2_N0
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \p_blink:counter[22]~q\ & ( (\p_blink:counter[21]~q\ & (\p_blink:counter[19]~q\ & \p_blink:counter[20]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[21]~q\,
	datab => \ALT_INV_p_blink:counter[19]~q\,
	datac => \ALT_INV_p_blink:counter[20]~q\,
	dataf => \ALT_INV_p_blink:counter[22]~q\,
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X37_Y2_N57
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( \p_blink:counter[16]~q\ & ( (!\p_blink:counter[23]~q\ & ((!\p_blink:counter[18]~q\) # (!\LessThan0~0_combout\))) ) ) # ( !\p_blink:counter[16]~q\ & ( (!\p_blink:counter[23]~q\ & ((!\p_blink:counter[18]~q\) # 
-- ((!\p_blink:counter[17]~q\) # (!\LessThan0~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011100000111100001110000011110000101000001111000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[18]~q\,
	datab => \ALT_INV_p_blink:counter[17]~q\,
	datac => \ALT_INV_p_blink:counter[23]~q\,
	datad => \ALT_INV_LessThan0~0_combout\,
	dataf => \ALT_INV_p_blink:counter[16]~q\,
	combout => \LessThan0~1_combout\);

-- Location: LABCELL_X37_Y2_N42
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \p_blink:counter[24]~q\ ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[24]~q\,
	cin => \Add0~14\,
	sumout => \Add0~5_sumout\);

-- Location: FF_X37_Y2_N44
\p_blink:counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[24]~q\);

-- Location: LABCELL_X37_Y3_N6
\LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ( !\p_blink:counter[7]~q\ & ( (!\p_blink:counter[8]~q\ & (!\p_blink:counter[9]~q\ & (!\p_blink:counter[10]~q\ & !\p_blink:counter[6]~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[8]~q\,
	datab => \ALT_INV_p_blink:counter[9]~q\,
	datac => \ALT_INV_p_blink:counter[10]~q\,
	datad => \ALT_INV_p_blink:counter[6]~q\,
	dataf => \ALT_INV_p_blink:counter[7]~q\,
	combout => \LessThan0~2_combout\);

-- Location: MLABCELL_X39_Y2_N9
\LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ( \p_blink:counter[14]~q\ & ( (\p_blink:counter[12]~q\ & (\p_blink:counter[13]~q\ & \p_blink:counter[11]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010100000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[12]~q\,
	datac => \ALT_INV_p_blink:counter[13]~q\,
	datad => \ALT_INV_p_blink:counter[11]~q\,
	datae => \ALT_INV_p_blink:counter[14]~q\,
	combout => \LessThan0~3_combout\);

-- Location: MLABCELL_X39_Y2_N12
\LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ( \p_blink:counter[23]~q\ & ( \LessThan0~3_combout\ & ( \p_blink:counter[24]~q\ ) ) ) # ( !\p_blink:counter[23]~q\ & ( \LessThan0~3_combout\ & ( (\p_blink:counter[24]~q\ & (((!\LessThan0~2_combout\) # (\p_blink:counter[15]~q\)) # 
-- (\p_blink:counter[17]~q\))) ) ) ) # ( \p_blink:counter[23]~q\ & ( !\LessThan0~3_combout\ & ( \p_blink:counter[24]~q\ ) ) ) # ( !\p_blink:counter[23]~q\ & ( !\LessThan0~3_combout\ & ( (\p_blink:counter[24]~q\ & ((\p_blink:counter[15]~q\) # 
-- (\p_blink:counter[17]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000011110000111100001111000001110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[17]~q\,
	datab => \ALT_INV_p_blink:counter[15]~q\,
	datac => \ALT_INV_p_blink:counter[24]~q\,
	datad => \ALT_INV_LessThan0~2_combout\,
	datae => \ALT_INV_p_blink:counter[23]~q\,
	dataf => \ALT_INV_LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LABCELL_X37_Y3_N9
\LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = ( \LessThan0~4_combout\ & ( !\LessThan0~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_LessThan0~1_combout\,
	dataf => \ALT_INV_LessThan0~4_combout\,
	combout => \LessThan0~5_combout\);

-- Location: FF_X37_Y2_N35
\p_blink:counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~9_sumout\,
	asdata => \~GND~combout\,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[21]~q\);

-- Location: LABCELL_X37_Y2_N48
\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ( \Add0~25_sumout\ & ( \Add0~37_sumout\ & ( (\Add0~17_sumout\ & (\Add0~21_sumout\ & \Add0~29_sumout\)) ) ) ) # ( \Add0~25_sumout\ & ( !\Add0~37_sumout\ & ( (\Add0~17_sumout\ & (\Add0~33_sumout\ & (\Add0~21_sumout\ & 
-- \Add0~29_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~17_sumout\,
	datab => \ALT_INV_Add0~33_sumout\,
	datac => \ALT_INV_Add0~21_sumout\,
	datad => \ALT_INV_Add0~29_sumout\,
	datae => \ALT_INV_Add0~25_sumout\,
	dataf => \ALT_INV_Add0~37_sumout\,
	combout => \LessThan1~0_combout\);

-- Location: LABCELL_X37_Y3_N12
\LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ( \Add0~53_sumout\ & ( \LessThan0~4_combout\ & ( !\LessThan0~1_combout\ ) ) ) # ( !\Add0~53_sumout\ & ( \LessThan0~4_combout\ & ( (!\LessThan0~1_combout\) # ((!\Add0~57_sumout\ & (!\Add0~61_sumout\ & !\Add0~65_sumout\))) ) ) ) # ( 
-- !\Add0~53_sumout\ & ( !\LessThan0~4_combout\ & ( (!\Add0~57_sumout\ & (!\Add0~61_sumout\ & !\Add0~65_sumout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000000000000000000011111000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~57_sumout\,
	datab => \ALT_INV_Add0~61_sumout\,
	datac => \ALT_INV_LessThan0~1_combout\,
	datad => \ALT_INV_Add0~65_sumout\,
	datae => \ALT_INV_Add0~53_sumout\,
	dataf => \ALT_INV_LessThan0~4_combout\,
	combout => \LessThan1~1_combout\);

-- Location: LABCELL_X37_Y2_N54
\LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ( \Add0~77_sumout\ & ( (\Add0~73_sumout\ & \Add0~69_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add0~73_sumout\,
	datad => \ALT_INV_Add0~69_sumout\,
	dataf => \ALT_INV_Add0~77_sumout\,
	combout => \LessThan1~2_combout\);

-- Location: LABCELL_X37_Y3_N18
\LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = ( \Add0~45_sumout\ & ( \Add0~49_sumout\ & ( (!\Add0~41_sumout\ & (!\Add0~37_sumout\ & !\LessThan1~2_combout\)) ) ) ) # ( !\Add0~45_sumout\ & ( \Add0~49_sumout\ & ( (!\Add0~41_sumout\ & !\Add0~37_sumout\) ) ) ) # ( \Add0~45_sumout\ 
-- & ( !\Add0~49_sumout\ & ( (!\Add0~41_sumout\ & (!\Add0~37_sumout\ & ((!\LessThan1~2_combout\) # (\LessThan1~1_combout\)))) ) ) ) # ( !\Add0~45_sumout\ & ( !\Add0~49_sumout\ & ( (!\Add0~41_sumout\ & !\Add0~37_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000000010000010100000101000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~41_sumout\,
	datab => \ALT_INV_LessThan1~1_combout\,
	datac => \ALT_INV_Add0~37_sumout\,
	datad => \ALT_INV_LessThan1~2_combout\,
	datae => \ALT_INV_Add0~45_sumout\,
	dataf => \ALT_INV_Add0~49_sumout\,
	combout => \LessThan1~3_combout\);

-- Location: LABCELL_X37_Y3_N0
\LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = ( \Add0~1_sumout\ & ( \LessThan1~3_combout\ & ( (!\Add0~13_sumout\ & !\Add0~5_sumout\) ) ) ) # ( !\Add0~1_sumout\ & ( \LessThan1~3_combout\ & ( !\Add0~5_sumout\ ) ) ) # ( \Add0~1_sumout\ & ( !\LessThan1~3_combout\ & ( 
-- (!\Add0~13_sumout\ & !\Add0~5_sumout\) ) ) ) # ( !\Add0~1_sumout\ & ( !\LessThan1~3_combout\ & ( (!\Add0~5_sumout\ & ((!\Add0~9_sumout\) # ((!\Add0~13_sumout\) # (!\LessThan1~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111000000000110011000000000011111111000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~9_sumout\,
	datab => \ALT_INV_Add0~13_sumout\,
	datac => \ALT_INV_LessThan1~0_combout\,
	datad => \ALT_INV_Add0~5_sumout\,
	datae => \ALT_INV_Add0~1_sumout\,
	dataf => \ALT_INV_LessThan1~3_combout\,
	combout => \LessThan1~4_combout\);

-- Location: FF_X37_Y3_N1
\o_led~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \LessThan1~4_combout\,
	asdata => VCC,
	clrn => \i_reset~input_o\,
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_led~reg0_q\);

-- Location: LABCELL_X27_Y77_N0
\ctrl|sync|u1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~29_sumout\ = SUM(( \ctrl|sync|u1|counter\(0) ) + ( VCC ) + ( !VCC ))
-- \ctrl|sync|u1|Add0~30\ = CARRY(( \ctrl|sync|u1|counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(0),
	cin => GND,
	sumout => \ctrl|sync|u1|Add0~29_sumout\,
	cout => \ctrl|sync|u1|Add0~30\);

-- Location: FF_X27_Y77_N19
\ctrl|sync|u1|counter[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~5_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter[6]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y77_N18
\ctrl|sync|u1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~5_sumout\ = SUM(( \ctrl|sync|u1|counter\(6) ) + ( GND ) + ( \ctrl|sync|u1|Add0~10\ ))
-- \ctrl|sync|u1|Add0~6\ = CARRY(( \ctrl|sync|u1|counter\(6) ) + ( GND ) + ( \ctrl|sync|u1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(6),
	cin => \ctrl|sync|u1|Add0~10\,
	sumout => \ctrl|sync|u1|Add0~5_sumout\,
	cout => \ctrl|sync|u1|Add0~6\);

-- Location: LABCELL_X27_Y77_N21
\ctrl|sync|u1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~1_sumout\ = SUM(( \ctrl|sync|u1|counter\(7) ) + ( GND ) + ( \ctrl|sync|u1|Add0~6\ ))
-- \ctrl|sync|u1|Add0~2\ = CARRY(( \ctrl|sync|u1|counter\(7) ) + ( GND ) + ( \ctrl|sync|u1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(7),
	cin => \ctrl|sync|u1|Add0~6\,
	sumout => \ctrl|sync|u1|Add0~1_sumout\,
	cout => \ctrl|sync|u1|Add0~2\);

-- Location: FF_X27_Y77_N22
\ctrl|sync|u1|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~1_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(7));

-- Location: LABCELL_X27_Y77_N24
\ctrl|sync|u1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~17_sumout\ = SUM(( \ctrl|sync|u1|counter\(8) ) + ( GND ) + ( \ctrl|sync|u1|Add0~2\ ))
-- \ctrl|sync|u1|Add0~18\ = CARRY(( \ctrl|sync|u1|counter\(8) ) + ( GND ) + ( \ctrl|sync|u1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(8),
	cin => \ctrl|sync|u1|Add0~2\,
	sumout => \ctrl|sync|u1|Add0~17_sumout\,
	cout => \ctrl|sync|u1|Add0~18\);

-- Location: FF_X27_Y77_N25
\ctrl|sync|u1|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~17_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(8));

-- Location: LABCELL_X27_Y77_N27
\ctrl|sync|u1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~13_sumout\ = SUM(( \ctrl|sync|u1|counter\(9) ) + ( GND ) + ( \ctrl|sync|u1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(9),
	cin => \ctrl|sync|u1|Add0~18\,
	sumout => \ctrl|sync|u1|Add0~13_sumout\);

-- Location: FF_X27_Y77_N28
\ctrl|sync|u1|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~13_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(9));

-- Location: LABCELL_X27_Y77_N54
\ctrl|sync|u1|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal0~0_combout\ = ( !\ctrl|sync|u1|counter\(7) & ( (\ctrl|sync|u1|counter\(1) & (\ctrl|sync|u1|counter\(2) & (\ctrl|sync|u1|counter\(0) & \ctrl|sync|u1|counter\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_counter\(1),
	datab => \ctrl|sync|u1|ALT_INV_counter\(2),
	datac => \ctrl|sync|u1|ALT_INV_counter\(0),
	datad => \ctrl|sync|u1|ALT_INV_counter\(3),
	dataf => \ctrl|sync|u1|ALT_INV_counter\(7),
	combout => \ctrl|sync|u1|Equal0~0_combout\);

-- Location: LABCELL_X27_Y77_N48
\ctrl|sync|u1|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal0~1_combout\ = ( \ctrl|sync|u1|Equal0~0_combout\ & ( !\ctrl|sync|u1|counter\(5) & ( (!\ctrl|sync|u1|counter[6]~DUPLICATE_q\ & (\ctrl|sync|u1|counter\(8) & (\ctrl|sync|u1|counter\(4) & \ctrl|sync|u1|counter\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\,
	datab => \ctrl|sync|u1|ALT_INV_counter\(8),
	datac => \ctrl|sync|u1|ALT_INV_counter\(4),
	datad => \ctrl|sync|u1|ALT_INV_counter\(9),
	datae => \ctrl|sync|u1|ALT_INV_Equal0~0_combout\,
	dataf => \ctrl|sync|u1|ALT_INV_counter\(5),
	combout => \ctrl|sync|u1|Equal0~1_combout\);

-- Location: FF_X27_Y77_N2
\ctrl|sync|u1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~29_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(0));

-- Location: LABCELL_X27_Y77_N3
\ctrl|sync|u1|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~33_sumout\ = SUM(( \ctrl|sync|u1|counter\(1) ) + ( GND ) + ( \ctrl|sync|u1|Add0~30\ ))
-- \ctrl|sync|u1|Add0~34\ = CARRY(( \ctrl|sync|u1|counter\(1) ) + ( GND ) + ( \ctrl|sync|u1|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(1),
	cin => \ctrl|sync|u1|Add0~30\,
	sumout => \ctrl|sync|u1|Add0~33_sumout\,
	cout => \ctrl|sync|u1|Add0~34\);

-- Location: FF_X27_Y77_N5
\ctrl|sync|u1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~33_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(1));

-- Location: LABCELL_X27_Y77_N6
\ctrl|sync|u1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~21_sumout\ = SUM(( \ctrl|sync|u1|counter\(2) ) + ( GND ) + ( \ctrl|sync|u1|Add0~34\ ))
-- \ctrl|sync|u1|Add0~22\ = CARRY(( \ctrl|sync|u1|counter\(2) ) + ( GND ) + ( \ctrl|sync|u1|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(2),
	cin => \ctrl|sync|u1|Add0~34\,
	sumout => \ctrl|sync|u1|Add0~21_sumout\,
	cout => \ctrl|sync|u1|Add0~22\);

-- Location: FF_X27_Y77_N8
\ctrl|sync|u1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~21_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(2));

-- Location: LABCELL_X27_Y77_N9
\ctrl|sync|u1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~25_sumout\ = SUM(( \ctrl|sync|u1|counter\(3) ) + ( GND ) + ( \ctrl|sync|u1|Add0~22\ ))
-- \ctrl|sync|u1|Add0~26\ = CARRY(( \ctrl|sync|u1|counter\(3) ) + ( GND ) + ( \ctrl|sync|u1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(3),
	cin => \ctrl|sync|u1|Add0~22\,
	sumout => \ctrl|sync|u1|Add0~25_sumout\,
	cout => \ctrl|sync|u1|Add0~26\);

-- Location: FF_X27_Y77_N10
\ctrl|sync|u1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~25_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(3));

-- Location: LABCELL_X27_Y77_N12
\ctrl|sync|u1|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~37_sumout\ = SUM(( \ctrl|sync|u1|counter\(4) ) + ( GND ) + ( \ctrl|sync|u1|Add0~26\ ))
-- \ctrl|sync|u1|Add0~38\ = CARRY(( \ctrl|sync|u1|counter\(4) ) + ( GND ) + ( \ctrl|sync|u1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(4),
	cin => \ctrl|sync|u1|Add0~26\,
	sumout => \ctrl|sync|u1|Add0~37_sumout\,
	cout => \ctrl|sync|u1|Add0~38\);

-- Location: FF_X27_Y77_N14
\ctrl|sync|u1|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~37_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(4));

-- Location: LABCELL_X27_Y77_N15
\ctrl|sync|u1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add0~9_sumout\ = SUM(( \ctrl|sync|u1|counter\(5) ) + ( GND ) + ( \ctrl|sync|u1|Add0~38\ ))
-- \ctrl|sync|u1|Add0~10\ = CARRY(( \ctrl|sync|u1|counter\(5) ) + ( GND ) + ( \ctrl|sync|u1|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_counter\(5),
	cin => \ctrl|sync|u1|Add0~38\,
	sumout => \ctrl|sync|u1|Add0~9_sumout\,
	cout => \ctrl|sync|u1|Add0~10\);

-- Location: FF_X27_Y77_N16
\ctrl|sync|u1|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~9_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(5));

-- Location: FF_X27_Y77_N20
\ctrl|sync|u1|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add0~5_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u1|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|counter\(6));

-- Location: LABCELL_X27_Y77_N57
\ctrl|sync|u1|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal1~0_combout\ = ( !\ctrl|sync|u1|counter\(8) & ( (!\ctrl|sync|u1|counter\(9) & !\ctrl|sync|u1|counter\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u1|ALT_INV_counter\(9),
	datad => \ctrl|sync|u1|ALT_INV_counter\(4),
	dataf => \ctrl|sync|u1|ALT_INV_counter\(8),
	combout => \ctrl|sync|u1|Equal1~0_combout\);

-- Location: LABCELL_X27_Y77_N33
\ctrl|sync|u1|shs~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|shs~0_combout\ = ( \ctrl|sync|u1|counter\(5) & ( ((\ctrl|sync|u1|counter\(6) & (\ctrl|sync|u1|Equal0~0_combout\ & \ctrl|sync|u1|Equal1~0_combout\))) # (\ctrl|sync|u1|shs~q\) ) ) # ( !\ctrl|sync|u1|counter\(5) & ( (\ctrl|sync|u1|shs~q\ & 
-- (((!\ctrl|sync|u1|Equal0~0_combout\) # (!\ctrl|sync|u1|Equal1~0_combout\)) # (\ctrl|sync|u1|counter\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111101000000001111110100000001111111110000000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_counter\(6),
	datab => \ctrl|sync|u1|ALT_INV_Equal0~0_combout\,
	datac => \ctrl|sync|u1|ALT_INV_Equal1~0_combout\,
	datad => \ctrl|sync|u1|ALT_INV_shs~q\,
	dataf => \ctrl|sync|u1|ALT_INV_counter\(5),
	combout => \ctrl|sync|u1|shs~0_combout\);

-- Location: FF_X27_Y77_N34
\ctrl|sync|u1|shs\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|shs~0_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shs~q\);

-- Location: LABCELL_X24_Y77_N30
\ctrl|sync|u2|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~37_sumout\ = SUM(( \ctrl|sync|u2|counter\(0) ) + ( VCC ) + ( !VCC ))
-- \ctrl|sync|u2|Add0~38\ = CARRY(( \ctrl|sync|u2|counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(0),
	cin => GND,
	sumout => \ctrl|sync|u2|Add0~37_sumout\,
	cout => \ctrl|sync|u2|Add0~38\);

-- Location: LABCELL_X24_Y77_N33
\ctrl|sync|u2|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~33_sumout\ = SUM(( \ctrl|sync|u2|counter\(1) ) + ( GND ) + ( \ctrl|sync|u2|Add0~38\ ))
-- \ctrl|sync|u2|Add0~34\ = CARRY(( \ctrl|sync|u2|counter\(1) ) + ( GND ) + ( \ctrl|sync|u2|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(1),
	cin => \ctrl|sync|u2|Add0~38\,
	sumout => \ctrl|sync|u2|Add0~33_sumout\,
	cout => \ctrl|sync|u2|Add0~34\);

-- Location: LABCELL_X24_Y77_N36
\ctrl|sync|u2|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~13_sumout\ = SUM(( \ctrl|sync|u2|counter\(2) ) + ( GND ) + ( \ctrl|sync|u2|Add0~34\ ))
-- \ctrl|sync|u2|Add0~14\ = CARRY(( \ctrl|sync|u2|counter\(2) ) + ( GND ) + ( \ctrl|sync|u2|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(2),
	cin => \ctrl|sync|u2|Add0~34\,
	sumout => \ctrl|sync|u2|Add0~13_sumout\,
	cout => \ctrl|sync|u2|Add0~14\);

-- Location: LABCELL_X27_Y77_N30
\ctrl|sync|u1|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal3~0_combout\ = ( \ctrl|sync|u1|counter[6]~DUPLICATE_q\ & ( (\ctrl|sync|u1|Equal0~0_combout\ & (\ctrl|sync|u1|counter\(5) & \ctrl|sync|u1|Equal1~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ctrl|sync|u1|ALT_INV_Equal0~0_combout\,
	datac => \ctrl|sync|u1|ALT_INV_counter\(5),
	datad => \ctrl|sync|u1|ALT_INV_Equal1~0_combout\,
	dataf => \ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\,
	combout => \ctrl|sync|u1|Equal3~0_combout\);

-- Location: FF_X24_Y77_N38
\ctrl|sync|u2|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~13_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(2));

-- Location: LABCELL_X24_Y77_N39
\ctrl|sync|u2|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~9_sumout\ = SUM(( \ctrl|sync|u2|counter\(3) ) + ( GND ) + ( \ctrl|sync|u2|Add0~14\ ))
-- \ctrl|sync|u2|Add0~10\ = CARRY(( \ctrl|sync|u2|counter\(3) ) + ( GND ) + ( \ctrl|sync|u2|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(3),
	cin => \ctrl|sync|u2|Add0~14\,
	sumout => \ctrl|sync|u2|Add0~9_sumout\,
	cout => \ctrl|sync|u2|Add0~10\);

-- Location: FF_X24_Y77_N40
\ctrl|sync|u2|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~9_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(3));

-- Location: LABCELL_X24_Y77_N42
\ctrl|sync|u2|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~5_sumout\ = SUM(( \ctrl|sync|u2|counter\(4) ) + ( GND ) + ( \ctrl|sync|u2|Add0~10\ ))
-- \ctrl|sync|u2|Add0~6\ = CARRY(( \ctrl|sync|u2|counter\(4) ) + ( GND ) + ( \ctrl|sync|u2|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(4),
	cin => \ctrl|sync|u2|Add0~10\,
	sumout => \ctrl|sync|u2|Add0~5_sumout\,
	cout => \ctrl|sync|u2|Add0~6\);

-- Location: FF_X24_Y77_N44
\ctrl|sync|u2|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~5_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(4));

-- Location: LABCELL_X24_Y77_N45
\ctrl|sync|u2|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~1_sumout\ = SUM(( \ctrl|sync|u2|counter\(5) ) + ( GND ) + ( \ctrl|sync|u2|Add0~6\ ))
-- \ctrl|sync|u2|Add0~2\ = CARRY(( \ctrl|sync|u2|counter\(5) ) + ( GND ) + ( \ctrl|sync|u2|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(5),
	cin => \ctrl|sync|u2|Add0~6\,
	sumout => \ctrl|sync|u2|Add0~1_sumout\,
	cout => \ctrl|sync|u2|Add0~2\);

-- Location: FF_X24_Y77_N47
\ctrl|sync|u2|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~1_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(5));

-- Location: LABCELL_X24_Y77_N48
\ctrl|sync|u2|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~25_sumout\ = SUM(( \ctrl|sync|u2|counter\(6) ) + ( GND ) + ( \ctrl|sync|u2|Add0~2\ ))
-- \ctrl|sync|u2|Add0~26\ = CARRY(( \ctrl|sync|u2|counter\(6) ) + ( GND ) + ( \ctrl|sync|u2|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(6),
	cin => \ctrl|sync|u2|Add0~2\,
	sumout => \ctrl|sync|u2|Add0~25_sumout\,
	cout => \ctrl|sync|u2|Add0~26\);

-- Location: FF_X24_Y77_N50
\ctrl|sync|u2|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~25_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(6));

-- Location: LABCELL_X24_Y77_N51
\ctrl|sync|u2|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~21_sumout\ = SUM(( \ctrl|sync|u2|counter\(7) ) + ( GND ) + ( \ctrl|sync|u2|Add0~26\ ))
-- \ctrl|sync|u2|Add0~22\ = CARRY(( \ctrl|sync|u2|counter\(7) ) + ( GND ) + ( \ctrl|sync|u2|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(7),
	cin => \ctrl|sync|u2|Add0~26\,
	sumout => \ctrl|sync|u2|Add0~21_sumout\,
	cout => \ctrl|sync|u2|Add0~22\);

-- Location: FF_X24_Y77_N53
\ctrl|sync|u2|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~21_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(7));

-- Location: LABCELL_X24_Y77_N54
\ctrl|sync|u2|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~17_sumout\ = SUM(( \ctrl|sync|u2|counter\(8) ) + ( GND ) + ( \ctrl|sync|u2|Add0~22\ ))
-- \ctrl|sync|u2|Add0~18\ = CARRY(( \ctrl|sync|u2|counter\(8) ) + ( GND ) + ( \ctrl|sync|u2|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(8),
	cin => \ctrl|sync|u2|Add0~22\,
	sumout => \ctrl|sync|u2|Add0~17_sumout\,
	cout => \ctrl|sync|u2|Add0~18\);

-- Location: FF_X24_Y77_N56
\ctrl|sync|u2|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~17_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(8));

-- Location: LABCELL_X24_Y77_N12
\ctrl|sync|o_blank~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|o_blank~0_combout\ = ( !\ctrl|sync|u2|counter\(8) & ( !\ctrl|sync|u2|counter\(6) & ( !\ctrl|sync|u2|counter\(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u2|ALT_INV_counter\(7),
	datae => \ctrl|sync|u2|ALT_INV_counter\(8),
	dataf => \ctrl|sync|u2|ALT_INV_counter\(6),
	combout => \ctrl|sync|o_blank~0_combout\);

-- Location: LABCELL_X24_Y77_N18
\ctrl|sync|u2|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Equal0~0_combout\ = ( !\ctrl|sync|u2|counter\(4) & ( (!\ctrl|sync|u2|counter\(5) & (!\ctrl|sync|u2|counter\(0) & \ctrl|sync|u2|counter\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ctrl|sync|u2|ALT_INV_counter\(5),
	datac => \ctrl|sync|u2|ALT_INV_counter\(0),
	datad => \ctrl|sync|u2|ALT_INV_counter\(3),
	dataf => \ctrl|sync|u2|ALT_INV_counter\(4),
	combout => \ctrl|sync|u2|Equal0~0_combout\);

-- Location: LABCELL_X24_Y77_N27
\ctrl|sync|u2|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Equal0~1_combout\ = ( \ctrl|sync|u2|Equal0~0_combout\ & ( (!\ctrl|sync|u2|counter\(1) & (\ctrl|sync|o_blank~0_combout\ & \ctrl|sync|u2|counter\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001000100000000000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_counter\(1),
	datab => \ctrl|sync|ALT_INV_o_blank~0_combout\,
	datad => \ctrl|sync|u2|ALT_INV_counter\(2),
	dataf => \ctrl|sync|u2|ALT_INV_Equal0~0_combout\,
	combout => \ctrl|sync|u2|Equal0~1_combout\);

-- Location: LABCELL_X24_Y77_N57
\ctrl|sync|u2|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add0~29_sumout\ = SUM(( \ctrl|sync|u2|counter\(9) ) + ( GND ) + ( \ctrl|sync|u2|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_counter\(9),
	cin => \ctrl|sync|u2|Add0~18\,
	sumout => \ctrl|sync|u2|Add0~29_sumout\);

-- Location: FF_X24_Y77_N58
\ctrl|sync|u2|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~29_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(9));

-- Location: LABCELL_X24_Y77_N21
\ctrl|sync|u2|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Equal0~2_combout\ = ( \ctrl|sync|u2|counter\(9) & ( \ctrl|sync|u2|Equal0~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_Equal0~1_combout\,
	dataf => \ctrl|sync|u2|ALT_INV_counter\(9),
	combout => \ctrl|sync|u2|Equal0~2_combout\);

-- Location: FF_X24_Y77_N31
\ctrl|sync|u2|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~37_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(0));

-- Location: FF_X24_Y77_N35
\ctrl|sync|u2|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add0~33_sumout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sclr => \ctrl|sync|u2|Equal0~2_combout\,
	ena => \ctrl|sync|u1|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|counter\(1));

-- Location: LABCELL_X24_Y77_N24
\ctrl|sync|u2|svs~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|svs~0_combout\ = ( \ctrl|sync|u2|Equal0~0_combout\ & ( (\ctrl|sync|u2|counter\(1) & (\ctrl|sync|o_blank~0_combout\ & !\ctrl|sync|u2|counter\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_counter\(1),
	datab => \ctrl|sync|ALT_INV_o_blank~0_combout\,
	datac => \ctrl|sync|u2|ALT_INV_counter\(2),
	dataf => \ctrl|sync|u2|ALT_INV_Equal0~0_combout\,
	combout => \ctrl|sync|u2|svs~0_combout\);

-- Location: LABCELL_X24_Y77_N0
\ctrl|sync|u2|svs~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|svs~1_combout\ = ( \ctrl|sync|u2|svs~q\ & ( \ctrl|sync|u2|counter\(9) ) ) # ( \ctrl|sync|u2|svs~q\ & ( !\ctrl|sync|u2|counter\(9) & ( (!\ctrl|sync|u2|svs~0_combout\) # ((!\ctrl|sync|u1|Equal3~0_combout\) # 
-- ((\clk25|pll25_inst|altera_pll_i|locked_wire\(0)) # (\ctrl|sync|u2|Equal0~1_combout\))) ) ) ) # ( !\ctrl|sync|u2|svs~q\ & ( !\ctrl|sync|u2|counter\(9) & ( (\ctrl|sync|u1|Equal3~0_combout\ & (\ctrl|sync|u2|Equal0~1_combout\ & 
-- !\clk25|pll25_inst|altera_pll_i|locked_wire\(0))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000111011111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_svs~0_combout\,
	datab => \ctrl|sync|u1|ALT_INV_Equal3~0_combout\,
	datac => \ctrl|sync|u2|ALT_INV_Equal0~1_combout\,
	datad => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	datae => \ctrl|sync|u2|ALT_INV_svs~q\,
	dataf => \ctrl|sync|u2|ALT_INV_counter\(9),
	combout => \ctrl|sync|u2|svs~1_combout\);

-- Location: FF_X24_Y77_N1
\ctrl|sync|u2|svs\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|svs~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svs~q\);

-- Location: LABCELL_X30_Y77_N0
\ctrl|sync|u2|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~1_sumout\ = SUM(( \ctrl|sync|u2|svcount\(0) ) + ( VCC ) + ( !VCC ))
-- \ctrl|sync|u2|Add1~2\ = CARRY(( \ctrl|sync|u2|svcount\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(0),
	cin => GND,
	sumout => \ctrl|sync|u2|Add1~1_sumout\,
	cout => \ctrl|sync|u2|Add1~2\);

-- Location: LABCELL_X30_Y77_N3
\ctrl|sync|u2|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~5_sumout\ = SUM(( \ctrl|sync|u2|svcount\(1) ) + ( GND ) + ( \ctrl|sync|u2|Add1~2\ ))
-- \ctrl|sync|u2|Add1~6\ = CARRY(( \ctrl|sync|u2|svcount\(1) ) + ( GND ) + ( \ctrl|sync|u2|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(1),
	cin => \ctrl|sync|u2|Add1~2\,
	sumout => \ctrl|sync|u2|Add1~5_sumout\,
	cout => \ctrl|sync|u2|Add1~6\);

-- Location: LABCELL_X27_Y77_N39
\ctrl|sync|u2|svs~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|svs~2_combout\ = ( \ctrl|sync|u1|counter[6]~DUPLICATE_q\ & ( (\ctrl|sync|u1|Equal0~0_combout\ & (\ctrl|sync|u1|counter\(5) & (\ctrl|sync|u1|Equal1~0_combout\ & !\clk25|pll25_inst|altera_pll_i|locked_wire\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_Equal0~0_combout\,
	datab => \ctrl|sync|u1|ALT_INV_counter\(5),
	datac => \ctrl|sync|u1|ALT_INV_Equal1~0_combout\,
	datad => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	dataf => \ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\,
	combout => \ctrl|sync|u2|svs~2_combout\);

-- Location: FF_X30_Y77_N5
\ctrl|sync|u2|svcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~5_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(1));

-- Location: LABCELL_X30_Y77_N6
\ctrl|sync|u2|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~9_sumout\ = SUM(( \ctrl|sync|u2|svcount\(2) ) + ( GND ) + ( \ctrl|sync|u2|Add1~6\ ))
-- \ctrl|sync|u2|Add1~10\ = CARRY(( \ctrl|sync|u2|svcount\(2) ) + ( GND ) + ( \ctrl|sync|u2|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(2),
	cin => \ctrl|sync|u2|Add1~6\,
	sumout => \ctrl|sync|u2|Add1~9_sumout\,
	cout => \ctrl|sync|u2|Add1~10\);

-- Location: FF_X30_Y77_N8
\ctrl|sync|u2|svcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~9_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(2));

-- Location: LABCELL_X30_Y77_N9
\ctrl|sync|u2|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~13_sumout\ = SUM(( \ctrl|sync|u2|svcount\(3) ) + ( GND ) + ( \ctrl|sync|u2|Add1~10\ ))
-- \ctrl|sync|u2|Add1~14\ = CARRY(( \ctrl|sync|u2|svcount\(3) ) + ( GND ) + ( \ctrl|sync|u2|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(3),
	cin => \ctrl|sync|u2|Add1~10\,
	sumout => \ctrl|sync|u2|Add1~13_sumout\,
	cout => \ctrl|sync|u2|Add1~14\);

-- Location: FF_X30_Y77_N10
\ctrl|sync|u2|svcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~13_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(3));

-- Location: LABCELL_X30_Y77_N12
\ctrl|sync|u2|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~17_sumout\ = SUM(( \ctrl|sync|u2|svcount\(4) ) + ( GND ) + ( \ctrl|sync|u2|Add1~14\ ))
-- \ctrl|sync|u2|Add1~18\ = CARRY(( \ctrl|sync|u2|svcount\(4) ) + ( GND ) + ( \ctrl|sync|u2|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(4),
	cin => \ctrl|sync|u2|Add1~14\,
	sumout => \ctrl|sync|u2|Add1~17_sumout\,
	cout => \ctrl|sync|u2|Add1~18\);

-- Location: FF_X30_Y77_N14
\ctrl|sync|u2|svcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~17_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(4));

-- Location: LABCELL_X30_Y77_N15
\ctrl|sync|u2|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~21_sumout\ = SUM(( \ctrl|sync|u2|svcount\(5) ) + ( GND ) + ( \ctrl|sync|u2|Add1~18\ ))
-- \ctrl|sync|u2|Add1~22\ = CARRY(( \ctrl|sync|u2|svcount\(5) ) + ( GND ) + ( \ctrl|sync|u2|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(5),
	cin => \ctrl|sync|u2|Add1~18\,
	sumout => \ctrl|sync|u2|Add1~21_sumout\,
	cout => \ctrl|sync|u2|Add1~22\);

-- Location: FF_X30_Y77_N16
\ctrl|sync|u2|svcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~21_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(5));

-- Location: LABCELL_X30_Y77_N48
\ctrl|sync|u2|Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Equal3~0_combout\ = ( \ctrl|sync|u2|svcount\(1) & ( (\ctrl|sync|u2|svcount\(5) & (\ctrl|sync|u2|svcount\(0) & \ctrl|sync|u2|svcount\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001100000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ctrl|sync|u2|ALT_INV_svcount\(5),
	datac => \ctrl|sync|u2|ALT_INV_svcount\(0),
	datad => \ctrl|sync|u2|ALT_INV_svcount\(2),
	datae => \ctrl|sync|u2|ALT_INV_svcount\(1),
	combout => \ctrl|sync|u2|Equal3~0_combout\);

-- Location: LABCELL_X30_Y77_N18
\ctrl|sync|u2|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~25_sumout\ = SUM(( \ctrl|sync|u2|svcount\(6) ) + ( GND ) + ( \ctrl|sync|u2|Add1~22\ ))
-- \ctrl|sync|u2|Add1~26\ = CARRY(( \ctrl|sync|u2|svcount\(6) ) + ( GND ) + ( \ctrl|sync|u2|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(6),
	cin => \ctrl|sync|u2|Add1~22\,
	sumout => \ctrl|sync|u2|Add1~25_sumout\,
	cout => \ctrl|sync|u2|Add1~26\);

-- Location: FF_X30_Y77_N20
\ctrl|sync|u2|svcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~25_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(6));

-- Location: LABCELL_X30_Y77_N21
\ctrl|sync|u2|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Add1~29_sumout\ = SUM(( \ctrl|sync|u2|svcount\(7) ) + ( GND ) + ( \ctrl|sync|u2|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u2|ALT_INV_svcount\(7),
	cin => \ctrl|sync|u2|Add1~26\,
	sumout => \ctrl|sync|u2|Add1~29_sumout\);

-- Location: FF_X30_Y77_N23
\ctrl|sync|u2|svcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~29_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(7));

-- Location: LABCELL_X30_Y77_N24
\ctrl|sync|u2|Equal3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u2|Equal3~1_combout\ = ( \ctrl|sync|u2|svcount\(7) & ( \ctrl|sync|u2|svcount\(3) & ( (\ctrl|sync|u2|svcount\(4) & (\ctrl|sync|u2|Equal3~0_combout\ & \ctrl|sync|u2|svcount\(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ctrl|sync|u2|ALT_INV_svcount\(4),
	datac => \ctrl|sync|u2|ALT_INV_Equal3~0_combout\,
	datad => \ctrl|sync|u2|ALT_INV_svcount\(6),
	datae => \ctrl|sync|u2|ALT_INV_svcount\(7),
	dataf => \ctrl|sync|u2|ALT_INV_svcount\(3),
	combout => \ctrl|sync|u2|Equal3~1_combout\);

-- Location: FF_X30_Y77_N2
\ctrl|sync|u2|svcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u2|Add1~1_sumout\,
	sclr => \ctrl|sync|u2|Equal3~1_combout\,
	ena => \ctrl|sync|u2|svs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u2|svcount\(0));

-- Location: LABCELL_X30_Y77_N54
\ctrl|comm|rR[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[0]~0_combout\ = !\ctrl|sync|u2|svcount\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u2|ALT_INV_svcount\(0),
	combout => \ctrl|comm|rR[0]~0_combout\);

-- Location: FF_X30_Y77_N55
\ctrl|comm|rR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[0]~0_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(0));

-- Location: LABCELL_X27_Y77_N36
\ctrl|comm|rR[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[1]~1_combout\ = !\ctrl|sync|u2|svcount\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u2|ALT_INV_svcount\(1),
	combout => \ctrl|comm|rR[1]~1_combout\);

-- Location: FF_X27_Y77_N37
\ctrl|comm|rR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[1]~1_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(1));

-- Location: LABCELL_X27_Y77_N42
\ctrl|comm|rR[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[2]~2_combout\ = ( !\ctrl|sync|u2|svcount\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ctrl|sync|u2|ALT_INV_svcount\(2),
	combout => \ctrl|comm|rR[2]~2_combout\);

-- Location: FF_X27_Y77_N44
\ctrl|comm|rR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[2]~2_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(2));

-- Location: LABCELL_X30_Y77_N30
\ctrl|comm|rR[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[3]~3_combout\ = ( !\ctrl|sync|u2|svcount\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ctrl|sync|u2|ALT_INV_svcount\(3),
	combout => \ctrl|comm|rR[3]~3_combout\);

-- Location: FF_X30_Y77_N31
\ctrl|comm|rR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[3]~3_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(3));

-- Location: LABCELL_X30_Y77_N33
\ctrl|comm|rR[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[4]~4_combout\ = !\ctrl|sync|u2|svcount\(4)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u2|ALT_INV_svcount\(4),
	combout => \ctrl|comm|rR[4]~4_combout\);

-- Location: FF_X30_Y77_N34
\ctrl|comm|rR[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[4]~4_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(4));

-- Location: LABCELL_X27_Y77_N45
\ctrl|comm|rR[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[5]~5_combout\ = !\ctrl|sync|u2|svcount\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_svcount\(5),
	combout => \ctrl|comm|rR[5]~5_combout\);

-- Location: FF_X27_Y77_N47
\ctrl|comm|rR[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[5]~5_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(5));

-- Location: LABCELL_X30_Y77_N36
\ctrl|comm|rR[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[6]~6_combout\ = ( !\ctrl|sync|u2|svcount\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ctrl|sync|u2|ALT_INV_svcount\(6),
	combout => \ctrl|comm|rR[6]~6_combout\);

-- Location: FF_X30_Y77_N37
\ctrl|comm|rR[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[6]~6_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(6));

-- Location: LABCELL_X30_Y77_N42
\ctrl|comm|rR[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rR[7]~7_combout\ = !\ctrl|sync|u2|svcount\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_svcount\(7),
	combout => \ctrl|comm|rR[7]~7_combout\);

-- Location: FF_X30_Y77_N43
\ctrl|comm|rR[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rR[7]~7_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rR\(7));

-- Location: LABCELL_X16_Y80_N30
\ctrl|sync|u1|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~1_sumout\ = SUM(( \ctrl|sync|u1|shcount\(0) ) + ( VCC ) + ( !VCC ))
-- \ctrl|sync|u1|Add1~2\ = CARRY(( \ctrl|sync|u1|shcount\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(0),
	cin => GND,
	sumout => \ctrl|sync|u1|Add1~1_sumout\,
	cout => \ctrl|sync|u1|Add1~2\);

-- Location: LABCELL_X16_Y80_N33
\ctrl|sync|u1|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~5_sumout\ = SUM(( \ctrl|sync|u1|shcount\(1) ) + ( GND ) + ( \ctrl|sync|u1|Add1~2\ ))
-- \ctrl|sync|u1|Add1~6\ = CARRY(( \ctrl|sync|u1|shcount\(1) ) + ( GND ) + ( \ctrl|sync|u1|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(1),
	cin => \ctrl|sync|u1|Add1~2\,
	sumout => \ctrl|sync|u1|Add1~5_sumout\,
	cout => \ctrl|sync|u1|Add1~6\);

-- Location: FF_X16_Y80_N35
\ctrl|sync|u1|shcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~5_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(1));

-- Location: LABCELL_X16_Y80_N36
\ctrl|sync|u1|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~9_sumout\ = SUM(( \ctrl|sync|u1|shcount\(2) ) + ( GND ) + ( \ctrl|sync|u1|Add1~6\ ))
-- \ctrl|sync|u1|Add1~10\ = CARRY(( \ctrl|sync|u1|shcount\(2) ) + ( GND ) + ( \ctrl|sync|u1|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(2),
	cin => \ctrl|sync|u1|Add1~6\,
	sumout => \ctrl|sync|u1|Add1~9_sumout\,
	cout => \ctrl|sync|u1|Add1~10\);

-- Location: FF_X16_Y80_N38
\ctrl|sync|u1|shcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~9_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(2));

-- Location: LABCELL_X16_Y80_N39
\ctrl|sync|u1|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~13_sumout\ = SUM(( \ctrl|sync|u1|shcount\(3) ) + ( GND ) + ( \ctrl|sync|u1|Add1~10\ ))
-- \ctrl|sync|u1|Add1~14\ = CARRY(( \ctrl|sync|u1|shcount\(3) ) + ( GND ) + ( \ctrl|sync|u1|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(3),
	cin => \ctrl|sync|u1|Add1~10\,
	sumout => \ctrl|sync|u1|Add1~13_sumout\,
	cout => \ctrl|sync|u1|Add1~14\);

-- Location: FF_X16_Y80_N41
\ctrl|sync|u1|shcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~13_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(3));

-- Location: LABCELL_X16_Y80_N18
\ctrl|sync|u1|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal2~0_combout\ = ( \ctrl|sync|u1|shcount\(2) & ( (\ctrl|sync|u1|shcount\(0) & (\ctrl|sync|u1|shcount\(1) & \ctrl|sync|u1|shcount\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001100000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ctrl|sync|u1|ALT_INV_shcount\(0),
	datac => \ctrl|sync|u1|ALT_INV_shcount\(1),
	datad => \ctrl|sync|u1|ALT_INV_shcount\(3),
	datae => \ctrl|sync|u1|ALT_INV_shcount\(2),
	combout => \ctrl|sync|u1|Equal2~0_combout\);

-- Location: LABCELL_X16_Y80_N42
\ctrl|sync|u1|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~17_sumout\ = SUM(( \ctrl|sync|u1|shcount\(4) ) + ( GND ) + ( \ctrl|sync|u1|Add1~14\ ))
-- \ctrl|sync|u1|Add1~18\ = CARRY(( \ctrl|sync|u1|shcount\(4) ) + ( GND ) + ( \ctrl|sync|u1|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(4),
	cin => \ctrl|sync|u1|Add1~14\,
	sumout => \ctrl|sync|u1|Add1~17_sumout\,
	cout => \ctrl|sync|u1|Add1~18\);

-- Location: FF_X16_Y80_N44
\ctrl|sync|u1|shcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~17_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(4));

-- Location: LABCELL_X16_Y80_N45
\ctrl|sync|u1|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~21_sumout\ = SUM(( \ctrl|sync|u1|shcount\(5) ) + ( GND ) + ( \ctrl|sync|u1|Add1~18\ ))
-- \ctrl|sync|u1|Add1~22\ = CARRY(( \ctrl|sync|u1|shcount\(5) ) + ( GND ) + ( \ctrl|sync|u1|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(5),
	cin => \ctrl|sync|u1|Add1~18\,
	sumout => \ctrl|sync|u1|Add1~21_sumout\,
	cout => \ctrl|sync|u1|Add1~22\);

-- Location: FF_X16_Y80_N47
\ctrl|sync|u1|shcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~21_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(5));

-- Location: LABCELL_X16_Y80_N48
\ctrl|sync|u1|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~25_sumout\ = SUM(( \ctrl|sync|u1|shcount\(6) ) + ( GND ) + ( \ctrl|sync|u1|Add1~22\ ))
-- \ctrl|sync|u1|Add1~26\ = CARRY(( \ctrl|sync|u1|shcount\(6) ) + ( GND ) + ( \ctrl|sync|u1|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(6),
	cin => \ctrl|sync|u1|Add1~22\,
	sumout => \ctrl|sync|u1|Add1~25_sumout\,
	cout => \ctrl|sync|u1|Add1~26\);

-- Location: FF_X16_Y80_N50
\ctrl|sync|u1|shcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~25_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(6));

-- Location: LABCELL_X16_Y80_N51
\ctrl|sync|u1|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Add1~29_sumout\ = SUM(( \ctrl|sync|u1|shcount\(7) ) + ( GND ) + ( \ctrl|sync|u1|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ctrl|sync|u1|ALT_INV_shcount\(7),
	cin => \ctrl|sync|u1|Add1~26\,
	sumout => \ctrl|sync|u1|Add1~29_sumout\);

-- Location: FF_X16_Y80_N52
\ctrl|sync|u1|shcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~29_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(7));

-- Location: LABCELL_X16_Y80_N54
\ctrl|sync|u1|Equal2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|u1|Equal2~1_combout\ = ( \ctrl|sync|u1|shcount\(5) & ( (\ctrl|sync|u1|Equal2~0_combout\ & (\ctrl|sync|u1|shcount\(7) & (\ctrl|sync|u1|shcount\(6) & \ctrl|sync|u1|shcount\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_Equal2~0_combout\,
	datab => \ctrl|sync|u1|ALT_INV_shcount\(7),
	datac => \ctrl|sync|u1|ALT_INV_shcount\(6),
	datad => \ctrl|sync|u1|ALT_INV_shcount\(4),
	datae => \ctrl|sync|u1|ALT_INV_shcount\(5),
	combout => \ctrl|sync|u1|Equal2~1_combout\);

-- Location: FF_X16_Y80_N32
\ctrl|sync|u1|shcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|sync|u1|Add1~1_sumout\,
	sclr => \ctrl|sync|u1|Equal2~1_combout\,
	ena => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|sync|u1|shcount\(0));

-- Location: FF_X16_Y80_N1
\ctrl|comm|rG[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(0),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(0));

-- Location: LABCELL_X16_Y80_N6
\ctrl|comm|rG[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|comm|rG[1]~feeder_combout\ = \ctrl|sync|u1|shcount\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ctrl|sync|u1|ALT_INV_shcount\(1),
	combout => \ctrl|comm|rG[1]~feeder_combout\);

-- Location: FF_X16_Y80_N7
\ctrl|comm|rG[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ctrl|comm|rG[1]~feeder_combout\,
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(1));

-- Location: FF_X16_Y80_N16
\ctrl|comm|rG[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(2),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(2));

-- Location: FF_X16_Y80_N11
\ctrl|comm|rG[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(3),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(3));

-- Location: FF_X16_Y80_N23
\ctrl|comm|rG[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(4),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(4));

-- Location: FF_X16_Y80_N29
\ctrl|comm|rG[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(5),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(5));

-- Location: FF_X16_Y80_N25
\ctrl|comm|rG[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(6),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(6));

-- Location: FF_X16_Y80_N58
\ctrl|comm|rG[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u1|shcount\(7),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rG\(7));

-- Location: FF_X30_Y77_N52
\ctrl|comm|rB[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(0),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(0));

-- Location: FF_X24_Y77_N10
\ctrl|comm|rB[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(1),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(1));

-- Location: FF_X24_Y77_N16
\ctrl|comm|rB[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(2),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(2));

-- Location: FF_X30_Y77_N40
\ctrl|comm|rB[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(3),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(3));

-- Location: FF_X30_Y77_N58
\ctrl|comm|rB[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(4),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(4));

-- Location: FF_X27_Y77_N52
\ctrl|comm|rB[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(5),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(5));

-- Location: FF_X30_Y77_N46
\ctrl|comm|rB[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(6),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(6));

-- Location: FF_X30_Y77_N28
\ctrl|comm|rB[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk25|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ctrl|sync|u2|svcount\(7),
	clrn => \clk25|pll25_inst|altera_pll_i|ALT_INV_locked_wire\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ctrl|comm|rB\(7));

-- Location: MLABCELL_X28_Y77_N30
\ctrl|sync|o_blank~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|o_blank~1_combout\ = ( !\ctrl|sync|u2|counter\(9) & ( \ctrl|sync|u1|counter[6]~DUPLICATE_q\ & ( (!\ctrl|sync|u1|counter\(7) & (!\ctrl|sync|u1|counter\(8) & !\ctrl|sync|u1|counter\(9))) ) ) ) # ( !\ctrl|sync|u2|counter\(9) & ( 
-- !\ctrl|sync|u1|counter[6]~DUPLICATE_q\ & ( (!\ctrl|sync|u1|counter\(8) & (!\ctrl|sync|u1|counter\(9) & ((!\ctrl|sync|u1|counter\(7)) # (!\ctrl|sync|u1|counter\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000000000000000000000010000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u1|ALT_INV_counter\(7),
	datab => \ctrl|sync|u1|ALT_INV_counter\(8),
	datac => \ctrl|sync|u1|ALT_INV_counter\(9),
	datad => \ctrl|sync|u1|ALT_INV_counter\(5),
	datae => \ctrl|sync|u2|ALT_INV_counter\(9),
	dataf => \ctrl|sync|u1|ALT_INV_counter[6]~DUPLICATE_q\,
	combout => \ctrl|sync|o_blank~1_combout\);

-- Location: LABCELL_X24_Y77_N6
\ctrl|sync|o_blank~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ctrl|sync|o_blank~2_combout\ = ( \ctrl|sync|u2|counter\(5) & ( \ctrl|sync|u2|counter\(4) ) ) # ( !\ctrl|sync|u2|counter\(5) & ( \ctrl|sync|u2|counter\(4) & ( (!\ctrl|sync|o_blank~0_combout\) # (!\ctrl|sync|o_blank~1_combout\) ) ) ) # ( 
-- \ctrl|sync|u2|counter\(5) & ( !\ctrl|sync|u2|counter\(4) & ( (!\ctrl|sync|o_blank~0_combout\) # ((!\ctrl|sync|o_blank~1_combout\) # ((\ctrl|sync|u2|counter\(2) & \ctrl|sync|u2|counter\(3)))) ) ) ) # ( !\ctrl|sync|u2|counter\(5) & ( 
-- !\ctrl|sync|u2|counter\(4) & ( (!\ctrl|sync|o_blank~0_combout\) # (!\ctrl|sync|o_blank~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100111111001111110111111100111111001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ctrl|sync|u2|ALT_INV_counter\(2),
	datab => \ctrl|sync|ALT_INV_o_blank~0_combout\,
	datac => \ctrl|sync|ALT_INV_o_blank~1_combout\,
	datad => \ctrl|sync|u2|ALT_INV_counter\(3),
	datae => \ctrl|sync|u2|ALT_INV_counter\(5),
	dataf => \ctrl|sync|u2|ALT_INV_counter\(4),
	combout => \ctrl|sync|o_blank~2_combout\);


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


