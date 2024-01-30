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

-- DATE "01/23/2024 13:51:02"

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
	o_VGA_R : OUT std_logic_vector(7 DOWNTO 0);
	o_VGA_G : OUT std_logic_vector(7 DOWNTO 0);
	o_VGA_B : OUT std_logic_vector(7 DOWNTO 0);
	o_VGA_HS : OUT std_logic;
	o_VGA_VS : OUT std_logic;
	o_VGA_SYNC : OUT std_logic;
	o_VGA_BLANK : OUT std_logic;
	o_VGA_CLOCK : OUT std_logic
	);
END vga;

-- Design Ports Information
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
SIGNAL ww_o_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_VGA_HS : std_logic;
SIGNAL ww_o_VGA_VS : std_logic;
SIGNAL ww_o_VGA_SYNC : std_logic;
SIGNAL ww_o_VGA_BLANK : std_logic;
SIGNAL ww_o_VGA_CLOCK : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \i_clk_50~input_o\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \i_rst_n~input_o\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \VGA_controler|Add0~1_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~2\ : std_logic;
SIGNAL \VGA_controler|Add0~5_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~6\ : std_logic;
SIGNAL \VGA_controler|Add0~9_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~10\ : std_logic;
SIGNAL \VGA_controler|Add0~13_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~14\ : std_logic;
SIGNAL \VGA_controler|Add0~17_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~18\ : std_logic;
SIGNAL \VGA_controler|Add0~21_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~22\ : std_logic;
SIGNAL \VGA_controler|Add0~25_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~26\ : std_logic;
SIGNAL \VGA_controler|Add0~29_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~30\ : std_logic;
SIGNAL \VGA_controler|Add0~37_sumout\ : std_logic;
SIGNAL \VGA_controler|Add0~38\ : std_logic;
SIGNAL \VGA_controler|Add0~33_sumout\ : std_logic;
SIGNAL \VGA_controler|r_h_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler|LessThan2~0_combout\ : std_logic;
SIGNAL \VGA_controler|r_h_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler|Add1~1_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~2\ : std_logic;
SIGNAL \VGA_controler|Add1~5_sumout\ : std_logic;
SIGNAL \VGA_controler|Equal0~0_combout\ : std_logic;
SIGNAL \VGA_controler|Equal1~0_combout\ : std_logic;
SIGNAL \VGA_controler|Add1~6\ : std_logic;
SIGNAL \VGA_controler|Add1~9_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~10\ : std_logic;
SIGNAL \VGA_controler|Add1~13_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~14\ : std_logic;
SIGNAL \VGA_controler|Add1~17_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~18\ : std_logic;
SIGNAL \VGA_controler|Add1~21_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~22\ : std_logic;
SIGNAL \VGA_controler|Add1~25_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~26\ : std_logic;
SIGNAL \VGA_controler|Add1~29_sumout\ : std_logic;
SIGNAL \VGA_controler|Add1~30\ : std_logic;
SIGNAL \VGA_controler|Add1~37_sumout\ : std_logic;
SIGNAL \VGA_controler|LessThan3~0_combout\ : std_logic;
SIGNAL \VGA_controler|Add1~38\ : std_logic;
SIGNAL \VGA_controler|Add1~33_sumout\ : std_logic;
SIGNAL \VGA_controler|LessThan3~1_combout\ : std_logic;
SIGNAL \VGA_controler|r_v_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler|o_VGA_HS~0_combout\ : std_logic;
SIGNAL \VGA_controler|o_VGA_HS~q\ : std_logic;
SIGNAL \VGA_controler|o_VGA_VS~0_combout\ : std_logic;
SIGNAL \VGA_controler|o_VGA_VS~1_combout\ : std_logic;
SIGNAL \VGA_controler|o_VGA_VS~q\ : std_logic;
SIGNAL \VGA_controler|o_VGA_BLANK~0_combout\ : std_logic;
SIGNAL \VGA_controler|r_v_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler|o_VGA_BLANK~1_combout\ : std_logic;
SIGNAL \VGA_controler|o_VGA_BLANK~2_combout\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler|r_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler|r_v_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \pll|pll25_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \VGA_controler|ALT_INV_r_h_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_r_v_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \pll|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \ALT_INV_i_rst_n~input_o\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_VS~0_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_LessThan3~0_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_BLANK~2_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_BLANK~1_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_BLANK~0_combout\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_VS~q\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_o_VGA_HS~q\ : std_logic;
SIGNAL \VGA_controler|ALT_INV_r_h_count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \VGA_controler|ALT_INV_r_v_count\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_i_clk_50 <= i_clk_50;
ww_i_rst_n <= i_rst_n;
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

