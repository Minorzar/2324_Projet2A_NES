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

-- DATE "01/16/2024 14:23:49"

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

ENTITY 	vga IS
    PORT (
	i_clk_50 : IN std_logic;
	i_rst_n : IN std_logic;
	o_led : BUFFER std_logic;
	o_VGA_R : BUFFER std_logic_vector(7 DOWNTO 0);
	o_VGA_G : BUFFER std_logic_vector(7 DOWNTO 0);
	o_VGA_B : BUFFER std_logic_vector(7 DOWNTO 0);
	o_VGA_HS : BUFFER std_logic;
	o_VGA_VS : BUFFER std_logic;
	o_VGA_SYNC : BUFFER std_logic;
	o_VGA_BLANK : BUFFER std_logic;
	o_VGA_CLOCK : BUFFER std_logic
	);
END vga;

-- Design Ports Information
-- o_led	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[1]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[3]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_R[7]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[0]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[1]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[3]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[4]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[5]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[6]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_G[7]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[0]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[1]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[2]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[4]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[6]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_B[7]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_HS	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_VS	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_SYNC	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_BLANK	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_VGA_CLOCK	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_rst_n	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk_50 : std_logic;
SIGNAL ww_i_rst_n : std_logic;
SIGNAL ww_o_led : std_logic;
SIGNAL ww_o_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_HS : std_logic;
SIGNAL ww_o_VGA_VS : std_logic;
SIGNAL ww_o_VGA_SYNC : std_logic;
SIGNAL ww_o_VGA_BLANK : std_logic;
SIGNAL ww_o_VGA_CLOCK : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \i_clk_50~input_o\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \i_rst_n~input_o\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
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
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \p_blink:counter[24]~q\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \p_blink:counter[21]~q\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \o_led~reg0_q\ : std_logic;
SIGNAL \VGA_controler_0|Add0~1_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~2\ : std_logic;
SIGNAL \VGA_controler_0|Add0~5_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~6\ : std_logic;
SIGNAL \VGA_controler_0|Add0~9_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~10\ : std_logic;
SIGNAL \VGA_controler_0|Add0~13_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~14\ : std_logic;
SIGNAL \VGA_controler_0|Add0~17_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~18\ : std_logic;
SIGNAL \VGA_controler_0|Add0~21_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~22\ : std_logic;
SIGNAL \VGA_controler_0|Add0~25_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~26\ : std_logic;
SIGNAL \VGA_controler_0|Add0~29_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~30\ : std_logic;
SIGNAL \VGA_controler_0|Add0~33_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add0~34\ : std_logic;
SIGNAL \VGA_controler_0|Add0~37_sumout\ : std_logic;
SIGNAL \VGA_controler_0|LessThan2~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~2\ : std_logic;
SIGNAL \VGA_controler_0|Add1~5_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Equal0~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|Equal1~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~6\ : std_logic;
SIGNAL \VGA_controler_0|Add1~9_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~10\ : std_logic;
SIGNAL \VGA_controler_0|Add1~13_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~14\ : std_logic;
SIGNAL \VGA_controler_0|Add1~17_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~18\ : std_logic;
SIGNAL \VGA_controler_0|Add1~21_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~22\ : std_logic;
SIGNAL \VGA_controler_0|Add1~25_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~26\ : std_logic;
SIGNAL \VGA_controler_0|Add1~29_sumout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~30\ : std_logic;
SIGNAL \VGA_controler_0|Add1~37_sumout\ : std_logic;
SIGNAL \VGA_controler_0|LessThan3~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~38\ : std_logic;
SIGNAL \VGA_controler_0|Add1~33_sumout\ : std_logic;
SIGNAL \VGA_controler_0|LessThan3~1_combout\ : std_logic;
SIGNAL \VGA_controler_0|Add1~1_sumout\ : std_logic;
SIGNAL \VGA_controler_0|r_v_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|r_v_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|r_v_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|r_v_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_HS~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_HS~q\ : std_logic;
SIGNAL \VGA_controler_0|r_v_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_VS~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_VS~1_combout\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_VS~q\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_BLANK~1_combout\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_BLANK~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|o_VGA_BLANK~2_combout\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler_0|r_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler_0|r_v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll_0|pll25_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler_0|ALT_INV_r_v_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_r_v_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \pll_0|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_i_rst_n~input_o\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_VS~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_LessThan3~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_BLANK~2_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_BLANK~1_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_BLANK~0_combout\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_VS~q\ : std_logic;
SIGNAL \VGA_controler_0|ALT_INV_o_VGA_HS~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[0]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[1]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[2]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[3]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[4]~q\ : std_logic;
SIGNAL \ALT_INV_p_blink:counter[5]~q\ : std_logic;
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
SIGNAL \VGA_controler_0|ALT_INV_r_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \VGA_controler_0|ALT_INV_r_v_count\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_i_clk_50 <= i_clk_50;
ww_i_rst_n <= i_rst_n;
o_led <= ww_o_led;
o_VGA_R <= ww_o_VGA_R;
o_VGA_G <= ww_o_VGA_G;
o_VGA_B <= ww_o_VGA_B;
o_VGA_HS <= ww_o_VGA_HS;
o_VGA_VS <= ww_o_VGA_VS;
o_VGA_SYNC <= ww_o_VGA_SYNC;
o_VGA_BLANK <= ww_o_VGA_BLANK;
o_VGA_CLOCK <= ww_o_VGA_CLOCK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \i_clk_50~input_o\);

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\VGA_controler_0|ALT_INV_r_v_count[9]~DUPLICATE_q\ <= NOT \VGA_controler_0|r_v_count[9]~DUPLICATE_q\;
\VGA_controler_0|ALT_INV_r_v_count[6]~DUPLICATE_q\ <= NOT \VGA_controler_0|r_v_count[6]~DUPLICATE_q\;
\pll_0|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ <= NOT \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\;
\ALT_INV_i_rst_n~input_o\ <= NOT \i_rst_n~input_o\;
\VGA_controler_0|ALT_INV_o_VGA_VS~0_combout\ <= NOT \VGA_controler_0|o_VGA_VS~0_combout\;
\VGA_controler_0|ALT_INV_Equal1~0_combout\ <= NOT \VGA_controler_0|Equal1~0_combout\;
\VGA_controler_0|ALT_INV_Equal0~0_combout\ <= NOT \VGA_controler_0|Equal0~0_combout\;
\VGA_controler_0|ALT_INV_LessThan3~0_combout\ <= NOT \VGA_controler_0|LessThan3~0_combout\;
\ALT_INV_LessThan1~3_combout\ <= NOT \LessThan1~3_combout\;
\ALT_INV_LessThan1~2_combout\ <= NOT \LessThan1~2_combout\;
\ALT_INV_LessThan1~1_combout\ <= NOT \LessThan1~1_combout\;
\ALT_INV_LessThan0~4_combout\ <= NOT \LessThan0~4_combout\;
\ALT_INV_LessThan0~3_combout\ <= NOT \LessThan0~3_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
\VGA_controler_0|ALT_INV_o_VGA_BLANK~2_combout\ <= NOT \VGA_controler_0|o_VGA_BLANK~2_combout\;
\VGA_controler_0|ALT_INV_o_VGA_BLANK~1_combout\ <= NOT \VGA_controler_0|o_VGA_BLANK~1_combout\;
\VGA_controler_0|ALT_INV_o_VGA_BLANK~0_combout\ <= NOT \VGA_controler_0|o_VGA_BLANK~0_combout\;
\VGA_controler_0|ALT_INV_o_VGA_VS~q\ <= NOT \VGA_controler_0|o_VGA_VS~q\;
\VGA_controler_0|ALT_INV_o_VGA_HS~q\ <= NOT \VGA_controler_0|o_VGA_HS~q\;
\ALT_INV_p_blink:counter[0]~q\ <= NOT \p_blink:counter[0]~q\;
\ALT_INV_p_blink:counter[1]~q\ <= NOT \p_blink:counter[1]~q\;
\ALT_INV_p_blink:counter[2]~q\ <= NOT \p_blink:counter[2]~q\;
\ALT_INV_p_blink:counter[3]~q\ <= NOT \p_blink:counter[3]~q\;
\ALT_INV_p_blink:counter[4]~q\ <= NOT \p_blink:counter[4]~q\;
\ALT_INV_p_blink:counter[5]~q\ <= NOT \p_blink:counter[5]~q\;
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
\VGA_controler_0|ALT_INV_r_h_count\(9) <= NOT \VGA_controler_0|r_h_count\(9);
\VGA_controler_0|ALT_INV_r_h_count\(8) <= NOT \VGA_controler_0|r_h_count\(8);
\VGA_controler_0|ALT_INV_r_v_count\(8) <= NOT \VGA_controler_0|r_v_count\(8);
\VGA_controler_0|ALT_INV_r_v_count\(9) <= NOT \VGA_controler_0|r_v_count\(9);
\VGA_controler_0|ALT_INV_r_v_count\(7) <= NOT \VGA_controler_0|r_v_count\(7);
\VGA_controler_0|ALT_INV_r_v_count\(6) <= NOT \VGA_controler_0|r_v_count\(6);
\VGA_controler_0|ALT_INV_r_v_count\(5) <= NOT \VGA_controler_0|r_v_count\(5);
\VGA_controler_0|ALT_INV_r_v_count\(4) <= NOT \VGA_controler_0|r_v_count\(4);
\VGA_controler_0|ALT_INV_r_v_count\(3) <= NOT \VGA_controler_0|r_v_count\(3);
\VGA_controler_0|ALT_INV_r_v_count\(2) <= NOT \VGA_controler_0|r_v_count\(2);
\VGA_controler_0|ALT_INV_r_v_count\(1) <= NOT \VGA_controler_0|r_v_count\(1);
\VGA_controler_0|ALT_INV_r_v_count\(0) <= NOT \VGA_controler_0|r_v_count\(0);
\VGA_controler_0|ALT_INV_r_h_count\(7) <= NOT \VGA_controler_0|r_h_count\(7);
\VGA_controler_0|ALT_INV_r_h_count\(6) <= NOT \VGA_controler_0|r_h_count\(6);
\VGA_controler_0|ALT_INV_r_h_count\(5) <= NOT \VGA_controler_0|r_h_count\(5);
\VGA_controler_0|ALT_INV_r_h_count\(4) <= NOT \VGA_controler_0|r_h_count\(4);
\VGA_controler_0|ALT_INV_r_h_count\(3) <= NOT \VGA_controler_0|r_h_count\(3);
\VGA_controler_0|ALT_INV_r_h_count\(2) <= NOT \VGA_controler_0|r_h_count\(2);
\VGA_controler_0|ALT_INV_r_h_count\(1) <= NOT \VGA_controler_0|r_h_count\(1);
\VGA_controler_0|ALT_INV_r_h_count\(0) <= NOT \VGA_controler_0|r_h_count\(0);

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

