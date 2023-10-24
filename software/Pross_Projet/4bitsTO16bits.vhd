library ieee;
use ieee.std_logic_1164.all;

entity 4bitsTO16bits is 
port(

    data0: in std_logic_vector(3 downto 0),
    data1: in std_logic_vector(3 downto 0),
    data2: in std_logic_vector(3 downto 0),
    data3: in std_logic_vector(3 downto 0),
    Conca: out std_logic_vector(15 downto 0)


);
end 4bitsTO16bits;

architecture 4bitsTO16bits_rt1 of 4bitsTO16bits is 
    Conca<= data0 & data1 & data2 & data3;

--    Conca(3 downto 0) <= data0;
--    Conca(7 downto 4) <= data1;
--    ...

end 4bitsTO16bits_rt1;