\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \i_clk_50~input_o\);

\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\VGA_controler|ALT_INV_r_h_count[9]~DUPLICATE_q\ <= NOT \VGA_controler|r_h_count[9]~DUPLICATE_q\;
\VGA_controler|ALT_INV_r_v_count[9]~DUPLICATE_q\ <= NOT \VGA_controler|r_v_count[9]~DUPLICATE_q\;
\pll|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\ <= NOT \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\;
\ALT_INV_i_rst_n~input_o\ <= NOT \i_rst_n~input_o\;
\VGA_controler|ALT_INV_o_VGA_VS~0_combout\ <= NOT \VGA_controler|o_VGA_VS~0_combout\;
\VGA_controler|ALT_INV_Equal1~0_combout\ <= NOT \VGA_controler|Equal1~0_combout\;
\VGA_controler|ALT_INV_Equal0~0_combout\ <= NOT \VGA_controler|Equal0~0_combout\;
\VGA_controler|ALT_INV_LessThan3~0_combout\ <= NOT \VGA_controler|LessThan3~0_combout\;
\VGA_controler|ALT_INV_o_VGA_BLANK~2_combout\ <= NOT \VGA_controler|o_VGA_BLANK~2_combout\;
\VGA_controler|ALT_INV_o_VGA_BLANK~1_combout\ <= NOT \VGA_controler|o_VGA_BLANK~1_combout\;
\VGA_controler|ALT_INV_o_VGA_BLANK~0_combout\ <= NOT \VGA_controler|o_VGA_BLANK~0_combout\;
\VGA_controler|ALT_INV_o_VGA_VS~q\ <= NOT \VGA_controler|o_VGA_VS~q\;
\VGA_controler|ALT_INV_o_VGA_HS~q\ <= NOT \VGA_controler|o_VGA_HS~q\;
\VGA_controler|ALT_INV_r_h_count\(8) <= NOT \VGA_controler|r_h_count\(8);
\VGA_controler|ALT_INV_r_h_count\(9) <= NOT \VGA_controler|r_h_count\(9);
\VGA_controler|ALT_INV_r_v_count\(8) <= NOT \VGA_controler|r_v_count\(8);
\VGA_controler|ALT_INV_r_v_count\(9) <= NOT \VGA_controler|r_v_count\(9);
\VGA_controler|ALT_INV_r_v_count\(7) <= NOT \VGA_controler|r_v_count\(7);
\VGA_controler|ALT_INV_r_v_count\(6) <= NOT \VGA_controler|r_v_count\(6);
\VGA_controler|ALT_INV_r_v_count\(5) <= NOT \VGA_controler|r_v_count\(5);
\VGA_controler|ALT_INV_r_v_count\(4) <= NOT \VGA_controler|r_v_count\(4);
\VGA_controler|ALT_INV_r_v_count\(3) <= NOT \VGA_controler|r_v_count\(3);
\VGA_controler|ALT_INV_r_v_count\(2) <= NOT \VGA_controler|r_v_count\(2);
\VGA_controler|ALT_INV_r_v_count\(1) <= NOT \VGA_controler|r_v_count\(1);
\VGA_controler|ALT_INV_r_v_count\(0) <= NOT \VGA_controler|r_v_count\(0);
\VGA_controler|ALT_INV_r_h_count\(7) <= NOT \VGA_controler|r_h_count\(7);
\VGA_controler|ALT_INV_r_h_count\(6) <= NOT \VGA_controler|r_h_count\(6);
\VGA_controler|ALT_INV_r_h_count\(5) <= NOT \VGA_controler|r_h_count\(5);
\VGA_controler|ALT_INV_r_h_count\(4) <= NOT \VGA_controler|r_h_count\(4);
\VGA_controler|ALT_INV_r_h_count\(3) <= NOT \VGA_controler|r_h_count\(3);
\VGA_controler|ALT_INV_r_h_count\(2) <= NOT \VGA_controler|r_h_count\(2);
\VGA_controler|ALT_INV_r_h_count\(1) <= NOT \VGA_controler|r_h_count\(1);
\VGA_controler|ALT_INV_r_h_count\(0) <= NOT \VGA_controler|r_h_count\(0);