-- Location: IOOBUF_X40_Y81_N53
\o_VGA_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(0),
	devoe => ww_devoe,
	o => ww_o_VGA_R(0));

-- Location: IOOBUF_X38_Y81_N2
\o_VGA_R[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(1),
	devoe => ww_devoe,
	o => ww_o_VGA_R(1));

-- Location: IOOBUF_X26_Y81_N59
\o_VGA_R[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(2),
	devoe => ww_devoe,
	o => ww_o_VGA_R(2));

-- Location: IOOBUF_X38_Y81_N19
\o_VGA_R[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(3),
	devoe => ww_devoe,
	o => ww_o_VGA_R(3));

-- Location: IOOBUF_X36_Y81_N36
\o_VGA_R[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(4),
	devoe => ww_devoe,
	o => ww_o_VGA_R(4));

-- Location: IOOBUF_X22_Y81_N19
\o_VGA_R[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(5),
	devoe => ww_devoe,
	o => ww_o_VGA_R(5));

-- Location: IOOBUF_X22_Y81_N2
\o_VGA_R[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(6),
	devoe => ww_devoe,
	o => ww_o_VGA_R(6));

-- Location: IOOBUF_X26_Y81_N42
\o_VGA_R[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_h_count\(7),
	devoe => ww_devoe,
	o => ww_o_VGA_R(7));

-- Location: IOOBUF_X4_Y81_N19
\o_VGA_G[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count[0]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_o_VGA_G(0));

-- Location: IOOBUF_X4_Y81_N2
\o_VGA_G[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count\(1),
	devoe => ww_devoe,
	o => ww_o_VGA_G(1));

-- Location: IOOBUF_X20_Y81_N19
\o_VGA_G[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count\(2),
	devoe => ww_devoe,
	o => ww_o_VGA_G(2));

-- Location: IOOBUF_X6_Y81_N2
\o_VGA_G[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count\(3),
	devoe => ww_devoe,
	o => ww_o_VGA_G(3));

-- Location: IOOBUF_X10_Y81_N59
\o_VGA_G[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count\(4),
	devoe => ww_devoe,
	o => ww_o_VGA_G(4));

-- Location: IOOBUF_X10_Y81_N42
\o_VGA_G[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count[5]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_o_VGA_G(5));

-- Location: IOOBUF_X18_Y81_N42
\o_VGA_G[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count[6]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_o_VGA_G(6));

-- Location: IOOBUF_X18_Y81_N59
\o_VGA_G[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|r_v_count[7]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_o_VGA_G(7));

-- Location: IOOBUF_X40_Y81_N36
\o_VGA_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(0));

-- Location: IOOBUF_X28_Y81_N19
\o_VGA_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(1));

-- Location: IOOBUF_X20_Y81_N2
\o_VGA_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(2));

-- Location: IOOBUF_X36_Y81_N19
\o_VGA_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(3));

-- Location: IOOBUF_X28_Y81_N2
\o_VGA_B[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(4));

-- Location: IOOBUF_X36_Y81_N2
\o_VGA_B[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(5));

-- Location: IOOBUF_X40_Y81_N19
\o_VGA_B[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(6));

-- Location: IOOBUF_X32_Y81_N19
\o_VGA_B[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_VGA_B(7));

-- Location: IOOBUF_X36_Y81_N53
\o_VGA_HS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|o_VGA_HS~q\,
	devoe => ww_devoe,
	o => ww_o_VGA_HS);

