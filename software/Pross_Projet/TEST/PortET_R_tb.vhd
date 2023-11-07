library ieee;
use ieee.std_logic_1164.all;

entity PortET_R_tb is
end PortET_R_tb;

architecture PortET_R_rt1_bench of PortET_R_tb is 

   signal tb_a: std_logic;
   signal  tb_b: std_logic;
   signal  tb_Q: std_logic;
   signal tb_R: std_logic;



begin
    PortET_R : entity work.PortET_R
    port map (
        a => tb_a,
        b => tb_a, 
        Q => tb_Q,
        R => tb_R

    );
 
bench : process
begin 
tb_a <= '0';
tb_b <= '0';

wait for 10 ns;

tb_a <= '1';
tb_b <= '0';

wait for 10 ns;

tb_a <= '0';
tb_b <= '1';

wait for 10 ns;

tb_a <= '1';
tb_b <= '1';

wait for 10 ns;
wait;
end process bench;

end PortET_R_rt1_bench;