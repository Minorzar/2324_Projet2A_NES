library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_6116 is 
    port(
    --clock

    CS: in std_logic;

    -- enable 
    WE: in std_logic;
    -- desable output
    OE: in std_logic;
     
    -- all pin to select a row (pin coding an adress)

    i_Adress: in unsigned(10 downto 0);

    --Normaly, the pin are I/O but here, to be clearer, we separet it in two pin's type

    io_data: inout unsigned(7 downto 0)
    );
end RAM_6116;

architecture RAM_6116_rft of RAM_6116 is 
    subtype word_8 is unsigned(7 downto 0);
    type MEMORY is array(2**10 downto 0) of word_8;
    signal RAM: MEMORY;

    begin 

    process(CS)
    begin
            if (CS='0') then
                if(WE='1') then 
                    if(OE='0') then 
                        io_data <=RAM(to_integer(i_Adress));
                    end if;

                else
                    RAM(to_integer(i_Adress))<=io_data;
                end if;
            end if;
    end process;
end RAM_6116_rft; 