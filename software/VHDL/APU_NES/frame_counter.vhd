library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity frame_counter is 

	port( i_en_seq : in STD_LOGIC;
			i_reset  : in STD_LOGIC;
			i_clk    : in STD_LOGIC;
			
			o_IRQ    : out STD_LOGIC;
			o_L      : out STD_LOGIC;
			o_enable : out STD_LOGIC);
			
end frame_counter;

architecture Behavorial of frame_counter is
signal step : unsigned(2 downto 0);
begin 
process(i_clk)
	begin
		if rising_edge(i_clk) then
		
			if (i_reset = '1') then
				step <= "000";
			elsif (step = "100" and i_en_seq = '0') then
				step <= "000";
			elsif (step = "101" and i_en_seq = '1') then
				step <= "000";
			else
				step <= step + "001";
			end if;
			
		end if;
end process;

	o_IRQ <= '1' when (step = "011" and i_en_seq = '0') else
	'0';
 
	o_L <= '1' when ((step = "001" and i_en_seq = '0') or (step = "011" and i_en_seq = '0') or (step = "001" and i_en_seq = '1') or (step = "100" and i_en_seq = '1')) else
	'0';

	o_enable <= '1' when ((i_en_seq = '0') or (i_en_seq = '1' and step /= "100")) else
	'0';
			
end Behavorial;
 