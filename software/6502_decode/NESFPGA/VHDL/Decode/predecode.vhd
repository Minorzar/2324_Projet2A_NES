library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity predecode is
	Port (
		i_clk : in STD_LOGIC;												-- Input clock
		i_instruction : in STD_LOGIC_VECTOR(7 downto 0);		 	-- Input raw instruction
		i_status_register : in STD_LOGIC_VECTOR(7 downto 0);	 	-- Input processor status register
		o_active_instruction : out STD_LOGIC_VECTOR(5 downto 0); -- Output processed instruction
		o_addressing_mode : out STD_LOGIC_VECTOR(2 downto 0);		-- Output addressing mode
		o_register_select : out STD_LOGIC_VECTOR(1 downto 0)		-- Output register select
	);
end predecode;

architecture Behavioral of predecode is
	-- Instruction (aaabbbcc)
	signal s_aaa : STD_LOGIC_VECTOR(2 downto 0);
	signal s_bbb : STD_LOGIC_VECTOR(2 downto 0);
	signal s_cc : STD_LOGIC_VECTOR(1 downto 0);

	-- Instruction (xxy10000)
	signal s_xx : STD_LOGIC_VECTOR(1 downto 0);
	signal s_y : STD_LOGIC;
	 
	-- Status Register flags
	signal s_flag_N : STD_LOGIC; -- Negative flag
	signal s_flag_V : STD_LOGIC; -- Overflow flag
	signal s_flag_Z : STD_LOGIC; -- Zero flag
	signal s_flag_C : STD_LOGIC; -- Carry flag

