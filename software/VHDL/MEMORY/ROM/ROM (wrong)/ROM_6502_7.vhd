---------------------------------------------------------------------
--autor : Xteck 

--this composent is the ROM presnent in the 6502, unfortunatly we didn't found
-- the 


--------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_6502 is 
    port(
    clk : in std_logic;
    CS_n: in std_logic;
    OE_n: in std_logic;

    i_Adress: in unsigned(10 downto 0);
    o_data: out unsigned(7 downto 0)

    );
    end ROM_6502;

architecture ROM_6502_rft of ROM_6502 is 
    subtype word_8 is unsigned(7 downto 0);
    type MEMORY is array(0 to (2**11)-1) of word_8
    signal ROM: MEMORY; 
    
        RAM <=(


        );



    process(clk)
    begin 
        if(rising_edge(clk)) then 
            if(CS_n='0')then
                
             end if;
        end if; 
    end process;