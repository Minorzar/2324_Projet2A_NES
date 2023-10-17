library ieee;
use ieee.std_logic_1164.all;

entity test_tb is
end test_tb;

architecture TEST_ZORD of counting_tb is 

    signal First_oder: std_logic;
    signal clk : std_logic ;
    signal ceo1 : std_logic;
    signal ceo2 : std_logic;
    signal OUT_COMP :std_logic;
    signal RESET : std_logic;

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


benche : process

begin
    First_oder<='1';
    ceo2<='0';
    for k in 0 to 10000 loop
        if (mod(k,2)= 0) then

        else

        end if;
        

            First_oder<='1';
            clk<=mod(k);
            wait for 10 ns ;
            if (k = 6969)
            wait for 100 ns ;
            end if;
    end loop;
end process;



end TEST_ZORD;