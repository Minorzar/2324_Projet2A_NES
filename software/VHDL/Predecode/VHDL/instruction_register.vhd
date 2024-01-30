-- instruction_register.vhd
--
-- This VHDL module implements an instruction register.
--
-- Description:
-- The instruction register latches the input instruction on the rising edge of the clock signal
-- and provides the latched instruction as output on subsequent clock edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register is
	port (
		i_clk				: in std_logic;						-- Input clock signal
		i_pl_instruction	: in std_logic_vector(7 downto 0);	-- Input instruction from predecode_logic
		o_ir_instruction	: out std_logic_vector(7 downto 0)	-- Output instruction to decode_rom
	);
end entity instruction_register;

architecture Behavioral of instruction_register is
begin
	process (i_clk, i_pl_instruction)
	begin
		if rising_edge(i_clk) then
			-- Load the instruction from the predecoded logic
			o_ir_instruction <= i_pl_instruction;
		end if;
	end process;
end architecture Behavioral;
