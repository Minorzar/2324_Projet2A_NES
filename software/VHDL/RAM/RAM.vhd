library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is 
port(
    clk: in std_logic;
    w_en: in std_logic; 
    data : inout std_logic_vector(7 downto 0);
    adress: in std_logic_vector(15 downto 0):
);
end RAM;
    subtype DAT is unsigned (7 downto 0);
    type MEMORY is array (2**15 downto 0) of DAT
    signal reg : MEMORY;
    
    begin 

    process(clk)
    begin
        if (rising_edge(clk))then 
            if (w_en='1') then
                reg(to_integer(adress))<=data;
            else 
                data<=reg(to_integer(adress));
            end if;
        end if;
    end process; 

architecture RAM_rtf of RAM is 

end RAM_rtf; 