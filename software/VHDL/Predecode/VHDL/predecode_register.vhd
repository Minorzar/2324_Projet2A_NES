-- predecode_register.vhd
--
-- This VHDL module implements a predecode register.
--
-- Description:
--	The predecode register captures the input data bus value on the rising edge of the clock signal.
--	The captured instruction is stored and provided as the output on subsequent clock edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_register is
	Port (
		i_clk : in std_logic;									-- Input clock signal
		i_reset : in std_logic;									-- Input reset signal
		i_db_instruction : in std_logic_vector(7 downto 0);		-- Input instruction from data bus
		o_pr_instruction : out std_logic_vector(7 downto 0)		-- Output instruction to predecode_logic
	);
end predecode_register;

architecture Behavioral of predecode_register is
	signal s_captured_instruction : std_logic_vector(7 downto 0) := (others => '0');

begin
	-- Main process
	process(i_clk, i_reset)
	begin
		if i_reset = '1' then
			-- Reset the captured instruction to all zeros
			s_captured_instruction <= (others => '0');
		elsif rising_edge(i_clk) then
			-- Capture the input instruction from the data bus
			s_captured_instruction <= i_db_instruction;
		end if;
	end process;

	-- Output the captured instruction
	o_pr_instruction <= s_captured_instruction;

end Behavioral;
