library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_6116tb is 
end RAM_6116tb;

architecture R_6116 of RAM_6116tb is
    signal CS: std_logic;
    signal WE: std_logic;
    signal OE: std_logic;
    signal clk: std_logic;
    signal iAdress: unsigned(10 downto 0);
    signal iodata: unsigned(7 downto 0);


    signal finished : boolean := false;
    constant CLK_PERIOD: time := 5 ns;

begin
    RAM : entity work.RAM_6116
    port map(
        CS_n=>CS,
        WE_n=>WE,
        OE_n=>OE,
        i_Adress=>iAdress,
        io_data=>iodata,
        clk=>clk
    );

    benche : process
    -- quand on s'attend pas recesoir un donnée on doit ce mettre en Z
        begin
                
                WE<='1';
                OE<='1';
                CS<='1';
                iodata<="ZZZZZZZZ";
            --    iodata <= (others => 'Z');
            wait for 3* CLK_PERIOD;
                iAdress<="00000000001";
            wait for 3* CLK_PERIOD;
                CS<='0';
                iodata<="ZZZZZZZZ" ;
                iAdress<="00000000010";


            wait for 3* CLK_PERIOD;
                --write begin
                WE<='0';
            wait for 3* CLK_PERIOD;
                iodata<="00010011";
                iAdress<="00000000001";
            wait for 3* CLK_PERIOD;
                --read 
                WE<='1';
                iAdress<="00000000010";
                iodata <= (others => 'Z');
            wait for 3* CLK_PERIOD;
                 OE<='0';
            wait for 3* CLK_PERIOD;
                iAdress<="00000000001";
            wait for 3* CLK_PERIOD;
                finished <= true;
            wait;
    end process benche;

    p_clk: process
    begin 
         while (finished =false) loop
            clk<='0';
            wait for CLK_PERIOD/2;
            clk<='1';
            wait for CLK_PERIOD/2;
        end loop ; -- identifier
        wait;
    end process p_clk;

end R_6116 ; -- R_6116