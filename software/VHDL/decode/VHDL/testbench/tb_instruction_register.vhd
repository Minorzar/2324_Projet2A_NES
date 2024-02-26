-- tb_instruction_register.vhd
--
-- This VHDL testbench simulates the behavior of the instruction_register module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_instruction_register is
end tb_instruction_register;

architecture Behavioral of tb_instruction_register is
	-- Constants
	constant CLK_PERIOD			: time := 100 ps;					-- Clock period

	-- Signals
	signal t_clk_1				: std_logic := '0';					-- Input clock signal
	signal t_tgl_fetch			: std_logic;						-- Input fetch signal from timing_generator_logic
	signal t_pl_instruction		: std_logic_vector(7 downto 0);		-- Input instruction from predecode_logic
	signal t_ir_instruction		: std_logic_vector(7 downto 0);		-- Output instruction from instruction_register

	-- Component declaration
	component instruction_register
		port (
			i_clk_1				: in std_logic;
			i_tgl_fetch			: in std_logic;
			i_pl_instruction	: in std_logic_vector(7 downto 0);
			o_ir_instruction	: out std_logic_vector(7 downto 0)
		);
	end component;

begin
	-- Instantiate the instruction_register module
	UUT: instruction_register
	port map (
		i_clk_1				=> t_clk_1,
		i_tgl_fetch			=> t_tgl_fetch,
		i_pl_instruction	=> t_pl_instruction,
		o_ir_instruction	=> t_ir_instruction
	);

	-- Clock generator process
	process
	begin
		-- Simulate for 100 ns
		while now < 100 ns loop
			t_clk_1 <= not t_clk_1; -- Toggle the clock
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process
	process
	begin
		-- Initialize t_tgl_fetch to '1'
		t_tgl_fetch <= '1';

		-- Test ASL acc instruction (Opcode: x"0A")
		t_pl_instruction <= x"0A";
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"0A" report "ASL acc instruction failed" severity error;

		-- Test ORA # instruction (Opcode: x"09")
		t_pl_instruction <= x"09";
		t_tgl_fetch <= '0';		-- Disable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"0A" report "Fetch disabled, unexpected instruction fetched" severity error;

		t_tgl_fetch <= '1';		-- Enable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"09" report "ORA # instruction failed" severity error;

		-- Test LDX # instruction (Opcode: x"A2")
		t_pl_instruction <= x"A2";
		t_tgl_fetch <= '0';		-- Disable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"09" report "Fetch disabled, unexpected instruction fetched" severity error;

		t_tgl_fetch <= '1';		-- Enable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"A2" report "LDX # instruction failed" severity error;

		-- Test PHP instruction (Opcode: x"08")
		t_pl_instruction <= x"08";
		t_tgl_fetch <= '0';		-- Disable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"A2" report "Fetch disabled, unexpected instruction fetched" severity error;

		t_tgl_fetch <= '1';		-- Enable fetch
		wait for CLK_PERIOD;
		assert t_ir_instruction = x"08" report "PHP instruction failed" severity error;

		wait;
	end process;

end Behavioral;
