library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity clk_divider is

	port (
      i_clk 	    : in STD_LOGIC;
      i_reset      : in STD_LOGIC;
      o_clk        : out STD_LOGIC
		  
    );
end entity clk_divider;

architecture Behavioral of clk_divider is

    signal counter : unsigned(3 downto 0);
begin
    process (i_clk, i_reset)
    begin
	 
        if i_reset = '1' then
            counter <= "1111";
            o_clk <= '0';
				end if;
				
        if rising_edge(i_clk) then
		  
            if counter = 0 then
                counter <= "1111";
                o_clk <= '1';
					 
            else
                counter <= counter - 1;
                o_clk <= '0';
					 
            end if;
				
        end if;
		  
    end process;
	 
end architecture Behavioral;