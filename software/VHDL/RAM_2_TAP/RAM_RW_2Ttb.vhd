library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity RAM_RW_2Ttb is 
end RAM_RW_2Ttb; 




architecture RAM_RW_2Ttb_rtf of RAM_RW_2Ttb is

    --CONSTANT
    constant CLK_PERIOD : time :=5 ns;
    signal finished : boolean := false;

    --composent signal
    signal clk : std_logic;

    signal iwena1: std_logic;
    signal iwena2: std_logic;

    signal idata11: unsigned(7 downto 0);
    signal idata12: unsigned(7 downto 0);

    signal idata21: unsigned(7 downto 0);
    signal idata22: unsigned(7 downto 0);

    signal odata1: unsigned(7 downto 0);
    signal odata2: unsigned(7 downto 0);

    signal iaddress1 : unsigned(15 downto 0);
    signal iaddress2 : unsigned(15 downto 0);

begin
    RAM2P : entity work.RAM_RW_2T
    port map(
      clk => clk,
      iwena1=> i_wenable_1,
      iwena2=> i_wenable_2,

      idata11=> i_data1_1,
      idata12=> i_data1_2,
      idata21=> i_data2_1,
      idata22=> i_data2_2,

      odata1=>o_data1,
      odata2=>o_data2,

      iaddress1=>i_adress1,
      iaddress2=>i_adress2

    );

    benche : process 
    begin 
        wait for 10* CLK_PERIOD;
        idata11<=to_unsigned(00010011,8);
        idata12<=to_unsigned(00000000,8);
        iaddress1<=to_unsigned(0000000000000001,16);
        iwena1<='1';
        idata21<=to_unsigned(00010011,8);
        idata22<=to_unsigned(00000000,8);
        iaddress2<=to_unsigned(0000000000000010,16);
        iwena2<='1';
        wait for 2* CLK_PERIOD;



    end process benche;

    p_clk: process
    begin 
        while (finished =false) loop 
            clk<='0';
            wait for CLK_PERIOD/2;
            clk<='1';
            wait for CLK_PERIOD/2;
        end loop;
            wait;

    end process p_clk;



    
end RAM_RW_2Ttb_rtf;