begin
	process (i_clk, i_instruction, i_status_register)
	begin
		if rising_edge(i_clk) then
			-- === Initialize Default Values ==
			o_active_instruction <= "000000";
			o_addressing_mode <= "000";
			o_register_select <= "00";

			-- === Initialize Signals ==
			s_aaa <= i_instruction(7 downto 5);
			s_bbb <= i_instruction(4 downto 2);
			s_cc <= i_instruction(1 downto 0);
			s_xx <= i_instruction(7 downto 6);
			s_y <= i_instruction(5);
			s_flag_N <= i_status_register(7);
			s_flag_V <= i_status_register(6);
			s_flag_Z <= i_status_register(1);
			s_flag_C <= i_status_register(0);

			-- === Instruction Decoding ===
			case s_cc is
				-- === s_cc = "01" ===
				when "01" =>
					case s_aaa is
						when "000" =>
							o_active_instruction <= "000000";   -- ORA
						when "001" =>
							o_active_instruction <= "000001";   -- AND
						when "010" =>
							o_active_instruction <= "000010";   -- EOR
						when "011" =>
							o_active_instruction <= "000011";   -- ADC
						when "100" =>
							o_active_instruction <= "000100";   -- STA
						when "101" =>
							o_active_instruction <= "000101";   -- LDA
						when "110" =>
							o_active_instruction <= "000110";   -- CMP
						when "111" =>
							o_active_instruction <= "000111";   -- SBC
						when others =>
							o_active_instruction <= "000000";	-- Default case
					end case;

					case s_bbb is
						when "000" =>
							o_addressing_mode <= "111";	-- (zero page, X)
							o_register_select <= "01";	 	-- Use X
						when "001" =>
							o_addressing_mode <= "111";	-- zero page
							o_register_select <= "00";	 	-- Use accumulator
						when "010" =>
							o_addressing_mode <= "010";	-- #immediate
							o_register_select <= "00";	 	-- Use accumulator
						when "011" =>
							o_addressing_mode <= "001";	-- absolute
							o_register_select <= "00";	 	-- Use accumulator
						when "100" =>
							o_addressing_mode <= "111";	-- (zero page),Y
							o_register_select <= "10";	 	-- Use Y
						when "101" =>
							o_addressing_mode <= "111";	-- zero page,X
							o_register_select <= "01";	 	-- Use X
						when "110" =>
							o_addressing_mode <= "001";	-- absolute,Y
							o_register_select <= "10";	 	-- Use Y
						when "111" =>
							o_addressing_mode <= "001";	-- absolute,X
							o_register_select <= "01";	 	-- Use X
						when others =>
							o_addressing_mode <= "000";	-- Default case
							o_register_select <= "00";
					end case;

				-- === s_cc = "10" ===
				when "10" =>
					case s_aaa is
						when "000" =>
							o_active_instruction <= "001000";   -- ASL
						when "001" =>
							o_active_instruction <= "001001";   -- ROL
						when "010" =>
							o_active_instruction <= "001010";   -- LSR
						when "011" =>
							o_active_instruction <= "001011";   -- ROR
						when "100" =>
							o_active_instruction <= "001100";   -- STX
						when "101" =>
							o_active_instruction <= "001101";   -- LDX
						when "110" =>
							o_active_instruction <= "001110";   -- DEC
						when "111" =>
							o_active_instruction <= "001111";   -- INC
						when others =>
							o_active_instruction <= "000000";	-- Default case
					end case;

					case s_bbb is
						when "000" =>
							o_addressing_mode <= "010";	-- #immediate
							o_register_select <= "00";	 	-- Use accumulator
						when "001" =>
							o_addressing_mode <= "111";	-- zero page
							o_register_select <= "00";	 	-- Use accumulator
						when "010" =>
							o_addressing_mode <= "000";	-- accumulator
							o_register_select <= "00";	 	-- Use accumulator
						when "011" =>
							o_addressing_mode <= "001";	-- absolute
							o_register_select <= "00";	 	-- Use accumulator
						when "101" =>
							o_addressing_mode <= "111";	-- zero page,X
							o_register_select <= "01";	 	-- Use X
						when "111" =>
							o_addressing_mode <= "001";	-- absolute,X
							o_register_select <= "01";	 	-- Use X
						when others =>
							o_addressing_mode <= "000";	-- Default case
							o_register_select <= "00";
					end case;

				-- === s_cc = "00" ===
				when "00" =>
					case s_aaa is
						when "001" =>
							o_active_instruction <= "010000";   -- BIT
						when "010" =>
							o_active_instruction <= "010001";   -- JMP
						when "011" =>
							o_active_instruction <= "010010";   -- JMP (abs)
						when "100" =>
							o_active_instruction <= "010011";   -- STY
						when "101" =>
							o_active_instruction <= "010100";   -- LDLY
						when "110" =>
							o_active_instruction <= "010101";   -- CPY
						when "111" =>
							o_active_instruction <= "010110";   -- CPX
						when others =>
							o_active_instruction <= "000000";	-- Default case
					end case;

					case s_bbb is
						when "000" =>
							o_addressing_mode <= "010";	-- #immediate
							o_register_select <= "00";	 	-- Use accumulator
						when "001" =>
							o_addressing_mode <= "111";	-- zero page
							o_register_select <= "00";	 	-- Use accumulator
						when "011" =>
							o_addressing_mode <= "001";	-- absolute
							o_register_select <= "00";	 	-- Use accumulator
						when "101" =>
							o_addressing_mode <= "111";	-- zero page,X
							o_register_select <= "01";	 	-- Use X
						when "111" =>
							o_addressing_mode <= "001";	-- absolute,X
							o_register_select <= "01";	 	-- Use X

						-- === s_cc = "00" - Conditional branches (xxy10000) ===
						-- WIP: NOT FUNCTIONAL IF CONDITION IS NOT VERIFIED
						when "100" =>
							case s_xx is
								when "00" =>
									if s_y = '0' and s_flag_N = '0' then
										o_active_instruction <= "010111";	   -- BPL (Branch on Plus)
									end if;
									if s_y = '1' and s_flag_N = '1' then
										o_active_instruction <= "011000";	   -- BMI (Branch on Minus)
									end if;
								when "01" =>
									if s_y = '0' and s_flag_V = '0' then
										o_active_instruction <= "011001";	   -- BVC (Branch on Overflow Clear)
									end if;
									if s_y = '1' and s_flag_V = '1' then
										o_active_instruction <= "011010";	   -- BVS (Branch on Overflow Set)
									end if;
								when "10" =>
									if s_y = '0' and s_flag_C = '0' then
										o_active_instruction <= "011011";	   -- BCC (Branch on Carry Clear)
									end if;
									if s_y = '1' and s_flag_C = '1' then
										o_active_instruction <= "011100";	   -- BCS (Branch on Carry Set)
									end if;
								when "11" =>
									if s_y = '0' and s_flag_Z = '0' then
										o_active_instruction <= "011101";	   -- BNE (Branch on Not Equal)
									end if;
									if s_y = '1' and s_flag_Z = '1' then
										o_active_instruction <= "011110";	   -- BEQ (Branch on Equal)
									end if;
							end case;
							
							-- Reset o_active_instruction value
							o_active_instruction <= "000000";

						-- === s_cc = "00" - Single-byte instruction ===
						when others =>
							case i_instruction is
									when "00000000" =>
										o_active_instruction <= "011111";	   -- BRK
									when "00100000" =>
										o_active_instruction <= "100000";	   -- JSR abs
									when "01000000" =>
										o_active_instruction <= "100001";	   -- RTI
									when "01100000" =>
										o_active_instruction <= "100010";	   -- RTS
									when "00001000" =>
										o_active_instruction <= "100011";	   -- PHP
									when "00101000" =>
										o_active_instruction <= "100100";	   -- PLP
									when "01001000" =>
										o_active_instruction <= "100101";	   -- PHA
									when "01101000" =>
										o_active_instruction <= "100110";	   -- PLA
									when "10001000" =>
										o_active_instruction <= "100111";	   -- DEY
									when "10101000" =>
										o_active_instruction <= "101000";	   -- TAY
									when "11001000" =>
										o_active_instruction <= "101001";	   -- INY
									when "11101000" =>
										o_active_instruction <= "101010";	   -- INX
									when "00011000" =>
										o_active_instruction <= "101011";	   -- CLC
									when "00111000" =>
										o_active_instruction <= "101100";	   -- SEC
									when "01011000" =>
										o_active_instruction <= "101101";	   -- CLI
									when "01111000" =>
										o_active_instruction <= "101110";	   -- SEI
									when "10011000" =>
										o_active_instruction <= "101111";	   -- TYA
									when "10111000" =>
										o_active_instruction <= "110000";	   -- CLV
									when "11011000" =>
										o_active_instruction <= "110001";	   -- CLD
									when "11111000" =>
										o_active_instruction <= "110010";	   -- SED
									when "10001010" =>
										o_active_instruction <= "110011";	   -- TXA
									when "10101010" =>
										o_active_instruction <= "110100";	   -- TXS
									when "11001010" =>
										o_active_instruction <= "110101";	   -- TAX
									when "11101010" =>
										o_active_instruction <= "110110";	   -- TSX
									when "11011010" =>
										o_active_instruction <= "110111";	   -- DEX
									when "11111010" =>
										o_active_instruction <= "111000";	   -- NOP
									when others =>
										o_active_instruction <= "000000";		-- Default case
							end case;
					end case;

				-- === Default Values ===
				when others =>
					o_active_instruction <= "000000";
					o_addressing_mode <= "000";
					o_register_select <= "00";
			end case;
		end if;
	end process;
end Behavioral;
