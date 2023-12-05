Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity V_sync is
	Port(
		i_clk25			: in std_logic;
		i_reset 			: in std_logic;
		i_cnt_y_enable : in std_logic;
		o_VS 				: out std_logic;
		o_blank_v 		: out std_logic ;
		o_v_count 		: out std_logic_vector(9 downto 0));
end V_sync;


-- V_SYNC  :   2
-- V_FRONT :  11
-- V_ACT   : 480
-- V_BACK  :  31


-- V_BLANK : V_FRONT + V_SYNC + V_BACK = 44
-- V_TOTAL : V_BLANK + V_ACT = 525


architecture Behavioral of V_sync is
	signal counter : natural range 0 to 525 := 0;
	signal svs 		: std_logic := '0' ;
	signal svcount : integer range 0 to 255 :=0 ;
	
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
			
			if (counter = 10) then -- V_FRONT - 1
				svs <= '0' ;
			elsif (counter = 12) then -- V_FRONT + V_SYNC - 1
				svs <= '1' ;
			end if ;
			
			if (svcount = 255) then
				svcount <= 0 ;
			else
				svcount <= svcount + 1 ;
			end if ;
		end if ;
	end process ;

	o_VS 			<= svs ;
	o_v_count 	<= std_logic_vector((to_unsigned(svcount, o_v_count'length))) ;
	o_blank_v 	<= '0' when (counter < 44) else '1' ;
	

end Behavioral;