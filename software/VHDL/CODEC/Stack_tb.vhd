library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stack_tb is 
end Stack_tb; 

architecture Stack_test of Stack_tb is 

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


        finished <= true;
        wait
end process benche; 


end Stack_test; 