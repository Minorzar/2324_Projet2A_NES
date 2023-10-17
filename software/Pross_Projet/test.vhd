library ieee;
use ieee.std_logic_1164.all;

entity monComposant is port (
    a: in std_logic;
    b: in std_logic;
    Q: out std_logic
);
end monComposant;

-- std_logic est juste une un booléen 

architecture monComposant_rtl of monComposant is 
begin 
    Q<= a and b;
end monComposant_rtl;   

-- une architecture ne dépend seulement que d'une entré et d'une sortie 
