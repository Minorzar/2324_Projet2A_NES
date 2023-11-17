library IEEE ;
use ieee.std_logic_1164.all ;

entity VGA_comm is
	Port(
		clk108 : in std_logic ;
		reset : in std_logic ;
		inDisp : in std_logic ;
		x : in std_logic_vector(9 downto 0) ;
		y : in std_logic_vector(9 downto 0) ;
		R : out std_logic_vector(7 downto 0) ;
		G : out std_logic_vector(7 downto 0) ;
		B : out std_logic_vector(7 downto 0)
	);

end VGA_comm ;

architecture Behavioral of VGA_comm is
	signal sR : std_logic_vector(7 downto 0) ;
	signal sG : std_logic_vector(7 downto 0) ;
	signal sB : std_logic_vector(7 downto 0) ;

begin

	process(clk108)
	begin
		if(reset = '1') then
			sR <= "00000000" ;
			sG <= "00000000" ;
			sB <= "00000000" ;
		else
			if(rising_edge(clk108)) then
				sR <= "11111111" xor y(7 downto 0) ;
				sG <= x(7 downto 0) ;
				sB <= y(7 downto 0) ;
			end if ;
		end if ;
	end process ;
	
	R <= sR when(inDisp = '1') else "00000000" ;
	B <= sB when(inDisp = '1') else "00000000" ;
	G <= sG when(inDisp = '1') else "00000000" ;

end Behavioral ;