-- predecode_register.vhd
--
-- This VHDL module implements a predecode register.
--
-- Entity:
--   predecode_register
--
-- Ports:
--   - i_clk: Input clock signal
--   - i_reset: Input reset signal
--   - i_databus: Input data bus (8 bits)
--   - o_instruction: Output predecoded instruction (8 bits)
--
-- Description:
--   The predecode register captures the input data bus value on the rising edge of the clock signal.
--   The captured value is stored in an internal buffer and provided as the predecoded instruction on the output.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_register is
    Port (
        i_clk : in STD_LOGIC;                             -- Clock signal
        i_reset : in STD_LOGIC;                           -- Reset signal
        i_databus : in STD_LOGIC_VECTOR(7 downto 0);      -- Input data bus
        o_instruction : out STD_LOGIC_VECTOR(7 downto 0)  -- Output predecoded instruction
    );
end predecode_register;

architecture Behavioral of predecode_register is
    signal s_captured_instruction : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    -- Main process
    process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            -- Reset the buffer to all zeros
            s_captured_instruction <= (others => '0');
        elsif rising_edge(i_clk) then
            -- Load the buffer with data from the data bus
            s_captured_instruction <= i_databus;
        end if;
    end process;

    -- Output the buffer
    o_instruction <= s_captured_instruction;

end Behavioral;
