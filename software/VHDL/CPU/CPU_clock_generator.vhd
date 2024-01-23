library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_clock_generator is
	Port(
		i_clk: in STD_LOGIC;
		b_phi1: buffer STD_LOGIC :='0';
		b_phi2: buffer STD_LOGIC :='1');
end CPU_clock_generator;

architecture Behavioral of CPU_clock_generator is
begin
	process(i_clk)
	begin
		if(rising_edge(i_clk)) then
			b_phi1 <= not b_phi1;
			b_phi2 <= not b_phi2;
		end if;
	end process;
end Behavioral;