Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity H_sync is
	Port(
		i_clk25			: in std_logic;
		i_reset 			: in std_logic;
		o_cnt_y_enable : out std_logic;
		o_hs 				: out std_logic;
		o_blank_h 		: out std_logic ;
		o_h_count 		: out std_logic_vector(9 downto 0));
end H_sync;

-- H_SYNC  :  96
-- H_FRONT :  16
-- H_ACT   : 640
-- H_BACK  :  48




-- H_BLANK : H_FRONT + H_SYNC + H_BACK = 160
-- H_TOTAL : H_BLANK + H_ACT = 800


architecture Behavioral of H_sync is
	signal counter 	: natural range 0 to 800 := 0;
	signal shs 			: std_logic := '0' ;
	signal sy_enable 	: std_logic ;
	signal shcount 	: integer range 0 to 255 :=0 ;
	
begin
	
	process(i_clk25, i_reset)
	begin
		if (i_reset = '1') then
			counter <= 0 ;
		elsif (rising_edge(i_clk25)) then
			counter <= counter + 1 ;
			if (counter = 799) then
				counter <= 0 ;
			end if ;
			
			if (counter = 15) then -- H_FRONT -1
				shs <= '0' ;
			elsif (counter = 111) then -- H_FRONT + H_SYNC -1
				shs <= '1' ;
			end if ;
			
			if (shcount = 255) then
				shcount <= 0 ;
			else
				shcount <= shcount + 1 ;
			end if ;
				
		end if ;
	end process ;

	o_hs 				<= shs ;
	o_cnt_y_enable <= '1' when (counter = 111) else '0' ;	-- H_FRONT + H_SYNC -1
	o_h_count 		<= std_logic_vector(to_unsigned(shcount, o_h_count'length)) ;
	o_blank_h 		<= '0' when (counter < 160) else '1' ;
	

end Behavioral;
