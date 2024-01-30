-- predecode_logic.vhdl
--
-- This VHDL module implements predecode logic.
--
-- Description:
--	The predecode logic block has three main functions:
--	1) Indicate if an opcode is one cycle via the implied output
--	2) Indicate if an opcode is two cycles via the o_is_two_cycle_opcode output
--	3) Pass the opcode to the instruction register or pass all zeros if clear_ir is high.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode_logic is
	Port (
		i_clk : in std_logic;									-- Clock signal for latch signals
		i_assert_interrupt_control : in std_logic;				-- Assert interrupt control signal
		i_fetch : in std_logic;									-- Fetch instruction signal
		i_pr_instruction : in std_logic_vector(7 downto 0);		-- Input instruction from predecode_register
		o_pl_instruction : out std_logic_vector(7 downto 0);	-- Output predecoded instruction to instruction_register
		o_implied : out std_logic								-- Output signal indicating an opcode with implied addressing
		o_is_two_cycle_opcode : out std_logic;					-- Output signal indicating a two-cycle opcode (active low)
	);
end predecode_logic;

architecture Behavioral of predecode_logic is
	signal s_ir_clear: std_logic;								-- Signal to control clearing of the instruction register
	signal s_mask_xxxx10x0: std_logic;							-- Mask to identify instructions with the pattern xxxx10x0
	signal s_mask_xxx010x1: std_logic;							-- Mask to identify instructions with the pattern xxx010x1
	signal s_mask_1xx000x0: std_logic;							-- Mask to identify instructions with the pattern 1xx000x0
	signal s_mask_0xx01000: std_logic;							-- Mask to identify instructions with the pattern 0xx01000
	signal s_implied: std_logic;								-- Signal indicating instructions with implied addressing mode
	signal s_two_cycle_opcode: std_logic;						-- Signal indicating two-cycle opcodes
