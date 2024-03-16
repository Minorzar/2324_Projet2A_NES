-- tb_predecode_register.vhd
--
-- This VHDL testbench simulates the behavior of the predecode_register module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_predecode_register is
end tb_predecode_register;

architecture Behavioral of tb_predecode_register is
	-- Constants
	constant CLK_PERIOD			: time := 200 ps;

	-- Signals
	signal t_clk_2				: std_logic := '0';
	signal t_db_instruction		: std_logic_vector(7 downto 0);
	signal t_pr_instruction		: std_logic_vector(7 downto 0);

	-- Define arrays to hold test vectors
	type InstructionArray is array (natural range <>) of std_logic_vector(7 downto 0);

	-- Define input instructions
	constant Instructions : InstructionArray := (
		0 => "UUUUUUUU",	-- No operation
		1 => x"0A",			-- ASL acc
		2 => x"09",			-- ORA #
		3 => x"A2",			-- LDX #
		4 => x"08"			-- PHP
	);

begin
	-- Instantiate the predecode_register module
	UUT: entity work.predecode_register
	port map (
		i_clk_2				=> t_clk_2,
		i_db_instruction	=> t_db_instruction,
		o_pr_instruction	=> t_pr_instruction
	);

	-- Clock process
	process
	begin
		-- Simulate for 100 ns
		while now < 100 ns loop
			t_clk_1 <= '1';
			wait for CLK_PERIOD / 2;
			t_clk_1 <= '0';
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process
	process
	begin
        -- Iterate through each test vector, starting from index 1
		for i in 1 to Instructions'high loop
			-- Test instruction
			t_pl_instruction <= Instructions(i);
			wait for CLK_PERIOD;
			assert t_ir_instruction = Instructions(i) report "Instruction failed" severity error;
		end loop;

        -- Wait indefinitely
		wait;
	end process;

end Behavioral;
