library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counting_tb is
end counting_tb;

architecture TEST_ZORD of counting_tb is 

    signal First_oder: std_logic;
    signal clk : std_logic ;
    signal ceo1 : std_logic;
    signal ceo2 : std_logic;
    signal OUT_COMP :std_logic;
    signal RESET : std_logic;

    constant CLK_PERIOD : time := 10 ns;
    signal finished : boolean := false;
begin 
    count_640 : entity work.counting_N
    generic map (
        N => 640
    )
    port map (
        clk => clk,
        reset => RESET,
        ce => OUT_COMP,
        ceo => ceo1
    );

    count_480 : entity work.counting_N
    generic map (
        N => 480
    )
    port map (
        clk => clk,
        reset => RESET,
        ce => ceo1,
        ceo => ceo2
    );


    Retroaction : entity work.comparater
    port map(
        ORDER => First_oder,
        Retro_action =>ceo2,
        changed =>OUT_COMP
    );


p_clk : process
begin
    while (finished = false) loop
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end loop;
    wait;
end process;

benche : process
begin
    First_oder<='1';
    ceo2<='0';

    wait for 3 * CLK_PERIOD;

    finished <= true;
    wait;
end process benche;



end TEST_ZORD;