-- tb_predecode_logic.vhd
--
-- This VHDL testbench simulates the behavior of the predecode_logic module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_predecode_logic is
end tb_predecode_logic;

architecture Behavioral of tb_predecode_logic is
	-- Constants
	constant CLK_PERIOD			: time := 200 ps;

	-- Signals
	signal t_clk_1				: std_logic := '0';
	signal t_irc_aic			: std_logic;
	signal t_tgl_fetch			: std_logic;
	signal t_pr_instruction		: std_logic_vector(7 downto 0);
	signal t_pl_instruction		: std_logic_vector(7 downto 0);
	signal t_pl_implied			: std_logic;
	signal t_pl_tzpre			: std_logic;

	-- Define arrays to hold test vectors
	type InstructionArray is array (natural range <>) of std_logic_vector(7 downto 0);
	type ImpliedArray is array (natural range <>) of std_logic;
	type TzPreArray is array (natural range <>) of std_logic;

	-- Define input instructions
	constant Instructions : InstructionArray := (
		0 => "UUUUUUUU",	-- No operation
		1 => x"0A",			-- ASL acc
		2 => x"09",			-- ORA #
		3 => x"A2",			-- LDX #
		4 => x"08"			-- PHP
	);

	-- Define implied status
	constant Implied : ImpliedArray := (
		0 => 'U',			-- No operation
		1 => '1',			-- ASL acc
		2 => '0',			-- ORA #
		3 => '0',			-- LDX #
		4 => '1'			-- PHP
	);

	-- Define 2-cycles status
	constant TzPre : TzPreArray := (
		0 => 'U',			-- No operation
		1 => '1',			-- ASL acc
		2 => '1',			-- ORA #
		3 => '1',			-- LDX #
		4 => '0'			-- PHP
	);

begin
	-- Instantiate the predecode_logic module
	UUT: entity work.predecode_logic
	port map (
		i_clk_1				=> t_clk_1,
		i_irc_aic			=> t_irc_aic,
		i_tgl_fetch			=> t_tgl_fetch,
		i_pr_instruction	=> t_pr_instruction,
		o_pl_instruction	=> t_pl_instruction,
		o_pl_implied		=> t_pl_implied,
		o_pl_tzpre			=> t_pl_tzpre
	);

	-- Clock process
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
		-- Initialise t_irc_aic and t_tgl_fetch to '1'
		t_irc_aic <= '1';
		t_tgl_fetch <= '1';

        -- Iterate through each test vector, starting from index 1
		for i in 1 to Instructions'high loop
			-- Test instruction
			t_pr_instruction <= Instructions(i);
			wait for CLK_PERIOD;
			assert t_pl_instruction = Instructions(i) report "Instruction failed" severity error;
			wait for CLK_PERIOD;
			assert t_pl_implied = Implied(i) report "Implied signal failed" severity error;
			assert t_pl_tzpre = TzPre(i) report "Two-cycle signal failed" severity error;
			wait for CLK_PERIOD;
		end loop;

        -- Wait indefinitely
		wait;
	end process;

end Behavioral;
