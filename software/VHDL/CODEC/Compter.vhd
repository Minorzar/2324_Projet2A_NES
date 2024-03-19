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

architecture Compter_rtf of Compter is



    signal unsigned(8 downto 0) : cpt :="00000000";
    

process(i_mclk)
    begin
        if(rising_edge(i_mclk)) then
            
            if(cpt="11111111")then
                    cpt<="00000000";
                    o_en<='1';
                    o_dacklrck<=cpt(8);
                    o_bclk<=cpt(4);
            else
                    o_en<='0';
                    cpt<=cpt+"00000001";
                    o_dacklrck<=cpt(8);
                    o_bclk<=cpt(4);

                    if (cpt(8)='0' and cpt(4)='0')then
                        o_en<='1'; 
                    end if; 
            end if;

        end if; 
end process;



end Compter_rtf;

