library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity VGA_ctrl_tb is
-- Port () ;
end VGA_ctrl_tb;

architecture Behavioral of VGA_ctrl_tb is
	component VGA_ctrl
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
			o_CLK : out std_logic
		);
		
	end component ;
   
	signal sclk25   : std_logic;
	signal sreset   : std_logic;
	signal sHS : std_logic ;
	signal sVS : std_logic ;
	signal sR : std_logic_vector(7 downto 0) ;
	signal sG : std_logic_vector(7 downto 0) ;
	signal sB : std_logic_vector(7 downto 0) ;
	signal sblank : std_logic ;
	signal ssync : std_logic;
	signal sclk : std_logic ;
	
	constant clk25_period : time := 40ns ;
	
begin
	unit_test : VGA_ctrl port map (i_clk25 => sclk25, i_reset => sreset, o_HS => sHS, o_VS => sVS, o_R => sR, o_G => sG, o_B => sB, o_BLANK_N => sblank, o_SYNC_N => ssync, o_CLK => sclk) ;
		
	clk_process : process
							begin
								sclk25 <= '0' ;
								wait for clk25_period/2 ;
								sclk25 <= '1' ;
								wait for clk25_period/2 ;
							end process ;
	
end Behavioral ;