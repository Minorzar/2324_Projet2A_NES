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
	type TestVectorRecord is record
		tv_instruction			: std_logic_vector(7 downto 0);
		tv_timing_n				: std_logic_vector(5 downto 0);
		tv_pla129				: std_logic;
	end record;
	
	type TestVectorArray is array (natural range <>) of TestVectorRecord;

	-- Define input vectors
	constant TestVectors : TestVectorArray := (
		0	=> ("100UU100", "UUUUUU", '0'),
		1	=> ("UUU100U1", "UU0UUU", '0'),
		2	=> ("UUU110U1", "UUU0UU", '0'),
		3	=> ("1U001000", "UUUUU0", '0'),
		4	=> ("10011000", "UUUUU0", '0'),
		5	=> ("1100UU00", "UUUUU0", '0'),
		6	=> ("UUU1U1UU", "UUU0UU", '0'),
		7	=> ("10UUUU1U", "UUUUUU", '0'),
		8	=> ("UUU000U1", "UUU0UU", '0'),
		9	=> ("10001010", "UUUUU0", '0'),
		10	=> ("1100101U", "UUUUU0", '0'),
		11	=> ("1110UU00", "UUUUU0", '0'),
		12	=> ("100UUU1U", "UUUUUU", '0'),
		13	=> ("1001101U", "UUUUU0", '0'),
		14	=> ("101UUU1U", "UUUUU0", '0'),
		15	=> ("1100101U", "UUUU0U", '0'),
		16	=> ("11101000", "UUUU0U", '0'),
		17	=> ("1011101U", "UUUUU0", '0'),
		18	=> ("1U001000", "UUUU0U", '0'),
		19	=> ("101UU100", "UUUUU0", '0'),
		20	=> ("1010UU00", "UUUUU0", '0'),
		21	=> ("00100000", "UUUUU0", '0'),
		22	=> ("00000000", "0UUUUU", '0'),
		23	=> ("0U001000", "UUUUU0", '0'),
		24	=> ("01100000", "U0UUUU", '0'),
		25	=> ("0U101000", "UU0UUU", '0'),
		26	=> ("01000000", "0UUUUU", '0'),
		27	=> ("011UUU1U", "UUUUUU", '0'),
		28	=> ("UUUUUUUU", "UUU0UU", '0'),
		29	=> ("010UUUU1", "UUUUU0", '0'),
		30	=> ("01U01100", "UUUUUU", '0'),
		31	=> ("UUU011UU", "UUU0UU", '0'),
		32	=> ("000UUUU1", "UUUUU0", '0'),
		33	=> ("UUUU0UUU", "UUU0UU", '0'),
		34	=> ("UUUUUUUU", "UUUUU0", '0'),
		35	=> ("0UU0U000", "UUU0UU", '0'),
		36	=> ("0UU0UU00", "UU0UUU", '0'),
		37	=> ("00U00000", "U0UUUU", '0'),
		38	=> ("01000000", "U0UUUU", '0'),
		39	=> ("UUU000U1", "UU0UUU", '0'),
		40	=> ("UUU100U1", "U0UUUU", '0'),
		41	=> ("UUU100U1", "UUU0UU", '0'),
		42	=> ("UUU11UUU", "UU0UUU", '0'),
		43	=> ("0U101000", "UUUUUU", '0'),
		44	=> ("111UUU1U", "UUUUUU", '0'),
		45	=> ("UUU000U1", "U0UUUU", '0'),
		46	=> ("UUU100U1", "UU0UUU", '0'),
		47	=> ("01U00000", "UUUUUU", '0'),
		48	=> ("00100000", "UUU0UU", '0'),
		49	=> ("11U0UU00", "UUUUU0", '0'),
		50	=> ("110UUUU1", "UUUUU0", '0'),
		51	=> ("111UUUU1", "UUUUU0", '0'),
		52	=> ("U11UUUU1", "UUUUU0", '0'),
		53	=> ("001UUU1U", "UUUUUU", '0'),
		54	=> ("01U01100", "UU0UUU", '0'),
		55	=> ("00UUUU1U", "UUUUUU", '0'),
		56	=> ("00100000", "0UUUUU", '0'),
		57	=> ("0UU0U000", "UUU0UU", '0'),
		58	=> ("10011000", "UUUUU0", '0'),
		59	=> ("0UUUUUU1", "UUUU0U", '0'),
		60	=> ("U11UUUU1", "UUUU0U", '0'),
		61	=> ("0UU0101U", "UUUU0U", '0'),
		62	=> ("1000101U", "UUUUU0", '0'),
		63	=> ("01101000", "UUUUU0", '0'),
		64	=> ("101UUUU1", "UUUUU0", '0'),
		65	=> ("UUUUUUU1", "UUUUU0", '0'),
		66	=> ("10101000", "UUUUU0", '0'),
		67	=> ("0UU0101U", "UUUUU0", '0'),
		68	=> ("1010101U", "UUUUU0", '0'),
		69	=> ("0010U100", "UUUUU0", '0'),
		70	=> ("001UUUU1", "UUUUU0", '0'),
		71	=> ("UUU11UUU", "U0UUUU", '0'),
		72	=> ("UUU100U1", "0UUUUU", '0'),
		73	=> ("UUU10000", "UUUUU0", '0'),
		74	=> ("01001000", "UUU0UU", '0'),
		75	=> ("01U0101U", "UUUUU0", '0'),
		76	=> ("01UUUU1U", "UUUUUU", '0'),
		77	=> ("00000000", "UUU0UU", '0'),
		78	=> ("00100000", "UU0UUU", '0'),
		79	=> ("100UUUU1", "UUUUUU", '0'),
		80	=> ("UUU10000", "UUU0UU", '0'),
		81	=> ("UUUU01UU", "UUU0UU", '0'),
		82	=> ("UUUU00U1", "UUU0UU", '0'),
		83	=> ("UUUU1UUU", "UUU0UU", '1'),
		84	=> ("01100000", "0UUUUU", '0'),
		85	=> ("UUUUUUUU", "U0UUUU", '0'),
		86	=> ("UUUUUUUU", "UU0UUU", '0'),
		87	=> ("0U000000", "UUUUU0", '0'),
		88	=> ("01U01100", "UUUUU0", '0'),
		89	=> ("UU0000U1", "0UUUUU", '0'),
		90	=> ("UUUU1UUU", "UU0UUU", '1'),
		91	=> ("UUU100U1", "U0UUUU", '0'),
		92	=> ("UUU11UUU", "UU0UUU", '0'),
		93	=> ("UUU10000", "UU0UUU", '0'),
		94	=> ("0U000000", "UUUUUU", '0'),
		95	=> ("00100000", "UUUUUU", '0'),
		96	=> ("01U01100", "UUUUUU", '0'),
		97	=> ("100UUUUU", "UUUUUU", '0'),
		98	=> ("00000000", "U0UUUU", '0'),
		99	=> ("00001000", "UUU0UU", '0'),
		100	=> ("0U001000", "UUU0UU", '0'),
		101	=> ("01U00000", "0UUUUU", '0'),
		102	=> ("01U01100", "U0UUUU", '0'),
		103	=> ("00100000", "0UUUUU", '0'),
		104	=> ("01001100", "UUU0UU", '0'),
		105	=> ("0U101000", "UU0UUU", '0'),
		106	=> ("U1UUUU1U", "UUUUUU", '0'),
		107	=> ("00UUUU1U", "UUUUUU", '0'),
		108	=> ("01U11000", "UUUUU0", '0'),
		109	=> ("0010U100", "UUUU0U", '0'),
		110	=> ("00U11000", "UUUUU0", '0'),
		111	=> ("UUU101UU", "UU0UUU", '0'),
		112	=> ("U11UUUU1", "UUUU0U", '0'),
		113	=> ("0010U100", "UUUUU0", '0'),
		114	=> ("00101000", "UUUUU0", '0'),
		115	=> ("01000000", "U0UUUU", '0'),
		116	=> ("110UUUU1", "UUUU0U", '0'),
		117	=> ("11U01100", "UUUU0U", '0'),
		118	=> ("00U0101U", "UUUU0U", '0'),
		119	=> ("11U00U00", "UUUU0U", '0'),
		120	=> ("11U11000", "UUUUU0", '0'),
		121	=> ("U0UUUUUU", "UUUUUU", '0'),
		122	=> ("UUU011UU", "UU0UUU", '0'),
		123	=> ("UUU001UU", "UUU0UU", '0'),
		124	=> ("UUUU00U1", "0UUUUU", '0'),
		125	=> ("UUU11UUU", "U0UUUU", '0'),
		126	=> ("0UUUUUUU", "UUUUUU", '0'),
		127	=> ("10111000", "UUUUUU", '0'),
		128	=> ("UUUU10U0", "UUUUUU", '1'),
		129	=> ("0UU01000", "UUUUUU", '0')
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
		for i in TestVectors'range loop
			-- Send instruction
			t_ir_instruction <= TestVectors(i).tv_instruction;

			-- Send timing
			t_tgl_timing_n <= TestVectors(i).tv_timing_n;

			-- Simulate behavior for specific instructions
			if TestVectors(i).tv_pla129 = '1' then
				for j in 0 to 7 loop
					if TestVectors(i).tv_instruction(j) = 'U' then
						t_ir_instruction(j) <= not TestVectors(129).tv_instruction(j);
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
