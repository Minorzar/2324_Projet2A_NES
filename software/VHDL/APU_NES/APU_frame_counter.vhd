library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity APU_frame_counter is 

	port( i_en_seq : in STD_LOGIC;
			i_reset  : in STD_LOGIC;
			i_clk    : in STD_LOGIC;
			
			o_IRQ    : in STD_LOGIC;
			o_L      : in STD_LOGIC;
			o_enable : in STD_LOGIC;);
			
end APU_frame_counter;

architecture frame_counter_IO of APU_frame_counter is
signal step : unsigned(2 downto 0);
begin
 o_IRQ = '1' when (step = "011" and i_en_seq = '0') else
 '0';
 
 o_L = '1' when ((step = "001" and i_en_seq ='0') or (step = "011" and i_en_seq='0') or (step = "001" and i_en_seq = "1") or (step = "100" and i_en_seq = "1")) else
 '0';
 
 o_enable = '1' when ((i_en_seq = 0) or (i_en_seq = 1 and step /= "100")) else
 '0';
end frame_counter_IO;
 