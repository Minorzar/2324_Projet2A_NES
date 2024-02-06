library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_predecode_register is
end tb_predecode_register;

architecture Behavioral of tb_predecode_register is
	-- Constants
	constant CLK_PERIOD	: time := 10 ns;	-- Clock period

	-- Signals
	signal t_clk_2			: std_logic := '0';									-- Input clock signal
	signal t_db_instruction	: std_logic_vector(7 downto 0) := (others => '0');	-- Input instruction from data bus
	signal t_pr_instruction	: std_logic_vector(7 downto 0);						-- Output instruction from predecode_register

	-- Component declaration
	component predecode_register
		port (
			i_clk_2				: in std_logic;
			i_db_instruction	: in std_logic_vector(7 downto 0);
			o_pr_instruction	: out std_logic_vector(7 downto 0)
		);
	end component;

	-- Procedure to test an instruction
	procedure test_instruction(constant opcode : std_logic_vector) is
	begin
		t_db_instruction <= opcode;
		wait for CLK_PERIOD;
		assert t_pr_instruction = t_db_instruction
			report "Output does not match input"
			severity failure;
	end procedure;

begin
	-- Instantiate the predecode_register module
	UUT: predecode_register
	port map (
		i_clk_2 => t_clk_2,
		i_db_instruction => t_db_instruction,
		o_pr_instruction => t_pr_instruction
	);

	-- Clock generator process
	process
	begin
		while now < 1000 ns loop -- Simulate for 1000 ns
			t_clk_2 <= not t_clk_2; -- Toggle the clock
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process for testing various instructions
	stimulus: process
	begin
		test_instruction(x"0A");	-- ASL A instruction
		test_instruction(x"08");	-- PHP instruction
		test_instruction(x"18");	-- CLC instruction
		test_instruction(x"8A");	-- TXA instruction
		test_instruction(x"09");	-- ORA # instruction
		test_instruction(x"A2");	-- LDX # instruction
		test_instruction(x"A0");	-- LDY # instruction
		test_instruction(x"08");	-- PHP instruction
		test_instruction(x"01");	-- ORA, Ind,X instruction
		test_instruction(x"21");	-- AND, Ind,X instruction
		test_instruction(x"41");	-- EOR, Ind,X instruction
		test_instruction(x"61");	-- ADC, Ind,X instruction
		test_instruction(x"81");	-- STA, Ind,X instruction
		test_instruction(x"A1");	-- LDA, Ind,X instruction
		test_instruction(x"C1");	-- CMP, Ind,X instruction
		test_instruction(x"E1");	-- SBC, Ind,X instruction
		test_instruction(x"1A");	-- INC A instruction
		test_instruction(x"89");	-- BIT instruction
		test_instruction(x"80");	-- BRA instruction
		wait;
	end process;

end Behavioral;
