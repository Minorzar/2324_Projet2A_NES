-- all_modules_tb.vhd
--
-- Testbench for testing all modules together.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity all_modules_tb is
end all_modules_tb;

architecture SIM of all_modules_tb is
	-- Constants
	constant CLK_PERIOD					: time := 10 ns;

	-- Signals
	signal t_clk_1						: std_logic := '0';
	signal t_clk_2						: std_logic := '0';
	signal t_rdy						: std_logic := '0';
	signal t_tz_pre_n					: std_logic := '0';
	signal t_t_zero						: std_logic := '0';
	signal t_t_res_1					: std_logic := '0';
	signal t_db_instruction				: std_logic_vector(7 downto 0) := (others => '0');
	signal t_pr_instruction				: std_logic_vector(7 downto 0);
	signal t_pl_instruction				: std_logic_vector(7 downto 0);
	signal t_implied					: std_logic;
	signal t_is_two_cycle_opcode		: std_logic;
	signal t_fetch						: std_logic;
	signal t_sync						: std_logic;
	signal t_timing_n					: std_logic_vector(5 downto 0);

	-- Component instantiations
	component predecode_register
		Port (
			i_clk						: in std_logic;
			i_reset						: in std_logic;
			i_db_instruction			: in std_logic_vector(7 downto 0);
			o_pr_instruction			: out std_logic_vector(7 downto 0)
		);
	end component;

	component predecode_logic
		Port (
			i_clk						: in std_logic;
			i_assert_interrupt_control	: in std_logic;
			i_fetch						: in std_logic;
			i_pr_instruction			: in std_logic_vector(7 downto 0);
			o_pl_instruction			: out std_logic_vector(7 downto 0);
			o_implied					: out std_logic;
			o_is_two_cycle_opcode		: out std_logic
		);
	end component;

	component instruction_register
		Port (
			i_clk						: in std_logic;
			i_reset						: in std_logic;
			i_pl_instruction			: in std_logic_vector(7 downto 0);
			o_ir_instruction			: out std_logic_vector(7 downto 0)
		);
	end component;

	component decode_rom
		Port (
			ir							: in std_logic_vector(7 downto 0);
			t_n							: in std_logic_vector(5 downto 0);
			pla							: out std_logic_vector(7 downto 0)
		);
	end component;

	component timing_generator
		Port (
			i_clk_1						: in std_logic;
			i_clk_2						: in std_logic;
			i_rdy						: in std_logic;
			i_tz_pre_n					: in std_logic;
			i_t_zero					: in std_logic;
			i_t_res_1					: in std_logic;
			o_timing_n					: out std_logic_vector(5 downto 0);
			o_fetch						: out std_logic;
			o_sync						: out std_logic
		);
	end component;

