library ieee;
use ieee.std_logic_1164.all;

entity CPU_test_execution_tb is
end CPU_test_execution_tb;

architecture tb of CPU_test_execution_tb is

    component CPU_test_execution
        port (i_clk              : in std_logic;
              i_ir5              : in std_logic;
              dl_to_db           : in std_logic;
              dl_to_adl          : in std_logic;
              dl_to_adh          : in std_logic;
              O_to_adh0          : in std_logic;
              O_to_adh1_7        : in std_logic;
              adh_to_abh         : in std_logic;
              adl_to_abl         : in std_logic;
              pcl_to_pcl         : in std_logic;
              adl_to_pcl         : in std_logic;
              i_to_pc            : in std_logic;
              pcl_to_db          : in std_logic;
              pcl_to_adl         : in std_logic;
              pch_to_pch         : in std_logic;
              adh_to_pch         : in std_logic;
              pch_to_db          : in std_logic;
              pch_to_adh         : in std_logic;
              sb_to_adh          : in std_logic;
              sb_to_db           : in std_logic;
              O_to_adl0          : in std_logic;
              O_to_adl1          : in std_logic;
              O_to_adl2          : in std_logic;
              s_to_adl           : in std_logic;
              sb_to_s            : in std_logic;
              s_to_s             : in std_logic;
              s_to_sb            : in std_logic;
              db_bar_to_add      : in std_logic;
              db_to_add          : in std_logic;
              adl_to_add         : in std_logic;
              i_to_addc          : in std_logic;
              sum_select         : in std_logic;
              and_select         : in std_logic;
              eor_select         : in std_logic;
              or_select          : in std_logic;
              shift_right_select : in std_logic;
              add_to_adl         : in std_logic;
              add_to_sb_0_6      : in std_logic;
              add_to_sb_7        : in std_logic;
              O_to_add           : in std_logic;
              sb_to_add          : in std_logic;
              sb_to_ac           : in std_logic;
              ac_to_db           : in std_logic;
              ac_to_sb           : in std_logic;
              sb_to_x            : in std_logic;
              x_to_sb            : in std_logic;
              sb_to_y            : in std_logic;
              y_to_sb            : in std_logic;
              p_to_db            : in std_logic;
              db0_to_c           : in std_logic;
              ir5_to_c           : in std_logic;
              acr_to_c           : in std_logic;
              db1_to_z           : in std_logic;
              dbz_to_z           : in std_logic;
              db2_to_i           : in std_logic;
              ir5_to_i           : in std_logic;
              db3_to_d           : in std_logic;
              ir5_to_d           : in std_logic;
              db6_to_v           : in std_logic;
              avr_to_v           : in std_logic;
              i_to_v             : in std_logic;
              O_to_v             : in std_logic;
              db7_to_n           : in std_logic;
              o_address_bus      : out std_logic_vector (15 downto 0);
              i_data_bus         : in std_logic_vector (7 downto 0);
              o_data_bus         : out std_logic_vector (7 downto 0));
    end component;

    signal i_clk              : std_logic;
    signal i_ir5              : std_logic;
    signal dl_to_db           : std_logic;
    signal dl_to_adl          : std_logic;
    signal dl_to_adh          : std_logic;
    signal O_to_adh0          : std_logic;
    signal O_to_adh1_7        : std_logic;
    signal adh_to_abh         : std_logic;
    signal adl_to_abl         : std_logic;
    signal pcl_to_pcl         : std_logic;
    signal adl_to_pcl         : std_logic;
    signal i_to_pc            : std_logic;
    signal pcl_to_db          : std_logic;
    signal pcl_to_adl         : std_logic;
    signal pch_to_pch         : std_logic;
    signal adh_to_pch         : std_logic;
    signal pch_to_db          : std_logic;
    signal pch_to_adh         : std_logic;
    signal sb_to_adh          : std_logic;
    signal sb_to_db           : std_logic;
    signal O_to_adl0          : std_logic;
    signal O_to_adl1          : std_logic;
    signal O_to_adl2          : std_logic;
    signal s_to_adl           : std_logic;
    signal sb_to_s            : std_logic;
    signal s_to_s             : std_logic;
    signal s_to_sb            : std_logic;
    signal db_bar_to_add      : std_logic;
    signal db_to_add          : std_logic;
    signal adl_to_add         : std_logic;
    signal i_to_addc          : std_logic;
    signal sum_select         : std_logic;
    signal and_select         : std_logic;
    signal eor_select         : std_logic;
    signal or_select          : std_logic;
    signal shift_right_select : std_logic;
    signal add_to_adl         : std_logic;
    signal add_to_sb_0_6      : std_logic;
    signal add_to_sb_7        : std_logic;
    signal O_to_add           : std_logic;
    signal sb_to_add          : std_logic;
    signal sb_to_ac           : std_logic;
    signal ac_to_db           : std_logic;
    signal ac_to_sb           : std_logic;
    signal sb_to_x            : std_logic;
    signal x_to_sb            : std_logic;
    signal sb_to_y            : std_logic;
    signal y_to_sb            : std_logic;
    signal p_to_db            : std_logic;
    signal db0_to_c           : std_logic;
    signal ir5_to_c           : std_logic;
    signal acr_to_c           : std_logic;
    signal db1_to_z           : std_logic;
    signal dbz_to_z           : std_logic;
    signal db2_to_i           : std_logic;
    signal ir5_to_i           : std_logic;
    signal db3_to_d           : std_logic;
    signal ir5_to_d           : std_logic;
    signal db6_to_v           : std_logic;
    signal avr_to_v           : std_logic;
    signal i_to_v             : std_logic;
    signal O_to_v             : std_logic;
    signal db7_to_n           : std_logic;
    signal o_address_bus      : std_logic_vector (15 downto 0);
    signal i_data_bus         : std_logic_vector (7 downto 0);
    signal o_data_bus         : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 100 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '1';
    signal TbSimEnded : std_logic := '0';

begin

    dut : CPU_test_execution
    port map (i_clk              => i_clk,
              i_ir5              => i_ir5,
              dl_to_db           => dl_to_db,
              dl_to_adl          => dl_to_adl,
              dl_to_adh          => dl_to_adh,
              O_to_adh0          => O_to_adh0,
              O_to_adh1_7        => O_to_adh1_7,
              adh_to_abh         => adh_to_abh,
              adl_to_abl         => adl_to_abl,
              pcl_to_pcl         => pcl_to_pcl,
              adl_to_pcl         => adl_to_pcl,
              i_to_pc            => i_to_pc,
              pcl_to_db          => pcl_to_db,
              pcl_to_adl         => pcl_to_adl,
              pch_to_pch         => pch_to_pch,
              adh_to_pch         => adh_to_pch,
              pch_to_db          => pch_to_db,
              pch_to_adh         => pch_to_adh,
              sb_to_adh          => sb_to_adh,
              sb_to_db           => sb_to_db,
              O_to_adl0          => O_to_adl0,
              O_to_adl1          => O_to_adl1,
              O_to_adl2          => O_to_adl2,
              s_to_adl           => s_to_adl,
              sb_to_s            => sb_to_s,
              s_to_s             => s_to_s,
              s_to_sb            => s_to_sb,
              db_bar_to_add      => db_bar_to_add,
              db_to_add          => db_to_add,
              adl_to_add         => adl_to_add,
              i_to_addc          => i_to_addc,
              sum_select         => sum_select,
              and_select         => and_select,
              eor_select         => eor_select,
              or_select          => or_select,
              shift_right_select => shift_right_select,
              add_to_adl         => add_to_adl,
              add_to_sb_0_6      => add_to_sb_0_6,
              add_to_sb_7        => add_to_sb_7,
              O_to_add           => O_to_add,
              sb_to_add          => sb_to_add,
              sb_to_ac           => sb_to_ac,
              ac_to_db           => ac_to_db,
              ac_to_sb           => ac_to_sb,
              sb_to_x            => sb_to_x,
              x_to_sb            => x_to_sb,
              sb_to_y            => sb_to_y,
              y_to_sb            => y_to_sb,
              p_to_db            => p_to_db,
              db0_to_c           => db0_to_c,
              ir5_to_c           => ir5_to_c,
              acr_to_c           => acr_to_c,
              db1_to_z           => db1_to_z,
              dbz_to_z           => dbz_to_z,
              db2_to_i           => db2_to_i,
              ir5_to_i           => ir5_to_i,
              db3_to_d           => db3_to_d,
              ir5_to_d           => ir5_to_d,
              db6_to_v           => db6_to_v,
              avr_to_v           => avr_to_v,
              i_to_v             => i_to_v,
              O_to_v             => O_to_v,
              db7_to_n           => db7_to_n,
              o_address_bus      => o_address_bus,
              i_data_bus         => i_data_bus,
              o_data_bus         => o_data_bus);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        i_ir5 <= '0';
        dl_to_db <= '0';
        dl_to_adl <= '0';
        dl_to_adh <= '0';
        O_to_adh0 <= '0';
        O_to_adh1_7 <= '0';
        adh_to_abh <= '0';
        adl_to_abl <= '0';
        pcl_to_pcl <= '0';
        adl_to_pcl <= '0';
        i_to_pc <= '0';
        pcl_to_db <= '0';
        pcl_to_adl <= '0';
        pch_to_pch <= '0';
        adh_to_pch <= '0';
        pch_to_db <= '0';
        pch_to_adh <= '0';
        sb_to_adh <= '0';
        sb_to_db <= '0';
        O_to_adl0 <= '0';
        O_to_adl1 <= '0';
        O_to_adl2 <= '0';
        s_to_adl <= '0';
        sb_to_s <= '0';
        s_to_s <= '0';
        s_to_sb <= '0';
        db_bar_to_add <= '0';
        db_to_add <= '0';
        adl_to_add <= '0';
        i_to_addc <= '0';
        sum_select <= '0';
        and_select <= '0';
        eor_select <= '0';
        or_select <= '0';
        shift_right_select <= '0';
        add_to_adl <= '0';
        add_to_sb_0_6 <= '0';
        add_to_sb_7 <= '0';
        O_to_add <= '0';
        sb_to_add <= '0';
        sb_to_ac <= '0';
        ac_to_db <= '0';
        ac_to_sb <= '0';
        sb_to_x <= '0';
        x_to_sb <= '0';
        sb_to_y <= '0';
        y_to_sb <= '0';
        p_to_db <= '0';
        db0_to_c <= '0';
        ir5_to_c <= '0';
        acr_to_c <= '0';
        db1_to_z <= '0';
        dbz_to_z <= '0';
        db2_to_i <= '0';
        ir5_to_i <= '0';
        db3_to_d <= '0';
        ir5_to_d <= '0';
        db6_to_v <= '0';
        avr_to_v <= '0';
        i_to_v <= '0';
        O_to_v <= '0';
        db7_to_n <= '0';
        i_data_bus <= (others => '0');

        -- EDIT Add stimuli here
		  
		  wait for TbPeriod;
		  O_to_adh0 <= '1';
		  wait for TbPeriod;
		  O_to_adh1_7 <= '1';
		  wait for TbPeriod;
		  O_to_adh0 <= '0';

	
		  wait for 10 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;