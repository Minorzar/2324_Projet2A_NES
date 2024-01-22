-- package_cycles_required.vhd
--
-- This VHDL package provides functions to determine the number of cycles required for 6502 processor instructions.
--
-- Package Contents:
--    - t_instruction: Subtype representing the instruction as a STD_LOGIC_VECTOR(7 downto 0).
--    - t_opcode_mnemonic: Type representing the mnemonic of the opcode.
--    - t_addressing_mode: Type representing the addressing mode as a string.
--    - f_determine_cycles_required: Function to determine the number of cycles required for a given instruction.
--
-- Example Usage:
--    - Call the function f_determine_cycles_required with the instruction, opcode mnemonic, and addressing mode.

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
         when "PLA" | "PLP" => s_cycles := 4;
         when "RTI" | "RTS" => s_cycles := 6;

			-- JSR
         when "JSR" => s_cycles := 4;

			-- Stack
         when "ASL" | "DEC" | "INC" | "LSR" | "ROL" | "ROR" => s_cycles := 4;
			
         when others =>
            -- Check for single-byte instructions
            if (i_mode = "IMP") then
               s_cycles := s_cycles;
            end if;

            -- Check for immediate addressing mode
            if (i_mode = "IMM") then
               s_cycles := 2;
            end if;

            -- Check for accumulator addressing mode
            if (i_mode = "ACC") then
               s_cycles := 2;
            end if;

            -- Check for zero page addressing mode
            if (i_mode = "ZP") then
               s_cycles := s_cycles + 1;
            end if;

            -- Check for zero page,X addressing mode
            if (i_mode = "ZP,X") then
               s_cycles := s_cycles + 2;
            end if;

            -- Check for zero page,Y addressing mode
            if (i_mode = "ZP,Y") then
               s_cycles := s_cycles + 2;
            end if;

            -- Check for absolute addressing mode
            if (i_mode = "ABS") then
               s_cycles := s_cycles + 2;
            end if;

            -- Check for absolute,X addressing mode
            if (i_mode = "ABS,X") then
               s_cycles := s_cycles + 3;
            end if;

            -- Check for absolute,Y addressing mode
            if (i_mode = "ABS,Y") then
               s_cycles := s_cycles + 3;
            end if;

            -- Check for indirect addressing mode
            if (i_mode = "IND") then
               s_cycles := s_cycles + 3;
            end if;

            -- Check for indirect,X addressing mode
            if (i_mode = "IND,X") then
               s_cycles := s_cycles + 4;
            end if;

            -- Check for indirect,Y addressing mode
            if (i_mode = "IND,Y") then
               s_cycles := s_cycles + 4;
            end if;

      end case;

      return s_cycles;
   end function f_determine_cycles_required;

end package body package_cycles_required;
