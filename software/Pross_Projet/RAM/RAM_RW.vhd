library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RW is 
port (
    clk: in std_logic;
   -- reset: in std_logic;

    i_wenable: in std_logic;

--make enable the write

    i_data: in unsigned(7 downto 0);
    o_data: out unsigned(7 downto 0);

    i_address: in unsigned(15 downto 0)

);
end RAM_RW;

architecture RAM_RW_rtf of RAM_RW is 
    subtype DATA is unsigned(7 downto 0);
    type MEMORY is array (2**15 downto 0) of DATA; -- origin : size of adress
    signal RAM: MEMORY; -- set up a signal ram of type memory


    begin

    ------------------- RESTART 

    restart : process(clk,i_wenable)
    begin 
     --   if(reset ='1') then
       --    RAM <=(
       --             0=>
       --             1=>
        --            2=>
       --             3=>
       --             others=>"00000000");
       -- o_data<="XXXXXXXX";
      --  else
            if (rising_edge(clk)) then
            
                if(i_wenable='1') then
                    RAM(to_integer(i_address))<=i_data;
                    o_data<=RAM(to_integer(i_address)); 
                    --problem this is 
                    else 
                    o_data<=RAM(to_integer(i_address));
                end if;
                
            
            

            end if;
     --   end if;
    end process restart;

  --------------------  NORMAL FUNCTION 

 -- normal_funct: process(clk,rw,i_data,i_adress)
 -- begin
   --   if()
     -- end if;
  --end normal_funct;

end RAM_RW_rtf;     