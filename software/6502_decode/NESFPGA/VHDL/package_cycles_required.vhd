-- package_cycles_required.vhd
--
-- This VHDL package provides functions to determine the number of cycles required for 6502 processor instructions.
--
-- Package Contents:
--	 - t_instruction: Subtype representing the instruction as a STD_LOGIC_VECTOR(7 downto 0).
--	 - t_opcode_mnemonic: Type representing the mnemonic of the opcode.
--	 - t_addressing_mode: Type representing the addressing mode as a string.
--	 - f_determine_cycles_required: Function to determine the number of cycles required for a given instruction.
--
-- Example Usage:
--	 - Call the function f_determine_cycles_required with the instruction, opcode mnemonic, and addressing mode.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.package_opcode_determination.ALL;
use work.package_addressing_mode_determination.ALL;

package package_cycles_required is
	subtype t_instruction is STD_LOGIC_VECTOR(7 downto 0);
	type t_opcode_mnemonic is string(1 to 8);
	type t_addressing_mode is string(1 to 15);

	function f_determine_cycles_required(i_instruction : t_instruction; i_mnemonic : t_opcode_mnemonic; i_mode : t_addressing_mode) return natural;

end package package_cycles_required;

package body package_cycles_required is

	function f_determine_cycles_required(i_instruction : t_instruction; i_mnemonic : t_opcode_mnemonic; i_mode : t_addressing_mode) return natural is
		variable s_cycles : natural := 2;

		-- Determine cycles required based on mnemonic and addressing mode
		case i_mnemonic is
			-- Implied
			when "BRK" => s_cycles := 7;
			when "PHA" | "PHP" => s_cycles := 3;
			when "PLA" | "PLP" => s_cycles := s_cycles + 2;
			when "RTI" | "RTS" => s_cycles := s_cycles + 4;

			-- JSR is a special case for absolute addressing mode
			when "JSR" => s_cycles := s_cycles + 2;

			-- Read-Modify-Write
			when "ASL" | "DEC" | "INC" | "LSR" | "ROL" | "ROR" => s_cycles := s_cycles + 2;
			
			when others =>
				case i_mode is
					when "IMP"		=> null;
					when "IMM"		=> s_cycles := 2;
					when "ACC"		=> s_cycles := 2;
					when "ZP"		=> s_cycles := s_cycles + 1;
					when "ZP,X"		=> s_cycles := s_cycles + 2;
					when "ZP,Y"		=> s_cycles := s_cycles + 2;
					when "ABS"		=> s_cycles := s_cycles + 2;
					when "ABS,X"	=> s_cycles := s_cycles + 3;
					when "ABS,Y"	=> s_cycles := s_cycles + 3;
					when "IND"		=> s_cycles := s_cycles + 3;
					when "IND,X"	=> s_cycles := s_cycles + 4;
					when "IND,Y"	=> s_cycles := s_cycles + 4;
				end case;
		end case;

		return s_cycles;
	end function f_determine_cycles_required;

end package body package_cycles_required;
