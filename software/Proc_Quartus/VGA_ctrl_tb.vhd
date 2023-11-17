library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity VGA_ctrl_tb is
-- Port () ;
end VGA_ctrl_tb;

architecture Behavioral of VGA_ctrl_tb is
	component VGA_ctrl
		Port(
			clk108   : in std_logic;
			reset   : in std_logic;
			HS : out std_logic ;
			VS : out std_logic ;
			R : out std_logic_vector(7 downto 0) ;
			G : out std_logic_vector(7 downto 0) ;
			B : out std_logic_vector(7 downto 0) ;
			BLANK_N : out std_logic ;
			SYNC_N : out std_logic
		);
		
	end component ;
   
	signal sclk108   : std_logic;
	signal sreset   : std_logic;
	signal sHS : std_logic ;
	signal sVS : std_logic ;
	signal sR : std_logic_vector(7 downto 0) ;
	signal sG : std_logic_vector(7 downto 0) ;
	signal sB : std_logic_vector(7 downto 0) ;
	signal sblank : std_logic ;
	signal ssync : std_logic;
	
	constant clk108_period : time := 9.26ns ;
	
begin
	unit_test : VGA_ctrl port map (clk108 => sclk108, reset => sreset, HS => sHS, VS => sVS, R => sR, G => sG, B => sB, BLANK_N => sblank, SYNC_N => ssync) ;
		
	clk_process : process
							begin
								sclk108 <= '0' ;
								wait for clk108_period/2 ;
								sclk108 <= '1' ;
								wait for clk108_period/2 ;
							end process ;
	
end Behavioral ;