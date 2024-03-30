-- predecode_register.vhd
--
-- This VHDL module implements "Predecode Register".
--
-- Description:
-- The predecode register latches the input instruction from the data bus on the rising edge of the clock signal
-- and provides the latched instruction as output on subsequent clock edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_register is
	port (
		i_clk_2				: in std_logic;							-- Input clock signal (rising edge)
		i_db_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from the data bus
		o_pr_instruction	: out std_logic_vector(7 downto 0)		-- Output instruction
	);
end entity predecode_register;

architecture Behavioral of predecode_register is

begin
	process (i_clk_2, i_db_instruction)
	begin
		if rising_edge(i_clk_2) then
			-- Load the instruction from the data bus
			o_pr_instruction <= i_db_instruction;
		end if;
	end process;

end architecture Behavioral;
