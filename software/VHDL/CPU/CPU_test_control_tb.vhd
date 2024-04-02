library ieee;
use ieee.std_logic_1164.all;

entity CPU_test_control_tb is
end CPU_test_control_tb;

architecture tb of CPU_test_control_tb is

    component CPU_test_control
        port (i_clk                : in std_logic;
              i_irq                : in std_logic;
              i_nmi                : in std_logic;
              i_ready              : in std_logic;
              i_reset              : in std_logic;
              i_set_overflow       : in std_logic;
              i_db7                : in std_logic;
              i_acr                : in std_logic;
              i_p_register_out     : in std_logic_vector (7 downto 0);
              o_read_write         : out std_logic;
              i_data_bus           : in std_logic_vector (7 downto 0);
              o_sync               : out std_logic;
              o_dl_to_db           : out std_logic;
              o_dl_to_adl          : out std_logic;
              o_dl_to_adh          : out std_logic;
              o_O_to_adh0          : out std_logic;
              o_O_to_adh1_7        : out std_logic;
              o_adh_to_abh         : out std_logic;
              o_adl_to_abl         : out std_logic;
              o_pcl_to_pcl         : out std_logic;
              o_adl_to_pcl         : out std_logic;
              o_i_to_pc            : out std_logic;
              o_pcl_to_db          : out std_logic;
              o_pcl_to_adl         : out std_logic;
              o_pch_to_pch         : out std_logic;
              o_adh_to_pch         : out std_logic;
              o_pch_to_db          : out std_logic;
              o_pch_to_adh         : out std_logic;
              o_sb_to_adh          : out std_logic;
              o_sb_to_db           : out std_logic;
              o_s_to_adl           : out std_logic;
              o_sb_to_s            : out std_logic;
              o_s_to_s             : out std_logic;
              o_s_to_sb            : out std_logic;
              o_db_bar_to_add      : out std_logic;
              o_db_to_add          : out std_logic;
              o_adl_to_add         : out std_logic;
              o_i_to_addc          : out std_logic;
              o_sum_select         : out std_logic;
              o_and_select         : out std_logic;
              o_eor_select         : out std_logic;
              o_or_select          : out std_logic;
              o_shift_right_select : out std_logic;
              o_add_to_adl         : out std_logic;
              o_add_to_sb_0_6      : out std_logic;
              o_add_to_sb_7        : out std_logic;
              o_O_to_add           : out std_logic;
              o_sb_to_add          : out std_logic;
              o_sb_to_ac           : out std_logic;
              o_ac_to_db           : out std_logic;
              o_ac_to_sb           : out std_logic;
              o_sb_to_x            : out std_logic;
              o_x_to_sb            : out std_logic;
              o_sb_to_y            : out std_logic;
              o_y_to_sb            : out std_logic;
              o_p_to_db            : out std_logic;
              o_db0_to_c           : out std_logic;
              o_ir5_to_c           : out std_logic;
              o_acr_to_c           : out std_logic;
              o_db1_to_z           : out std_logic;
              o_dbz_to_z           : out std_logic;
              o_db2_to_i           : out std_logic;
              o_ir5_to_i           : out std_logic;
              o_db3_to_d           : out std_logic;
              o_ir5_to_d           : out std_logic;
              o_db6_to_v           : out std_logic;
              o_avr_to_v           : out std_logic;
              o_0_to_v             : out std_logic;
              o_1_to_v             : out std_logic;
              o_db7_to_n           : out std_logic);
    end component;

    signal i_clk                : std_logic;
    signal i_irq                : std_logic;
    signal i_nmi                : std_logic;
    signal i_ready              : std_logic;
    signal i_reset              : std_logic;
    signal i_set_overflow       : std_logic;
    signal i_db7                : std_logic;
    signal i_acr                : std_logic;
    signal i_p_register_out     : std_logic_vector (7 downto 0);
    signal o_read_write         : std_logic;
    signal i_data_bus           : std_logic_vector (7 downto 0);
    signal o_sync               : std_logic;
    signal o_dl_to_db           : std_logic;
    signal o_dl_to_adl          : std_logic;
    signal o_dl_to_adh          : std_logic;
    signal o_O_to_adh0          : std_logic;
    signal o_O_to_adh1_7        : std_logic;
    signal o_adh_to_abh         : std_logic;
    signal o_adl_to_abl         : std_logic;
    signal o_pcl_to_pcl         : std_logic;
    signal o_adl_to_pcl         : std_logic;
    signal o_i_to_pc            : std_logic;
    signal o_pcl_to_db          : std_logic;
    signal o_pcl_to_adl         : std_logic;
    signal o_pch_to_pch         : std_logic;
    signal o_adh_to_pch         : std_logic;
    signal o_pch_to_db          : std_logic;
    signal o_pch_to_adh         : std_logic;
    signal o_sb_to_adh          : std_logic;
    signal o_sb_to_db           : std_logic;
    signal o_s_to_adl           : std_logic;
    signal o_sb_to_s            : std_logic;
    signal o_s_to_s             : std_logic;
    signal o_s_to_sb            : std_logic;
    signal o_db_bar_to_add      : std_logic;
    signal o_db_to_add          : std_logic;
    signal o_adl_to_add         : std_logic;
    signal o_i_to_addc          : std_logic;
    signal o_sum_select         : std_logic;
    signal o_and_select         : std_logic;
    signal o_eor_select         : std_logic;
    signal o_or_select          : std_logic;
    signal o_shift_right_select : std_logic;
    signal o_add_to_adl         : std_logic;
    signal o_add_to_sb_0_6      : std_logic;
    signal o_add_to_sb_7        : std_logic;
    signal o_O_to_add           : std_logic;
    signal o_sb_to_add          : std_logic;
    signal o_sb_to_ac           : std_logic;
    signal o_ac_to_db           : std_logic;
    signal o_ac_to_sb           : std_logic;
    signal o_sb_to_x            : std_logic;
    signal o_x_to_sb            : std_logic;
    signal o_sb_to_y            : std_logic;
    signal o_y_to_sb            : std_logic;
    signal o_p_to_db            : std_logic;
    signal o_db0_to_c           : std_logic;
    signal o_ir5_to_c           : std_logic;
    signal o_acr_to_c           : std_logic;
    signal o_db1_to_z           : std_logic;
    signal o_dbz_to_z           : std_logic;
    signal o_db2_to_i           : std_logic;
    signal o_ir5_to_i           : std_logic;
    signal o_db3_to_d           : std_logic;
    signal o_ir5_to_d           : std_logic;
    signal o_db6_to_v           : std_logic;
    signal o_avr_to_v           : std_logic;
    signal o_0_to_v             : std_logic;
    signal o_1_to_v             : std_logic;
    signal o_db7_to_n           : std_logic;

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '1';
    signal TbSimEnded : std_logic := '0';

