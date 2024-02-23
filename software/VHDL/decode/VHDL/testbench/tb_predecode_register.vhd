-- tb_predecode_register.vhd
--
-- This VHDL testbench simulates the behavior of the predecode_register module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_predecode_register is
end tb_predecode_register;

architecture Behavioral of tb_predecode_register is
	-- Constants
	constant CLK_PERIOD			: time := 100 ps;					-- Clock period

	-- Signals
	signal t_clk_2				: std_logic := '0';					-- Input lock signal
	signal t_db_instruction		: std_logic_vector(7 downto 0);		-- Input instruction from data bus
	signal t_pr_instruction		: std_logic_vector(7 downto 0);		-- Output instruction from predecode_register

	-- Component declaration
	component predecode_register
		port (
			i_clk_2				: in std_logic;
			i_db_instruction	: in std_logic_vector(7 downto 0);
			o_pr_instruction	: out std_logic_vector(7 downto 0)
		);
	end component;

begin
	-- Instantiate the predecode_register module
	UUT: predecode_register
	port map (
		i_clk_2				=> t_clk_2,
		i_db_instruction	=> t_db_instruction,
		o_pr_instruction	=> t_pr_instruction
	);

	-- Clock generator process
	process
	begin
		-- Simulate for 100 ns
		while now < 100 ns loop
			t_clk_2 <= not t_clk_2; -- Toggle the clock
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process for testing various instructions
	process
	begin
		-- Test ASL acc instruction (Opcode: x"0A")
		t_db_instruction <= x"0A";
		wait for CLK_PERIOD;
		assert t_pr_instruction = x"0A" report "ASL acc instruction failed" severity error;

		-- Test ORA # instruction (Opcode: x"09")
		t_db_instruction <= x"09";
		wait for CLK_PERIOD;
		assert t_pr_instruction = x"09" report "ORA # instruction failed" severity error;

		-- Test LDX # instruction (Opcode: x"A2")
		t_db_instruction <= x"A2";
		wait for CLK_PERIOD;
		assert t_pr_instruction = x"A2" report "LDX # instruction failed" severity error;

		-- Test PHP instruction (Opcode: x"08")
		t_db_instruction <= x"08";
		wait for CLK_PERIOD;
		assert t_pr_instruction = x"08" report "PHP instruction failed" severity error;

		-- Test TXA instruction (Opcode: x"8A")
		t_db_instruction <= x"8A";
		wait for CLK_PERIOD;
		assert t_pr_instruction = x"8A" report "TXA instruction failed" severity error;

		wait;
	end process;

end Behavioral;
