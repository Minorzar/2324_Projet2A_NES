library IEEE ;
use ieee.std_logic_1164.all ;

entity VGA_ctrl is
	Port(
		clk25   : in std_logic;
		reset   : in std_logic;
		HS : out std_logic ;
		VS : out std_logic :
		R : out std_logic_vector(7 downto 0) ;
		G : out std_logic_vector(7 downto 0) ;
		B : out std_logic_vector(7 downto 0) ;
		BLANK_N : std_logic ;
		SYNC_N : std_logic);
		
end VGA_ctrl ;

architecture Behavioral of VGA_ctrl is
	signal h_s : std_logic ;
	signal v_s : std_logic ;
	signal inDisp : std_logic ;
	signal Rout : std_logic_vector(7 downto 0) ;
	signal Gout : std_logic_vector(7 downto 0) ;
	signal Bout : std_logic_vector(7 downto 0) ;
	signal sync : std_logic ;
	signal x : std_logic_vector(9 downto 0) ;
	signal y : std_logic_vector(9 downto 0) ;
	
	begin
		
		vga-sync : entity work.VGA_Sync
						Port map(clk25=>clk25, reset => reset, hs => h_s, vs => v_s, inDisp => inDisp, x => x, y => y) ;
						
		
		
		
	
	
	VS <= v_s ;
	HS <= h_s ;
	R <= Rout ;
	B <= Bout ;
	G <= Gout ;
	BLANK_N <= inDisp ;
	SYNC_N <= h_s and v_s ;



end Behavioral ;