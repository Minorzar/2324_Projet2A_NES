library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity APU_linear_counter_tb is
end APU_linear_counter_tb;

architecture tb_arch of APU_linear_counter_tb is

    -- Component declaration for the unit under test (UUT)
    component APU_linear_counter
        port (
            i_linear_counter_en : in STD_LOGIC;
            i_clk : in STD_LOGIC;
            i_halt_flag : in STD_LOGIC;
            o_enabler : out STD_LOGIC;
            i_counter_load : in STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    end component;

    -- Clock period definitions
    constant clk_period : time := 10 ns;

    -- Signals for the testbench
    signal tb_clk : STD_LOGIC := '0';
    signal tb_linear_counter_en : STD_LOGIC := '0';
    signal tb_halt_flag : STD_LOGIC := '0';
    signal tb_counter_load : STD_LOGIC_VECTOR(4 DOWNTO 0) := (others => '0');
    signal tb_enabler : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: APU_linear_counter
    port map (
        i_linear_counter_en => tb_linear_counter_en,
        i_clk => tb_clk,
        i_halt_flag => tb_halt_flag,
        o_enabler => tb_enabler,
        i_counter_load => tb_counter_load
    );

    -- Clock process
    tb_clk_process: process
    begin
        while now < 1000 ns loop  -- Run the simulation for 1000 ns
            tb_clk <= not tb_clk;
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        tb_linear_counter_en <= '0';
        tb_halt_flag <= '0';
        tb_counter_load <= "00000";

        -- Wait for a few clock cycles
        wait for clk_period * 5;

        -- Enable the linear counter
        tb_linear_counter_en <= '1';

        -- Load a counter value
        tb_counter_load <= "11111";
        wait for clk_period * 10;

        -- Load another counter value
        tb_counter_load <= "11011";
        wait for clk_period * 10;

        -- Disable the linear counter
        tb_linear_counter_en <= '0';
        wait for clk_period * 5;

        -- Enable the linear counter again
        tb_linear_counter_en <= '1';
        wait for clk_period * 10;

        -- Add more test scenarios here if needed

        wait;
    end process;

end tb_arch;