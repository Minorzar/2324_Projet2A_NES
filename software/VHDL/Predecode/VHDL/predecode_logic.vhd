-- predecode_logic.vhdl
--
-- This VHDL module implements predecode logic.
--
-- Entity:
--   predecode_logic
--
-- Ports:
--   - i_clk: Input clock signal for latch signals
--   - i_assert_interrupt_control_n: Input assert interrupt control signal
--   - i_fetch: Input fetch instruction signal
--   - i_predecoded_instruction: Input predecoded instruction (8 bits) from predecode_register
--   - o_instruction: Output instruction (8 bits) to instruction_register
--   - o_is_two_cycle_opcode: Output signal indicating a two-cycle opcode (active low)
--   - o_implied: Output signal indicating an opcode with implied addressing
--
-- Description:
--   The predecode logic block has three main functions:
--   1) Indicate if an opcode is one cycle via the implied output
--   2) Indicate if an opcode is two cycles via the o_is_two_cycle_opcode output
--   3) Pass the opcode to the instruction register or pass all zeros if clear_ir is high.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_logic is
    Port (
        i_clk : in STD_LOGIC;										-- Clock signal for latch signals
        i_assert_interrupt_control_n : in STD_LOGIC;				-- Assert interrupt control signal
        i_fetch : in STD_LOGIC;										-- Fetch instruction signal
        i_predecoded_instruction : in STD_LOGIC_VECTOR(7 downto 0);	-- Input predecoded instruction from predecode_register
        o_instruction : out STD_LOGIC_VECTOR(7 downto 0);			-- Output instruction to instruction_register
        o_is_two_cycle_opcode : out STD_LOGIC;						-- Output signal indicating a two-cycle opcode (active low)
        o_implied : out STD_LOGIC									-- Output signal indicating an opcode with implied addressing
    );
end predecode_logic;

architecture Behavioral of predecode_logic is
    signal s_clear_ir : STD_LOGIC;
    signal s_is_two_cycle_opcode : STD_LOGIC;
    signal s_implied : STD_LOGIC;
begin
    -- Clear the instruction if either aic_n or clear is active; otherwise pass the predecoded register data
    s_clear_ir <= not (i_assert_interrupt_control_n and i_fetch);
    o_instruction <= (others => '0') when s_clear_ir = '1' else i_predecoded_instruction;

    -- Implied is active for implied instructions which are equal to the mask xxxxx10x0.
    -- Implied instructions have no operands and last for two cycles.
    s_implied <= i_predecoded_instruction(3) and not i_predecoded_instruction(2) and not i_predecoded_instruction(0);

    -- is_two_cycle_opcode is active for two-cycle opcodes
    s_is_two_cycle_opcode <= not (
        (not i_predecoded_instruction(4) and i_predecoded_instruction(3) and not i_predecoded_instruction(2) and i_predecoded_instruction(0)) or
        (i_predecoded_instruction(7) and not i_predecoded_instruction(4) and not i_predecoded_instruction(3) and not i_predecoded_instruction(2) and not i_predecoded_instruction(0)) or
        (s_implied and not (not i_predecoded_instruction(7) and not i_predecoded_instruction(4) and i_predecoded_instruction(3) and not i_predecoded_instruction(2) and not i_predecoded_instruction(1) and not i_predecoded_instruction(0)))
    );

    -- Output signals
    o_is_two_cycle_opcode <= s_is_two_cycle_opcode;
    o_implied <= s_implied;

end Behavioral;
