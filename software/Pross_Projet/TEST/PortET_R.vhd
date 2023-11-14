library ieee;
use ieee.std_logic_1164.all;

entity PortET_R is port (
    a: in std_logic;
    b: in std_logic;
    Q: out std_logic;
    R: out std_logic
);
end PortET_R;

architecture PortET_R_rt1 of PortET_R is 
begin
    Q<= a and b;
    R_value : process
    begin if (a /= '0') and ((a and b) /='0') then 
             R<='1';
        else R<='0';
        end if;
    end process R_value;
end PortET_R_rt1;