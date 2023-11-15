library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity VGA_Sync_tb is
-- Port () ;
end VGA_Sync_tb;

architecture Behavioral of VGA_Sync_tb is
	component VGA_Sync
	Port( clk25   : in std_logic;
			reset   : in std_logic;
			hs      : out std_logic;
			vs      : out std_logic;
			inDisp  : out std_logic;
			x       : out std_logic_vector(9 downto 0);
			y       : out std_logic_vector(9 downto 0));
	end component ;
   
	signal sclk25 : std_logic ;
	signal shs : std_logic ;
	signal svs : std_logic ;
	signal sinDisp : std_logic ;
	signal sx : std_logic_vector(9 downto 0) ;
	signal sy : std_logic_vector(9 downto 0) ;
	
	constant clk25_period : time := 40ns ;
	
begin
	unit_test : VGA_Sync port map (clk25 => sclk25, reset => '0', hs => shs, vs => svs, inDisp => sinDisp, x => sx, y => sy) ;
		
	clk_process : process
							begin
								sclk25 <= '0' ;
								wait for clk25_period/2 ;
								sclk25 <= '1' ;
								wait for clk25_period/2 ;
							end process ;
	
end Behavioral ;