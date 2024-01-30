-- decode_rom.vhd
--
-- This VHDL module implements a ROM decoder.
--
-- Description:
--	The decode ROM decodes the input instruction register and T-n value to generate outputs for a PLA.
--	The PLA outputs are determined based on specific logic expressions derived from the input values.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decode_rom is
	Port (
		ir : in STD_LOGIC_VECTOR(7 downto 0);		-- Input instruction register
		t_n : in STD_LOGIC_VECTOR(5 downto 0);		-- Input T-n value
		pla : out STD_LOGIC_VECTOR(129 downto 0)	-- Output PLA
	);
end decode_rom;

architecture Behavioral of decode_rom is
	signal ir10 : STD_LOGIC;						-- Signal to store concatenation of ir(1) and ir(0)
begin
	-- Main process
	process(ir, t_n)
	begin
		-- Concatenation of ir(1) and ir(0) and storing it in ir10
		ir10 <= ir(1) or ir(0);

		-- PLA output assignments based on specified logic expressions
		pla(0) <= not (not ir(7) or ir(6) or ir(5) or not ir(2) or ir10);
		pla(1) <= not (t_n(3) or not ir(4) or ir(3) or ir(2) or not ir(0));
		pla(2) <= not (t_n(2) or not ir(4) or not ir(3) or ir(2) or not ir(0));
		pla(3) <= not (t_n(0) or not ir(7) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(4) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(5) <= not (t_n(0) or not ir(7) or not ir(6) or ir(5) or ir(4) or ir10);
		pla(6) <= not (t_n(2) or not ir(4) or not ir(2));
		pla(7) <= not (not ir(7) or ir(6) or not ir(1));
		pla(8) <= not (t_n(2) or ir(4) or ir(3) or ir(2) or not ir(0));
		pla(9) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(10) <= not (t_n(0) or not ir(7) or not ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(11) <= not (t_n(0) or not ir(7) or not ir(6) or not ir(5) or ir(4) or ir10);
		pla(12) <= not (not ir(7) or ir(6) or ir(5) or not ir(1));
		pla(13) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(14) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(1));
		pla(15) <= not (t_n(1) or not ir(7) or not ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(16) <= not (t_n(1) or not ir(7) or not ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(17) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(18) <= not (t_n(1) or not ir(7) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(19) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or ir(4) or ir10);
		pla(20) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or ir(4) or ir10);
		pla(21) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(22) <= not (t_n(1) or not ir(7) or ir(6) or ir(5) or not ir(3) or ir(2) or not ir(1));
		pla(23) <= not (t_n(1) or not ir(7) or not ir(6) or ir(5) or ir(4) or not ir(2));
		pla(24) <= not (t_n(1) or not ir(7) or not ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(25) <= not (t_n(0) or not ir(7) or ir(5) or ir(4) or ir(3) or ir(2) or not ir(1));
		pla(26) <= not (t_n(0) or ir(7) or ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(27) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or not ir(4) or ir(3) or not ir(2) or not ir(1));
		pla(28) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(29) <= not (t_n(0) or not ir(7) or not ir(6) or ir(5) or ir(4) or ir(3) or not ir(2) or not ir(1));
		pla(30) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(31) <= not (t_n(1) or not ir(7) or ir(6) or ir(5) or not ir(4) or ir(3) or not ir(2) or not ir(1));
		pla(32) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(33) <= not (t_n(2) or ir(4) or ir(3) or ir(2) or not ir(1));
		pla(34) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(35) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(36) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(4) or ir(3) or ir(2) or not ir(1));
		pla(37) <= not (t_n(0) or ir(7) or ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(38) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or not ir(4) or ir(3) or not ir(2) or not ir(1));
		pla(39) <= not (t_n(2) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(40) <= not (t_n(2) or ir(4) or not ir(3) or not ir(2) or not ir(1));
		pla(41) <= not (t_n(1) or ir(7) or not ir(5) or not ir(3) or not ir(2) or not ir(1));
		pla(42) <= not (t_n(1) or ir(7) or not ir(6) or ir(5) or not ir(3) or not ir(1));
		pla(43) <= not (t_n(1) or not ir(7) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(44) <= not (t_n(1) or not ir(7) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(45) <= not (t_n(1) or not ir(7) or ir(5) or not ir(3) or not ir(2) or not ir(1));
		pla(46) <= not (t_n(1) or not ir(7) or not ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(47) <= not (ir(7) or not ir(6) or ir(4) or ir(3) or ir(2) or ir10);
		pla(48) <= not (t_n(2) or ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(49) <= not (t_n(0) or not ir(7) or not ir(6) or ir(4) or ir10);
		pla(50) <= not (t_n(0) or not ir(7) or not ir(6) or ir(5) or not ir(0));
		pla(51) <= not (t_n(0) or not ir(7) or not ir(6) or not ir(5) or not ir(0));
		pla(52) <= not (t_n(0) or not ir(6) or not ir(5) or not ir(0));
		pla(53) <= not (ir(7) or ir(6) or not ir(5) or not ir(1));
		pla(54) <= not (t_n(3) or ir(7) or not ir(6) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(55) <= not (ir(7) or ir(6) or not ir(1));
		pla(56) <= not (t_n(5) or ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(57) <= not (t_n(2) or ir(7) or ir(4) or ir(2) or ir10);
		pla(58) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(59) <= not (t_n(1) or ir(7) or not ir(0));
		pla(60) <= not (t_n(1) or not ir(6) or not ir(5) or not ir(0));
		pla(61) <= not (t_n(1) or ir(7) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(62) <= not (t_n(0) or not ir(7) or ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(63) <= not (t_n(0) or ir(7) or not ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(64) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or not ir(0));
		pla(65) <= not (t_n(0) or not ir(0));
		pla(66) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(67) <= not (t_n(0) or ir(7) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(68) <= not (t_n(0) or not ir(7) or ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(69) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or ir(4) or not ir(2) or ir10);
		pla(70) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or not ir(0));	
		pla(71) <= not (t_n(4) or not ir(4) or not ir(3));
		pla(72) <= not (t_n(5) or not ir(4) or ir(3) or ir(2) or not ir(0));
		pla(73) <= not (t_n(0) or not ir(4) or ir(3) or ir(2) or ir10);
		pla(74) <= not (t_n(2) or ir(7) or not ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(75) <= not (t_n(0) or ir(7) or not ir(6) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(76) <= not (ir(7) or not ir(6) or not ir(1));
		pla(77) <= not (t_n(2) or ir(7) or ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(78) <= not (t_n(3) or ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(79) <= not (~ir(7) or ir(6) or ir(5) or not ir(0));
		pla(80) <= not (t_n(2) or not ir(4) or ir(3) or ir(2) or ir10);	
		pla(81) <= not (t_n(2) or ir(3) or not ir(2));
		pla(82) <= not (t_n(2) or ir(3) or ir(2) or not ir(0));
		pla(83) <= not (pla(129) or t_n(2) or not ir(3));
		pla(84) <= not (t_n(5) or ir(7) or not ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(85) <= not (t_n(4));
		pla(86) <= not (t_n(3));
		pla(87) <= not (t_n(0) or ir(7) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(88) <= not (t_n(0) or ir(7) or not ir(6) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(89) <= not (t_n(5) or ir(4) or ir(3) or ir(2) or not ir(0));
		pla(90) <= not (pla(129) or t_n(3) or not ir(3));
		pla(91) <= not (t_n(4) or not ir(4) or ir(3) or ir(2) or not ir(0));
		pla(92) <= not (t_n(3) or not ir(4) or not ir(3));
		pla(93) <= not (t_n(3) or not ir(4) or ir(3) or ir(2) or ir10);
		pla(94) <= not (ir(7) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(95) <= not (ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(96) <= not (ir(7) or not ir(6) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(97) <= not (~ir(7) or ir(6) or ir(5));
		pla(98) <= not (t_n(4) or ir(7) or ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(99) <= not (t_n(2) or ir(7) or ir(6) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(100) <= not (t_n(2) or ir(7) or ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(101) <= not (t_n(5) or ir(7) or not ir(6) or ir(4) or ir(3) or ir(2) or ir10);
		pla(102) <= not (t_n(4) or ir(7) or not ir(6) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(103) <= not (t_n(5) or ir(7) or ir(6) or not ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(104) <= not (t_n(2) or ir(7) or not ir(6) or ir(5) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(105) <= not (t_n(3) or ir(7) or not ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(106) <= not (~ir(6) or not ir(1));
		pla(107) <= not (ir(7) or ir(6) or not ir(1));
		pla(108) <= not (t_n(0) or ir(7) or not ir(6) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(109) <= not (t_n(1) or ir(7) or ir(6) or not ir(5) or ir(4) or not ir(2) or ir10);
		pla(110) <= not (t_n(0) or ir(7) or ir(6) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(111) <= not (t_n(3) or not ir(4) or ir(3) or not ir(2));
		pla(112) <= not (t_n(1) or not ir(6) or not ir(5) or not ir(0));
		pla(113) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or ir(4) or not ir(2) or ir10);
		pla(114) <= not (t_n(0) or ir(7) or ir(6) or not ir(5) or ir(4) or not ir(3) or ir(2) or ir10);
		pla(115) <= not (t_n(4) or ir(7) or not ir(6) or ir(5) or ir(4) or ir(3) or ir(2) or ir10);
		pla(116) <= not (t_n(1) or not ir(7) or not ir(6) or ir(5) or not ir(0));
		pla(117) <= not (t_n(1) or not ir(7) or not ir(6) or ir(4) or not ir(3) or not ir(2) or ir10);
		pla(118) <= not (t_n(1) or ir(7) or ir(6) or ir(4) or not ir(3) or ir(2) or not ir(1));
		pla(119) <= not (t_n(1) or not ir(7) or not ir(6) or ir(4) or ir(3) or ir10);
		pla(120) <= not (t_n(0) or not ir(7) or not ir(6) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(121) <= not (ir(6));
		pla(122) <= not (t_n(3) or ir(4) or not ir(3) or not ir(2));
		pla(123) <= not (t_n(2) or ir(4) or ir(3) or not ir(2));
		pla(124) <= not (t_n(5) or ir(3) or ir(2) or not ir(0));
		pla(125) <= not (t_n(4) or not ir(4) or not ir(3));
		pla(126) <= not (ir(7));
		pla(127) <= not (not ir(7) or ir(6) or not ir(5) or not ir(4) or not ir(3) or ir(2) or ir10);
		pla(128) <= not (pla(129) or not ir(3) or ir(2) or ir(0));
		pla(129) <= not (ir(7) or ir(4) or not ir(3) or ir(2) or ir10);
	end process;

end Behavioral;