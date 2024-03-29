library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity envelope_gen is
	
	port( i_start_flag :in STD_LOGIC;
			i_loop_flag :in STD_LOGIC;
			i_constant_vol_flag :in STD_LOGIC;
			i_envelope_param :in STD_LOGIC_VECTOR(3 downto 0);
			i_clk :in STD_LOGIC;
			i_frame_clk :in STD_LOGIC;
			
			o_envelope_out :out STD_LOGIC_VECTOR(3 downto 0));
end envelope_gen;

architecture envelope of envelope_gen is
signal reset : STD_LOGIC;
signal counter : unsigned(3 downto 0);
signal counter_clk : STD_LOGIC;
begin
	process(i_clk)
		begin 
			if rising_edge(i_frame_clk) then
				if (i_start_flag = '1') then
					counter <= "1111";
					reset <= '1';
				else
					reset <= '0';
				end if;
				
				if (i_constant_vol_flag ='1') then 
					o_envelope_out <= i_envlope_param;
				else
					o_envelope_out <= counter;
				end if
				
				if (i_loop_flag = '1' and counter = '0') then
					counter <= "1111";
					end if;
					
				if (counter /= 0) then
					counter <= counter - "0001";
					end if;
					
			end if;
			
	end process;