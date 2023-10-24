library ieee;
use ieee.std_logic_1164.all; 

entity Test_multidata is port (

    data: in std_logic_vector(15 downto 0);
    selector: in std_logic_vector(15 downto 0);
    data_corrected: out std_logic_vector(15 downto 0)
);
end Test_multidata;

architecture Test_multidata_rt1 of Test_multidata is
    begin 
    process(data,selector)
    begin
        for k in 0 to 15 loop
            if (selector(k)='1') then
                if data(k)='1' then
                    data_corrected(k) <= '0';
                else 
                    data_corrected(k) <= '1';
                end if;
            else 
            data_corrected(k)<= data(k);
            end if;
        end loop;
    end process;
        
end Test_multidata_rt1;