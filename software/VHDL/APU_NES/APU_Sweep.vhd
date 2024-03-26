library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity APU_Sweep is
    Port (
        i_clk : in STD_LOGIC;  -- Clock input
        i_enabled : in  STD_LOGIC;
        i_divider_period : in  STD_LOGIC_VECTOR (2 downto 0);
        i_negate_flag : in  STD_LOGIC;
        i_shift_count : in  STD_LOGIC_VECTOR (2 downto 0);
        i_current_period : in  STD_LOGIC_VECTOR (10 downto 0);
        i_reload_flag : in  STD_LOGIC;
        i_frame_clock : in  STD_LOGIC;  -- Frame clock input
        i_half_frame_clock : in  STD_LOGIC;  -- Half-frame clock input
        i_channel_muted : in  STD_LOGIC;
        o_target_period : out STD_LOGIC_VECTOR (10 downto 0);
        o_mute_channel : buffer STD_LOGIC
    );
end entity APU_Sweep;

architecture Behavioral of APU_Sweep is
    signal target_period_calc : signed(10 downto 0);

begin

    -- Sweep logic process
    sweep_logic : process(i_clk)  -- Sensitivity to i_clk
        variable change_amount : signed(10 downto 0);
    begin
        if rising_edge(i_clk) then  -- Check for rising edge of i_clk
            change_amount := resize(shift_right(signed(i_current_period), to_integer(unsigned(i_shift_count))), change_amount'length);

            if i_negate_flag = '1' then
                change_amount := -change_amount;
            end if;
            
            target_period_calc <= signed(i_current_period) + change_amount;
        end if;
    end process sweep_logic;

    -- Mute logic process
    mute_logic : process(i_clk)  -- Sensitivity to i_clk
    begin
        if rising_edge(i_clk) then  -- Check for rising edge of i_clk
            if to_integer(unsigned(i_current_period)) < 8 or 
               to_integer(target_period_calc) > 2047 or
               i_channel_muted = '1' then
                o_mute_channel <= '1';
            else
                o_mute_channel <= '0';
            end if;
        end if;
    end process mute_logic;

    -- Update period process
    update_period : process(i_clk)  -- Sensitivity to i_clk
    begin
        if rising_edge(i_clk) then  -- Check for rising edge of i_clk
            if (i_divider_period = "000" and i_enabled = '1' and i_shift_count /= "000" and o_mute_channel = '0') then
                o_target_period <= std_logic_vector(target_period_calc);
            elsif (i_divider_period = "000" or i_reload_flag = '1') then
                o_target_period <= i_current_period;
            end if;
        end if;
    end process update_period;

end architecture Behavioral;