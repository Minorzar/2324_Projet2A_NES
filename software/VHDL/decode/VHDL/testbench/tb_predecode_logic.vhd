-- tb_predecode_logic.vhd
--
-- This VHDL testbench simulates the behavior of the predecode_logic module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_predecode_logic is
end tb_predecode_logic;

architecture Behavioral of tb_predecode_logic is
	-- Constants
	constant CLK_PERIOD : time := 10 ns;								-- Clock period

	-- Signals
	signal t_clk_1				: std_logic := '0';						-- Input clock signal
	signal t_irc_aic			: std_logic;							-- Input assert interrupt control signal from interrupt_and_reset_control
	signal t_tgl_fetch			: std_logic;							-- Input fetch signal from timing_generator_logic
	signal t_pr_instruction		: std_logic_vector(7 downto 0);			-- Input instruction from predecode_register
	signal t_pl_instruction		: std_logic_vector(7 downto 0);			-- Output predecoded instruction
	signal t_pl_implied			: std_logic;							-- Output signal indicating an opcode with implied addressing mode
	signal t_pl_tzpre			: std_logic;							-- Output signal indicating a two-cycle opcode

	-- Component declaration
	component predecode_logic
		port (
			i_clk_1				: in std_logic;
			i_irc_aic			: in std_logic;
			i_tgl_fetch			: in std_logic;
			i_pr_instruction	: in std_logic_vector(7 downto 0);
			o_pl_instruction	: out std_logic_vector(7 downto 0);
			o_pl_implied		: out std_logic;
			o_pl_tzpre			: out std_logic
		);
	end component;

begin
	-- Instantiate the predecode_logic module
	UUT: predecode_logic
	port map (
		i_clk_1				=> t_clk_1,
		i_irc_aic			=> t_irc_aic,
		i_tgl_fetch			=> t_tgl_fetch,
		i_pr_instruction	=> t_pr_instruction,
		o_pl_instruction	=> t_pl_instruction,
		o_pl_implied		=> t_pl_implied,
		o_pl_tzpre			=> t_pl_tzpre
	);

	-- Clock generator process
	process
	begin
		-- Simulate for 100 ns
		while now < 100 ns loop
			t_clk_1 <= not t_clk_1; -- Toggle the clock
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process for testing various instructions
	process
	begin
		-- Test ASL acc instruction (Opcode: x"0A")
		t_pr_instruction <= x"0A";
		wait for CLK_PERIOD;
		assert t_pl_implied = '1' report "Implied signal failed for ASL A instruction" severity error;
		assert t_pl_tzpre = '0' report "Two-cycle signal failed for ASL A instruction" severity error;
		assert t_pl_instruction = x"0A" report "PL instruction failed for ASL A instruction" severity error;

		-- Test ORA # instruction (Opcode: x"09")
		t_pr_instruction <= x"09";
		wait for CLK_PERIOD;
		assert t_pl_implied = '1' report "Implied signal failed for ORA # instruction" severity error;
		assert t_pl_tzpre = '0' report "Two-cycle signal failed for ORA # instruction" severity error;
		assert t_pl_instruction = x"09" report "PL instruction failed for ORA # instruction" severity error;

		-- Test LDX # instruction (Opcode: x"A2")
		t_pr_instruction <= x"A2";
		wait for CLK_PERIOD;
		assert t_pl_implied = '1' report "Implied signal failed for LDX # instruction" severity error;
		assert t_pl_tzpre = '0' report "Two-cycle signal failed for LDX # instruction" severity error;
		assert t_pl_instruction = x"A2" report "PL instruction failed for LDX # instruction" severity error;

		-- Test PHP instruction (Opcode: x"08")
		t_pr_instruction <= x"08";
		wait for CLK_PERIOD;
		assert t_pl_implied = '1' report "Implied signal failed for PHP instruction" severity error;
		assert t_pl_tzpre = '0' report "Two-cycle signal failed for PHP instruction" severity error;
		assert t_pl_instruction = x"08" report "PL instruction failed for PHP instruction" severity error;

		-- Test TXA instruction (Opcode: x"8A")
		t_pr_instruction <= x"8A";
		wait for CLK_PERIOD;
		assert t_pl_implied = '0' report "Implied signal failed for TXA instruction" severity error;
		assert t_pl_tzpre = '0' report "Two-cycle signal failed for TXA instruction" severity error;
		assert t_pl_instruction = x"8A" report "PL instruction failed for TXA instruction" severity error;

		wait;
	end process;

end Behavioral;