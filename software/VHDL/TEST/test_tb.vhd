library ieee;
use ieee.std_logic_1164.all;

entity test_tb is
end test_tb;
-- cette partie est vide car l'on crée un objet vituelle qui n'a que pour but d'etre testé afin de voir si notre composent fonction

architecture testbench of test_tb is

    signal tb_a: std_logic;
    signal tb_b: std_logic;
    signal tb_Q: std_logic; 

-- on crée trois signal qui va nous permettre de testé en donnant des entré qui vont etre celle que nous choisions 

begin  
    monComposant_0 : entity work.monComposant  
    --initialisation du composant vituelle 
        port map (
            -- ATTRIBUTION des entré vituelle aux signaux que nous générons !!!! ATTENTION a est maintenant lier a jamais a tb_a et si la valeur de tb_a change 
            -- celle de a change aussi
            a => tb_a,
            b => tb_b,  
            Q => tb_Q
        );

    p_testbench : process
    -- initialisation de la fonction qui va avoir pour but de faire le teste
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
    end process p_testbench;
end testbench;   
