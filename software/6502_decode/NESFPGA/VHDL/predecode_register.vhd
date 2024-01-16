library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_register is
	Port (
		i_clk : in STD_LOGIC;											-- Clock signal
		i_databus : in STD_LOGIC_VECTOR(7 downto 0);				-- Input data bus
		o_instruction : out STD_LOGIC_VECTOR(7 downto 0)		-- Output instruction
	);
end predecode_register;

architecture Behavioral of predecode_register is
	signal s_predecode_buffer : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
	-- Main process
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			-- Load the buffer with data from the data bus
			s_predecode_buffer <= i_databus;
		end if;
	end process;

	-- Output the buffer
	o_instruction <= s_predecode_buffer;

end Behavioral;