-- Location: IOOBUF_X40_Y81_N53
\o_VGA_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_controler|r_h_count\(0),
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
	i => \VGA_controler|r_h_count[1]~DUPLICATE_q\,
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
	i => \VGA_controler|r_h_count\(2),
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
	i => \VGA_controler|r_h_count\(3),
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
	i => \VGA_controler|r_h_count\(4),
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
	i => \VGA_controler|r_h_count\(5),
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
	i => \VGA_controler|r_h_count\(6),
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
	i => \VGA_controler|r_h_count\(7),
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
	i => \VGA_controler|r_v_count\(0),
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
	i => \VGA_controler|r_v_count\(1),
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
	i => \VGA_controler|r_v_count\(2),
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
	i => \VGA_controler|r_v_count\(3),
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
	i => \VGA_controler|r_v_count\(4),
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
	i => \VGA_controler|r_v_count\(5),
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
	i => \VGA_controler|r_v_count[6]~DUPLICATE_q\,
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
	i => \VGA_controler|r_v_count\(7),
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
	i => \VGA_controler|o_VGA_HS~q\,
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
	i => \VGA_controler|o_VGA_VS~q\,
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
	i => \VGA_controler|ALT_INV_o_VGA_BLANK~2_combout\,
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
	i => \pll|pll25_inst|altera_pll_i|ALT_INV_outclk_wire[0]~CLKENA0_outclk\,
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
\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
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
	clkin => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

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
\pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
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
	coreclkfb => \pll|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_i_rst_n~input_o\,
	refclkin => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll|pll25_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	tclk => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
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
	nen0 => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \pll|pll25_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll|pll25_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll|pll25_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G6
\pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll|pll25_inst|altera_pll_i|outclk_wire\(0),
	outclk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: LABCELL_X33_Y80_N30
