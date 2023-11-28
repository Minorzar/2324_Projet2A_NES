library ieee ;
use ieee.std_logic_1164.all ;

library pll25 ;
use pll25.all ;


entity VGA_final is
	Port(
		i_clk50   : in std_logic;
		i_reset   : in std_logic;
		o_HS : out std_logic ;
		o_VS : out std_logic ;
		o_R : out std_logic_vector(7 downto 0) ;
		o_G : out std_logic_vector(7 downto 0) ;
		o_B : out std_logic_vector(7 downto 0) ;
		o_BLANK_N : out std_logic ;
		o_SYNC_N : out std_logic;
		o_CLK : out std_logic ) ;
		
end VGA_final ;

architecture Behavioral of VGA_final is
	signal sclk_25 : std_logic ;
	signal spll_locked : std_logic;
	signal shs : std_logic ;
	signal svs : std_logic ;
	signal rR : std_logic_vector(7 downto 0) ;
	signal rG : std_logic_vector(7 downto 0) ;
	signal rB : std_logic_vector(7 downto 0) ;
	signal sblank : std_logic ;
	signal ssync : std_logic ;
	signal sclk : std_logic ;

		
begin

		clk25: entity pll25.pll25 
			port map (
				refclk => i_clk50,
				rst => not i_reset ,
				outclk_0 => sclk_25,
				locked => spll_locked
		);
		
		ctrl : entity work.VGA_ctrl
			Port map(i_clk25 => sclk_25, i_reset => spll_locked, o_HS => shs, o_VS => svs, o_R => rR, o_G => rG, o_B => rB, o_BLANK_N => sblank, o_SYNC_N => ssync, o_CLK => sclk) ;
			
			
		o_HS <= shs ;
		o_VS <= svs ;
		o_R <= rR ;
		o_G <= rG ;
		o_B <= rB ;
		o_BLANK_N <= sblank ;
		o_SYNC_N <= ssync ;
		o_CLK <= sclk ;

end behavioral ;
	