begin

    dut : CPU_test_control
    port map (i_clk                => i_clk,
              i_irq                => i_irq,
              i_nmi                => i_nmi,
              i_ready              => i_ready,
              i_reset              => i_reset,
              i_set_overflow       => i_set_overflow,
              i_db7                => i_db7,
              i_acr                => i_acr,
              i_p_register_out     => i_p_register_out,
              o_read_write         => o_read_write,
              i_data_bus           => i_data_bus,
              o_sync               => o_sync,
              o_dl_to_db           => o_dl_to_db,
              o_dl_to_adl          => o_dl_to_adl,
              o_dl_to_adh          => o_dl_to_adh,
              o_O_to_adh0          => o_O_to_adh0,
              o_O_to_adh1_7        => o_O_to_adh1_7,
              o_adh_to_abh         => o_adh_to_abh,
              o_adl_to_abl         => o_adl_to_abl,
              o_pcl_to_pcl         => o_pcl_to_pcl,
              o_adl_to_pcl         => o_adl_to_pcl,
              o_i_to_pc            => o_i_to_pc,
              o_pcl_to_db          => o_pcl_to_db,
              o_pcl_to_adl         => o_pcl_to_adl,
              o_pch_to_pch         => o_pch_to_pch,
              o_adh_to_pch         => o_adh_to_pch,
              o_pch_to_db          => o_pch_to_db,
              o_pch_to_adh         => o_pch_to_adh,
              o_sb_to_adh          => o_sb_to_adh,
              o_sb_to_db           => o_sb_to_db,
              o_s_to_adl           => o_s_to_adl,
              o_sb_to_s            => o_sb_to_s,
              o_s_to_s             => o_s_to_s,
              o_s_to_sb            => o_s_to_sb,
              o_db_bar_to_add      => o_db_bar_to_add,
              o_db_to_add          => o_db_to_add,
              o_adl_to_add         => o_adl_to_add,
              o_i_to_addc          => o_i_to_addc,
              o_sum_select         => o_sum_select,
              o_and_select         => o_and_select,
              o_eor_select         => o_eor_select,
              o_or_select          => o_or_select,
              o_shift_right_select => o_shift_right_select,
              o_add_to_adl         => o_add_to_adl,
              o_add_to_sb_0_6      => o_add_to_sb_0_6,
              o_add_to_sb_7        => o_add_to_sb_7,
              o_O_to_add           => o_O_to_add,
              o_sb_to_add          => o_sb_to_add,
              o_sb_to_ac           => o_sb_to_ac,
              o_ac_to_db           => o_ac_to_db,
              o_ac_to_sb           => o_ac_to_sb,
              o_sb_to_x            => o_sb_to_x,
              o_x_to_sb            => o_x_to_sb,
              o_sb_to_y            => o_sb_to_y,
              o_y_to_sb            => o_y_to_sb,
              o_p_to_db            => o_p_to_db,
              o_db0_to_c           => o_db0_to_c,
              o_ir5_to_c           => o_ir5_to_c,
              o_acr_to_c           => o_acr_to_c,
              o_db1_to_z           => o_db1_to_z,
              o_dbz_to_z           => o_dbz_to_z,
              o_db2_to_i           => o_db2_to_i,
              o_ir5_to_i           => o_ir5_to_i,
              o_db3_to_d           => o_db3_to_d,
              o_ir5_to_d           => o_ir5_to_d,
              o_db6_to_v           => o_db6_to_v,
              o_avr_to_v           => o_avr_to_v,
              o_0_to_v             => o_0_to_v,
              o_1_to_v             => o_1_to_v,
              o_db7_to_n           => o_db7_to_n);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_irq <= '0';
        i_nmi <= '0';
        i_ready <= '1';
        i_reset <= '0';
        i_set_overflow <= '0';
        i_db7 <= '0';
        i_acr <= '0';
        i_p_register_out <= (others => '0');
        i_data_bus <= x"EA";

        -- EDIT Add stimuli here
		  
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;
end tb;