Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity V_sync is
	Port(
		clk108: in std_logic;
		reset : in std_logic;
		V_S : out std_logic;
		inDispV : out std_logic;
		cnt_y_enable : in std_logic;
		y_value : out std_logic_vector(9 downto 0));
end V_sync;

 
--		Assuming we use VGA for 60Hz, 1280x1024 it comes:
--			
--			VERTICAL TIMING
--			
--				- a : 3 lines		=> Sync (HSync low)									=> 5056.5 clock cycles (or 63.4us)
--				- b : 38 lines		=> back porch (before display)					=> 64049 clock cycles (or 1046,1us)
--				- c : 1024 lines	=> display time										=> 1725952 clock cycles (or 15216us)
--				- d : 1 lines		=> front porch (after display, before sync)	=> 1685.5 clock cycles (or 317us)
--				
--			=> 1796749 clock cycles (or 16.637ms) per frame
--			
--			Also meaning:
--				
--				- a : 2 lines => 2 lines
--				- b : 38 lines => 40 lines
--				- c : 1024 lines => 1064 lines
--				- d : 1 lines => 1065 lines
--			
--			Hence: a counter from 0 to 1066 that restart at 1065 and set inDispV between the 40th and 1063rd line.
--			Mostly, it gives us:
--			counter between 0 and 2 => VS = 0, inDispV = 0,
--			counter between 3 and 39 => VS = 1, inDispV = 0,
--			counter between 40 and 1063 => VS = 1, inDispV = 1,
--			counter between 1064 and 1065 => VS = 0, inDispV = 0.


architecture Behavioral of V_sync is
	signal counter : natural range 0 to 1066;
	
begin
	
	process(clk108)
	begin
		if (reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(clk108) and (cnt_y_enable = '1')) then
			counter <= counter + 1 ;
			if (counter = 1065) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	V_S <= '0' when (counter >= 0 and counter < 2) else '1' ;
	inDispV <= '1' when (counter > 39 and counter < 1064) else '0' ;
	y_value <= std_logic_vector(to_unsigned(integer((counter - 35)*255/1024), y_value'length)) when(counter > 39 and counter < 1064 and not(counter >= 0 and counter < 2)) else "0000000000" ;
	

end Behavioral;