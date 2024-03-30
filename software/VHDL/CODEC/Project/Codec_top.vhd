library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Codec_top is 

port(

    i_Data: in unsigned(15 downto 0);
    i_Mclk: in std_logic;
    i_en: in std_logic;

    o_Data: out unsigned(15 downto 0)

);
end Codec_top; 

architecture Codec_top_rtf of Codec_top is 

    signal Mem: unsigned(15 downto 0);
	 
begin 

process(i_Mclk)

    begin
        if(rising_edge(i_Mclk)) then 

                Mem<=i_Data;

            if (i_en = '1') then 

                o_Data<=Mem;

            end if; 

        end if; 

end process;

end Codec_top_rtf; 