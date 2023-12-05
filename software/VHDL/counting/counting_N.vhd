library ieee;
use ieee.std_logic_1164.all;

entity counting_N is
generic (
    N: integer
);
port (
    clk : in std_logic;
    reset : in std_logic;
    -- toujours un reset pour remettre le systeme dans un état connu
    ce: in std_logic;   -- count enabke
    
    ceo: out std_logic  -- count enable output
);
end counting_N;

architecture counting_N_rt1 of counting_N is 
    -- unsigned (c'est comme un std_logic_vector, mais sur lequel on a le droit de faire des oprétaios arithmétiques)
    -- ON A PAS LE DROIT DE FAIRE DES OPERATIONS SUR UN STD_LOGIC_VECTOR!!!!
    -- a : in unsigned (7 downto 0)
    -- b : in unsigned (7 downto 0)
    -- q : out unsigned (7 downto 0)
    
    -- archi
    -- signal a9, b9, q9 : unsigned(8 downto 0);
    -- begin
    -- a9 (7 downto 0) <= a;
    -- a (8) <= '0';
    -- q9 <= a9 + b9;  
    -- overflow <= q9(8);
    signal counter : integer range 0 to N-1;
begin
    counting : process (clk, reset) -- liste de sensibilité (signaux qui "déclenchent" le process)
    begin
        if (reset = '1') then
            counter <= 0;
        elsif(rising_edge(clk)) then
            if (ce = '1') then
                if (counter = N - 1) then
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process counting;

    ceo <= '1' when (counter = N-1) else '0';
end counting_N_rt1;