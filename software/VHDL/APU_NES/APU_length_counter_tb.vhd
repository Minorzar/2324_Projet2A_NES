library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity APU_length_counter_tb is
end APU_length_counter_tb;

architecture testbench of APU_length_counter_tb is
    constant CLK_PERIOD : time := 10 ns; -- Define your clock period here
    
    signal Si_clk : std_logic := '0';
    signal Si_length_counter_en : std_logic := '0';
    signal Si_frame_counter : std_logic := '0';
    signal Si_halt_flag : std_logic := '0';
    signal Si_counter_load : std_logic_vector(4 downto 0) := (others => '0');
    signal So_enabler : std_logic;

begin

    -- Instantiate the APU_length_counter component
    UUT : entity work.APU_length_counter
        port map (
            i_length_counter_en => Si_length_counter_en,
            i_frame_counter => Si_frame_counter,
            i_clk => Si_clk,
            i_halt_flag => Si_halt_flag,
            i_counter_load => Si_counter_load,
            o_enabler => So_enabler
        );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop  -- Simulate for 1000 ns
            Si_clk <= '0';
            wait for CLK_PERIOD / 2;
            Si_clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1
        Si_length_counter_en <= '1';
        Si_frame_counter <= '0';
        Si_halt_flag <= '0';
        Si_counter_load <= "11111";
        wait for 10 ns;
        
        -- Test case 2
        Si_length_counter_en <= '0';
        Si_frame_counter <= '1';
        Si_halt_flag <= '0';
        Si_counter_load <= "11111";
        wait for 10 ns;
        
        -- Test case 3
        Si_length_counter_en <= '1';
        Si_frame_counter <= '0';
        Si_halt_flag <= '1';
        Si_counter_load <= "00000";
        wait for 10 ns;
        
        -- Add more test cases as needed
        
        wait;
    end process stimulus_process;

end testbench;