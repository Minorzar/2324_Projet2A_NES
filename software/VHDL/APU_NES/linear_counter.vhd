library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity linear_counter is

port(i_linear_counter_en : in STD_LOGIC;
	  i_clk : in STD_LOGIC;
	  i_halt_flag : in STD_LOGIC;
	  o_enabler : out STD_LOGIC;
	  i_counter_load : in STD_LOGIC_VECTOR(4 DOWNTO 0));
	  

end APU_linear_counter;

architecture Behavorial of linear_counter is

signal length_value : unsigned(7 DOWNTO 0);
signal linear_counter_en_OLD : STD_LOGIC;

begin
process(i_clk)
	begin
		if rising_edge(i_clk) then
		
			-- Assign the counter value
			if linear_counter_en_OLD /= i_linear_counter_en then
				case i_counter_load is
					when "11111" => 
						length_value <= "00011110";
					when "11101" =>
						length_value <= "00011100";
					when "11011" =>
						length_value <= "00011010";
					when "11001" =>
						length_value <= "00011000";
					when "10111" =>
						length_value <= "00010110";
					when "10101" =>
						length_value <= "00010100";
					when "10011" =>
						length_value <= "00010010";
					when "10001" =>
						length_value <= "00010000";
					when "01111" =>
						length_value <= "00001110";
					when "01101" =>
						length_value <= "00001100";
					when "01011" =>
						length_value <= "00001010";
					when "01001" =>
						length_value <= "00001000";
					when "00111" =>
						length_value <= "00000110";
					when "00101" =>
						length_value <= "00000100";
					when "00001" =>
						length_value <= "11111110";
					when others =>
						length_value <= "00000000";
					end case;
			end if;
			
			linear_counter_en_OLD <= i_linear_counter_en;
			
			if linear_counter_en_OLD = '0' then
				length_value <= "00000000";
				o_enabler <= '0';
				
			else
				if length_value = "00000000" then
					o_enabler <= '0';
					
				else
					o_enabler <= '1';
					if i_halt_flag = '0' then
						length_value <= length_value - "00000001";
						
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavorial;