library ieee;
use ieee.std_logic_1164.all;

entity comparater is port (
    ORDER: in std_logic;
    Retro_action: in std_logic;
    changed: out std_logic

);
end comparater;

architecture comparater_rt1 of comparater is
begin
    changed <= ORDER and (not Retro_action);
end comparater_rt1;