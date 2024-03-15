-- tb_decode_rom.vhd
--
-- This VHDL testbench simulates the behavior of the decode_rom module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decode_rom is
end tb_decode_rom;

architecture Behavioral of tb_decode_rom is
	-- Constants
	constant CLK_PERIOD			: time := 200 ps;

	-- Signals
	signal t_ir_instruction		: std_logic_vector(7 downto 0);
	signal t_tgl_timing_n		: std_logic_vector(5 downto 0);
	signal t_dr_pla				: std_logic_vector(129 downto 0);

	-- Define arrays to hold test vectors
	type InstructionArray is array (natural range <>) of std_logic_vector(7 downto 0);
	type TimingArray is array (natural range <>) of std_logic_vector(5 downto 0);

	-- Define input instructions
	constant Instructions : InstructionArray := (
		0 => "100UU100",
		1 => "UUU100U1",
		2 => "UUU110U1",
		3 => "1U001000",
		4 => "10011000",
		5 => "1100UU00",
		6 => "UUU1U1UU",
		7 => "10UUUU1U",
		8 => "UUU000U1",
		9 => "10001010",
		10 => "1100101U",
		11 => "1110UU00",
		12 => "100UUU1U",
		13 => "1001101U",
		14 => "101UUU1U",
		15 => "1100101U",
		16 => "11101000",
		17 => "1011101U",
		18 => "1U001000",
		19 => "101UU100",
		20 => "1010UU00",
		21 => "00100000",
		22 => "00000000",
		23 => "0U001000",
		24 => "01100000",
		25 => "0U101000",
		26 => "01000000",
		27 => "011UUU1U",
		28 => "UUUUUUUU",
		29 => "010UUUU1",
		30 => "01U01100",
		31 => "UUU011UU",
		32 => "000UUUU1",
		33 => "UUUU0UUU",
		34 => "UUUUUUUU",
		35 => "0UU0U000",
		36 => "0UU0UU00",
		37 => "00U00000",
		38 => "01000000",
		39 => "UUU000U1",
		40 => "UUU100U1",
		41 => "UUU100U1",
		42 => "UUU11UUU",
		43 => "0U101000",
		44 => "111UUU1U",
		45 => "UUU000U1",
		46 => "UUU100U1",
		47 => "01U00000",
		48 => "00100000",
		49 => "11U0UU00",
		50 => "110UUUU1",
		51 => "111UUUU1",
		52 => "U11UUUU1",
		53 => "001UUU1U",
		54 => "01U01100",
		55 => "00UUUU1U",
		56 => "00100000",
		57 => "0UU0U000",
		58 => "10011000",
		59 => "0UUUUUU1",
		60 => "U11UUUU1",
		61 => "0UU0101U",
		62 => "1000101U",
		63 => "01101000",
		64 => "101UUUU1",
		65 => "UUUUUUU1",
		66 => "10101000",
		67 => "0UU0101U",
		68 => "1010101U",
		69 => "0010U100",
		70 => "001UUUU1",
		71 => "UUU11UUU",
		72 => "UUU100U1",
		73 => "UUU10000",
		74 => "01001000",
		75 => "01U0101U",
		76 => "01UUUU1U",
		77 => "00000000",
		78 => "00100000",
		79 => "100UUUU1",
		80 => "UUU10000",
		81 => "UUUU01UU",
		82 => "UUUU00U1",
		83 => "UUUU1UUU",
		84 => "01100000",
		85 => "UUUUUUUU",
		86 => "UUUUUUUU",
		87 => "0U000000",
		88 => "01U01100",
		89 => "UU0000U1",
		90 => "UUUU1UUU",
		91 => "UUU100U1",
		92 => "UUU11UUU",
		93 => "UUU10000",
		94 => "0U000000",
		95 => "00100000",
		96 => "01U01100",
		97 => "100UUUUU",
		98 => "00000000",
		99 => "00001000",
		100 => "0U001000",
		101 => "01U00000",
		102 => "01U01100",
		103 => "00100000",
		104 => "01001100",
		105 => "0U101000",
		106 => "U1UUUU1U",
		107 => "00UUUU1U",
		108 => "01U11000",
		109 => "0010U100",
		110 => "00U11000",
		111 => "UUU101UU",
		112 => "U11UUUU1",
		113 => "0010U100",
		114 => "00101000",
		115 => "01000000",
		116 => "110UUUU1",
		117 => "11U01100",
		118 => "00U0101U",
		119 => "11U00U00",
		120 => "11U11000",
		121 => "U0UUUUUU",
		122 => "UUU011UU",
		123 => "UUU001UU",
		124 => "UUUU00U1",
		125 => "UUU11UUU",
		126 => "0UUUUUUU",
		127 => "10111000",
		128 => "UUUU10U0",
		129 => "0UU01000"
	);

	-- Define input timings
	constant Timings : TimingArray := (
		0 => "UUUUUU",
		1 => "UU0UUU",
		2 => "UUU0UU",
		3 => "UUUUU0",
		4 => "UUUUU0",
		5 => "UUUUU0",
		6 => "UUU0UU",
		7 => "UUUUUU",
		8 => "UUU0UU",
		9 => "UUUUU0",
		10 => "UUUUU0",
		11 => "UUUUU0",
		12 => "UUUUUU",
		13 => "UUUUU0",
		14 => "UUUUU0",
		15 => "UUUU0U",
		16 => "UUUU0U",
		17 => "UUUUU0",
		18 => "UUUU0U",
		19 => "UUUUU0",
		20 => "UUUUU0",
		21 => "UUUUU0",
		22 => "0UUUUU",
		23 => "UUUUU0",
		24 => "U0UUUU",
		25 => "UU0UUU",
		26 => "0UUUUU",
		27 => "UUUUUU",
		28 => "UUU0UU",
		29 => "UUUUU0",
		30 => "UUUUUU",
		31 => "UUU0UU",
		32 => "UUUUU0",
		33 => "UUU0UU",
		34 => "UUUUU0",
		35 => "UUU0UU",
		36 => "UU0UUU",
		37 => "U0UUUU",
		38 => "U0UUUU",
		39 => "UU0UUU",
		40 => "U0UUUU",
		41 => "UUU0UU",
		42 => "UU0UUU",
		43 => "UUUUUU",
		44 => "UUUUUU",
		45 => "U0UUUU",
		46 => "UU0UUU",
		47 => "UUUUUU",
		48 => "UUU0UU",
		49 => "UUUUU0",
		50 => "UUUUU0",
		51 => "UUUUU0",
		52 => "UUUUU0",
		53 => "UUUUUU",
		54 => "UU0UUU",
		55 => "UUUUUU",
		56 => "0UUUUU",
		57 => "UUU0UU",
		58 => "UUUUU0",
		59 => "UUUU0U",
		60 => "UUUU0U",
		61 => "UUUU0U",
		62 => "UUUUU0",
		63 => "UUUUU0",
		64 => "UUUUU0",
		65 => "UUUUU0",
		66 => "UUUUU0",
		67 => "UUUUU0",
		68 => "UUUUU0",
		69 => "UUUUU0",
		70 => "UUUUU0",
		71 => "U0UUUU",
		72 => "0UUUUU",
		73 => "UUUUU0",
		74 => "UUU0UU",
		75 => "UUUUU0",
		76 => "UUUUUU",
		77 => "UUU0UU",
		78 => "UU0UUU",
		79 => "UUUUUU",
		80 => "UUU0UU",
		81 => "UUU0UU",
		82 => "UUU0UU",
		83 => "UUU0UU",
		84 => "0UUUUU",
		85 => "U0UUUU",
		86 => "UU0UUU",
		87 => "UUUUU0",
		88 => "UUUUU0",
		89 => "0UUUUU",
		90 => "UU0UUU",
		91 => "U0UUUU",
		92 => "UU0UUU",
		93 => "UU0UUU",
		94 => "UUUUUU",
		95 => "UUUUUU",
		96 => "UUUUUU",
		97 => "UUUUUU",
		98 => "U0UUUU",
		99 => "UUU0UU",
		100 => "UUU0UU",
		101 => "0UUUUU",
		102 => "U0UUUU",
		103 => "0UUUUU",
		104 => "UUU0UU",
		105 => "UU0UUU",
		106 => "UUUUUU",
		107 => "UUUUUU",
		108 => "UUUUU0",
		109 => "UUUU0U",
		110 => "UUUUU0",
		111 => "UU0UUU",
		112 => "UUUU0U",
		113 => "UUUUU0",
		114 => "UUUUU0",
		115 => "U0UUUU",
		116 => "UUUU0U",
		117 => "UUUU0U",
		118 => "UUUU0U",
		119 => "UUUU0U",
		120 => "UUUUU0",
		121 => "UUUUUU",
		122 => "UU0UUU",
		123 => "UUU0UU",
		124 => "0UUUUU",
		125 => "U0UUUU",
		126 => "UUUUUU",
		127 => "UUUUUU",
		128 => "UUUUUU",
		129 => "UUUUUU"
	);

begin
	-- Instantiate the decode_rom module
	UUT: entity work.decode_rom
	port map (
		i_ir_instruction	=> t_ir_instruction,
		i_tgl_timing_n		=> t_tgl_timing_n,
		o_dr_pla			=> t_dr_pla
	);

	-- Stimulus process
	process
	begin
		-- Iterate through each test vector
		for i in Instructions'range loop
			-- Send instruction
			t_ir_instruction <= Instructions(i);

			-- Send timing
			t_tgl_timing_n <= Timings(i);

            -- Simulate behavior for specific instructions
			if i = 83 or i = 90 or i = 128 then
				for j in 0 to 7 loop
					if Instructions(i)(j) = 'U' then
						t_ir_instruction(j) <= not Instructions(129)(j);
					end if;
				end loop;
			end if;

            -- Wait for clock period
			wait for CLK_PERIOD;

			-- Check output and raise assertion if not expected
			assert t_dr_pla(i) = '1' report "Output mismatch at index " & integer'image(i) severity error;

		end loop;

        -- Wait indefinitely
		wait;
	end process;

end Behavioral;
