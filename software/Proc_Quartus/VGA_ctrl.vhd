library IEEE ;
use ieee.std_logic_1164.all ;

entity VGA_ctrl is
	Port(
		i_clk25   : in std_logic;
		i_reset   : in std_logic;
		o_HS : out std_logic ;
		o_VS : out std_logic ;
		o_R : out std_logic_vector(7 downto 0) ;
		o_G : out std_logic_vector(7 downto 0) ;
		o_B : out std_logic_vector(7 downto 0) ;
		o_BLANK_N : out std_logic ;
		o_SYNC_N : out std_logic;
		o_CLK : out std_logic ) ;
		
end VGA_ctrl ;

architecture Behavioral of VGA_ctrl is
	signal shs : std_logic ;
	signal svs : std_logic ;
	signal sinDisp : std_logic ;
	signal rR : std_logic_vector(7 downto 0) ;
	signal rG : std_logic_vector(7 downto 0) ;
	signal rB : std_logic_vector(7 downto 0) ;
	signal rx : std_logic_vector(9 downto 0) ;
	signal ry : std_logic_vector(9 downto 0) ;
	
	begin
		
		sync : entity work.VGA_Sync
						Port map(i_clk25 => i_clk25, i_reset => i_reset, o_hs => shs, o_vs => svs, o_inDisp => sinDisp, o_x => rx, o_y => ry) ;
			
		comm : entity work.vga_comm
						Port map(i_clk25 => i_clk25, i_reset => i_reset, i_inDisp => sinDisp, i_x => rx, i_y => ry, o_R => rR, o_G => rG, o_B => rB) ;
	
	o_VS <= svs ;
	o_HS <= shs ;
	o_R <= rR ;
	o_B <= rB ;
	o_G <= rG ;
	o_BLANK_N <= sinDisp ;
	o_SYNC_N <= shs and svs ;
	o_CLK <= i_clk25 ;



end Behavioral ;