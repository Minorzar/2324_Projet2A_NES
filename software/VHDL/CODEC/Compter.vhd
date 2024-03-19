library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compter is 
port (
    i_mclk: in std_logic;
    o_dacklrck: out std_logic;
    o_bclk: out std_logic;
    o_en: out std_logic
);
end Compter;

architecture Compter_rtl of Compter is
    signal unsigned(7 downto 0) : cpt := x"00";
begin

    process(i_mclk)
        begin
            if(rising_edge(i_mclk)) then
                cpt <= cpt + 1;
            end if; 
    end process;

    o_dacklrck<=cpt(7); -- f_dacklrck = f_mclk / 256 
    o_bclk<=cpt(3);     -- f_bclk = f_mclk / 8

    o_en<='1' when (cpt = x"FF") else '0';

end Compter_rtl;
