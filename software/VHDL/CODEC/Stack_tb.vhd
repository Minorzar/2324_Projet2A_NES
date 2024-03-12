library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stack_tb is 
end Stack_tb; 

architecture Stack_test of Stack_tb is 
-- benche variable 

constant CLK_PERIOD : time := 5 ns;
signal finished : boolean := false; 

-- composent signal 
    signal iData : unsigned(15 downto 0); 
    signal iclk : std_logic;
    signal ien : std_logic;
    signal oData : unsigned(15 downto 0);
 
begin 
    Stack : entity work.Stack
    port map(
        i_Data=>iData,
        i_clk=>iclk,
        i_en=>ien,
        o_Data=>oData
    );

benche : process
begin 
    wait for 10* CLK_PERIOD;
    iData<=to_unsigned(0000000000000001,16);
    wait for 2* CLK_PERIOD;
    iData<=to_unsigned(0000000000000111,16);
    wait for 2* CLK_PERIOD;
    iData<=to_unsigned(0000000000000001,16);
    iData<=to_unsigned(0000000000000011,16);
        finished <= true;
        wait
end process benche; 


end Stack_test; 