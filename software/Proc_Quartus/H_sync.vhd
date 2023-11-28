Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity H_sync is
	Port(
		i_clk25: in std_logic;
		i_reset : in std_logic;
		o_cnt_y_enable : out std_logic;
		o_hs : out std_logic;
		o_inDispH : out std_logic;
		o_x_value : out std_logic_vector(9 downto 0));
end H_sync;



architecture Behavioral of H_sync is
	signal counter : natural range 0 to 800;
	
begin
	
	process(i_clk25)
	begin
		if (i_reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(i_clk25)) then
			counter <= counter + 1 ;
			if (counter = 799) then
				counter <= 0 ;
			end if ;
		end if ;
	end process ;

	o_hs <= '0' when (counter < 96) else '1' ;
	o_inDispH <= '1' when (counter > 143 and counter < 784) else '0' ;
	o_cnt_y_enable <= '1' when (counter = 799) else '0' ;
	o_x_value <= std_logic_vector(((counter - 144), o_x_value'length)) when(counter > 143 and counter < 784) else "0000000000" ;
	

end Behavioral;
