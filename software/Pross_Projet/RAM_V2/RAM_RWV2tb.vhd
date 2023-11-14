library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RWV2tb is 
end RAM_RWV2tb;

architecture SecondRAM of RAM_RWV2tb is 
constant CLK_PERIOD: time := 5 ns;
signal finished : boolean := false;

--composent signal 
signal clk : std_logic;
signal iwena: std_logic;
signal idata1: unsigned(7 downto 0);
signal idata2: unsigned(7 downto 0);
signal odata: unsigned(15 downto 0);
signal iaddress: unsigned(15 downto 0);


begin 
    RAM : entity work.RAM_RWV2
    port map(
        clk=>clk,
        i_wenable=>iwena,
        i_data1=>idata1,
        i_data2=>idata2,
        i_adress=>iaddress,
        o_data=>odata
    );

    benche : process
    begin 
        wait for 10* CLK_PERIOD;
        idata1<=to_unsigned(00010011,8);
        idata2<=to_unsigned(00000000,8);
        iaddress<=to_unsigned(0000000000000001,16);
        iwena<='1';
        wait for 10* CLK_PERIOD;
        idata1<=to_unsigned(00000001,8);
        --iaddress<=to_unsigned(0001001100000000,16); problem out of bound 
        iaddress<=to_unsigned(0000000000010011,16);
        iwena<='1';
        wait for 10* CLK_PERIOD;
        idata1<=to_unsigned(00000000,8);
        idata2<=to_unsigned(00010011,8);
        iaddress<=to_unsigned(0000000000000000,16);
        iwena<='0';
        wait for 10 * CLK_PERIOD;
        idata1<=to_unsigned(00000000,8);
        idata2<=to_unsigned(00000001,8);
        wait for 10 * CLK_PERIOD;

        finished <= true;
        wait;

    end process benche;

    p_clk: process
    begin 
        while(finished =false) loop
            clk<='0';
            wait for CLK_PERIOD/2;
            clk<='1';
            wait for CLK_PERIOD/2;
        end loop;
            wait;
    end process p_clk;

end SecondRAM;

