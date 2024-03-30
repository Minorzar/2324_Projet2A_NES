library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compter_tb is 
end Compter_tb;

architecture NCompteur of Compter_tb is 

signal Mclk : std_logic;
signal Daclrck : std_logic;
signal bclk : std_logic; 
signal en : std_logic;

-- benche variable 
constant CLK_PERIOD : time := 5 ns;
signal finished : boolean := false;

begin
    Compter : entity work.Codec_top
    port map(

        MCLK=>Mclk,
        DACLRCK =>Daclrck,
        BCLK=>bclk,
        EN=>en


    );

benche : process
begin 
        for k in 0 to 1024 loop
            
            Mclk <= not Mclk;
            wait for(CLK_PERIOD);
            
        end loop; 
            finished <= true;
            wait;

end process benche;

end NCompteur;