-- timing_generator_logic.vhd
--
-- This VHDL module implements "Timing Generator Logic".
--
-- Description:
-- This module generates timing signals indicating the current cycle of the CPU operation and handles resets based on control signals.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timing_generator_logic is
	port (
		i_clk_1			: in std_logic;							-- Input clock signal
		i_clk_2			: in std_logic;							-- Input clock signal
		i_rc_rdy		: in std_logic;							-- Input ready signal from ready_control
		i_pl_tzpre		: in std_logic;							-- Input signal from predecode_logic set high when the opcode is a two-cycle opcode 
		i_rcl_t_zero	: in std_logic;							-- Input signal from random_control_logic to reset timing registers
		i_rcl_t_res_1	: in std_logic;							-- Input signal from random_control_logic to reset timing register 1
		o_tgl_timing_n	: out std_logic_vector(5 downto 0);		-- Output main timing signals 0-5 (active low)
		o_tgl_fetch		: out std_logic;						-- Output signal indicating instruction fetch
		o_tgl_sync		: out std_logic							-- Output signal indicating instruction synchronization
	);
end timing_generator_logic;

architecture Behavioral of timing_generator_logic is
	signal s_timing_n	: std_logic_vector(5 downto 0);			-- Internal main timing signal
	signal s_sync		: std_logic;							-- Internal synchronization signal
	signal s_timing_c2	: std_logic_vector(5 downto 0);			-- Latched timing signals on clk_2 with opposite sign
	signal s_t_reset_c1	: std_logic_vector(5 downto 0);			-- Individual timing signal resets on clk_1
	signal s_sync_c2	: std_logic;							-- Synchronization signal on clk_2
	signal s_t_reset	: std_logic_vector(5 downto 0);			-- Internal signal for individual timing signal resets
	signal s_t0_c2_rdy	: std_logic;							-- Signal to indicate if T0 is ready on clk_2
	signal s_t0			: std_logic;							-- T0 signal (opcode prefetch)

begin
	-- Main timing signals assignment
	s_timing_n(0) <= not s_t0;									-- T0 signal (opcode prefetch)
	s_timing_n(1) <= not s_t_reset_c1(1);						-- T1 signal (operand prefetch)
	s_timing_n(2) <= i_rcl_t_zero or s_t_reset_c1(2);			-- T2 signal (opcode loaded in instruction register and executed)
	s_timing_n(3) <= i_rcl_t_zero or s_t_reset_c1(3);			-- T3 signal
	s_timing_n(4) <= i_rcl_t_zero or s_t_reset_c1(4);			-- T4 signal
	s_timing_n(5) <= i_rcl_t_zero or s_t_reset_c1(5);			-- T5 signal
	o_tgl_timing_n <= s_timing_n;								-- Output main timing signals

	-- Generate fetch signal
	o_tgl_fetch <= i_rc_rdy and s_sync_c2;						-- Output fetch signal

	-- Reset conditions
	s_t_reset(0) <= not (s_sync or (not i_rcl_t_zero and i_pl_tzpre));							-- Reset T0 signal
	s_t_reset(1) <= s_timing_c2(0) and i_rc_rdy;												-- Reset T1 signal
	s_t_reset(2) <= not ((s_timing_c2(2) and not i_rc_rdy) or (s_sync_c2 and i_rc_rdy));		-- Reset T2 signal
	s_t_reset(3) <= not ((s_timing_c2(3) and not i_rc_rdy) or (s_timing_c2(2) and i_rc_rdy));	-- Reset T3 signal
	s_t_reset(4) <= not ((s_timing_c2(4) and not i_rc_rdy) or (s_timing_c2(3) and i_rc_rdy));	-- Reset T4 signal
	s_t_reset(5) <= not ((s_timing_c2(5) and not i_rc_rdy) or (s_timing_c2(4) and i_rc_rdy));	-- Reset T5 signal

	-- Generate T0 signal
	s_t0_c2_rdy <= s_timing_c2(0) and i_rc_rdy;						-- T0 ready condition on clk_2
	s_t0 <= s_t_reset(0) or (s_timing_c2(0) and not s_t0_c2_rdy);	-- Generate T0 signal

	-- Latch timing signals on clk_1
	process (i_clk_1)
	begin
		if rising_edge(i_clk_1) then
			s_sync <= i_rcl_t_res_1;		-- Update synchronization signal with the value from random_control_logic
			s_t_reset_c1 <= s_t_reset;		-- Update individual timing signal resets on clk_1
			o_tgl_sync <= s_sync;			-- Output synchronization signal
		end if;
	end process;

	-- Latch timing signals on clk_2
	process (i_clk_2)
	begin
		if rising_edge(i_clk_2) then
			s_timing_c2 <= not s_timing_n;	-- Latch timing signals on clk_2 with opposite sign
			s_sync_c2 <= s_sync;			-- Synchronization signal for clk_2
		end if;
	end process;

end architecture Behavioral;
