library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity noise is

	port (
      i_clk 	    			: in STD_LOGIC;
		i_envelope_in			: in STD_LOGIC_VECTOR(3 downto 0);
		i_shift_register_in  : in STD_LOGIC;
		i_length_counter_in  : in STD_LOGIC;
		
      o_noise_out        	: out STD_LOGIC_VECTOR(3 downto 0)
		  
    );
end entity noise;

 architecture Behavioral of noise is
 begin
 process (i_clk)
    begin
        if rising_edge(i_clk) then
		  
            if i_shift_register_in = '0' or i_length_counter_in = '0' then
				
                o_noise_out <= "0000";
					 
            else
				
                o_noise_out <= i_envelope_in;
					 
            end if;
        end if;
    end process;
end Behavioral;