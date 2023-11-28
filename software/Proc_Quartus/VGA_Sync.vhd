library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_Sync is
    Port(
        i_clk25   : in std_logic;
        i_reset   : in std_logic;
        o_hs      : out std_logic;
        o_vs      : out std_logic;
        o_inDisp  : out std_logic;
        o_x       : out std_logic_vector(9 downto 0);
        o_y       : out std_logic_vector(9 downto 0)
    );
end VGA_Sync;

architecture behavioral of VGA_Sync is
    signal sEN       : std_logic;
    signal sdispH    : std_logic;
    signal sdispV    : std_logic;
    signal sVS   : std_logic;
    signal sHS   : std_logic;
    signal rx    : std_logic_vector(9 downto 0);
    signal ry    : std_logic_vector(9 downto 0);

begin
    u1 : entity work.H_sync
        port map (i_clk25 => i_clk25, i_reset => i_reset, o_cnt_y_enable => sEN, o_hs => shs, o_inDispH => sdispH, o_x_value => rx);
    u2 : entity work.V_sync
        port map (i_clk25 => i_clk25, i_reset => i_reset, i_cnt_y_enable => sEN, o_vs => svs, o_inDispV => sdispV, o_y_value => ry);

    o_hs <= sHS;
    o_vs <= sVS;
    o_inDisp <= (sdispH and sdispV);
    o_x <= rx;
    o_y <= ry;

end behavioral;