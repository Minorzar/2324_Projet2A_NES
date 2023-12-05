library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_6116 is 
    port(
    --clock
<<<<<<< HEAD
    clk : in std_logic;

    -- chip select
    CS_n: in std_logic;

    -- enable 
    WE_n: in std_logic;
    -- desable output
    OE_n: in std_logic;
=======

    CS: in std_logic;

    -- enable 
    WE: in std_logic;
    -- desable output
    OE: in std_logic;
>>>>>>> 424011948608416313d87c2cf5c8f0130b37d12b
     
    -- all pin to select a row (pin coding an adress)

    i_Adress: in unsigned(10 downto 0);

    --Normaly, the pin are I/O but here, to be clearer, we separet it in two pin's type

    io_data: inout unsigned(7 downto 0)
    );
end RAM_6116;

architecture RAM_6116_rft of RAM_6116 is 
    subtype word_8 is unsigned(7 downto 0);
<<<<<<< HEAD
    type MEMORY is array(0 to (2**11)-1) of word_8;
    signal RAM: MEMORY;

-- Créer port d'entrée et de sortie
signal s_in_port : unsigned(7 downto 0);
signal s_out_port : unsigned(7 downto 0);

    begin 

    --OLD ONES


    -- TODO réécrire une ram standard (avec deux ports: signaux internes)
   process(clk)
   begin
        if(rising_edge(clk)) then 
           if (CS_n='0') then
               if(WE_n='1') then  
                    s_out_port <=RAM(to_integer(i_Adress));
               else
                   RAM(to_integer(i_Adress))<=s_in_port;
               end if;
           end if;
        end if;
   end process;

   s_in_port <= io_data; 
   -- pour faire en sorte que la sortie devienne l'entré

   io_data <= s_out_port when (OE_n = '0') else "ZZZZZZZZ";
   --pour faire en sorte que ce qui sort devient ce qui est bien présen

=======
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
>>>>>>> 424011948608416313d87c2cf5c8f0130b37d12b
end RAM_6116_rft; 