\VGA_controler|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~1_sumout\ = SUM(( \VGA_controler|r_h_count\(0) ) + ( VCC ) + ( !VCC ))
-- \VGA_controler|Add0~2\ = CARRY(( \VGA_controler|r_h_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(0),
	cin => GND,
	sumout => \VGA_controler|Add0~1_sumout\,
	cout => \VGA_controler|Add0~2\);

-- Location: LABCELL_X33_Y80_N33
\VGA_controler|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~5_sumout\ = SUM(( \VGA_controler|r_h_count\(1) ) + ( GND ) + ( \VGA_controler|Add0~2\ ))
-- \VGA_controler|Add0~6\ = CARRY(( \VGA_controler|r_h_count\(1) ) + ( GND ) + ( \VGA_controler|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(1),
	cin => \VGA_controler|Add0~2\,
	sumout => \VGA_controler|Add0~5_sumout\,
	cout => \VGA_controler|Add0~6\);

-- Location: FF_X33_Y80_N35
\VGA_controler|r_h_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~5_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(1));

-- Location: LABCELL_X33_Y80_N36
\VGA_controler|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~9_sumout\ = SUM(( \VGA_controler|r_h_count\(2) ) + ( GND ) + ( \VGA_controler|Add0~6\ ))
-- \VGA_controler|Add0~10\ = CARRY(( \VGA_controler|r_h_count\(2) ) + ( GND ) + ( \VGA_controler|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(2),
	cin => \VGA_controler|Add0~6\,
	sumout => \VGA_controler|Add0~9_sumout\,
	cout => \VGA_controler|Add0~10\);

-- Location: FF_X33_Y80_N37
\VGA_controler|r_h_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~9_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(2));

-- Location: LABCELL_X33_Y80_N39
\VGA_controler|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~13_sumout\ = SUM(( \VGA_controler|r_h_count\(3) ) + ( GND ) + ( \VGA_controler|Add0~10\ ))
-- \VGA_controler|Add0~14\ = CARRY(( \VGA_controler|r_h_count\(3) ) + ( GND ) + ( \VGA_controler|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(3),
	cin => \VGA_controler|Add0~10\,
	sumout => \VGA_controler|Add0~13_sumout\,
	cout => \VGA_controler|Add0~14\);

-- Location: FF_X33_Y80_N40
\VGA_controler|r_h_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~13_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(3));

-- Location: LABCELL_X33_Y80_N42
\VGA_controler|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~17_sumout\ = SUM(( \VGA_controler|r_h_count\(4) ) + ( GND ) + ( \VGA_controler|Add0~14\ ))
-- \VGA_controler|Add0~18\ = CARRY(( \VGA_controler|r_h_count\(4) ) + ( GND ) + ( \VGA_controler|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(4),
	cin => \VGA_controler|Add0~14\,
	sumout => \VGA_controler|Add0~17_sumout\,
	cout => \VGA_controler|Add0~18\);

-- Location: FF_X33_Y80_N43
\VGA_controler|r_h_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~17_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(4));

-- Location: LABCELL_X33_Y80_N45
\VGA_controler|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~21_sumout\ = SUM(( \VGA_controler|r_h_count\(5) ) + ( GND ) + ( \VGA_controler|Add0~18\ ))
-- \VGA_controler|Add0~22\ = CARRY(( \VGA_controler|r_h_count\(5) ) + ( GND ) + ( \VGA_controler|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(5),
	cin => \VGA_controler|Add0~18\,
	sumout => \VGA_controler|Add0~21_sumout\,
	cout => \VGA_controler|Add0~22\);

-- Location: FF_X33_Y80_N46
\VGA_controler|r_h_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~21_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(5));

-- Location: LABCELL_X33_Y80_N48
\VGA_controler|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~25_sumout\ = SUM(( \VGA_controler|r_h_count\(6) ) + ( GND ) + ( \VGA_controler|Add0~22\ ))
-- \VGA_controler|Add0~26\ = CARRY(( \VGA_controler|r_h_count\(6) ) + ( GND ) + ( \VGA_controler|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(6),
	cin => \VGA_controler|Add0~22\,
	sumout => \VGA_controler|Add0~25_sumout\,
	cout => \VGA_controler|Add0~26\);

-- Location: FF_X33_Y80_N50
\VGA_controler|r_h_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~25_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(6));

-- Location: LABCELL_X33_Y80_N51
\VGA_controler|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~29_sumout\ = SUM(( \VGA_controler|r_h_count\(7) ) + ( GND ) + ( \VGA_controler|Add0~26\ ))
-- \VGA_controler|Add0~30\ = CARRY(( \VGA_controler|r_h_count\(7) ) + ( GND ) + ( \VGA_controler|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(7),
	cin => \VGA_controler|Add0~26\,
	sumout => \VGA_controler|Add0~29_sumout\,
	cout => \VGA_controler|Add0~30\);

-- Location: FF_X33_Y80_N52
\VGA_controler|r_h_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~29_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(7));

-- Location: LABCELL_X33_Y80_N54
\VGA_controler|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~37_sumout\ = SUM(( \VGA_controler|r_h_count\(8) ) + ( GND ) + ( \VGA_controler|Add0~30\ ))
-- \VGA_controler|Add0~38\ = CARRY(( \VGA_controler|r_h_count\(8) ) + ( GND ) + ( \VGA_controler|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(8),
	cin => \VGA_controler|Add0~30\,
	sumout => \VGA_controler|Add0~37_sumout\,
	cout => \VGA_controler|Add0~38\);

-- Location: FF_X33_Y80_N56
\VGA_controler|r_h_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~37_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(8));

-- Location: FF_X33_Y80_N59
\VGA_controler|r_h_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~33_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(9));

