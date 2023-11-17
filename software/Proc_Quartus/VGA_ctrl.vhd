library IEEE ;
use ieee.std_logic_1164.all ;

entity VGA_ctrl is
	Port(
		clk108   : in std_logic;
		reset   : in std_logic;
		HS : out std_logic ;
		VS : out std_logic ;
		R : out std_logic_vector(7 downto 0) ;
		G : out std_logic_vector(7 downto 0) ;
		B : out std_logic_vector(7 downto 0) ;
		BLANK_N : out std_logic ;
		SYNC_N : out std_logic);
		
end VGA_ctrl ;

architecture Behavioral of VGA_ctrl is
	signal h_s : std_logic ;
	signal v_s : std_logic ;
	signal inDisp : std_logic ;
	signal Rout : std_logic_vector(7 downto 0) ;
	signal Gout : std_logic_vector(7 downto 0) ;
	signal Bout : std_logic_vector(7 downto 0) ;
	signal sx : std_logic_vector(9 downto 0) ;
	signal sy : std_logic_vector(9 downto 0) ;
	
	begin
		
		sync : entity work.VGA_Sync
						Port map(clk108 => clk108, reset => reset, hs => h_s, vs => v_s, inDisp => inDisp, x => sx, y => sy) ;
			
		comm : entity work.vga_comm
						Port map(clk108 => clk108, reset => reset, inDisp => inDisp, x => sx, y => sy, R => Rout, G => Gout, B => Bout) ;
	
	VS <= v_s ;
	HS <= h_s ;
	R <= Rout ;
	B <= Bout ;
	G <= Gout ;
	BLANK_N <= inDisp ;
	SYNC_N <= h_s and v_s ;



end Behavioral ;