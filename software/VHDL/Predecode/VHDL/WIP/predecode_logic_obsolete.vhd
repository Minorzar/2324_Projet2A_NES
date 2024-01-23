-- File Name: predecode_logic.vhd

-- Module Summary:
-- Implements Predecode Logic block in the 6502 CPU.
-- Processes predecoded data to determine the opcode, cycles, and implied addressing.
-- Handles clearing the instruction register based on the interrupt control signal.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity predecode_logic is
	Port ( 
		i_clk_1 : in STD_LOGIC;											-- Clock for the next cycle
		i_assert_interrupt_control : in STD_LOGIC;				-- Assert Interrupt Control signal
		i_predecode_data : in STD_LOGIC_VECTOR(7 downto 0);	-- Predecoded data input
		o_opcode : out STD_LOGIC_VECTOR(7 downto 0);				-- Opcode output
		o_two_cycle_opcode : out STD_LOGIC;							-- Signal indicating if the opcode requires two cycles
		o_implied_addressing : out STD_LOGIC						-- Signal indicating if the opcode has implied addressing
	);
end predecode_logic;

architecture Behavioral of predecode_logic is
	signal s_clear_instruction_register : STD_LOGIC;			-- Signal to determine if the instruction register should be cleared
	signal s_two_cycle_opcode : STD_LOGIC;							-- Signal to determine if the opcode requires two cycles

begin
	-- Determine if the instruction register should be cleared
	s_clear_instruction_register <= not i_assert_interrupt_control;

	-- Process to transfer the opcode to the instruction register
	process(i_predecode_data, s_clear_instruction_register)
	begin
		-- Clear the instruction register if necessary, else transfer the opcode
		o_opcode <= (others => '0') when s_clear_instruction_register = '1' else i_predecode_data;
	end process;

	-- Determine if the opcode has implied addressing (no operands)
	o_implied_addressing <= '1' when o_opcode(3) = '1' and o_opcode(2) = '0' and o_opcode(0) = '0' else '0';

	-- Determine if the opcode requires two cycles
	s_two_cycle_opcode <= not (
		(not o_opcode(4) and o_opcode(3) and not o_opcode(2) and o_opcode(0)) or
		(o_opcode(7) and not o_opcode(4) and not o_opcode(3) and not o_opcode(2) and not o_opcode(0)) or
		(o_implied_addressing = '1' and not (
			not o_opcode(7) and not o_opcode(4) and o_opcode(3) and
			not o_opcode(2) and not o_opcode(1) and not o_opcode(0)
		))
	);

	-- Output the synchronized signal for the next cycle
	process(i_clk_1)
	begin
		o_two_cycle_opcode <= s_two_cycle_opcode when rising_edge(i_clk_1);
	end process;

end Behavioral;
