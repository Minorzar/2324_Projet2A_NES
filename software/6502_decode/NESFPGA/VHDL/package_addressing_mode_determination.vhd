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
--
-- Work in progress:
--		- Implied
--		- JSR

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package package_addressing_mode_determination is
	subtype t_instruction is STD_LOGIC_VECTOR(7 downto 0);

	function f_determine_addressing_mode(i_instruction : t_instruction) return string;

end package package_addressing_mode_determination;

package body package_addressing_mode_determination is

	function f_determine_addressing_mode(i_instruction : t_instruction) return string is
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
						return "(ZP,X)";
					when "001" =>
						return "ZP";
					when "010" =>
						return "IMM";
					when "011" =>
						return "ABS";
					when "100" =>
						return "(ZP),Y";
					when "101" =>
						return "ZP,X";
					when "110" =>
						return "ABS,Y";
					when "111" =>
						return "ABS,X";
					when others =>
						return "UNKNOWN";
				end case; -- End of case with cc = 01 instructions

			-- Instructions with cc = 10
			when "10" =>
				case s_bbb is
					when "000" =>
						return "IMM";
					when "001" =>
						return "ZP";
					when "010" =>
						return "ACC";
					when "011" =>
						return "ABS";
					when "101" =>
						return "ZP,X";
					when "111" =>
						return "ABS,X";
					when others =>
						return "UNKNOWN";
				end case; -- End of case with cc = 10 instructions

			-- Instructions with cc = 00
			when "00" =>
				case s_bbb is
					when "000" =>
						return "IMM";
					when "001" =>
						return "ZP";
					when "011" =>
						return "ABS";
					when "101" =>
						return "ZP,X";
					when "111" =>
						return "ABS,X";
					when others =>
						return "UNKNOWN";
				end case; -- End of case with cc = 00 instructions

			-- Instructions with cc = 11
			when others =>
				return "UNKNOWN";
		end case; -- End of case with aaabbbcc instructions

	end function f_determine_addressing_mode;

end package body package_addressing_mode_determination;