-- Location: IOOBUF_X34_Y81_N42
\o_VGA_VS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|o_VGA_VS~q\,
	devoe => ww_devoe,
	o => ww_o_VGA_VS);

-- Location: IOOBUF_X28_Y81_N36
\o_VGA_SYNC~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_VGA_SYNC);

-- Location: IOOBUF_X6_Y81_N19
\o_VGA_BLANK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler_0|ALT_INV_o_VGA_BLANK~2_combout\,
	devoe => ww_devoe,
	o => ww_o_VGA_BLANK);

-- Location: IOOBUF_X38_Y81_N36
\o_VGA_CLOCK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pll_0|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\,
	devoe => ww_devoe,
	o => ww_o_VGA_CLOCK);

-- Location: IOIBUF_X32_Y0_N1
\i_clk_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk_50,
	o => \i_clk_50~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
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
	clkin => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X36_Y0_N1
\i_rst_n~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_rst_n,
	o => \i_rst_n~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
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
	coreclkfb => \pll_0|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_i_rst_n~input_o\,
	refclkin => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll_0|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	tclk => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
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
	nen0 => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll_0|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll_0|pll25_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G6
\pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll_0|pll25_inst|altera_pll_i|outclk_wire\(0),
	outclk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: MLABCELL_X15_Y26_N0
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

-- Location: LABCELL_X16_Y26_N30
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \p_blink:counter[0]~q\ ) + ( VCC ) + ( !VCC ))
-- \Add0~98\ = CARRY(( \p_blink:counter[0]~q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[0]~q\,
	cin => GND,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X16_Y26_N31
\p_blink:counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~97_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[0]~q\);

-- Location: LABCELL_X16_Y26_N33
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

-- Location: FF_X16_Y26_N35
\p_blink:counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~93_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[1]~q\);

-- Location: LABCELL_X16_Y26_N36
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

-- Location: FF_X16_Y26_N38
\p_blink:counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~89_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[2]~q\);

-- Location: LABCELL_X16_Y26_N39
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

-- Location: FF_X16_Y26_N41
\p_blink:counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~85_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[3]~q\);

-- Location: LABCELL_X16_Y26_N42
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

-- Location: FF_X16_Y26_N44
\p_blink:counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~81_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[4]~q\);

-- Location: LABCELL_X16_Y26_N45
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

-- Location: FF_X16_Y26_N46
\p_blink:counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~53_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[5]~q\);

-- Location: LABCELL_X16_Y26_N48
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \p_blink:counter[6]~q\ ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~58\ = CARRY(( \p_blink:counter[6]~q\ ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[6]~q\,
	cin => \Add0~54\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X16_Y26_N50
\p_blink:counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~57_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[6]~q\);

-- Location: LABCELL_X16_Y26_N51
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

-- Location: FF_X16_Y26_N53
\p_blink:counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~61_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[7]~q\);

-- Location: LABCELL_X16_Y26_N54
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

-- Location: FF_X16_Y26_N56
\p_blink:counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~65_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[8]~q\);

-- Location: LABCELL_X16_Y26_N57
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

-- Location: FF_X16_Y26_N59
\p_blink:counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~49_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[9]~q\);

-- Location: LABCELL_X16_Y25_N0
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

-- Location: FF_X16_Y25_N2
\p_blink:counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~69_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[10]~q\);

-- Location: LABCELL_X16_Y25_N3
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

-- Location: FF_X16_Y25_N5
\p_blink:counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~73_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[11]~q\);

-- Location: LABCELL_X16_Y25_N6
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( \p_blink:counter[12]~q\ ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~78\ = CARRY(( \p_blink:counter[12]~q\ ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[12]~q\,
	cin => \Add0~74\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X16_Y25_N8
\p_blink:counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~77_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[12]~q\);

-- Location: LABCELL_X16_Y25_N9
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

-- Location: FF_X16_Y25_N11
\p_blink:counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~45_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[13]~q\);

-- Location: LABCELL_X16_Y25_N12
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

-- Location: FF_X16_Y25_N14
\p_blink:counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~41_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[14]~q\);

-- Location: LABCELL_X16_Y25_N15
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

-- Location: FF_X16_Y25_N17
\p_blink:counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~33_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[15]~q\);

-- Location: LABCELL_X16_Y25_N18
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( \p_blink:counter[16]~q\ ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( \p_blink:counter[16]~q\ ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[16]~q\,
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X16_Y25_N20
\p_blink:counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~37_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[16]~q\);

-- Location: LABCELL_X16_Y25_N21
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \p_blink:counter[17]~q\ ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~18\ = CARRY(( \p_blink:counter[17]~q\ ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[17]~q\,
	cin => \Add0~38\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X16_Y25_N23
\p_blink:counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~17_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[17]~q\);

-- Location: LABCELL_X16_Y25_N24
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

-- Location: FF_X16_Y25_N26
\p_blink:counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~21_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[18]~q\);

-- Location: LABCELL_X16_Y25_N27
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \p_blink:counter[19]~q\ ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \p_blink:counter[19]~q\ ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[19]~q\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X16_Y25_N29
\p_blink:counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~25_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[19]~q\);

-- Location: LABCELL_X16_Y25_N30
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

-- Location: FF_X16_Y25_N32
\p_blink:counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~29_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[20]~q\);

-- Location: LABCELL_X16_Y25_N33
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

-- Location: LABCELL_X16_Y25_N36
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

-- Location: FF_X16_Y25_N38
\p_blink:counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~1_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[22]~q\);

-- Location: LABCELL_X16_Y25_N39
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

-- Location: FF_X16_Y25_N41
\p_blink:counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~13_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[23]~q\);

-- Location: LABCELL_X16_Y25_N42
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \p_blink:counter[24]~q\ ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_p_blink:counter[24]~q\,
	cin => \Add0~14\,
	sumout => \Add0~5_sumout\);

-- Location: FF_X16_Y25_N44
\p_blink:counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~5_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[24]~q\);

