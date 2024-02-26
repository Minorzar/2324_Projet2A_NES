-- tb_timing_generator_logic.vhd
--
-- This VHDL testbench simulates the behavior of the timing_generator_logic module.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_timing_generator_logic is
end tb_timing_generator_logic;

architecture Behavioral of tb_timing_generator_logic is
	-- Constants
	constant CLK_PERIOD			: time := 100 ps;					-- Clock period

	-- Signals
	signal t_clk_1				: std_logic;						-- Input clock signal for latch signals
	signal t_clk_2				: std_logic;						-- Input clock signal for internal latches
	signal t_rc_rdy				: std_logic;						-- Input ready signal from ready_control
	signal t_pl_tzpre			: std_logic;						-- Input signal set high when the opcode is a two-cycle opcode from predecode_logic
	signal t_rcl_t_zero			: std_logic;						-- Input signal to reset timing registers from random_control_logic
	signal t_rcl_t_res_1		: std_logic;						-- Input signal to reset timing register 1 from random_control_logic
	signal t_tgl_timing_n		: std_logic_vector(5 downto 0);		-- Output main timing signals 0-5 (active low)
	signal t_tgl_fetch			: std_logic;						-- Output signal indicating a fetch instruction is needed
	signal t_tgl_sync			: std_logic;						-- Output signal indicating an instruction fetch is in progress
	
begin
	-- Instantiate the timing_generator_logic module
	UUT: entity work.timing_generator_logic
	port map (
		i_clk_1				=> t_clk_1,
		i_clk_2				=> t_clk_2,
		i_rc_rdy			=> t_rc_rdy,
		i_pl_tzpre			=> t_pl_tzpre,
		i_rcl_t_zero		=> t_rcl_t_zero,
		i_rcl_t_res_1		=> t_rcl_t_res_1,
		o_tgl_timing_n		=> t_tgl_timing_n,
		o_tgl_fetch			=> t_tgl_fetch,
		o_tgl_sync			=> t_tgl_sync
	);

	-- Clock process
	process
	begin
		-- Simulate for 100 ns
		while now < 100 ns loop
			t_clk_1 <= '1';
			t_clk_2 <= '0';
			wait for CLK_PERIOD / 2;
			t_clk_1 <= '0';
			t_clk_2 <= '1';
			wait for CLK_PERIOD / 2;
		end loop;
		wait;
	end process;

	-- Stimulus process
	process
	begin
		t_rc_rdy <= '1';
		t_pl_tzpre <= '1';
		t_rcl_t_zero <= '1';
		t_rcl_t_res_1 <= '1';
		wait for CLK_PERIOD * 7;

		t_rc_rdy <= '1';
		t_pl_tzpre <= '1';
		t_rcl_t_zero <= '0';
		t_rcl_t_res_1 <= '0';
		wait for CLK_PERIOD * 7;

		t_rc_rdy <= '0';
		t_pl_tzpre <= '0';
		t_rcl_t_zero <= '1';
		t_rcl_t_res_1 <= '1';
		wait for CLK_PERIOD * 7;

		t_rc_rdy <= '1';
		t_pl_tzpre <= '0';
		t_rcl_t_zero <= '0';
		t_rcl_t_res_1 <= '0';
		wait for CLK_PERIOD * 7;

		t_rc_rdy <= '0';
		t_pl_tzpre <= '0';
		t_rcl_t_zero <= '0';
		t_rcl_t_res_1 <= '0';
		wait for CLK_PERIOD * 7;

		wait;
	end process;

end Behavioral;
