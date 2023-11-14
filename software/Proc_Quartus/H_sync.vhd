Library IEEE;
use IEEE.std_logic_1164.all;

entity H_sync is
	Port(
		clk25: in std_logic;
		reset : in std_logic;
		cnt_y_enable : out std_logic;
		H_S : out std_logic;
		inDispH : out std_logic;
		x_value : out std_logic_vector(9 downto 0));
end H_sync;

 
--		Assuming we use VGA for 60Hz, 640x480 it comes:
--			
--			HORIZONTAL TIMING
--			
--				- a : 3.8us			=> Sync (HSync low)									=> 95 clock cycles
--				- b : 1.9us			=> back porch (before display)					=> 47.5 clock cycles
--				- c : 25.4us		=> display time										=> 635 clock cycles
--				- d 0.6us			=> front porch (after display, before sync)	=> 15 clock cycles
--				
--			=> 792,5 clock cycles (or 31.7us) per line
--			
--			Also meaning:
--				
--				- a : 96px => 95px
--				- b : 48px => 143px
--				- c : 640px => 783px
--				- d : 16px => 16px
--			
--			Hence: a counter from 0 to 799 that restart at 800 and set inDispH between the 143rd and 782nd px.
--			Mostly, it gives us:
--			counter between 0 and 95 => HS = 0, inDispH = 0,
--			counter between 96 and 143 => HS = 1, inDispH = 0,
--			counter between 144 and 783 => HS = 1, inDispH = 1,
--			counter between 784 and 799 => HS = 0, inDispH = 0.


architecture Behavioral of H_sync is
	signal counter : natural range 0 to 800;
	
begin
	
	process(clk25)
	begin
		if (reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(clk25)) then
			counter <= counter + 1 ;
			if (counter = 800) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	H_S <= '1' when (counter > 95 and counter < 144) else '0' ;
	inDispH <= '1' when (counter > 143 and counter < 784) else '0' ;
	cnt_y_enable <= '1' when counter = 799 else '0' ;
	

end Behavioral;
