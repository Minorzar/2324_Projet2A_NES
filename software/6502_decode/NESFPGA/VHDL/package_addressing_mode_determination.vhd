-- package_addressing_mode_determination.vhd
--
-- This VHDL package provides functions to determine the addressing mode for 6502 processor instructions.
--
-- Package Contents:
--		- t_instruction: Subtype representing the instruction as a STD_LOGIC_VECTOR(7 downto 0).
--		- f_determine_addressing_mode: Function to determine the addressing mode for a given instruction.
--
-- Example Usage:
--		- Call the function f_determine_addressing_mode with the instruction to get the corresponding addressing mode.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package package_addressing_mode_determination is
	subtype t_instruction is STD_LOGIC_VECTOR(7 downto 0);

	function f_determine_addressing_mode(i_instruction : t_instruction) return string;

end package package_addressing_mode_determination;

package body package_addressing_mode_determination is

	function f_determine_addressing_mode(i_instruction : t_instruction) return string is
		variable l_result : string := "UNKNOWN";			-- Default value
		variable s_bbb : STD_LOGIC_VECTOR(2 downto 0);
		variable s_cc : STD_LOGIC_VECTOR(1 downto 0);
	begin
		-- Extract bbb, and cc bits from aaabbbcc
		s_bbb := i_instruction(4 downto 2);
		s_cc := i_instruction(1 downto 0);

		-- Determine addressing mode for aaabbbcc instructions
		case s_cc is
			-- Instructions with cc = 01
			when "01" =>
				case s_bbb is
					when "000" =>
						l_result := "(ZP,X)";
					when "001" =>
						l_result := "ZP";
					when "010" =>
						l_result := "IMM";
					when "011" =>
						l_result := "ABS";
					when "100" =>
						l_result := "(ZP),Y";
					when "101" =>
						l_result := "ZP,X";
					when "110" =>
						l_result := "ABS,Y";
					when "111" =>
						l_result := "ABS,X";
					when others =>
						null;
				end case; -- End of case with cc = 01 instructions

			-- Instructions with cc = 10
			when "10" =>
				case s_bbb is
					when "000" =>
						l_result := "IMM";
					when "001" =>
						l_result := "ZP";
					when "010" =>
						l_result := "ACC";
					when "011" =>
						l_result := "ABS";
					when "101" =>
						l_result := "ZP,X";
					when "111" =>
						l_result := "ABS,X";
					when others =>
						null;
				end case; -- End of case with cc = 10 instructions

			-- Instructions with cc = 00
			when "00" =>
				case s_bbb is
					when "000" =>
						l_result := "IMM";
					when "001" =>
						l_result := "ZP";
					when "011" =>
						l_result := "ABS";
					when "101" =>
						l_result := "ZP,X";
					when "111" =>
						l_result := "ABS,X";
					when others =>
						null;
				end case; -- End of case with cc = 00 instructions

			-- Instructions with cc = 11
			when others =>
				null;
		end case; -- End of case with aaabbbcc instructions

		-- Determine addressing mode for xxy10000 instructions
		if (i_instruction(4 downto 0) = "10000") then
			l_result := "REL";			-- Relative (Branch based on flag comparison)
		end if; -- End of case with xxy10000 instructions

		-- Determine addressing mode for other single-byte instructions
		case i_instruction is
			when x"00" =>
				l_result := "IMP";		-- Break
			when x"20" =>
				l_result := "ABS";		-- Jump to Subroutine (absolute)
			when x"40" =>
				l_result := "IMP";		-- Return from Interrupt
			when x"60" =>
				l_result := "IMP";		-- Return from Subroutine
			when x"08" =>
				l_result := "IMP";		-- Push Processor Status
			when x"28" =>
				l_result := "IMP";		-- Pull Processor Status
			when x"48" =>
				l_result := "IMP";		-- Push Accumulator
			when x"68" =>
				l_result := "IMP";		-- Pull Accumulator
			when x"88" =>
				l_result := "IMP";		-- Decrement Y Register
			when x"A8" =>
				l_result := "IMP";		-- Transfer Accumulator to Y
			when x"C8" =>
				l_result := "IMP";		-- Increment Y Register
			when x"E8" =>
				l_result := "IMP";		-- Increment X Register
			when x"18" =>
				l_result := "IMP";		-- Clear Carry Flag
			when x"38" =>
				l_result := "IMP";		-- Set Carry Flag
			when x"58" =>
				l_result := "IMP";		-- Clear Interrupt Disable
			when x"78" =>
				l_result := "IMP";		-- Set Interrupt Disable
			when x"98" =>
				l_result := "IMP";		-- Transfer Y to Accumulator
			when x"B8" =>
				l_result := "IMP";		-- Clear Overflow Flag
			when x"D8" =>
				l_result := "IMP";		-- Clear Decimal Mode
			when x"F8" =>
				l_result := "IMP";		-- Set Decimal Mode
			when x"8A" =>
				l_result := "IMP";		-- Transfer X to Accumulator
			when x"9A" =>
				l_result := "IMP";		-- Transfer X to Stack Pointer
			when x"AA" =>
				l_result := "IMP";		-- Transfer Accumulator to X
			when x"BA" =>
				l_result := "IMP";		-- Transfer Stack Pointer to X
			when x"CA" =>
				l_result := "IMP";		-- Decrement X Register
			when x"EA" =>
				l_result := "IMP";		-- No Operation
			when others =>
				null;
		end case; -- End of case with other single-byte instructions

		return l_result;
	end function f_determine_addressing_mode;

end package body package_addressing_mode_determination;
