-- instruction_register.vhd
--
-- This VHDL module implements an instruction register.
--
-- Description:
--	The instruction register captures the input predecoded instruction on the rising edge of the clock signal.
--	The captured instruction is stored and provided as the output on subsequent clock edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register is
	Port (
		i_clk : in STD_LOGIC;									-- Input clock signal
		i_reset : in STD_LOGIC;									-- Input reset signal
		i_pl_instruction : in STD_LOGIC_VECTOR(7 downto 0);		-- Input instruction from predecode_logic
		o_ir_instruction : out STD_LOGIC_VECTOR(7 downto 0)		-- Output instruction to decode_rom and timing_generation_logic
	);
end instruction_register;

architecture Behavioral of instruction_register is
	signal s_stored_instruction : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
	-- Main process
	process(i_clk, i_reset)
	begin
		if i_reset = '1' then
			-- Reset the stored instruction to all zeros
			s_stored_instruction <= (others => '0');
		elsif rising_edge(i_clk) then
			-- Capture the input predecoded instruction
			s_stored_instruction <= i_pl_instruction;
		end if;
	end process;

	-- Output the stored instruction
	o_pl_instruction <= s_stored_instruction;

end Behavioral;
