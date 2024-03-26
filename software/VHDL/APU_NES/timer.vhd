library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Timer is
    generic (
        TIMER_WIDTH : integer := 11   -- Width of the timer value
    );
    Port (
        i_clk     : in  std_logic;    -- System clock input
        i_reset   : in  std_logic;    -- Reset input
        i_load    : in  std_logic;    -- Load input
        i_timer   : in  std_logic_vector(TIMER_WIDTH - 1 downto 0); -- Input for timer value
        o_timer   : out std_logic;    -- Timer output
        o_carry   : out std_logic     -- Carry output when timer resets
    );
end Timer;

architecture Behavioral of Timer is
    signal timer_reg  : std_logic_vector(TIMER_WIDTH - 1 downto 0);
    signal carry_reg  : std_logic;

begin

    process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            timer_reg <= (others => '0');
            carry_reg <= '0';
        elsif rising_edge(i_clk) then
            if i_load = '1' then
                timer_reg <= i_timer;
                carry_reg <= '0';
            else
                if timer_reg = "00000000000" then  -- Check if timer reached zero
                    timer_reg <= i_timer;
                    carry_reg <= '1';  -- Set carry out signal
                else
                    timer_reg <= timer_reg - "1";
                    carry_reg <= '0';
                end if;
            end if;
        end if;
    end process;

    o_timer <= '1' when timer_reg = "00000000000" else '0'; -- Timer output high when timer is zero
    o_carry <= carry_reg;  -- Carry out signal assignment

end Behavioral;