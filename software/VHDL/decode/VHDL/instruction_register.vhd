-- instruction_register.vhd
--
-- This VHDL module implements "Instruction Register".
--
-- Description:
-- The instruction register latches the input instruction on the rising edge of the clock signal
-- and provides the latched instruction as output on subsequent clock edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register is
	port (
		i_clk_1				: in std_logic;							-- Input clock signal
		i_tgl_fetch			: in std_logic;							-- Input fetch signal from timing_generation_logic
		i_pl_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from predecode_logic
		o_ir_instruction	: out std_logic_vector(7 downto 0)		-- Output instruction from instruction_register
	);
end entity instruction_register;

architecture Behavioral of instruction_register is

begin
	process (i_clk_1, i_tgl_fetch, i_pl_instruction)
	begin
		if rising_edge(i_clk_1) then
			-- Load signal based on fetch signal
			if i_tgl_fetch = '1' then
				-- Load the instruction from predecode_logic
				o_ir_instruction <= i_pl_instruction;
			end if;
		end if;
	end process;

end architecture Behavioral;
