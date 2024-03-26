library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_regulator is 
 port(
	m_clk: in std_logic;
	i_data: in  unsigned(15 downto 0);
	o_data: out unsigned(15 downto 0)
 
 );
end clock_regulator; 

architecture clock_regulator_rtf of clock_regulator is

	signal reg1 : unsigned(15 downto 0) := (others=> '0');
	signal reg2 : unsigned(15 downto 0) := (others=> '0');
	signal reg3 : unsigned(15 downto 0) := (others=> '0');
	
begin 
	process(m_clk)
	begin
		if (rising_edge(m_clk)) then 
		
			reg3<=reg2;
			reg2<=reg1;
			reg1<=i_data;
			
		end if;
	end process;
 o_data<=reg3;

end clock_regulator_rtf;