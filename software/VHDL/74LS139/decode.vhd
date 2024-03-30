library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode is
port(

    i_en    : in std_logic;

    i_Addr_0 : in std_logic;
    i_Addr_1 : in std_logic;

    o_enable_0 : out std_logic;
    o_enable_1 : out std_logic;
    o_enable_2 : out std_logic;
    o_enable_3 : out std_logic
);
end decode;

architecture Dataflow of decode is

begin
    o_enable_0 <= i_en or i_Addr_0 or i_Addr_1;
    o_enable_1 <= i_en or not i_Addr_0 or i_Addr_1;
    o_enable_2 <= i_en or i_Addr_0 or not i_Addr_1;
    o_enable_3 <= i_en or not i_Addr_0 or not i_Addr_1;
end architecture Dataflow;