-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 30.3.2024 15:04:03 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_frame_counter is
end tb_frame_counter;

architecture tb of tb_frame_counter is

    component frame_counter
        port (i_en_seq : in std_logic;
              i_reset  : in std_logic;
              i_clk    : in std_logic;
              o_IRQ    : out std_logic;
              o_L      : out std_logic;
              o_enable : out std_logic);
    end component;

    signal i_en_seq : std_logic;
    signal i_reset  : std_logic;
    signal i_clk    : std_logic;
    signal o_IRQ    : std_logic;
    signal o_L      : std_logic;
    signal o_enable : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : frame_counter
    port map (i_en_seq => i_en_seq,
              i_reset  => i_reset,
              i_clk    => i_clk,
              o_IRQ    => o_IRQ,
              o_L      => o_L,
              o_enable => o_enable);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_en_seq <= '0';

        -- Reset generation
        -- EDIT: Check that i_reset is really your reset signal
        i_reset <= '1';
        wait for 100 ns;
        i_reset <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_frame_counter of tb_frame_counter is
    for tb
    end for;
end cfg_tb_frame_counter;