begin
	-- Clear the instruction if either aic_n or clear is active; otherwise pass the predecode register data
	s_ir_clear <= not (i_assert_interrupt_control and i_fetch);
	
	-- Conditional assignment of predecoded instruction
	process(i_pr_instruction, s_ir_clear)
	begin
		if s_ir_clear = '1' then
			o_pl_instruction <= (others => '0');
		else
			o_pl_instruction <= i_pr_instruction;
		end if;
	end process;

	-- Masks generation for different instruction patterns
	
	-- s_mask_xxxx10x0 <= i_pr_instruction(3) and not i_pr_instruction(2) and not i_pr_instruction(0);
	s_mask_xxxx10x0 <= (
		-- cc = 10 instructions
		i_pr_instruction = x"0A" or		-- 00001010 (ASL, A)
		i_pr_instruction = x"2A" or		-- 00101010 (ROL, A)
		i_pr_instruction = x"4A" or		-- 01001010 (LSR, A)
		i_pr_instruction = x"6A" or		-- 01101010 (ROR, A)

		-- Single-byte instructions
		i_pr_instruction = x"08" or		-- 00001000 (PHP)
		i_pr_instruction = x"28" or		-- 00101000 (PLP)
		i_pr_instruction = x"48" or		-- 01001000 (PHA)
		i_pr_instruction = x"68" or		-- 01101000 (PLA)
		i_pr_instruction = x"88" or		-- 10001000 (DEY)
		i_pr_instruction = x"A8" or		-- 10101000 (TAY)
		i_pr_instruction = x"C8" or		-- 11001000 (INY)
		i_pr_instruction = x"E8" or		-- 11101000 (INX)

		i_pr_instruction = x"18" or		-- 00011000 (CLC)
		i_pr_instruction = x"38" or		-- 00111000 (SEC)
		i_pr_instruction = x"58" or		-- 01011000 (CLI)
		i_pr_instruction = x"78" or		-- 01111000 (SEI)
		i_pr_instruction = x"98" or		-- 10011000 (TYA)
		i_pr_instruction = x"B8" or		-- 10111000 (CLV)
		i_pr_instruction = x"D8" or		-- 11011000 (CLD)
		i_pr_instruction = x"F8" or		-- 11111000 (SED)

		i_pr_instruction = x"8A" or		-- 10001010 (TXA)
		i_pr_instruction = x"9A" or		-- 10011010 (TXS)
		i_pr_instruction = x"AA" or		-- 10101010 (TAX)
		i_pr_instruction = x"BA" or		-- 10111010 (TSX)
		i_pr_instruction = x"CA" or		-- 11001010 (DEX)
		i_pr_instruction = x"EA" or		-- 11101010 (NOP)

		-- Additional 65C02 Instructions
		-- i_pr_instruction = x"1A" or	-- 00011010 (INC A)
		-- i_pr_instruction = x"3A" or	-- 00111010 (DEC A)
		-- i_pr_instruction = x"5A" or	-- 01011010 (PHY)
		-- i_pr_instruction = x"7A" or	-- 01111010 (PLY)
		-- i_pr_instruction = x"DA" or	-- 11011010 (PHX)
		-- i_pr_instruction = x"FA";	-- 11111010 (PLX)
	)

	-- s_mask_xxx010x1 <= not i_pr_instruction(4) and i_pr_instruction(3) and not i_pr_instruction(2) and i_pr_instruction(0);
	s_mask_xxx010x1 <= (
		-- cc = 01 instructions
		i_pr_instruction = x"09" or		-- 00001001 (ORA, #)
		i_pr_instruction = x"29" or		-- 00101001 (AND, #)
		i_pr_instruction = x"49" or		-- 01001001 (EOR, #)
		i_pr_instruction = x"69" or		-- 01101001 (ADC, #)
		i_pr_instruction = x"A9" or		-- 10101001 (LDA, #)
		i_pr_instruction = x"C9" or		-- 11001001 (CMP, #)
		i_pr_instruction = x"E9" or		-- 11101001 (SBC, #)

		-- Additional 65C02 Instructions
		-- i_pr_instruction = x"89" or	-- 10001001 (BIT)

		-- Additional 65C816 Instructions
		-- i_pr_instruction = x"0B" or	-- 00001011 (PHD)
		-- i_pr_instruction = x"2B" or	-- 00101011 (PLD)
		-- i_pr_instruction = x"4B" or	-- 01001011 (PHK)
		-- i_pr_instruction = x"6B" or	-- 01101011 (RTL)
		-- i_pr_instruction = x"8B" or	-- 10001011 (PHB)
		-- i_pr_instruction = x"AB" or	-- 10101011 (PLB)
		-- i_pr_instruction = x"CB" or	-- 11001011 (WAI)
		-- i_pr_instruction = x"EB";	-- 11101011 (XBA)
	)

	-- s_mask_1xx000x0 <= i_pr_instruction(7) and not i_pr_instruction(4) and not i_pr_instruction(3) and not i_pr_instruction(2) and not i_pr_instruction(0);
	s_mask_1xx000x0 <= (
		-- cc = 10 instructions
		i_pr_instruction = x"A2" or		-- 10100010 (LDX, #)

		-- cc = 00 instructions
		i_pr_instruction = x"A0" or		-- 10100000 (LDY, #)
		i_pr_instruction = x"C0" or		-- 11000000 (CPY, #)
		i_pr_instruction = x"E0" or		-- 11100000 (CPX, #)

		-- Additional 65C02 Instructions
		-- i_pr_instruction = x"80" or	-- 10000000 (BRA)

		-- Additional 65C816 Instructions
		-- i_pr_instruction = x"82" or	-- 10000010 (BRL rl)
		-- i_pr_instruction = x"C2" or	-- 11000010 (REP #)
		-- i_pr_instruction = x"E2";	-- 11100010 (SEP #)
	)

	-- s_mask_0xx01000 <= not ir(7) and not ir(4) and ir(3) and not ir(2) and not ir(1) and not ir(0);
	s_mask_0xx01000 <= (
		i_pr_instruction = x"08" or		-- 00001000 (PHP)
		i_pr_instruction = x"28" or		-- 00101000 (PLP)
		i_pr_instruction = x"48" or		-- 01001000 (PHA)
		i_pr_instruction = x"68";		-- 01101000 (PLA)
	)

	-- Implied instructions have no operands and last for two cycles.
	s_implied <= s_mask_xxxx10x0 and not s_mask_0xx01000;

	-- is_two_cycle_opcode is active for two-cycle opcodes
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			s_two_cycle_opcode <= (s_mask_xxx010x1 or s_mask_1xx000x0 or s_implied);
		end if;
	end process;

	-- Output signals
	o_implied <= s_implied;
	o_is_two_cycle_opcode <= s_two_cycle_opcode;

end Behavioral;
