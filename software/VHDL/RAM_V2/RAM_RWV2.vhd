library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RWV2 is 
port (
    clk: in std_logic;
    i_wenable: in std_logic;


    --DATA part 
    i_data1: in unsigned(7 downto 0);
    i_data2: in unsigned (7 downto 0);
    i_adress: in unsigned (15 downto 0);
    o_data: out unsigned(15 downto 0)
);
end RAM_RWV2;

architecture RAM_RWV2_rtf of RAM_RWV2 is 
    subtype DATA is unsigned(7 downto 0);
    type MEMORY is array (2**15 downto 0) of DATA;
    signal RAM: MEMORY;

    begin 

    purpuse : process(clk,i_wenable)
        begin 
            if(rising_edge(clk)) then 

                if(i_wenable='1')then 
                    --ICI si on nous autorise a écrire, alors  on écrit alors 
                    --Ce qui est présent dans data_1
                    RAM(to_integer(i_adress))<=i_data1;
                    o_data<=i_adress;
                elsif(i_wenable='0') then
                    o_data<= to_unsigned(00000000,8) & RAM(to_integer(i_data1 & i_data2));
                end if;
            end if;

    end process purpuse;
end RAM_RWV2_rtf;