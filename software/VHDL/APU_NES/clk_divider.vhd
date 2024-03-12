library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity clk_divider is
	
	port( 
	
	i_clk   :	in STD_LOGIC;	
	i_reset :	in STD_LOGIC;
	i_counter : in STD_LOGIC_VECTOR[7 downto 0];
			
	o_clk_out :	out STD_LOGIC);
			
end clk_divider;

architecture clk_divider_IO of clk_divider is
signal counter : unsigned[10 downto 0] = '0';
begin

