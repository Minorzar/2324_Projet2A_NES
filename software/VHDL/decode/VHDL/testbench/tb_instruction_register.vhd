-- tb_instruction_register.vhd
--
-- This VHDL testbench simulates the behavior of the instruction_register module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_instruction_register is
end tb_instruction_register;

architecture Behavioral of tb_instruction_register is
	-- Constants
	constant CLK_PERIOD			: time := 200 ps;

	-- Signals
	signal t_clk_1				: std_logic := '0';
	signal t_tgl_fetch			: std_logic;
	signal t_pl_instruction		: std_logic_vector(7 downto 0);
	signal t_ir_instruction		: std_logic_vector(7 downto 0);

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
	-- Instantiate the instruction_register module
	UUT: entity work.instruction_register
	port map (
		i_clk_1				=> t_clk_1,
		i_tgl_fetch			=> t_tgl_fetch,
		i_pl_instruction	=> t_pl_instruction,
		o_ir_instruction	=> t_ir_instruction
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

			-- Check if fetched instruction matches the previous one
			assert t_ir_instruction = Instructions(i-1) report "Fetch disabled, unexpected instruction fetched at index " & integer'image(i) severity error;
			t_tgl_fetch <= '1';		-- Enable fetch

			wait for CLK_PERIOD;
			assert t_ir_instruction = Instructions(i) report "Fetch enabled, instruction fetch failed at index " & integer'image(i) severity error;
			t_tgl_fetch <= '0';		-- Disable fetch
		end loop;

		-- Wait indefinitely
		wait;
	end process;

end Behavioral;
