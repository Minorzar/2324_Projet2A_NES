-- predecode_logic.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.package_addressing_mode_determination.ALL;
use work.package_cycles_required.ALL;
-- use work.package_flags_influence.ALL;
use work.package_opcode_determination.ALL;

entity predecode_logic is
	Port (
		i_instruction : in STD_LOGIC_VECTOR(7 downto 0)
	);
end predecode_logic;

architecture Behavioral of predecode_logic is
	signal s_opcode : STD_LOGIC_VECTOR(7 downto 0);
	signal s_addressing_mode : string(1 to 15);
	signal s_cycles_required : natural;
	-- signal s_affects_flags : boolean;
begin
	-- Placeholder functions
	s_opcode <= package_opcode_determination.f_determine_opcode(i_instruction);
	s_addressing_mode <= package_addressing_mode_determination.f_determine_addressing_mode(s_opcode);
	s_cycles_required <= package_cycles_required.f_determine_cycles_required(i_instruction, s_opcode, s_addressing_mode);
	-- s_affects_flags <= package_flags_influence.f_does_affect_flags(s_opcode);

	-- WIP: Logic
end Behavioral;
