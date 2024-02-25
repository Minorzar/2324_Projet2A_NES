-- timing_generator_logic.vhd
--
-- This VHDL module implements "Timing Generator Logic".
--
-- Description:
-- The timing generator generates six timing signals, timing_n[0] through timing_n[5], which represent T0 through T5 cycles of the operation. These signals map to specific cycles of the processor's operation, such as opcode prefetch, operand prefetch, opcode execution, and additional execution cycles for multi-cycle instructions.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timing_generator_logic is
	port (
		i_clk_1			: in std_logic;							-- Input clock signal for latch signals
		i_clk_2			: in std_logic;							-- Input clock signal for internal latches
		i_rc_rdy		: in std_logic;							-- Input ready signal from ready_control
		i_pl_tzpre		: in std_logic;							-- Input signal set high when the opcode is a two-cycle opcode from predecode_logic
		i_rcl_t_zero	: in std_logic;							-- Input signal to reset timing registers from random_control_logic
		i_rcl_t_res_1	: in std_logic;							-- Input signal to reset timing register 1 from random_control_logic
		o_tgl_timing	: out std_logic_vector(5 downto 0);		-- Output main timing signals 0-5 (active low)
		o_tgl_fetch		: out std_logic;						-- Output signal indicating a fetch instruction is needed
		o_tgl_sync		: out std_logic							-- Output signal indicating an instruction fetch is in progress
	);
end timing_generator_logic;

architecture Behavioral of timing_generator_logic is
	-- Internal signals
	signal s_timing_c2	: std_logic_vector(5 downto 0);			-- Latched value of timing signals on clk_2 with opposite sign
	signal s_t_reset_c1	: std_logic_vector(5 downto 0);			-- Reset individual timing signals on clk_1
	signal s_sync_c2	: std_logic;							-- Internal sync signal
	signal s_t0_c2_rdy	: std_logic;							-- Signal to indicate if T0 is ready

begin
	-- Main timing signals assignment
	o_timing_n(0) <= not s_t0;									-- Assign T0 signal (opcode prefetch)
	o_timing_n(1) <= not s_t_reset_c1(1);						-- Assign T1 signal (operand prefetch)
	o_timing_n(2) <= i_t_zero or s_t_reset_c1(2);				-- Assign T2 signal (opcode loaded in instruction register and executed)
	o_timing_n(3) <= i_t_zero or s_t_reset_c1(3);				-- Assign T3 signal
	o_timing_n(4) <= i_t_zero or s_t_reset_c1(4);				-- Assign T4 signal
	o_timing_n(5) <= i_t_zero or s_t_reset_c1(5);				-- Assign T5 signal

	o_fetch <= i_rc_rdy and s_sync_c2;							-- Calculate FETCH signal

	-- t_reset signals assignment
	s_t_reset_c1(0) <= not (s_sync_c2 or (not i_t_zero and i_pl_tzpre));							-- Assign T0 reset signal
	s_t_reset_c1(1) <= s_timing_c2(0) and i_rc_rdy;													-- Assign T1 reset signal
	s_t_reset_c1(2) <= not ((s_timing_c2(2) and not i_rc_rdy) or (s_sync_c2 and i_rc_rdy));			-- Assign T2 reset signal
	s_t_reset_c1(3) <= not ((s_timing_c2(3) and not i_rc_rdy) or (s_timing_c2(2) and i_rc_rdy));	-- Assign T3 reset signal
	s_t_reset_c1(4) <= not ((s_timing_c2(4) and not i_rc_rdy) or (s_timing_c2(3) and i_rc_rdy));	-- Assign T4 reset signal
	s_t_reset_c1(5) <= not ((s_timing_c2(5) and not i_rc_rdy) or (s_timing_c2(4) and i_rc_rdy));	-- Assign T5 reset signal

	-- t0 signal assignment
	s_t0_c2_rdy <= s_timing_c2(0) and i_rc_rdy;							-- Calculate t0_c2_rdy signal
	s_t0 <= s_t_reset_c1(0) or (s_timing_c2(0) and not s_t0_c2_rdy);	-- Assign T0 signal

	-- Latch signals process on clk1
	process (i_clk_1)
	begin
		if rising_edge(i_clk_1) then
			o_sync <= i_t_res_1;							-- Latch the pre-latched version of sync
			s_t_reset_c1 <= s_t_reset_c1;					-- Latch the reset signals
		end if;
	end process;

	-- Latch timing signals on clk2
	process (i_clk_2, o_timing_n)
	begin
		if rising_edge(i_clk_2) then
			s_timing_c2 <= not o_timing_n;					-- Latch the timing signals with opposite sign
			s_sync_c2 <= o_sync;							-- Latch the sync signal
		end if;
	end process;

end Behavioral;
