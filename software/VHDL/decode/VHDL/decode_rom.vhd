-- decode_rom.vhd
--
-- This VHDL module implements "Decode ROM".
--
-- Description:
--	The decode ROM decodes the input instruction register and T-n value to generate outputs for a PLA.
--	The PLA outputs are determined based on specific logic expressions derived from the input values.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_rom is
	port (
		i_ir_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from instruction_register
		i_tgl_timing_n		: in std_logic_vector(5 downto 0);		-- Input T-n value from timing_generation_logic
		o_dr_pla			: out std_logic_vector(129 downto 0)	-- Output programmable logic array
	);
end decode_rom;

architecture Behavioral of decode_rom is
	signal s_instruction10	: std_logic;							-- Internal signal to store concatenation of i_ir_instruction(1) and i_ir_instruction(0)
	signal s_pla129			: std_logic;							-- Internal signal to store PLA 129 output

begin
	process(i_ir_instruction, i_tgl_timing_n, s_instruction10, s_pla129)
	begin
		-- Calculate intermediate signals based on the input instruction and timing
		s_instruction10 <= i_ir_instruction(1) or i_ir_instruction(0);
		s_pla129 <= not (i_ir_instruction(7) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);

		-- o_dr_pla output assignments based on specified logic expressions
		o_dr_pla(0) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(1) <= not (i_tgl_timing_n(3) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(2) <= not (i_tgl_timing_n(2) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(3) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(4) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(5) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or s_instruction10);
		o_dr_pla(6) <= not (i_tgl_timing_n(2) or not i_ir_instruction(4) or not i_ir_instruction(2));
		o_dr_pla(7) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(1));
		o_dr_pla(8) <= not (i_tgl_timing_n(2) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(9) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(10) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(11) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or s_instruction10);
		o_dr_pla(12) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(1));
		o_dr_pla(13) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(14) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(1));
		o_dr_pla(15) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(16) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(17) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(18) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(19) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or s_instruction10);
		o_dr_pla(20) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or s_instruction10);
		o_dr_pla(21) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		
		

		o_dr_pla(47) <= not (i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(48) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(49) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or s_instruction10);
		o_dr_pla(50) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(51) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(52) <= not (i_tgl_timing_n(0) or not i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		
		

		o_dr_pla(54) <= not (i_tgl_timing_n(3) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(55) <= not (i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(1));
		o_dr_pla(56) <= not (i_tgl_timing_n(5) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(57) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or i_ir_instruction(4) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(58) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(59) <= not (i_tgl_timing_n(1) or i_ir_instruction(7) or not i_ir_instruction(0));
		o_dr_pla(60) <= not (i_tgl_timing_n(1) or not i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(61) <= not (i_tgl_timing_n(1) or i_ir_instruction(7) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(62) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(63) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(64) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(65) <= not (i_tgl_timing_n(0) or not i_ir_instruction(0));
		o_dr_pla(66) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(67) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(68) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(69) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(70) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(71) <= not (i_tgl_timing_n(4) or not i_ir_instruction(4) or not i_ir_instruction(3));
		o_dr_pla(72) <= not (i_tgl_timing_n(5) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(73) <= not (i_tgl_timing_n(0) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(74) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(75) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(76) <= not (i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(1));
		o_dr_pla(77) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(78) <= not (i_tgl_timing_n(3) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(79) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(80) <= not (i_tgl_timing_n(2) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(81) <= not (i_tgl_timing_n(2) or i_ir_instruction(3) or not i_ir_instruction(2));
		o_dr_pla(82) <= not (i_tgl_timing_n(2) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		
		

		o_dr_pla(84) <= not (i_tgl_timing_n(5) or i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(85) <= not (i_tgl_timing_n(4));
		o_dr_pla(86) <= not (i_tgl_timing_n(3));
		o_dr_pla(87) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(88) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(89) <= not (i_tgl_timing_n(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		


		o_dr_pla(91) <= not (i_tgl_timing_n(4) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(92) <= not (i_tgl_timing_n(3) or not i_ir_instruction(4) or not i_ir_instruction(3));
		o_dr_pla(93) <= not (i_tgl_timing_n(3) or not i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(94) <= not (i_ir_instruction(7) or i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(95) <= not (i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(96) <= not (i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(97) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5));
		o_dr_pla(98) <= not (i_tgl_timing_n(4) or i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(99) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(100) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(101) <= not (i_tgl_timing_n(5) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(102) <= not (i_tgl_timing_n(4) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(103) <= not (i_tgl_timing_n(5) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(104) <= not (i_tgl_timing_n(2) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(105) <= not (i_tgl_timing_n(3) or i_ir_instruction(7) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(106) <= not (not i_ir_instruction(6) or not i_ir_instruction(1));
		o_dr_pla(107) <= not (i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(1));
		o_dr_pla(108) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(109) <= not (i_tgl_timing_n(1) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(110) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(111) <= not (i_tgl_timing_n(3) or not i_ir_instruction(4) or i_ir_instruction(3) or not i_ir_instruction(2));
		o_dr_pla(112) <= not (i_tgl_timing_n(1) or not i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(0));
		
		

		o_dr_pla(114) <= not (i_tgl_timing_n(0) or i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(115) <= not (i_tgl_timing_n(4) or i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or i_ir_instruction(4) or i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(116) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(5) or not i_ir_instruction(0));
		o_dr_pla(117) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2) or s_instruction10);
		o_dr_pla(118) <= not (i_tgl_timing_n(1) or i_ir_instruction(7) or i_ir_instruction(6) or i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(1));
		o_dr_pla(119) <= not (i_tgl_timing_n(1) or not i_ir_instruction(7) or not i_ir_instruction(6) or i_ir_instruction(4) or i_ir_instruction(3) or s_instruction10);
		o_dr_pla(120) <= not (i_tgl_timing_n(0) or not i_ir_instruction(7) or not i_ir_instruction(6) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		o_dr_pla(121) <= not (i_ir_instruction(6));
		o_dr_pla(122) <= not (i_tgl_timing_n(3) or i_ir_instruction(4) or not i_ir_instruction(3) or not i_ir_instruction(2));
		o_dr_pla(123) <= not (i_tgl_timing_n(2) or i_ir_instruction(4) or i_ir_instruction(3) or not i_ir_instruction(2));
		o_dr_pla(124) <= not (i_tgl_timing_n(5) or i_ir_instruction(3) or i_ir_instruction(2) or not i_ir_instruction(0));
		o_dr_pla(125) <= not (i_tgl_timing_n(4) or not i_ir_instruction(4) or not i_ir_instruction(3));
		o_dr_pla(126) <= not (i_ir_instruction(7));
		o_dr_pla(127) <= not (not i_ir_instruction(7) or i_ir_instruction(6) or not i_ir_instruction(5) or not i_ir_instruction(4) or not i_ir_instruction(3) or i_ir_instruction(2) or s_instruction10);
		
		
		
		o_dr_pla(129) <= s_pla129;
	end process;

end Behavioral;