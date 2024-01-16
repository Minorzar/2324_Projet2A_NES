library ieee;
use ieee.std_logic_1164.all;

entity clock_N is 

generic(
    N:integer;
);

port (
    value: out std_logic
);
end clock_N;

architecture clock_N_rt1 of clock_N is 
begin 
    for k in 0 to 10000 loop
        if(mod(k,2)=1)
            value<=1;
        else value <=0;
        end if;
    end loop;
end clock_N_rt1;