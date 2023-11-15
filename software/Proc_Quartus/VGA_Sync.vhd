library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_Sync is
    Port(
        clk25   : in std_logic;
        reset   : in std_logic;
        hs      : out std_logic;
        vs      : out std_logic;
        inDisp  : out std_logic;
        x       : out std_logic_vector(9 downto 0);
        y       : out std_logic_vector(9 downto 0)
    );
end VGA_Sync;

architecture behavioral of VGA_Sync is
    signal EN       : std_logic;
    signal dispH    : std_logic;
    signal dispV    : std_logic;
    signal VS_sig   : std_logic;
    signal HS_sig   : std_logic;
    signal x_val    : std_logic_vector(9 downto 0);
    signal y_val    : std_logic_vector(9 downto 0);

begin
    u1 : entity work.H_sync
        port map (clk25 => clk25, reset => reset, cnt_y_enable => EN, H_S => HS_sig, inDispH => dispH, x_value => x_val);
    u2 : entity work.V_sync
        port map (clk25 => clk25, reset => reset, cnt_y_enable => EN, V_S => VS_sig, inDispV => dispV, y_value => y_val);

    hs <= HS_sig;
    vs <= VS_sig;
    inDisp <= (dispH and dispV);
    x <= x_val;
    y <= y_val;

end behavioral;