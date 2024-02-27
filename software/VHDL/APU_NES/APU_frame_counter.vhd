library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity APU_frame_counter is 

	port( i_en_seq :in STD_LOGIC;
			i_reset :in STD_LOGIC;
			i_clk :in STD_LOGIC;
			o_level :out STD_LOGIC_VECTOR(3 DOWNTO 0));
			
end APU_frame_counter;

