Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity V_sync is
	Port(
		clk25: in std_logic;
		reset : in std_logic;
		V_S : out std_logic;
		inDispV : out std_logic;
		cnt_y_enable : in std_logic;
		y_value : out std_logic_vector(9 downto 0));
end V_sync;

 
--		Assuming we use VGA for 60Hz, 640x480 it comes:
--			
--			VERTICAL TIMING
--			
--				- a : 2 lines		=> Sync (HSync low)									=> 1585 clock cycles (or 63.4us)
--				- b : 33 lines		=> back porch (before display)					=> 26152.5 clock cycles (or 1046,1us)
--				- c : 480 lines	=> display time										=> 380400 clock cycles (or 15216us)
--				- d : 10 lines		=> front porch (after display, before sync)	=> 7925 clock cycles (or 317us)
--				
--			=> 416062.5 clock cycles (or 16.6424ms) per frame
--			
--			Also meaning:
--				
--				- a : 2 lines => 1 lines
--				- b : 33 lines => 34 lines
--				- c : 480 lines => 514 lines
--				- d : 10 lines => 524 lines
--			
--			Hence: a counter from 0 to 525 that restart at 525 and set inDispV between the 34th and 513rd line.
--			Mostly, it gives us:
--			counter between 0 and 1 => VS = 0, inDispV = 0,
--			counter between 2 and 34 => VS = 1, inDispV = 0,
--			counter between 35 and 514 => VS = 1, inDispV = 1,
--			counter between 515 and 524 => VS = 0, inDispV = 0.


architecture Behavioral of V_sync is
	signal counter : natural range 0 to 525;
	
begin
	
	process(clk25)
	begin
		if (reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(clk25) and (cnt_y_enable = '1')) then
			counter <= counter + 1 ;
			if (counter = 524) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	V_S <= '0' when (counter >= 0 and counter < 2) else '1' ;
	inDispV <= '1' when (counter > 34 and counter < 515) else '0' ;
	y_value <= std_logic_vector(to_unsigned(counter, y_value'length)) ;
	

end Behavioral;