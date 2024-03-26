library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity APU_noise is

	port (
      i_clk 	    			: in STD_LOGIC;
      i_reset      			: in STD_LOGIC;
		i_envelope_in			: in STD_LOGIC_VECTOR(3 downto 0);
		i_shift_register_out : in STD_LOGIC;
		i_length_counter_out : in STD_LOGIC;
      o_noise_out        	: out STD_LOGIC_VECTOR(3 downto 0)
		  
    );
end entity APU_noise;

 architecture Behavioral of APU_noise is
 begin
 process (i_clk)
    begin
        if rising_edge(i_clk) then
            if i_shift_register_out = '0' or i_length_counter_out = '0' then
                o_noise_out <= "0000";
            else
                o_noise_out <= i_envelope_in;
					 
            end if;
        end if;
    end process;
end Behavioral;