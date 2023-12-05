library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RW_2T is 


port(

    clk: in std_logic;
    i_wenable_1: in std_logic;
    i_wenable_2: in std_logic;

    --DATA part 1
    i_data1_1: in unsigned(7 downto 0);
    i_data1_2: in unsigned(7 downto 0);
    i_adress1: in unsigned(15 downto 0);
    o_data1: out unsigned(15 downto 0);

    --DATA part 2
    i_data2_1: in unsigned(7 downto 0);
    i_data2_2: in unsigned(7 downto 0);
    i_adress2: in unsigned(15 downto 0);
    o_data2: out unsigned(15 downto 0)

);
end RAM_RW_2T;

architecture RAM_RW_2T_rtf of RAM_RW_2T is
    subtype DATA is unsigned(7 downto 0);
    type MEMORY is array (2**15 downto 0) of DATA;
    signal RAM: MEMORY;
begin
    purpose : process(clk)
    begin 
        if(rising_edge(clk)) then 
            --Case if try to write in the same place
            if(i_adress1=i_adress2)then 
                if(i_wenable_1='1')then
                    if(i_wenable_2='1')then
                        RAM(to_integer(i_adress1))<=i_data1_1;
                        o_data1<=i_adress1;
                    end if;
                end if;
            end if;

            -- Case where you try to read and write at the same time
            if (i_adress1=(i_data2_1 & i_data2_2))then
                if(i_wenable_1='1')then 
                    o_data2<=to_unsigned(00000000,8) & RAM(to_integer(i_data2_1 & i_data2_2));
                    RAM(to_integer(i_adress1))<=i_data1_1;
                    o_data1<=i_adress1;
                end if;
            end if;

            if (i_adress2=(i_data1_1 & i_data1_2))then
                if(i_wenable_2='1')then 
                    o_data1<=to_unsigned(00000000,8) & RAM(to_integer(i_data1_1 & i_data1_2));
                    RAM(to_integer(i_adress2))<=i_data2_1;
                    o_data2<=i_adress2;
                end if;
            end if;




            --Normal functionment 

            if(i_wenable_1='1')then 
                RAM(to_integer(i_adress1))<=i_data1_1;
                o_data1<=i_adress1;
            else
                o_data1<=to_unsigned(00000000,8) & RAM(to_integer(i_data1_1 & i_data1_2));
            end if;
            

            
            if(i_wenable_2='1')then 
                RAM(to_integer(i_adress2))<=i_data2_1;
                o_data2<=i_adress2;
            else
            o_data2<=to_unsigned(00000000,8) & RAM(to_integer(i_data2_1 & i_data2_2));
            end if;


        end if ;
    end process purpose;
end RAM_RW_2T_rtf;