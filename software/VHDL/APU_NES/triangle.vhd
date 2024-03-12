library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity triangle is 

<<<<<<< HEAD
	port( i_en_seq :in STD_LOGIC;
			i_reset :in STD_LOGIC;
			i_clk :in STD_LOGIC;
<<<<<<< HEAD
			i_linear_counter:in STD_LOGIC;
			i_length_counter:in STD_LOGIC;
=======
>>>>>>> main
			o_level :out STD_LOGIC_VECTOR(3 DOWNTO 0));
=======
	port( 
			i_en_seq        :	in STD_LOGIC;
			i_reset         :	in STD_LOGIC;
			i_clk    		 :	in STD_LOGIC;
			i_linear_counter:	in STD_LOGIC;
			i_length_counter:	in STD_LOGIC;
			o_level         :	out STD_LOGIC_VECTOR(3 DOWNTO 0));
>>>>>>> c13902ba83169c37383f2c590acd7d02a53b0f8d
			
end triangle;

architecture sequencer of triangle is
signal reg_step : unsigned(4 DOWNTO 0) := "10000";
begin
	
	process(i_clk)
	begin	
		if rising_edge(i_clk) then
<<<<<<< HEAD
<<<<<<< HEAD
		if (i_linear_counter = '1' and i_length_counter = '1' and i_en_seq = '1') then
		reg_step <= reg_step + "00001";
		else reg_step <= "00000";
=======
		if (i_en_seq = '1') then
		reg_step <= reg_step + "00001";
>>>>>>> main
=======
			if (i_linear_counter = '1' and i_length_counter = '1' and i_en_seq = '1') then
				reg_step <= reg_step + "00001";
			else 
				reg_step <= "10000";
			end if;
>>>>>>> c13902ba83169c37383f2c590acd7d02a53b0f8d
		end if;
	end process;

	o_level <= "1111" when reg_step = "00000" or reg_step = "11111" else
	"1110" when reg_step = "00001" or reg_step = "11110" else
	"1101" when reg_step = "00010" or reg_step = "11101" else
	"1100" when reg_step = "00011" or reg_step = "11100" else
	"1011" when reg_step = "00100" or reg_step = "11011" else
	"1010" when reg_step = "00101" or reg_step = "11010" else
	"1001" when reg_step = "00110" or reg_step = "11001" else
	"1000" when reg_step = "00111" or reg_step = "11000" else
	"0111" when reg_step = "01000" or reg_step = "10111" else
	"0110" when reg_step = "01001" or reg_step = "10110" else
	"0101" when reg_step = "01010" or reg_step = "10101" else
	"0100" when reg_step = "01011" or reg_step = "10100" else
	"0011" when reg_step = "01100" or reg_step = "10011" else
	"0010" when reg_step = "01101" or reg_step = "10010" else
	"0001" when reg_step = "01110" or reg_step = "10001" else
	"0000" when reg_step = "01111" or reg_step = "10000";
end sequencer;
