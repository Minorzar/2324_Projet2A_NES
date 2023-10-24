library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RW is 
port (
    clk: in std_logic;
    reset: in std_logic;

    i_wenable: in std_logic;

--make enable the write

    i_data: in unsigned(0 downto 7);
    o_data: out unsigned(0 downto 7);

    i_address: in unsigned(0 downto 15)

);
end RAM_RW;

architecture RAM_RW of counting is 
    subtype DATA is unsigned(0 downto 7);
    type MEMORY is array (0 downto 2**15) of DATA; -- origin : size of adress
    signal RAM: MEMORY; -- set up a signal ram of type memory


    begin

    ------------------- RESTART 

    restart : process(reset,clk,i_enable)
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
            
                if(i_enable='1') then
                    RAM(i_Waddress)<=i_data;
                
                end if;
                
            
            o_data<=RAM(i_address);
            end if;
     --   end if;
    end process restart;

  --------------------  NORMAL FUNCTION 

 -- normal_funct: process(clk,rw,i_data,i_adress)
 -- begin
   --   if()
     -- end if;
  --end normal_funct;

end RAM_RW;     