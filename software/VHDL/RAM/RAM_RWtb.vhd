library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_RWtb is 
end RAM_RWtb;

architecture FirstRAM of RAM_RWtb is 


-- benche variable 
constant CLK_PERIOD : time := 5 ns;
signal finished : boolean := false;


-- composent signal
signal clk : std_logic;
signal iwena: std_logic;
signal idata: unsigned(7 downto 0);
signal odata: unsigned(7 downto 0);
signal iaddress: unsigned(15 downto 0);
begin
    RAMbeta : entity work.RAM_RW
    port map(
        clk => clk,
        i_wenable=>iwena,
        i_data =>idata,
        i_address=>iaddress,
        o_data=>odata

    );

benche : process
begin 
    wait for 10* CLK_PERIOD;
    idata<=to_unsigned(00010011,8);
    iaddress<=to_unsigned(0000000000000001,16);
    iwena<='1';
    wait for 15* CLK_PERIOD;
    idata<=to_unsigned(00010011,8);
    iaddress<=to_unsigned(0000000000000110,16);
    iwena<='1';
    wait for 2* CLK_PERIOD;
    iwena<='0';
    wait for 2* CLK_PERIOD;
    iaddress<=to_unsigned(0000000000000001,16);

    wait for 10 * CLK_PERIOD;

    finished <= true;
    wait;

end process benche;




p_clk: process
begin
    while(finished = false )loop
        clk<='0';
        wait for CLK_PERIOD/2;
        clk <='1';
        wait for CLK_PERIOD/2;
    end loop;
    wait;
end process p_clk;

end FirstRAM;