begin
	-- Instantiate predecode_register module
	uut_predecode_register: predecode_register
		port map (
			i_clk => t_clk_1,
			i_reset => '0',	-- No reset in this testbench
			i_db_instruction => t_db_instruction,
			o_pr_instruction => t_pr_instruction
		);

	-- Instantiate predecode_logic module
	uut_predecode_logic: predecode_logic
		port map (
			i_clk => t_clk_2,
			i_assert_interrupt_control => '0',	-- No interrupt control in this testbench
			i_fetch => t_fetch,
			i_pr_instruction => t_pr_instruction,
			o_pl_instruction => t_pl_instruction,
			o_implied => t_implied,
			o_is_two_cycle_opcode => t_is_two_cycle_opcode
		);

	-- Instantiate instruction_register module
	uut_instruction_register: instruction_register
	port map (
		i_clk => t_clk_1,	-- Use the same clock as predecode_register
		i_reset => '0',	 -- No reset in this testbench
		i_pl_instruction => t_pl_instruction,
		o_ir_instruction => open	-- Connect output to a signal or observe it in simulation
	);

	-- Instantiate decode_rom module
	uut_decode_rom: decode_rom
	port map (
		ir => t_pl_instruction,	-- Connect to the output of predecode_logic module
		t_n => t_timing_n,	 -- Connect to the output of timing_generator module
		pla => t_pla_output	 -- Connect to a signal to observe the output or connect it to other modules as needed
	);

	-- Instantiate timing_generator module
	uut_timing_generator: timing_generator
		port map (
			i_clk_1 => t_clk_1,
			i_clk_2 => t_clk_2,
			i_rdy => t_rdy,
			i_tz_pre_n => t_tz_pre_n,
			i_t_zero => t_t_zero,
			i_t_res_1 => t_t_res_1,
			o_timing_n => t_timing_n,
			o_fetch => t_fetch,
			o_sync => t_sync
		);

	-- Clock processes
	clk_process: process
	begin
		while now < 1000 ns loop	-- Simulate for 1000 ns
			t_clk_1 <= '1';	-- Set t_clk_1 to high state
			t_clk_2 <= '0';	-- Set t_clk_2 to low state
			wait for CLK_PERIOD / 2;
			t_clk_1 <= '0';	-- Set t_clk_1 to low state
			t_clk_2 <= '1';	-- Set t_clk_2 to high state
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process clk_process;

	-- Stimulus process
	stimulus_process: process
	begin
		-- Test ASL A instruction (Opcode: x"0A")
		t_pr_instruction <= x"0A";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '1' report "Implied flag not set for ASL A instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for ASL A instruction" severity error;

		-- Test PHP instruction (Opcode: x"08")
		t_pr_instruction <= x"08";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '1' report "Implied flag not set for PHP instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for PHP instruction" severity error;

		-- Test CLC instruction (Opcode: x"18")
		t_pr_instruction <= x"18";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '1' report "Implied flag not set for CLC instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for CLC instruction" severity error;

		-- Test TXA instruction (Opcode: x"8A")
		t_pr_instruction <= x"8A";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '1' report "Implied flag not set for TXA instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for TXA instruction" severity error;
	
		-- Test ORA # instruction (Opcode: x"09")
		t_pr_instruction <= x"09";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for ORA # instruction" severity error;
		assert t_is_two_cycle_opcode = '1' report "Two-cycle flag not set for ORA # instruction" severity error;

		-- Test LDX # instruction (Opcode: x"A2")
		t_pr_instruction <= x"A2";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for LDX # instruction" severity error;
		assert t_is_two_cycle_opcode = '1' report "Two-cycle flag not set for LDX # instruction" severity error;

		-- Test LDY # instruction (Opcode: x"A0")
		t_pr_instruction <= x"A0";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for LDY # instruction" severity error;
		assert t_is_two_cycle_opcode = '1' report "Two-cycle flag not set for LDY # instruction" severity error;

		-- Test PHP instruction (Opcode: x"08")
		t_pr_instruction <= x"08";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for PHP instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for PHP instruction" severity error;

		-- Test ORA, Ind,X instruction (Opcode: x"01")
		t_pr_instruction <= x"01";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for ORA, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for ORA, Ind,X instruction" severity error;

		-- Test AND, Ind,X instruction (Opcode: x"21")
		t_pr_instruction <= x"21";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for AND, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for AND, Ind,X instruction" severity error;

		-- Test EOR, Ind,X instruction (Opcode: x"41")
		t_pr_instruction <= x"41";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for EOR, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for EOR, Ind,X instruction" severity error;

		-- Test ADC, Ind,X instruction (Opcode: x"61")
		t_pr_instruction <= x"61";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for ADC, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for ADC, Ind,X instruction" severity error;

		-- Test STA, Ind,X instruction (Opcode: x"81")
		t_pr_instruction <= x"81";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for STA, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for STA, Ind,X instruction" severity error;

		-- Test LDA, Ind,X instruction (Opcode: x"A1")
		t_pr_instruction <= x"A1";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for LDA, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for LDA, Ind,X instruction" severity error;

		-- Test CMP, Ind,X instruction (Opcode: x"C1")
		t_pr_instruction <= x"C1";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for CMP, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for CMP, Ind,X instruction" severity error;

		-- Test SBC, Ind,X instruction (Opcode: x"E1")
		t_pr_instruction <= x"E1";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for SBC, Ind,X instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for SBC, Ind,X instruction" severity error;

		-- Test INC A instruction (Opcode: x"1A")
		t_pr_instruction <= x"1A";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for INC A instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for INC A instruction" severity error;

		-- Test BIT instruction (Opcode: x"89")
		t_pr_instruction <= x"89";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for BIT instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for BIT instruction" severity error;

		-- Test BRA instruction (Opcode: x"80")
		t_pr_instruction <= x"80";
		wait for 2 * CLK_PERIOD;
		assert t_implied = '0' report "Implied flag set for BRA instruction" severity error;
		assert t_is_two_cycle_opcode = '0' report "Two-cycle flag set for BRA instruction" severity error;
	
		wait;

	end process stimulus_process;

end SIM;