-- Location: LABCELL_X33_Y80_N57
\VGA_controler|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add0~33_sumout\ = SUM(( \VGA_controler|r_h_count\(9) ) + ( GND ) + ( \VGA_controler|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_h_count\(9),
	cin => \VGA_controler|Add0~38\,
	sumout => \VGA_controler|Add0~33_sumout\);

-- Location: FF_X33_Y80_N58
\VGA_controler|r_h_count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~33_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count[9]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y80_N12
\VGA_controler|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|LessThan2~0_combout\ = ( \VGA_controler|r_h_count\(5) & ( \VGA_controler|r_h_count\(6) & ( (\VGA_controler|r_h_count\(8) & \VGA_controler|r_h_count[9]~DUPLICATE_q\) ) ) ) # ( !\VGA_controler|r_h_count\(5) & ( \VGA_controler|r_h_count\(6) & 
-- ( (\VGA_controler|r_h_count\(8) & \VGA_controler|r_h_count[9]~DUPLICATE_q\) ) ) ) # ( \VGA_controler|r_h_count\(5) & ( !\VGA_controler|r_h_count\(6) & ( (\VGA_controler|r_h_count\(8) & \VGA_controler|r_h_count[9]~DUPLICATE_q\) ) ) ) # ( 
-- !\VGA_controler|r_h_count\(5) & ( !\VGA_controler|r_h_count\(6) & ( (\VGA_controler|r_h_count\(8) & (\VGA_controler|r_h_count\(7) & \VGA_controler|r_h_count[9]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_h_count\(8),
	datab => \VGA_controler|ALT_INV_r_h_count\(7),
	datac => \VGA_controler|ALT_INV_r_h_count[9]~DUPLICATE_q\,
	datae => \VGA_controler|ALT_INV_r_h_count\(5),
	dataf => \VGA_controler|ALT_INV_r_h_count\(6),
	combout => \VGA_controler|LessThan2~0_combout\);

-- Location: FF_X33_Y80_N31
\VGA_controler|r_h_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~1_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count\(0));

-- Location: FF_X33_Y80_N34
\VGA_controler|r_h_count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add0~5_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_h_count[1]~DUPLICATE_q\);

-- Location: LABCELL_X13_Y80_N30
\VGA_controler|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~1_sumout\ = SUM(( \VGA_controler|r_v_count\(0) ) + ( VCC ) + ( !VCC ))
-- \VGA_controler|Add1~2\ = CARRY(( \VGA_controler|r_v_count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(0),
	cin => GND,
	sumout => \VGA_controler|Add1~1_sumout\,
	cout => \VGA_controler|Add1~2\);

-- Location: LABCELL_X13_Y80_N33
\VGA_controler|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~5_sumout\ = SUM(( \VGA_controler|r_v_count\(1) ) + ( GND ) + ( \VGA_controler|Add1~2\ ))
-- \VGA_controler|Add1~6\ = CARRY(( \VGA_controler|r_v_count\(1) ) + ( GND ) + ( \VGA_controler|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(1),
	cin => \VGA_controler|Add1~2\,
	sumout => \VGA_controler|Add1~5_sumout\,
	cout => \VGA_controler|Add1~6\);

-- Location: LABCELL_X33_Y80_N18
\VGA_controler|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Equal0~0_combout\ = ( \VGA_controler|r_h_count\(2) & ( \VGA_controler|r_h_count\(0) & ( (!\VGA_controler|r_h_count\(4) & (!\VGA_controler|r_h_count\(7) & (\VGA_controler|r_h_count\(1) & \VGA_controler|r_h_count\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_h_count\(4),
	datab => \VGA_controler|ALT_INV_r_h_count\(7),
	datac => \VGA_controler|ALT_INV_r_h_count\(1),
	datad => \VGA_controler|ALT_INV_r_h_count\(3),
	datae => \VGA_controler|ALT_INV_r_h_count\(2),
	dataf => \VGA_controler|ALT_INV_r_h_count\(0),
	combout => \VGA_controler|Equal0~0_combout\);

-- Location: LABCELL_X33_Y80_N27
\VGA_controler|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Equal1~0_combout\ = ( !\VGA_controler|r_h_count\(8) & ( \VGA_controler|r_h_count\(6) & ( (\VGA_controler|Equal0~0_combout\ & (\VGA_controler|r_h_count\(5) & !\VGA_controler|r_h_count[9]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_Equal0~0_combout\,
	datac => \VGA_controler|ALT_INV_r_h_count\(5),
	datad => \VGA_controler|ALT_INV_r_h_count[9]~DUPLICATE_q\,
	datae => \VGA_controler|ALT_INV_r_h_count\(8),
	dataf => \VGA_controler|ALT_INV_r_h_count\(6),
	combout => \VGA_controler|Equal1~0_combout\);

-- Location: FF_X13_Y80_N34
\VGA_controler|r_v_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~5_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(1));

-- Location: LABCELL_X13_Y80_N36
\VGA_controler|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~9_sumout\ = SUM(( \VGA_controler|r_v_count\(2) ) + ( GND ) + ( \VGA_controler|Add1~6\ ))
-- \VGA_controler|Add1~10\ = CARRY(( \VGA_controler|r_v_count\(2) ) + ( GND ) + ( \VGA_controler|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(2),
	cin => \VGA_controler|Add1~6\,
	sumout => \VGA_controler|Add1~9_sumout\,
	cout => \VGA_controler|Add1~10\);

-- Location: FF_X13_Y80_N38
\VGA_controler|r_v_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~9_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(2));

-- Location: LABCELL_X13_Y80_N39
\VGA_controler|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~13_sumout\ = SUM(( \VGA_controler|r_v_count\(3) ) + ( GND ) + ( \VGA_controler|Add1~10\ ))
-- \VGA_controler|Add1~14\ = CARRY(( \VGA_controler|r_v_count\(3) ) + ( GND ) + ( \VGA_controler|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(3),
	cin => \VGA_controler|Add1~10\,
	sumout => \VGA_controler|Add1~13_sumout\,
	cout => \VGA_controler|Add1~14\);

-- Location: FF_X13_Y80_N40
\VGA_controler|r_v_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~13_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(3));

-- Location: LABCELL_X13_Y80_N42
\VGA_controler|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~17_sumout\ = SUM(( \VGA_controler|r_v_count\(4) ) + ( GND ) + ( \VGA_controler|Add1~14\ ))
-- \VGA_controler|Add1~18\ = CARRY(( \VGA_controler|r_v_count\(4) ) + ( GND ) + ( \VGA_controler|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(4),
	cin => \VGA_controler|Add1~14\,
	sumout => \VGA_controler|Add1~17_sumout\,
	cout => \VGA_controler|Add1~18\);

-- Location: FF_X13_Y80_N44
\VGA_controler|r_v_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~17_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(4));

-- Location: LABCELL_X13_Y80_N45
\VGA_controler|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~21_sumout\ = SUM(( \VGA_controler|r_v_count\(5) ) + ( GND ) + ( \VGA_controler|Add1~18\ ))
-- \VGA_controler|Add1~22\ = CARRY(( \VGA_controler|r_v_count\(5) ) + ( GND ) + ( \VGA_controler|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(5),
	cin => \VGA_controler|Add1~18\,
	sumout => \VGA_controler|Add1~21_sumout\,
	cout => \VGA_controler|Add1~22\);

-- Location: FF_X13_Y80_N46
\VGA_controler|r_v_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~21_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(5));

-- Location: LABCELL_X13_Y80_N48
\VGA_controler|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~25_sumout\ = SUM(( \VGA_controler|r_v_count\(6) ) + ( GND ) + ( \VGA_controler|Add1~22\ ))
-- \VGA_controler|Add1~26\ = CARRY(( \VGA_controler|r_v_count\(6) ) + ( GND ) + ( \VGA_controler|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(6),
	cin => \VGA_controler|Add1~22\,
	sumout => \VGA_controler|Add1~25_sumout\,
	cout => \VGA_controler|Add1~26\);

-- Location: FF_X13_Y80_N50
\VGA_controler|r_v_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~25_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(6));

-- Location: LABCELL_X13_Y80_N51
\VGA_controler|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~29_sumout\ = SUM(( \VGA_controler|r_v_count\(7) ) + ( GND ) + ( \VGA_controler|Add1~26\ ))
-- \VGA_controler|Add1~30\ = CARRY(( \VGA_controler|r_v_count\(7) ) + ( GND ) + ( \VGA_controler|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(7),
	cin => \VGA_controler|Add1~26\,
	sumout => \VGA_controler|Add1~29_sumout\,
	cout => \VGA_controler|Add1~30\);

-- Location: FF_X13_Y80_N52
\VGA_controler|r_v_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~29_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(7));

-- Location: LABCELL_X13_Y80_N54
\VGA_controler|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~37_sumout\ = SUM(( \VGA_controler|r_v_count\(8) ) + ( GND ) + ( \VGA_controler|Add1~30\ ))
-- \VGA_controler|Add1~38\ = CARRY(( \VGA_controler|r_v_count\(8) ) + ( GND ) + ( \VGA_controler|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(8),
	cin => \VGA_controler|Add1~30\,
	sumout => \VGA_controler|Add1~37_sumout\,
	cout => \VGA_controler|Add1~38\);

-- Location: FF_X13_Y80_N56
\VGA_controler|r_v_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~37_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(8));

-- Location: LABCELL_X13_Y80_N21
\VGA_controler|LessThan3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|LessThan3~0_combout\ = ( !\VGA_controler|r_v_count\(5) & ( !\VGA_controler|r_v_count\(6) & ( (!\VGA_controler|r_v_count\(8) & !\VGA_controler|r_v_count\(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_v_count\(8),
	datac => \VGA_controler|ALT_INV_r_v_count\(7),
	datae => \VGA_controler|ALT_INV_r_v_count\(5),
	dataf => \VGA_controler|ALT_INV_r_v_count\(6),
	combout => \VGA_controler|LessThan3~0_combout\);

-- Location: LABCELL_X13_Y80_N57
\VGA_controler|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|Add1~33_sumout\ = SUM(( \VGA_controler|r_v_count\(9) ) + ( GND ) + ( \VGA_controler|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \VGA_controler|ALT_INV_r_v_count\(9),
	cin => \VGA_controler|Add1~38\,
	sumout => \VGA_controler|Add1~33_sumout\);

-- Location: FF_X13_Y80_N58
\VGA_controler|r_v_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~33_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(9));

-- Location: LABCELL_X13_Y80_N27
\VGA_controler|LessThan3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|LessThan3~1_combout\ = ( \VGA_controler|r_v_count\(9) & ( (!\VGA_controler|LessThan3~0_combout\) # (((\VGA_controler|r_v_count\(3) & \VGA_controler|r_v_count\(2))) # (\VGA_controler|r_v_count\(4))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010111011101111111011101110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_LessThan3~0_combout\,
	datab => \VGA_controler|ALT_INV_r_v_count\(4),
	datac => \VGA_controler|ALT_INV_r_v_count\(3),
	datad => \VGA_controler|ALT_INV_r_v_count\(2),
	dataf => \VGA_controler|ALT_INV_r_v_count\(9),
	combout => \VGA_controler|LessThan3~1_combout\);

-- Location: FF_X13_Y80_N32
\VGA_controler|r_v_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~1_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count\(0));

-- Location: FF_X13_Y80_N49
\VGA_controler|r_v_count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~25_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count[6]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y80_N0
\VGA_controler|o_VGA_HS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_HS~0_combout\ = ( \VGA_controler|o_VGA_HS~q\ & ( \VGA_controler|r_h_count\(6) ) ) # ( !\VGA_controler|o_VGA_HS~q\ & ( \VGA_controler|r_h_count\(6) & ( (\VGA_controler|Equal0~0_combout\ & (\VGA_controler|r_h_count\(5) & 
-- (!\VGA_controler|r_h_count\(8) & !\VGA_controler|r_h_count\(9)))) ) ) ) # ( \VGA_controler|o_VGA_HS~q\ & ( !\VGA_controler|r_h_count\(6) & ( (!\VGA_controler|Equal0~0_combout\) # (((\VGA_controler|r_h_count\(9)) # (\VGA_controler|r_h_count\(8))) # 
-- (\VGA_controler|r_h_count\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101111111111111100010000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_Equal0~0_combout\,
	datab => \VGA_controler|ALT_INV_r_h_count\(5),
	datac => \VGA_controler|ALT_INV_r_h_count\(8),
	datad => \VGA_controler|ALT_INV_r_h_count\(9),
	datae => \VGA_controler|ALT_INV_o_VGA_HS~q\,
	dataf => \VGA_controler|ALT_INV_r_h_count\(6),
	combout => \VGA_controler|o_VGA_HS~0_combout\);

-- Location: FF_X33_Y80_N1
\VGA_controler|o_VGA_HS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|o_VGA_HS~0_combout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|o_VGA_HS~q\);

-- Location: LABCELL_X13_Y80_N24
\VGA_controler|o_VGA_VS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_VS~0_combout\ = ( !\VGA_controler|r_v_count\(0) & ( (!\VGA_controler|r_v_count\(4) & (!\VGA_controler|r_v_count\(9) & \VGA_controler|r_v_count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \VGA_controler|ALT_INV_r_v_count\(4),
	datac => \VGA_controler|ALT_INV_r_v_count\(9),
	datad => \VGA_controler|ALT_INV_r_v_count\(3),
	dataf => \VGA_controler|ALT_INV_r_v_count\(0),
	combout => \VGA_controler|o_VGA_VS~0_combout\);

-- Location: LABCELL_X13_Y80_N0
\VGA_controler|o_VGA_VS~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_VS~1_combout\ = ( \VGA_controler|o_VGA_VS~q\ & ( \VGA_controler|r_v_count\(1) & ( ((!\VGA_controler|Equal1~0_combout\) # ((!\VGA_controler|LessThan3~0_combout\) # (!\VGA_controler|o_VGA_VS~0_combout\))) # 
-- (\VGA_controler|r_v_count\(2)) ) ) ) # ( \VGA_controler|o_VGA_VS~q\ & ( !\VGA_controler|r_v_count\(1) ) ) # ( !\VGA_controler|o_VGA_VS~q\ & ( !\VGA_controler|r_v_count\(1) & ( (\VGA_controler|r_v_count\(2) & (\VGA_controler|Equal1~0_combout\ & 
-- (\VGA_controler|LessThan3~0_combout\ & \VGA_controler|o_VGA_VS~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111100000000000000001111111111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_v_count\(2),
	datab => \VGA_controler|ALT_INV_Equal1~0_combout\,
	datac => \VGA_controler|ALT_INV_LessThan3~0_combout\,
	datad => \VGA_controler|ALT_INV_o_VGA_VS~0_combout\,
	datae => \VGA_controler|ALT_INV_o_VGA_VS~q\,
	dataf => \VGA_controler|ALT_INV_r_v_count\(1),
	combout => \VGA_controler|o_VGA_VS~1_combout\);

-- Location: FF_X13_Y80_N1
\VGA_controler|o_VGA_VS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|o_VGA_VS~1_combout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|o_VGA_VS~q\);

-- Location: LABCELL_X13_Y80_N6
\VGA_controler|o_VGA_BLANK~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_BLANK~0_combout\ = ( \VGA_controler|r_v_count\(5) & ( ((\VGA_controler|r_v_count\(2) & \VGA_controler|r_v_count\(3))) # (\VGA_controler|r_v_count\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011111100000000000000000011001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \VGA_controler|ALT_INV_r_v_count\(4),
	datac => \VGA_controler|ALT_INV_r_v_count\(2),
	datad => \VGA_controler|ALT_INV_r_v_count\(3),
	datae => \VGA_controler|ALT_INV_r_v_count\(5),
	combout => \VGA_controler|o_VGA_BLANK~0_combout\);

-- Location: FF_X13_Y80_N59
\VGA_controler|r_v_count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll|pll25_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \VGA_controler|Add1~33_sumout\,
	clrn => \pll|pll25_inst|altera_pll_i|locked_wire\(0),
	sclr => \VGA_controler|LessThan3~1_combout\,
	ena => \VGA_controler|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_controler|r_v_count[9]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y80_N6
\VGA_controler|o_VGA_BLANK~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_BLANK~1_combout\ = ( \VGA_controler|r_h_count\(5) & ( \VGA_controler|r_h_count\(6) & ( (!\VGA_controler|r_h_count\(8) & (!\VGA_controler|r_h_count\(7) & !\VGA_controler|r_h_count[9]~DUPLICATE_q\)) ) ) ) # ( 
-- !\VGA_controler|r_h_count\(5) & ( \VGA_controler|r_h_count\(6) & ( (!\VGA_controler|r_h_count\(8) & (!\VGA_controler|r_h_count\(7) & !\VGA_controler|r_h_count[9]~DUPLICATE_q\)) ) ) ) # ( \VGA_controler|r_h_count\(5) & ( !\VGA_controler|r_h_count\(6) & ( 
-- (!\VGA_controler|r_h_count\(8) & (!\VGA_controler|r_h_count\(7) & !\VGA_controler|r_h_count[9]~DUPLICATE_q\)) ) ) ) # ( !\VGA_controler|r_h_count\(5) & ( !\VGA_controler|r_h_count\(6) & ( (!\VGA_controler|r_h_count\(8) & 
-- !\VGA_controler|r_h_count[9]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_h_count\(8),
	datab => \VGA_controler|ALT_INV_r_h_count\(7),
	datac => \VGA_controler|ALT_INV_r_h_count[9]~DUPLICATE_q\,
	datae => \VGA_controler|ALT_INV_r_h_count\(5),
	dataf => \VGA_controler|ALT_INV_r_h_count\(6),
	combout => \VGA_controler|o_VGA_BLANK~1_combout\);

-- Location: LABCELL_X13_Y80_N12
\VGA_controler|o_VGA_BLANK~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_controler|o_VGA_BLANK~2_combout\ = ( \VGA_controler|r_v_count\(7) & ( \VGA_controler|o_VGA_BLANK~1_combout\ ) ) # ( !\VGA_controler|r_v_count\(7) & ( \VGA_controler|o_VGA_BLANK~1_combout\ ) ) # ( !\VGA_controler|r_v_count\(7) & ( 
-- !\VGA_controler|o_VGA_BLANK~1_combout\ & ( (!\VGA_controler|r_v_count\(8) & (!\VGA_controler|o_VGA_BLANK~0_combout\ & (!\VGA_controler|r_v_count\(6) & !\VGA_controler|r_v_count[9]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \VGA_controler|ALT_INV_r_v_count\(8),
	datab => \VGA_controler|ALT_INV_o_VGA_BLANK~0_combout\,
	datac => \VGA_controler|ALT_INV_r_v_count\(6),
	datad => \VGA_controler|ALT_INV_r_v_count[9]~DUPLICATE_q\,
	datae => \VGA_controler|ALT_INV_r_v_count\(7),
	dataf => \VGA_controler|ALT_INV_o_VGA_BLANK~1_combout\,
	combout => \VGA_controler|o_VGA_BLANK~2_combout\);

-- Location: LABCELL_X16_Y46_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


