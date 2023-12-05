-- tb_predecode.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_predecode is
end tb_predecode;

architecture Behavioral of tb_predecode is
	signal s_i_instruction : STD_LOGIC_VECTOR(7 downto 0);
	signal s_i_status_register : STD_LOGIC_VECTOR(7 downto 0);
	signal s_o_active_instruction : STD_LOGIC_VECTOR(5 downto 0);
	signal s_o_addressing_mode : STD_LOGIC_VECTOR(2 downto 0);
	signal s_o_register_select : STD_LOGIC_VECTOR(1 downto 0);

begin
	-- Instantiate the predecode module
	uut_predecode : entity work.predecode
		port map (
			i_instruction => s_i_instruction,
			i_status_register => s_i_status_register,
			o_active_instruction => s_o_active_instruction,
			o_addressing_mode => s_o_addressing_mode,
			o_register_select => s_o_register_select
		);

	-- Process for test cases
	test_process: process
	begin
		-- Test Case 1: ORA instruction, zero page, X addressing mode
		s_i_instruction <= "00000000";  -- ORA
		s_i_status_register <= "00000000";  -- Clear flags
		wait for 10 ns;
		assert s_o_active_instruction = "000000" report "Test Case 1 failed: ORA instruction" severity error;
		assert s_o_addressing_mode = "111" report "Test Case 1 failed: Zero page, X addressing mode" severity error;
		assert s_o_register_select = "01" report "Test Case 1 failed: Use X register" severity error;

		-- Test Case 2: LDX instruction, immediate addressing mode
		s_i_instruction <= "10100100";  -- INX
		s_i_status_register <= "00000000";  -- Clear flags
		wait for 10 ns;
		assert s_o_active_instruction = "101001" report "Test Case 2 failed: INX instruction" severity error;
		assert s_o_addressing_mode = "010" report "Test Case 2 failed: Immediate addressing mode" severity error;
		assert s_o_register_select = "00" report "Test Case 2 failed: Use accumulator" severity error;

		-- Add more test cases as needed

		wait;

	end process test_process;

end Behavioral;
