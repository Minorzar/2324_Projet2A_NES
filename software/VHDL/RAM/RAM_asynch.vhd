library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_asynch is 
port(
    w_en: in std_logic; 
    data : inout std_logic_vector(7 downto 0);
    adress: in std_logic_vector(10 downto 0)
);
end RAM_asynch;

architecture RAM_asynch_rtf of RAM_asynch is 
    subtype DAT is std_logic_vector (7 downto 0);
    type MEMORY is array (0 to 2047) of DAT;
    signal reg : MEMORY:=(others => "00000000"); 
    begin 

    process(w_en,adress)
    begin
            if (w_en='1') then
                reg(to_integer(unsigned(adress)))<=data;
					 data<= "ZZZZZZZZ";
            else 
                data<=reg(to_integer(unsigned(adress)));
            end if;
    end process;
	 --data<=reg(to_integer(unsigned(adress))) when w_en='0' else (others => 'Z');



end RAM_asynch_rtf; 