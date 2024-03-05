library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compter is 
port (
    MCLK: in std_logic;
    DACLRCK: out std_logic;
    BCLK: out std_logic;
    EN : out std_logic;
);
end Compter;

architecture Compter_rtf of Compter is



    signal unsigned(6 downto 0) : cpt :=0;


process(MCLK)
    begin
        if(rising_edge(MCLK)) then

            cpt=cpt+1;
            
            DACLRCK<=cpt[2];
            BCLK<=cpt[4];

            if (cpt[2]==cpt[4]==0)then
                EN<=0; 
            end if; 

        end if; 
end process;



end Compter_rtf;

