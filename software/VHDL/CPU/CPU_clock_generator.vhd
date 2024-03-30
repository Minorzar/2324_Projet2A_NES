library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_clock_generator is
	Port(
		i_clk: in STD_LOGIC;
		o_phi1: out STD_LOGIC :='1';
		o_phi2: out STD_LOGIC :='0');
end CPU_clock_generator;

architecture Behavioral of CPU_clock_generator is
signal phi1:STD_LOGIC :='1';
begin
	process(i_clk)
	begin
		if(rising_edge(i_clk)) then
			phi1 <= not phi1;
		end if;
	end process;
	o_phi1 <= phi1;
	o_phi2 <= not phi1;
end Behavioral;