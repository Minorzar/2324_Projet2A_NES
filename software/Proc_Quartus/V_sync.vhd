Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity V_sync is
	Port(
		i_clk25: in std_logic;
		i_reset : in std_logic;
		o_VS : out std_logic;
		o_inDispV : out std_logic;
		i_cnt_y_enable : in std_logic;
		o_y_value : out std_logic_vector(9 downto 0));
end V_sync;




architecture Behavioral of V_sync is
	signal counter : natural range 0 to 525;
	
begin
	
	process(i_clk25)
	begin
		if (i_reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(i_clk25) and (i_cnt_y_enable = '1')) then
			counter <= counter + 1 ;
			if (counter = 524) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	o_VS <= '0' when (counter < 2) else '1' ;
	o_inDispV <= '1' when (counter > 35 and counter < 515) else '0' ;
	o_y_value <= std_logic_vector(((counter - 36), o_y_value'length)) when(counter > 35 and counter < 515) else "0000000000" ;
	

end Behavioral;