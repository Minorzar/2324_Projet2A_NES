library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity chip_74LS139 is
port(

    -- First Part

    i_Addr13    : in std_logic;
    i_Addr14    : in std_logic;

    o_RAMSEL    : out std_logic;
    o_DBE       : out std_logic;

    -- Second Part

    i_clkout    : in std_logic;
    i_Addr15    : in std_logic;

    o_ROMSEL    : out std_logic

);
end chip_74LS139;

architecture Structural of chip_74LS139 is
signal JP : std_logic;
begin

decoder1 : entity work.decode 
port map(
    i_en => JP,

    i_Addr_0 => i_Addr13,
    i_Addr_1 => i_Addr14,

    o_enable_0 => o_RAMSEL,
    o_enable_1 => o_DBE 

);

decoder2 : entity work.decode 
port map(
    i_en => '0',

    i_Addr_0 => i_clkout,
    i_Addr_1 => i_Addr15,

    o_enable_1 => JP,
    o_enable_3 => o_ROMSEL 

);
end architecture Structural;