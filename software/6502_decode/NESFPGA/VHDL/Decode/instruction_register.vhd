-- instruction_register.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_register is
	Port (
		i_clock : in STD_LOGIC;		  -- Input clock
		i_reset : in STD_LOGIC;		  -- Input reset
		i_active_instruction : in STD_LOGIC_VECTOR(5 downto 0);  -- Input from predecode
		o_processed_instruction : out STD_LOGIC_VECTOR(5 downto 0)  -- Output to subsequent stages
	);
end instruction_register;

architecture Behavioral of instruction_register is
	signal s_register : STD_LOGIC_VECTOR(5 downto 0);

begin
	process (i_clock, i_reset)
	begin
		if i_reset = '1' then
			-- Reset condition
			s_register <= (others => '0');
		elsif rising_edge(i_clock) then
			-- Clock rising edge: update the register
			s_register <= i_active_instruction;
		end if;
	end process;

	-- Output the processed instruction
	o_processed_instruction <= s_register;

end Behavioral;
