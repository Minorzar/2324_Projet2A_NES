library IEEE ;
use ieee.std_logic_1164.all ;

entity VGA_comm is
	Port(
		i_clk25 	: in std_logic ;
		i_reset	: in std_logic ;
		i_x 		: in std_logic_vector(9 downto 0) ;
		i_y 		: in std_logic_vector(9 downto 0) ;
		o_R 		: out std_logic_vector(7 downto 0) ;
		o_G 		: out std_logic_vector(7 downto 0) ;
		o_B 		: out std_logic_vector(7 downto 0)
	);

end VGA_comm ;

architecture Behavioral of VGA_comm is
	signal rR : std_logic_vector(7 downto 0) ;
	signal rG : std_logic_vector(7 downto 0) ;
	signal rB : std_logic_vector(7 downto 0) ;

begin

	process(i_clk25)
	begin
		if(i_reset = '1') then
			rR <= "00000000" ;
			rG <= "00000000" ;
			rB <= "00000000" ;
		else
			if(rising_edge(i_clk25)) then
				rR <= "11111111" xor i_y(7 downto 0) ;
				rG <= i_x(7 downto 0) ;
				rB <= i_y(7 downto 0) ;
			end if ;
		end if ;
	end process ;
	
	o_R <= rR ;
	o_B <= rB ;
	o_G <= rG ;

end Behavioral ;