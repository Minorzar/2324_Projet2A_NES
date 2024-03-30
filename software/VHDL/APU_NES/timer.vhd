library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Timer is
    Port (
        i_clk     : in  std_logic;    
        i_reset   : in  std_logic;    
        i_timer   : in  std_logic_vector(10 downto 0);
        o_timer   : out std_logic   
    );
end Timer;

architecture Behavioral of Timer is
    signal timer_reg  : unsigned(10 downto 0);
begin

    process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            timer_reg <= (others => '0');
				
        elsif rising_edge(i_clk) then
		  
                if timer_reg = "0000000000" then  -- Check if timer reached zero
					 
                    timer_reg <= unsigned(i_timer); -- Reload the timer
						  
                else
                    timer_reg <= timer_reg - 1; -- Subtract 1 from timer_reg
						  
                end if;
            end if;
        end if;
    end process;

    o_timer <= '1' when timer_reg = "0000000000" else '0'; -- Timer output high when timer is zero
	
end Behavioral;