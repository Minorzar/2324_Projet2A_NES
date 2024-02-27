library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity APU_linear_counter is

port(i_linear_counter_en : in STD_LOGIC;
	  i_frame_counter : in STD_LOGIC;
	  i_clk : in STD_LOGIC;
	  i_halt_flag : in STD_LOGIC;
	  o_out_value: out STD_LOGIC_VECTOR(8 DOWNTO 0);
	  i_counter_load : in STD_LOGIC_VECTOR(4 DOWNTO 0));
	  

end APU_linear_counter;

architecture linear_counter of APU_linear_counter is
signal count_value : unsigned(7 DOWNTO 0);
begin
process(i_clk)
	begin
		if rising_edge(i_clk) then
			if (i_frame_counter = '1') then
				if (i_linear_counter_en = '1' and i_halt_flag = '1' and count_value /= "00000000") then
					count_value <= count_value - "00000001";
					-- o_enabler <= '1';
					end if;
					
				if (i_linear_counter_en = '0') then
					count_value <= "00000000";
					-- o_enabler <= '0';
					end if;
				end if;
			end if;
end process;
--Input/Output Table--

o_out_value <= "00011110" when i_counter_load = "11111" else
"00011100" when i_counter_load = "11101" else
"00011010" when i_counter_load = "11011" else
"00011000" when i_counter_load = "11001" else
"00010110" when i_counter_load = "10111" else
"00010100" when i_counter_load = "10101" else
"00010010" when i_counter_load = "10011" else
"00010000" when i_counter_load = "10001" else
"00001110" when i_counter_load = "01111" else
"00001100" when i_counter_load = "01101" else
"00001010" when i_counter_load = "01011" else
"00001000" when i_counter_load = "01001" else
"00000110" when i_counter_load = "00111" else
"00000100" when i_counter_load = "00101" else
"11111110" when i_counter_load = "00001" else
"00000000";

end linear_counter;