-- Location: LABCELL_X16_Y25_N54
\LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ( \p_blink:counter[12]~q\ & ( (\p_blink:counter[14]~q\ & (\p_blink:counter[11]~q\ & \p_blink:counter[13]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_p_blink:counter[14]~q\,
	datac => \ALT_INV_p_blink:counter[11]~q\,
	datad => \ALT_INV_p_blink:counter[13]~q\,
	dataf => \ALT_INV_p_blink:counter[12]~q\,
	combout => \LessThan0~3_combout\);

-- Location: LABCELL_X16_Y26_N6
\LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ( !\p_blink:counter[7]~q\ & ( (!\p_blink:counter[8]~q\ & (!\p_blink:counter[10]~q\ & (!\p_blink:counter[6]~q\ & !\p_blink:counter[9]~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[8]~q\,
	datab => \ALT_INV_p_blink:counter[10]~q\,
	datac => \ALT_INV_p_blink:counter[6]~q\,
	datad => \ALT_INV_p_blink:counter[9]~q\,
	dataf => \ALT_INV_p_blink:counter[7]~q\,
	combout => \LessThan0~2_combout\);

-- Location: LABCELL_X16_Y26_N12
\LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ( \p_blink:counter[17]~q\ & ( \p_blink:counter[15]~q\ & ( \p_blink:counter[24]~q\ ) ) ) # ( !\p_blink:counter[17]~q\ & ( \p_blink:counter[15]~q\ & ( \p_blink:counter[24]~q\ ) ) ) # ( \p_blink:counter[17]~q\ & ( 
-- !\p_blink:counter[15]~q\ & ( \p_blink:counter[24]~q\ ) ) ) # ( !\p_blink:counter[17]~q\ & ( !\p_blink:counter[15]~q\ & ( (\p_blink:counter[24]~q\ & (((\LessThan0~3_combout\ & !\LessThan0~2_combout\)) # (\p_blink:counter[23]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010001001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[23]~q\,
	datab => \ALT_INV_p_blink:counter[24]~q\,
	datac => \ALT_INV_LessThan0~3_combout\,
	datad => \ALT_INV_LessThan0~2_combout\,
	datae => \ALT_INV_p_blink:counter[17]~q\,
	dataf => \ALT_INV_p_blink:counter[15]~q\,
	combout => \LessThan0~4_combout\);

-- Location: LABCELL_X16_Y25_N57
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \p_blink:counter[21]~q\ & ( (\p_blink:counter[19]~q\ & (\p_blink:counter[20]~q\ & \p_blink:counter[22]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_p_blink:counter[19]~q\,
	datac => \ALT_INV_p_blink:counter[20]~q\,
	datad => \ALT_INV_p_blink:counter[22]~q\,
	dataf => \ALT_INV_p_blink:counter[21]~q\,
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X16_Y26_N0
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( \p_blink:counter[16]~q\ & ( \p_blink:counter[18]~q\ & ( (!\LessThan0~0_combout\ & !\p_blink:counter[23]~q\) ) ) ) # ( !\p_blink:counter[16]~q\ & ( \p_blink:counter[18]~q\ & ( (!\p_blink:counter[23]~q\ & ((!\LessThan0~0_combout\) 
-- # (!\p_blink:counter[17]~q\))) ) ) ) # ( \p_blink:counter[16]~q\ & ( !\p_blink:counter[18]~q\ & ( !\p_blink:counter[23]~q\ ) ) ) # ( !\p_blink:counter[16]~q\ & ( !\p_blink:counter[18]~q\ & ( !\p_blink:counter[23]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~0_combout\,
	datac => \ALT_INV_p_blink:counter[23]~q\,
	datad => \ALT_INV_p_blink:counter[17]~q\,
	datae => \ALT_INV_p_blink:counter[16]~q\,
	dataf => \ALT_INV_p_blink:counter[18]~q\,
	combout => \LessThan0~1_combout\);

-- Location: LABCELL_X16_Y26_N9
\LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (\LessThan0~4_combout\ & !\LessThan0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_LessThan0~4_combout\,
	datad => \ALT_INV_LessThan0~1_combout\,
	combout => \LessThan0~5_combout\);

-- Location: FF_X16_Y25_N35
\p_blink:counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Add0~9_sumout\,
	asdata => \~GND~combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \p_blink:counter[21]~q\);

-- Location: MLABCELL_X15_Y25_N6
\LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ( \Add0~69_sumout\ & ( (\Add0~73_sumout\ & \Add0~77_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~73_sumout\,
	datac => \ALT_INV_Add0~77_sumout\,
	dataf => \ALT_INV_Add0~69_sumout\,
	combout => \LessThan1~2_combout\);

-- Location: LABCELL_X16_Y26_N18
\LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ( \Add0~61_sumout\ & ( \Add0~57_sumout\ & ( (!\LessThan0~1_combout\ & \LessThan0~4_combout\) ) ) ) # ( !\Add0~61_sumout\ & ( \Add0~57_sumout\ & ( (!\LessThan0~1_combout\ & \LessThan0~4_combout\) ) ) ) # ( \Add0~61_sumout\ & ( 
-- !\Add0~57_sumout\ & ( (!\LessThan0~1_combout\ & \LessThan0~4_combout\) ) ) ) # ( !\Add0~61_sumout\ & ( !\Add0~57_sumout\ & ( (!\LessThan0~1_combout\ & (((!\Add0~53_sumout\ & !\Add0~65_sumout\)) # (\LessThan0~4_combout\))) # (\LessThan0~1_combout\ & 
-- (!\Add0~53_sumout\ & (!\Add0~65_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011101010000000001010101000000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~1_combout\,
	datab => \ALT_INV_Add0~53_sumout\,
	datac => \ALT_INV_Add0~65_sumout\,
	datad => \ALT_INV_LessThan0~4_combout\,
	datae => \ALT_INV_Add0~61_sumout\,
	dataf => \ALT_INV_Add0~57_sumout\,
	combout => \LessThan1~1_combout\);

-- Location: MLABCELL_X15_Y25_N42
\LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = ( \LessThan1~1_combout\ & ( !\Add0~37_sumout\ & ( (!\Add0~41_sumout\ & ((!\Add0~49_sumout\) # ((!\LessThan1~2_combout\) # (!\Add0~45_sumout\)))) ) ) ) # ( !\LessThan1~1_combout\ & ( !\Add0~37_sumout\ & ( (!\Add0~41_sumout\ & 
-- ((!\LessThan1~2_combout\) # (!\Add0~45_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000000000111111100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~49_sumout\,
	datab => \ALT_INV_LessThan1~2_combout\,
	datac => \ALT_INV_Add0~45_sumout\,
	datad => \ALT_INV_Add0~41_sumout\,
	datae => \ALT_INV_LessThan1~1_combout\,
	dataf => \ALT_INV_Add0~37_sumout\,
	combout => \LessThan1~3_combout\);

-- Location: MLABCELL_X15_Y25_N30
\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ( \Add0~25_sumout\ & ( \Add0~33_sumout\ & ( (\Add0~17_sumout\ & (\Add0~21_sumout\ & \Add0~29_sumout\)) ) ) ) # ( \Add0~25_sumout\ & ( !\Add0~33_sumout\ & ( (\Add0~17_sumout\ & (\Add0~21_sumout\ & (\Add0~29_sumout\ & 
-- \Add0~37_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~17_sumout\,
	datab => \ALT_INV_Add0~21_sumout\,
	datac => \ALT_INV_Add0~29_sumout\,
	datad => \ALT_INV_Add0~37_sumout\,
	datae => \ALT_INV_Add0~25_sumout\,
	dataf => \ALT_INV_Add0~33_sumout\,
	combout => \LessThan1~0_combout\);

-- Location: LABCELL_X16_Y25_N48
\LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = ( !\Add0~13_sumout\ & ( \Add0~1_sumout\ & ( !\Add0~5_sumout\ ) ) ) # ( \Add0~13_sumout\ & ( !\Add0~1_sumout\ & ( (!\Add0~5_sumout\ & ((!\Add0~9_sumout\) # ((!\LessThan1~0_combout\) # (\LessThan1~3_combout\)))) ) ) ) # ( 
-- !\Add0~13_sumout\ & ( !\Add0~1_sumout\ & ( !\Add0~5_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111110110000000011111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~9_sumout\,
	datab => \ALT_INV_LessThan1~3_combout\,
	datac => \ALT_INV_LessThan1~0_combout\,
	datad => \ALT_INV_Add0~5_sumout\,
	datae => \ALT_INV_Add0~13_sumout\,
	dataf => \ALT_INV_Add0~1_sumout\,
	combout => \LessThan1~4_combout\);

-- Location: FF_X16_Y25_N49
\o_led~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \LessThan1~4_combout\,
	asdata => VCC,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sload => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \o_led~reg0_q\);

-- Location: LABCELL_X27_Y80_N30
\VGA_controler_0|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~1_sumout\ = SUM(( \VGA_controler_0|r_h_count\(0) ) + ( VCC ) + ( !VCC ))
-- \VGA_controler_0|Add0~2\ = CARRY(( \VGA_controler_0|r_h_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(0),
	cin => GND,
	sumout => \VGA_controler_0|Add0~1_sumout\,
	cout => \VGA_controler_0|Add0~2\);

-- Location: LABCELL_X27_Y80_N33
\VGA_controler_0|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~5_sumout\ = SUM(( \VGA_controler_0|r_h_count\(1) ) + ( GND ) + ( \VGA_controler_0|Add0~2\ ))
-- \VGA_controler_0|Add0~6\ = CARRY(( \VGA_controler_0|r_h_count\(1) ) + ( GND ) + ( \VGA_controler_0|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(1),
	cin => \VGA_controler_0|Add0~2\,
	sumout => \VGA_controler_0|Add0~5_sumout\,
	cout => \VGA_controler_0|Add0~6\);

-- Location: FF_X27_Y80_N34
\VGA_controler_0|r_h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~5_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(1));

-- Location: LABCELL_X27_Y80_N36
\VGA_controler_0|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~9_sumout\ = SUM(( \VGA_controler_0|r_h_count\(2) ) + ( GND ) + ( \VGA_controler_0|Add0~6\ ))
-- \VGA_controler_0|Add0~10\ = CARRY(( \VGA_controler_0|r_h_count\(2) ) + ( GND ) + ( \VGA_controler_0|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(2),
	cin => \VGA_controler_0|Add0~6\,
	sumout => \VGA_controler_0|Add0~9_sumout\,
	cout => \VGA_controler_0|Add0~10\);

-- Location: FF_X27_Y80_N38
\VGA_controler_0|r_h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~9_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(2));

-- Location: LABCELL_X27_Y80_N39
\VGA_controler_0|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~13_sumout\ = SUM(( \VGA_controler_0|r_h_count\(3) ) + ( GND ) + ( \VGA_controler_0|Add0~10\ ))
-- \VGA_controler_0|Add0~14\ = CARRY(( \VGA_controler_0|r_h_count\(3) ) + ( GND ) + ( \VGA_controler_0|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(3),
	cin => \VGA_controler_0|Add0~10\,
	sumout => \VGA_controler_0|Add0~13_sumout\,
	cout => \VGA_controler_0|Add0~14\);

-- Location: FF_X27_Y80_N40
\VGA_controler_0|r_h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~13_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(3));

-- Location: LABCELL_X27_Y80_N42
\VGA_controler_0|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~17_sumout\ = SUM(( \VGA_controler_0|r_h_count\(4) ) + ( GND ) + ( \VGA_controler_0|Add0~14\ ))
-- \VGA_controler_0|Add0~18\ = CARRY(( \VGA_controler_0|r_h_count\(4) ) + ( GND ) + ( \VGA_controler_0|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(4),
	cin => \VGA_controler_0|Add0~14\,
	sumout => \VGA_controler_0|Add0~17_sumout\,
	cout => \VGA_controler_0|Add0~18\);

-- Location: FF_X27_Y80_N43
\VGA_controler_0|r_h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~17_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(4));

-- Location: LABCELL_X27_Y80_N45
\VGA_controler_0|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~21_sumout\ = SUM(( \VGA_controler_0|r_h_count\(5) ) + ( GND ) + ( \VGA_controler_0|Add0~18\ ))
-- \VGA_controler_0|Add0~22\ = CARRY(( \VGA_controler_0|r_h_count\(5) ) + ( GND ) + ( \VGA_controler_0|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(5),
	cin => \VGA_controler_0|Add0~18\,
	sumout => \VGA_controler_0|Add0~21_sumout\,
	cout => \VGA_controler_0|Add0~22\);

-- Location: FF_X27_Y80_N47
\VGA_controler_0|r_h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~21_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(5));

-- Location: LABCELL_X27_Y80_N48
\VGA_controler_0|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~25_sumout\ = SUM(( \VGA_controler_0|r_h_count\(6) ) + ( GND ) + ( \VGA_controler_0|Add0~22\ ))
-- \VGA_controler_0|Add0~26\ = CARRY(( \VGA_controler_0|r_h_count\(6) ) + ( GND ) + ( \VGA_controler_0|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(6),
	cin => \VGA_controler_0|Add0~22\,
	sumout => \VGA_controler_0|Add0~25_sumout\,
	cout => \VGA_controler_0|Add0~26\);

-- Location: FF_X27_Y80_N50
\VGA_controler_0|r_h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~25_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(6));

-- Location: LABCELL_X27_Y80_N51
\VGA_controler_0|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~29_sumout\ = SUM(( \VGA_controler_0|r_h_count\(7) ) + ( GND ) + ( \VGA_controler_0|Add0~26\ ))
-- \VGA_controler_0|Add0~30\ = CARRY(( \VGA_controler_0|r_h_count\(7) ) + ( GND ) + ( \VGA_controler_0|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(7),
	cin => \VGA_controler_0|Add0~26\,
	sumout => \VGA_controler_0|Add0~29_sumout\,
	cout => \VGA_controler_0|Add0~30\);

-- Location: FF_X27_Y80_N53
\VGA_controler_0|r_h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~29_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(7));

-- Location: LABCELL_X27_Y80_N54
\VGA_controler_0|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~33_sumout\ = SUM(( \VGA_controler_0|r_h_count\(8) ) + ( GND ) + ( \VGA_controler_0|Add0~30\ ))
-- \VGA_controler_0|Add0~34\ = CARRY(( \VGA_controler_0|r_h_count\(8) ) + ( GND ) + ( \VGA_controler_0|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(8),
	cin => \VGA_controler_0|Add0~30\,
	sumout => \VGA_controler_0|Add0~33_sumout\,
	cout => \VGA_controler_0|Add0~34\);

-- Location: FF_X27_Y80_N56
\VGA_controler_0|r_h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~33_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(8));

-- Location: LABCELL_X27_Y80_N57
\VGA_controler_0|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add0~37_sumout\ = SUM(( \VGA_controler_0|r_h_count\(9) ) + ( GND ) + ( \VGA_controler_0|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_h_count\(9),
	cin => \VGA_controler_0|Add0~34\,
	sumout => \VGA_controler_0|Add0~37_sumout\);

-- Location: FF_X27_Y80_N59
\VGA_controler_0|r_h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~37_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(9));

-- Location: LABCELL_X27_Y80_N12
\VGA_controler_0|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|LessThan2~0_combout\ = ( \VGA_controler_0|r_h_count\(5) & ( \VGA_controler_0|r_h_count\(7) & ( (\VGA_controler_0|r_h_count\(8) & \VGA_controler_0|r_h_count\(9)) ) ) ) # ( !\VGA_controler_0|r_h_count\(5) & ( \VGA_controler_0|r_h_count\(7) 
-- & ( (\VGA_controler_0|r_h_count\(8) & \VGA_controler_0|r_h_count\(9)) ) ) ) # ( \VGA_controler_0|r_h_count\(5) & ( !\VGA_controler_0|r_h_count\(7) & ( (\VGA_controler_0|r_h_count\(8) & \VGA_controler_0|r_h_count\(9)) ) ) ) # ( 
-- !\VGA_controler_0|r_h_count\(5) & ( !\VGA_controler_0|r_h_count\(7) & ( (\VGA_controler_0|r_h_count\(8) & (\VGA_controler_0|r_h_count\(9) & \VGA_controler_0|r_h_count\(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_h_count\(8),
	datab => \VGA_controler_0|ALT_INV_r_h_count\(9),
	datac => \VGA_controler_0|ALT_INV_r_h_count\(6),
	datae => \VGA_controler_0|ALT_INV_r_h_count\(5),
	dataf => \VGA_controler_0|ALT_INV_r_h_count\(7),
	combout => \VGA_controler_0|LessThan2~0_combout\);

-- Location: FF_X27_Y80_N31
\VGA_controler_0|r_h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add0~1_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_h_count\(0));

-- Location: LABCELL_X16_Y80_N0
\VGA_controler_0|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~1_sumout\ = SUM(( \VGA_controler_0|r_v_count\(0) ) + ( VCC ) + ( !VCC ))
-- \VGA_controler_0|Add1~2\ = CARRY(( \VGA_controler_0|r_v_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(0),
	cin => GND,
	sumout => \VGA_controler_0|Add1~1_sumout\,
	cout => \VGA_controler_0|Add1~2\);

-- Location: LABCELL_X16_Y80_N3
\VGA_controler_0|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~5_sumout\ = SUM(( \VGA_controler_0|r_v_count\(1) ) + ( GND ) + ( \VGA_controler_0|Add1~2\ ))
-- \VGA_controler_0|Add1~6\ = CARRY(( \VGA_controler_0|r_v_count\(1) ) + ( GND ) + ( \VGA_controler_0|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(1),
	cin => \VGA_controler_0|Add1~2\,
	sumout => \VGA_controler_0|Add1~5_sumout\,
	cout => \VGA_controler_0|Add1~6\);

-- Location: LABCELL_X27_Y80_N18
\VGA_controler_0|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Equal0~0_combout\ = ( \VGA_controler_0|r_h_count\(2) & ( !\VGA_controler_0|r_h_count\(7) & ( (\VGA_controler_0|r_h_count\(1) & (!\VGA_controler_0|r_h_count\(4) & (\VGA_controler_0|r_h_count\(0) & \VGA_controler_0|r_h_count\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_h_count\(1),
	datab => \VGA_controler_0|ALT_INV_r_h_count\(4),
	datac => \VGA_controler_0|ALT_INV_r_h_count\(0),
	datad => \VGA_controler_0|ALT_INV_r_h_count\(3),
	datae => \VGA_controler_0|ALT_INV_r_h_count\(2),
	dataf => \VGA_controler_0|ALT_INV_r_h_count\(7),
	combout => \VGA_controler_0|Equal0~0_combout\);

-- Location: LABCELL_X27_Y80_N27
\VGA_controler_0|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Equal1~0_combout\ = ( \VGA_controler_0|r_h_count\(5) & ( \VGA_controler_0|r_h_count\(6) & ( (\VGA_controler_0|Equal0~0_combout\ & (!\VGA_controler_0|r_h_count\(9) & !\VGA_controler_0|r_h_count\(8))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_Equal0~0_combout\,
	datac => \VGA_controler_0|ALT_INV_r_h_count\(9),
	datad => \VGA_controler_0|ALT_INV_r_h_count\(8),
	datae => \VGA_controler_0|ALT_INV_r_h_count\(5),
	dataf => \VGA_controler_0|ALT_INV_r_h_count\(6),
	combout => \VGA_controler_0|Equal1~0_combout\);

-- Location: FF_X16_Y80_N4
\VGA_controler_0|r_v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~5_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(1));

-- Location: LABCELL_X16_Y80_N6
\VGA_controler_0|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~9_sumout\ = SUM(( \VGA_controler_0|r_v_count\(2) ) + ( GND ) + ( \VGA_controler_0|Add1~6\ ))
-- \VGA_controler_0|Add1~10\ = CARRY(( \VGA_controler_0|r_v_count\(2) ) + ( GND ) + ( \VGA_controler_0|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(2),
	cin => \VGA_controler_0|Add1~6\,
	sumout => \VGA_controler_0|Add1~9_sumout\,
	cout => \VGA_controler_0|Add1~10\);

-- Location: FF_X16_Y80_N7
\VGA_controler_0|r_v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~9_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(2));

-- Location: LABCELL_X16_Y80_N9
\VGA_controler_0|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~13_sumout\ = SUM(( \VGA_controler_0|r_v_count\(3) ) + ( GND ) + ( \VGA_controler_0|Add1~10\ ))
-- \VGA_controler_0|Add1~14\ = CARRY(( \VGA_controler_0|r_v_count\(3) ) + ( GND ) + ( \VGA_controler_0|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(3),
	cin => \VGA_controler_0|Add1~10\,
	sumout => \VGA_controler_0|Add1~13_sumout\,
	cout => \VGA_controler_0|Add1~14\);

-- Location: FF_X16_Y80_N10
\VGA_controler_0|r_v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~13_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(3));

-- Location: LABCELL_X16_Y80_N12
\VGA_controler_0|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~17_sumout\ = SUM(( \VGA_controler_0|r_v_count\(4) ) + ( GND ) + ( \VGA_controler_0|Add1~14\ ))
-- \VGA_controler_0|Add1~18\ = CARRY(( \VGA_controler_0|r_v_count\(4) ) + ( GND ) + ( \VGA_controler_0|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(4),
	cin => \VGA_controler_0|Add1~14\,
	sumout => \VGA_controler_0|Add1~17_sumout\,
	cout => \VGA_controler_0|Add1~18\);

-- Location: FF_X16_Y80_N13
\VGA_controler_0|r_v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~17_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(4));

-- Location: LABCELL_X16_Y80_N15
\VGA_controler_0|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~21_sumout\ = SUM(( \VGA_controler_0|r_v_count\(5) ) + ( GND ) + ( \VGA_controler_0|Add1~18\ ))
-- \VGA_controler_0|Add1~22\ = CARRY(( \VGA_controler_0|r_v_count\(5) ) + ( GND ) + ( \VGA_controler_0|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(5),
	cin => \VGA_controler_0|Add1~18\,
	sumout => \VGA_controler_0|Add1~21_sumout\,
	cout => \VGA_controler_0|Add1~22\);

-- Location: FF_X16_Y80_N17
\VGA_controler_0|r_v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~21_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(5));

-- Location: LABCELL_X16_Y80_N18
\VGA_controler_0|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~25_sumout\ = SUM(( \VGA_controler_0|r_v_count\(6) ) + ( GND ) + ( \VGA_controler_0|Add1~22\ ))
-- \VGA_controler_0|Add1~26\ = CARRY(( \VGA_controler_0|r_v_count\(6) ) + ( GND ) + ( \VGA_controler_0|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(6),
	cin => \VGA_controler_0|Add1~22\,
	sumout => \VGA_controler_0|Add1~25_sumout\,
	cout => \VGA_controler_0|Add1~26\);

-- Location: FF_X16_Y80_N20
\VGA_controler_0|r_v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~25_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(6));

-- Location: LABCELL_X16_Y80_N21
\VGA_controler_0|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~29_sumout\ = SUM(( \VGA_controler_0|r_v_count\(7) ) + ( GND ) + ( \VGA_controler_0|Add1~26\ ))
-- \VGA_controler_0|Add1~30\ = CARRY(( \VGA_controler_0|r_v_count\(7) ) + ( GND ) + ( \VGA_controler_0|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(7),
	cin => \VGA_controler_0|Add1~26\,
	sumout => \VGA_controler_0|Add1~29_sumout\,
	cout => \VGA_controler_0|Add1~30\);

-- Location: FF_X16_Y80_N23
\VGA_controler_0|r_v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~29_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(7));

-- Location: LABCELL_X16_Y80_N24
\VGA_controler_0|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~37_sumout\ = SUM(( \VGA_controler_0|r_v_count\(8) ) + ( GND ) + ( \VGA_controler_0|Add1~30\ ))
-- \VGA_controler_0|Add1~38\ = CARRY(( \VGA_controler_0|r_v_count\(8) ) + ( GND ) + ( \VGA_controler_0|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(8),
	cin => \VGA_controler_0|Add1~30\,
	sumout => \VGA_controler_0|Add1~37_sumout\,
	cout => \VGA_controler_0|Add1~38\);

-- Location: FF_X16_Y80_N25
\VGA_controler_0|r_v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~37_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(8));

-- Location: LABCELL_X16_Y80_N51
\VGA_controler_0|LessThan3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|LessThan3~0_combout\ = ( !\VGA_controler_0|r_v_count\(7) & ( !\VGA_controler_0|r_v_count\(8) & ( (!\VGA_controler_0|r_v_count\(5) & !\VGA_controler_0|r_v_count\(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \VGA_controler_0|ALT_INV_r_v_count\(5),
	datad => \VGA_controler_0|ALT_INV_r_v_count\(6),
	datae => \VGA_controler_0|ALT_INV_r_v_count\(7),
	dataf => \VGA_controler_0|ALT_INV_r_v_count\(8),
	combout => \VGA_controler_0|LessThan3~0_combout\);

-- Location: LABCELL_X16_Y80_N27
\VGA_controler_0|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|Add1~33_sumout\ = SUM(( \VGA_controler_0|r_v_count\(9) ) + ( GND ) + ( \VGA_controler_0|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler_0|ALT_INV_r_v_count\(9),
	cin => \VGA_controler_0|Add1~38\,
	sumout => \VGA_controler_0|Add1~33_sumout\);

-- Location: FF_X16_Y80_N29
\VGA_controler_0|r_v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~33_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(9));

-- Location: LABCELL_X16_Y80_N54
\VGA_controler_0|LessThan3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|LessThan3~1_combout\ = ( \VGA_controler_0|r_v_count\(2) & ( (\VGA_controler_0|r_v_count\(9) & (((!\VGA_controler_0|LessThan3~0_combout\) # (\VGA_controler_0|r_v_count\(4))) # (\VGA_controler_0|r_v_count\(3)))) ) ) # ( 
-- !\VGA_controler_0|r_v_count\(2) & ( (\VGA_controler_0|r_v_count\(9) & ((!\VGA_controler_0|LessThan3~0_combout\) # (\VGA_controler_0|r_v_count\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110011000000001111001100000000111101110000000011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_v_count\(3),
	datab => \VGA_controler_0|ALT_INV_r_v_count\(4),
	datac => \VGA_controler_0|ALT_INV_LessThan3~0_combout\,
	datad => \VGA_controler_0|ALT_INV_r_v_count\(9),
	dataf => \VGA_controler_0|ALT_INV_r_v_count\(2),
	combout => \VGA_controler_0|LessThan3~1_combout\);

-- Location: FF_X16_Y80_N2
\VGA_controler_0|r_v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~1_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count\(0));

-- Location: FF_X16_Y80_N1
\VGA_controler_0|r_v_count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~1_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count[0]~DUPLICATE_q\);

-- Location: FF_X16_Y80_N16
\VGA_controler_0|r_v_count[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~21_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count[5]~DUPLICATE_q\);

-- Location: FF_X16_Y80_N19
\VGA_controler_0|r_v_count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~25_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count[6]~DUPLICATE_q\);

-- Location: FF_X16_Y80_N22
\VGA_controler_0|r_v_count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~29_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count[7]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y80_N0
\VGA_controler_0|o_VGA_HS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_HS~0_combout\ = ( \VGA_controler_0|o_VGA_HS~q\ & ( \VGA_controler_0|r_h_count\(6) ) ) # ( !\VGA_controler_0|o_VGA_HS~q\ & ( \VGA_controler_0|r_h_count\(6) & ( (\VGA_controler_0|Equal0~0_combout\ & (\VGA_controler_0|r_h_count\(5) & 
-- (!\VGA_controler_0|r_h_count\(8) & !\VGA_controler_0|r_h_count\(9)))) ) ) ) # ( \VGA_controler_0|o_VGA_HS~q\ & ( !\VGA_controler_0|r_h_count\(6) & ( (!\VGA_controler_0|Equal0~0_combout\) # (((\VGA_controler_0|r_h_count\(9)) # 
-- (\VGA_controler_0|r_h_count\(8))) # (\VGA_controler_0|r_h_count\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101111111111111100010000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_Equal0~0_combout\,
	datab => \VGA_controler_0|ALT_INV_r_h_count\(5),
	datac => \VGA_controler_0|ALT_INV_r_h_count\(8),
	datad => \VGA_controler_0|ALT_INV_r_h_count\(9),
	datae => \VGA_controler_0|ALT_INV_o_VGA_HS~q\,
	dataf => \VGA_controler_0|ALT_INV_r_h_count\(6),
	combout => \VGA_controler_0|o_VGA_HS~0_combout\);

-- Location: FF_X27_Y80_N1
\VGA_controler_0|o_VGA_HS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|o_VGA_HS~0_combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|o_VGA_HS~q\);

-- Location: FF_X16_Y80_N28
\VGA_controler_0|r_v_count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|Add1~33_sumout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler_0|LessThan3~1_combout\,
	ena => \VGA_controler_0|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|r_v_count[9]~DUPLICATE_q\);

-- Location: LABCELL_X16_Y80_N57
\VGA_controler_0|o_VGA_VS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_VS~0_combout\ = ( !\VGA_controler_0|r_v_count[9]~DUPLICATE_q\ & ( (\VGA_controler_0|r_v_count\(3) & (!\VGA_controler_0|r_v_count\(4) & !\VGA_controler_0|r_v_count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000000000010001000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_v_count\(3),
	datab => \VGA_controler_0|ALT_INV_r_v_count\(4),
	datad => \VGA_controler_0|ALT_INV_r_v_count\(0),
	dataf => \VGA_controler_0|ALT_INV_r_v_count[9]~DUPLICATE_q\,
	combout => \VGA_controler_0|o_VGA_VS~0_combout\);

-- Location: LABCELL_X16_Y80_N30
\VGA_controler_0|o_VGA_VS~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_VS~1_combout\ = ( \VGA_controler_0|o_VGA_VS~q\ & ( \VGA_controler_0|r_v_count\(2) ) ) # ( !\VGA_controler_0|o_VGA_VS~q\ & ( \VGA_controler_0|r_v_count\(2) & ( (!\VGA_controler_0|r_v_count\(1) & (\VGA_controler_0|o_VGA_VS~0_combout\ 
-- & (\VGA_controler_0|LessThan3~0_combout\ & \VGA_controler_0|Equal1~0_combout\))) ) ) ) # ( \VGA_controler_0|o_VGA_VS~q\ & ( !\VGA_controler_0|r_v_count\(2) & ( (!\VGA_controler_0|r_v_count\(1)) # ((!\VGA_controler_0|o_VGA_VS~0_combout\) # 
-- ((!\VGA_controler_0|LessThan3~0_combout\) # (!\VGA_controler_0|Equal1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111000000000000000101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_v_count\(1),
	datab => \VGA_controler_0|ALT_INV_o_VGA_VS~0_combout\,
	datac => \VGA_controler_0|ALT_INV_LessThan3~0_combout\,
	datad => \VGA_controler_0|ALT_INV_Equal1~0_combout\,
	datae => \VGA_controler_0|ALT_INV_o_VGA_VS~q\,
	dataf => \VGA_controler_0|ALT_INV_r_v_count\(2),
	combout => \VGA_controler_0|o_VGA_VS~1_combout\);

-- Location: FF_X16_Y80_N31
\VGA_controler_0|o_VGA_VS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_0|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler_0|o_VGA_VS~1_combout\,
	clrn => \pll_0|pll25_inst|altera_pll_i|locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler_0|o_VGA_VS~q\);

-- Location: LABCELL_X27_Y80_N6
\VGA_controler_0|o_VGA_BLANK~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_BLANK~1_combout\ = ( !\VGA_controler_0|r_h_count\(5) & ( \VGA_controler_0|r_h_count\(7) & ( (!\VGA_controler_0|r_h_count\(8) & (!\VGA_controler_0|r_h_count\(9) & !\VGA_controler_0|r_h_count\(6))) ) ) ) # ( 
-- \VGA_controler_0|r_h_count\(5) & ( !\VGA_controler_0|r_h_count\(7) & ( (!\VGA_controler_0|r_h_count\(8) & !\VGA_controler_0|r_h_count\(9)) ) ) ) # ( !\VGA_controler_0|r_h_count\(5) & ( !\VGA_controler_0|r_h_count\(7) & ( (!\VGA_controler_0|r_h_count\(8) & 
-- !\VGA_controler_0|r_h_count\(9)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_r_h_count\(8),
	datab => \VGA_controler_0|ALT_INV_r_h_count\(9),
	datac => \VGA_controler_0|ALT_INV_r_h_count\(6),
	datae => \VGA_controler_0|ALT_INV_r_h_count\(5),
	dataf => \VGA_controler_0|ALT_INV_r_h_count\(7),
	combout => \VGA_controler_0|o_VGA_BLANK~1_combout\);

-- Location: LABCELL_X16_Y80_N36
\VGA_controler_0|o_VGA_BLANK~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_BLANK~0_combout\ = ( \VGA_controler_0|r_v_count\(3) & ( \VGA_controler_0|r_v_count\(2) & ( \VGA_controler_0|r_v_count\(5) ) ) ) # ( !\VGA_controler_0|r_v_count\(3) & ( \VGA_controler_0|r_v_count\(2) & ( 
-- (\VGA_controler_0|r_v_count\(5) & \VGA_controler_0|r_v_count\(4)) ) ) ) # ( \VGA_controler_0|r_v_count\(3) & ( !\VGA_controler_0|r_v_count\(2) & ( (\VGA_controler_0|r_v_count\(5) & \VGA_controler_0|r_v_count\(4)) ) ) ) # ( !\VGA_controler_0|r_v_count\(3) 
-- & ( !\VGA_controler_0|r_v_count\(2) & ( (\VGA_controler_0|r_v_count\(5) & \VGA_controler_0|r_v_count\(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100000000001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \VGA_controler_0|ALT_INV_r_v_count\(5),
	datad => \VGA_controler_0|ALT_INV_r_v_count\(4),
	datae => \VGA_controler_0|ALT_INV_r_v_count\(3),
	dataf => \VGA_controler_0|ALT_INV_r_v_count\(2),
	combout => \VGA_controler_0|o_VGA_BLANK~0_combout\);

-- Location: LABCELL_X16_Y80_N42
\VGA_controler_0|o_VGA_BLANK~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler_0|o_VGA_BLANK~2_combout\ = ( \VGA_controler_0|o_VGA_BLANK~0_combout\ & ( \VGA_controler_0|r_v_count[9]~DUPLICATE_q\ & ( \VGA_controler_0|o_VGA_BLANK~1_combout\ ) ) ) # ( !\VGA_controler_0|o_VGA_BLANK~0_combout\ & ( 
-- \VGA_controler_0|r_v_count[9]~DUPLICATE_q\ & ( \VGA_controler_0|o_VGA_BLANK~1_combout\ ) ) ) # ( \VGA_controler_0|o_VGA_BLANK~0_combout\ & ( !\VGA_controler_0|r_v_count[9]~DUPLICATE_q\ & ( \VGA_controler_0|o_VGA_BLANK~1_combout\ ) ) ) # ( 
-- !\VGA_controler_0|o_VGA_BLANK~0_combout\ & ( !\VGA_controler_0|r_v_count[9]~DUPLICATE_q\ & ( ((!\VGA_controler_0|r_v_count[6]~DUPLICATE_q\ & (!\VGA_controler_0|r_v_count\(7) & !\VGA_controler_0|r_v_count\(8)))) # (\VGA_controler_0|o_VGA_BLANK~1_combout\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler_0|ALT_INV_o_VGA_BLANK~1_combout\,
	datab => \VGA_controler_0|ALT_INV_r_v_count[6]~DUPLICATE_q\,
	datac => \VGA_controler_0|ALT_INV_r_v_count\(7),
	datad => \VGA_controler_0|ALT_INV_r_v_count\(8),
	datae => \VGA_controler_0|ALT_INV_o_VGA_BLANK~0_combout\,
	dataf => \VGA_controler_0|ALT_INV_r_v_count[9]~DUPLICATE_q\,
	combout => \VGA_controler_0|o_VGA_BLANK~2_combout\);


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


