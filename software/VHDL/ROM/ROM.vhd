---------------------------------------------------------------------
--autor : Xteck 

--this composent is the ROM for the end of the projet chip tune 
--------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is 
port(
    clk: in std_logic;
    i_en: in std_logic;
    i_adress: in std_logic_vector(15 downto 0);
    o_data: out std_logic_vector(7 downto 0)
);
end ROM; 

architecture ROM_rtf of ROM is 
    subtype DAT is std_logic_vector(7 downto 0);
    type MEMORY is array (0 to ((8*1024)-1)) of DAT;
    signal reg : MEMORY:=(others => "00000000");
    begin 

    process(clk)
    begin 
        if (rising_edge(clk)) then
            if (i_en ='1')then
                o_data<= reg(to_integer(unsigned(i_adress)));
            else 
                o_data<="ZZZZZZZZ";
            end if;  
        end if;
    end process;
	--o_data<="ZZZZZZZZ";


end ROM_rtf;