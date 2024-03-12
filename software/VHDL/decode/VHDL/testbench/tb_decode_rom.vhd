-- tb_decode_rom.vhd
--
-- This VHDL testbench simulates the behavior of the decode_rom module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decode_rom is
end tb_decode_rom;

architecture Behavioral of tb_decode_rom is
	-- Constants
	constant CLK_PERIOD			: time := 100 ps;					-- Clock period

	-- Signals
	signal t_ir_instruction		: std_logic_vector(7 downto 0);		-- Input instruction from instruction_register
	signal t_tgl_timing_n		: std_logic_vector(5 downto 0);		-- Input T-n value from timing_generation_logic (active low)
	signal t_dr_pla				: std_logic_vector(129 downto 0);	-- Output programmable logic array (active high)

	-- Define arrays to hold test vectors
	type InstructionArray is array (natural range <>) of std_logic_vector(7 downto 0);
	type TimingArray is array (natural range <>) of std_logic_vector(5 downto 0);
	constant Instructions : InstructionArray := (
		0 => "100UU100",
		1 => "UUU100U1"
	);
	constant Timings : TimingArray := (
		0 => "UUUUUU",
		1 => "UU0UUU"
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
		for i in Instructions'range loop
			-- Send instruction
			t_ir_instruction <= Instructions(i);

			-- Send timing
			t_tgl_timing_n <= Timings(i);

			wait for CLK_PERIOD;

			-- Check output and raise assertion if not expected
			assert t_dr_pla(i) = '1' report "Output mismatch at index " & integer'image(i) severity error;

		end loop;
		wait;
	end process;

end Behavioral;
