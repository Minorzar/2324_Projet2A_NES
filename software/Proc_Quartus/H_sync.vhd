Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity H_sync is
	Port(
		clk108: in std_logic;
		reset : in std_logic;
		cnt_y_enable : out std_logic;
		H_S : out std_logic;
		inDispH : out std_logic;
		x_value : out std_logic_vector(9 downto 0));
end H_sync;

 
--		Assuming we use VGA for 60Hz, 1280x1024 it comes:
--			
--			HORIZONTAL TIMING
--			
--				- a : 1us			=> Sync (HSync low)									=> 108 clock cycles
--				- b : 2.3us			=> back porch (before display)					=> 248.5 clock cycles
--				- c : 11.9us		=> display time										=> 1285.5 clock cycles
--				- d : 0.4us			=> front porch (after display, before sync)	=> 43.5 clock cycles
--				
--			=> 1685.5 clock cycles (or 15.6us) per line
--			
--			Also meaning:
--				
--				- a : 108px => 107px
--				- b : 249px => 356px
--				- c : 1286px => 1642px
--				- d : 44px => 1686px
--			
--			Hence: a counter from 0 to 1687 that restart at 1686 and set inDispH between the 357th and 1642nd px.
--			Mostly, it gives us:
--			counter between 0 and 107 => HS = 0, inDispH = 0,
--			counter between 108 and 356 => HS = 1, inDispH = 0,
--			counter between 357 and 1642 => HS = 1, inDispH = 1,
--			counter between 1643 and 1686 => HS = 0, inDispH = 0.


architecture Behavioral of H_sync is
	signal counter : natural range 0 to 1687;
	
begin
	
	process(clk108)
	begin
		if (reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(clk108)) then
			counter <= counter + 1 ;
			if (counter = 1686) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	H_S <= '0' when (counter >= 0 and counter < 108) else '1' ;
	inDispH <= '1' when (counter > 356 and counter < 1643) else '0' ;
	cnt_y_enable <= '1' when (counter = 1686) else '0' ;
	x_value <= std_logic_vector(to_unsigned(integer((counter - 356)*255/1286), x_value'length)) when(counter > 356 and counter < 1643 and not(counter >= 0 and counter < 108)) else "0000000000" ;
	

end Behavioral;
