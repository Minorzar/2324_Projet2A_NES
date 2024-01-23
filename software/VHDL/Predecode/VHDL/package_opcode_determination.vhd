-- package_opcode_determination.vhd
--
-- This VHDL package provides functions to determine the opcode mnemonic (instruction name) for a 6502 microprocessor.
--
-- Package Contents:
--		- t_instruction: Subtype representing the instruction as a STD_LOGIC_VECTOR(7 downto 0).
--		- f_determine_opcode: Function to determine the mnemonic for a given instruction.
--
-- Example Usage:
-- 	- Call the function f_determine_opcode with the instruction to get the corresponding mnemonic.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package package_opcode_determination is
	subtype t_instruction is STD_LOGIC_VECTOR(7 downto 0);

	function f_determine_opcode(i_instruction : t_instruction) return string;

end package package_opcode_determination;

package body package_opcode_determination is

	function f_determine_opcode(i_instruction : t_instruction) return string is
		variable l_result : string := "UNKNOWN";	-- Default value
		variable s_aaa : STD_LOGIC_VECTOR(2 downto 0);
		variable s_cc : STD_LOGIC_VECTOR(1 downto 0);
		variable s_xx : STD_LOGIC_VECTOR(1 downto 0);
		variable s_y : STD_LOGIC;
	begin
		-- Extract bits aaa, cc from aaabbbcc
		s_aaa := i_instruction(7 downto 5);
		s_cc := i_instruction(1 downto 0);

		-- Extract bits xx and y from xxy10000
		s_xx := i_instruction(7 downto 6);
		s_y := i_instruction(5);

		-- Determine opcode for aaabbbcc instructions
		case s_cc is
			-- Instructions with cc = 01
			when "01" =>
				case s_aaa is
					when "000" => l_result := "ORA";		-- Logical Inclusive OR
					when "001" => l_result := "AND";		-- Logical AND
					when "010" => l_result := "EOR";		-- Exclusive OR
					when "011" => l_result := "ADC";		-- Add with Carry
					when "100" => l_result := "STA";		-- Store Accumulator
					when "101" => l_result := "LDA";		-- Load Accumulator
					when "110" => l_result := "CMP";		-- Compare Accumulator
					when "111" => l_result := "SBC";		-- Subtract with Carry
					-- when others => null;
				end case; -- End of case with cc = 01 instructions

			-- Instructions with cc = 10
			when "10" =>
				case s_aaa is
					when "000" => l_result := "ASL";			-- Arithmetic Shift Left
					when "001" => l_result := "ROL";			-- Rotate Left
					when "010" => l_result := "LSR";			-- Logical Shift Right
					when "011" => l_result := "ROR";			-- Rotate Right
					when "100" => l_result := "STX";			-- Store X Register
					when "101" => l_result := "LDX";			-- Load X Register
					when "110" => l_result := "DEC";			-- Decrement Memory
					when "111" => l_result := "INC";			-- Increment Memory
					-- when others => null;
				end case; -- End of case with cc = 10 instructions

			-- Instructions with cc = 00
			when "00" =>
				case s_aaa is
					when "001" => l_result := "BIT";			-- Bit Test
					when "010" => l_result := "JMP";			-- Jump
					when "011" => l_result := "JMP (abs)";	-- Jump (absolute)
					when "100" => l_result := "STY";			-- Store Y Register
					when "101" => l_result := "LDY";			-- Load Y Register
					when "110" => l_result := "CPY";			-- Compare Y Register
					when "111" => l_result := "CPX";			-- Compare X Register
					-- when others => null;
				end case; -- End of case with cc = 00 instructions

			-- Instructions with cc = 11
			-- when others => null;
		end case; -- End of case with aaabbbcc instructions

		-- Determine opcode for xxy10000 instructions
		if (i_instruction(4 downto 0) = "10000") then
			-- Conditional branch instructions based on xx and y bits
			case s_xx is
				when "00" =>
					if s_y = '0' then
						l_result := "BPL";			-- Branch on Positive
					else
						l_result := "BMI";			-- Branch on Minus
					end if;
				when "01" =>
					if s_y = '0' then
						l_result := "BVC";			-- Branch on Overflow Clear
					else
						l_result := "BVS";			-- Branch on Overflow Set
					end if;
				when "10" =>
					if s_y = '0' then
						l_result := "BCC";			-- Branch on Carry Clear
					else
						l_result := "BCS";			-- Branch on Carry Set
					end if;
				when "11" =>
					if s_y = '0' then
						l_result := "BNE";			-- Branch on Not Equal
					else
						l_result := "BEQ";			-- Branch on Equal
					end if;
				-- when others => null;
			end case;
		end if; -- End of case with xxy10000 instructions

		-- Determine opcode for other single-byte instructions
		case i_instruction is
			when x"00" => l_result := "BRK";			-- Break
			when x"20" => l_result := "JSR";			-- Jump to Subroutine (absolute)
			when x"40" => l_result := "RTI";			-- Return from Interrupt
			when x"60" => l_result := "RTS";			-- Return from Subroutine
			when x"08" => l_result := "PHP";			-- Push Processor Status
			when x"28" => l_result := "PLP";			-- Pull Processor Status
			when x"48" => l_result := "PHA";			-- Push Accumulator
			when x"68" => l_result := "PLA";			-- Pull Accumulator
			when x"88" => l_result := "DEY";			-- Decrement Y Register
			when x"A8" => l_result := "TAY";			-- Transfer Accumulator to Y
			when x"C8" => l_result := "INY";			-- Increment Y Register
			when x"E8" => l_result := "INX";			-- Increment X Register
			when x"18" => l_result := "CLC";			-- Clear Carry Flag
			when x"38" => l_result := "SEC";			-- Set Carry Flag
			when x"58" => l_result := "CLI";			-- Clear Interrupt Disable
			when x"78" => l_result := "SEI";			-- Set Interrupt Disable
			when x"98" => l_result := "TYA";			-- Transfer Y to Accumulator
			when x"B8" => l_result := "CLV";			-- Clear Overflow Flag
			when x"D8" => l_result := "CLD";			-- Clear Decimal Mode
			when x"F8" => l_result := "SED";			-- Set Decimal Mode
			when x"8A" => l_result := "TXA";			-- Transfer X to Accumulator
			when x"9A" => l_result := "TXS";			-- Transfer X to Stack Pointer
			when x"AA" => l_result := "TAX";			-- Transfer Accumulator to X
			when x"BA" => l_result := "TSX";			-- Transfer Stack Pointer to X
			when x"CA" => l_result := "DEX";			-- Decrement X Register
			when x"EA" => l_result := "NOP";			-- No Operation
			-- when others => null;
		end case; -- End of case with other single-byte instructions

		return l_result;
	end function f_determine_opcode;

end package body package_opcode_determination;
