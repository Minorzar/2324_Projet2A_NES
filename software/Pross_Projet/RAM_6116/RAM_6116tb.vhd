library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_6116tb is 
end RAM_6116tb;

architecture R_6116 of RAM_6116tb is
    signal CS: std_logic;
    signal WE: std_logic;
    signal OE: std_logic;
    signal iAdress: unsigned(10 downto 0);
    signal iodata: unsigned(7 downto 0);


    signal finished : boolean := false;
    constant CLK_PERIOD: time := 5 ns;

begin
    RAM : entity work.RAM_6116
    port map(
        CS=>CS,
        WE=>WE,
        OE=>OE,
        i_Adress=>iAdress,
        io_data=>iodata
    );

    benche : process
        begin
                WE<='1';
                OE<='0';
            wait for 3* CLK_PERIOD;
                iodata<=to_unsigned(00010011,8);
                iAdress<=to_unsigned(0000000001,10);
            wait for 3* CLK_PERIOD;
                iodata<=to_unsigned(00010011,8);
                iAdress<=to_unsigned(0000000010,10);
            wait for 3* CLK_PERIOD;
                WE<='1';
            wait for 3* CLK_PERIOD;
                iodata<=to_unsigned(00010011,8);
                iAdress<=to_unsigned(0000000011,10);
            wait for 3* CLK_PERIOD;
                WE<='0';
                iAdress<=to_unsigned(0000000010,10);
            wait for 3* CLK_PERIOD;
                 OE<='1';
             wait for 3* CLK_PERIOD;
                iAdress<=to_unsigned(0000000001,10);

    end process benche;

    p_clk: process
    begin 
         while (finished =false) loop
            CS<='0';
            wait for CLK_PERIOD/2;
            CS<='1';
            wait for CLK_PERIOD/2;
        end loop ; -- identifier
    end process p_clk;

end R_6116 ; -- R_6116