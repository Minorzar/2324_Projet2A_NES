library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_i_o is 
port(
    clk: in std_logic;
	 en: in std_logic;
    w_en: in std_logic; 
    i_data : in std_logic_vector(7 downto 0);
    i_adress: in std_logic_vector(10 downto 0);
    o_data : out std_logic_vector(7 downto 0)
);
end RAM_i_o;

architecture RAM_i_o_rtf of RAM_i_o is 
    subtype DAT is std_logic_vector (7 downto 0);
    type MEMORY is array (0 to 2047) of DAT;
    signal reg : MEMORY:=(others => "00000000"); 
    begin 

    process(clk)
    begin
        if (rising_edge(clk))then 
			if(en='1') then 
                if (w_en='1') then
                    reg(to_integer(unsigned(i_adress)))<=i_data;
                        o_data<= "ZZZZZZZZ";
                else 
                    o_data<=reg(to_integer(unsigned(i_adress)));
                end if;
            else
                o_data<= "ZZZZZZZZ";
			end if;
        end if;
    end process;




end RAM_i_o_rtf; 