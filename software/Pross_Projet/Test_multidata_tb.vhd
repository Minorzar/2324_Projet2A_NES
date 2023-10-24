library ieee;
use ieee.std_logic_1164.all;

entity Test_multidata_tb is
end Test_multidata_tb;

architecture Test_multidata_tb_rt1 of Test_multidata_tb is 

    signal tb_data: std_logic_vector(15 downto 0);
    signal tb_selector: std_logic_vector(15 downto 0);
    signal tb_data_corrected: std_logic_vector(15 downto 0);


begin 
    Tester : entity work.Test_multidata 
    port map(
        data => tb_data,
        selector => tb_selector,
        data_corrected => tb_data_corrected

    );

Test_TIME : process

begin 
    tb_data <= "0000000000000000";
    tb_selector <= "0000000000000000";

    wait for 10 ns;

    tb_data <= "0000000000000000";
    tb_selector <= "0000001000000000";

    wait for 10 ns;

    tb_data <= "1100001000000010";
    tb_selector <= "0000000000000000";

    wait for 10 ns;

    tb_data <= "1100001000000010";
    tb_selector <= "0011111100000000";

    wait for 10 ns;
    wait;
    end process Test_TIME;
end Test_multidata_tb_rt1;