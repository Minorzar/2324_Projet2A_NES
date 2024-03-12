-- decode.vhd
--
-- This VHDL module implements the top-level decoder for the NES FPGA project.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
	Port (
		i_clk_1					: in std_logic;
		i_clk_2					: in std_logic;
		i_db_instruction		: in std_logic_vector(7 downto 0);
		o_pr_instruction		: out std_logic_vector(7 downto 0);
		o_pl_instruction		: out std_logic_vector(7 downto 0);
		o_pl_implied			: out std_logic;
		o_pl_tzpre				: out std_logic;
		o_ir_instruction		: out std_logic_vector(7 downto 0);
		o_tgl_timing_n			: out std_logic_vector(5 downto 0);
		o_tgl_fetch				: out std_logic;
		o_tgl_sync				: out std_logic;
		o_dr_pla				: out std_logic_vector(129 downto 0)
	);
end decode;

architecture Behavioral of decode is
	-- Component declaration for predecode_register
	component predecode_register is
		Port (
			i_clk_2				: in std_logic;
			i_db_instruction	: in std_logic_vector(7 downto 0);
			o_pr_instruction	: out std_logic_vector(7 downto 0)
		);
	end component;

	-- Component declaration for predecode_logic
	component predecode_logic is
		Port (
			i_clk_1				: in std_logic;
			i_irc_aic			: in std_logic;
			i_tgl_fetch			: in std_logic;
			i_pr_instruction	: in std_logic_vector(7 downto 0);
			o_pl_instruction	: out std_logic_vector(7 downto 0);
			o_pl_implied		: out std_logic;
			o_pl_tzpre			: out std_logic
		);
	end component;

	-- Component declaration for instruction_register
	component instruction_register is
		port (
			i_clk_1				: in std_logic;
			i_tgl_fetch			: in std_logic;
			i_pl_instruction	: in std_logic_vector(7 downto 0);
			o_ir_instruction	: out std_logic_vector(7 downto 0)
		);
	end component;

	-- Component declaration for timing_generation_logic
	component timing_generation_logic is
		port (
			i_clk_1				: in std_logic;
			i_clk_2				: in std_logic;
			i_rc_rdy			: in std_logic;
			i_pl_tzpre			: in std_logic;
			i_rcl_t_zero		: in std_logic;
			i_rcl_t_res_1		: in std_logic;
			o_tgl_timing_n		: out std_logic_vector(5 downto 0);
			o_tgl_fetch			: out std_logic;
			o_tgl_sync			: out std_logic
		);
	end component;

	-- Component declaration for decode_rom
	component decode_rom is
		port (
			i_ir_instruction	: in std_logic_vector(7 downto 0);
			i_tgl_timing_n		: in std_logic_vector(5 downto 0);
			o_dr_pla			: out std_logic_vector(129 downto 0)
		);
	end component;

	-- Signal for output from predecode_register
	signal s_pr_instruction		: std_logic_vector(7 downto 0);

	-- Signal for output from predecode_logic
	signal s_pl_instruction		: std_logic_vector(7 downto 0);
	signal s_pl_implied			: std_logic;
	signal s_pl_tzpre			: std_logic;

	-- Signal for output from instruction_register
	signal s_ir_instruction		: std_logic_vector(7 downto 0);

	-- Signals for timing_generation_logic outputs
	signal s_tgl_timing_n		: std_logic_vector(5 downto 0);
	signal s_tgl_fetch			: std_logic;
	signal s_tgl_sync			: std_logic;

	-- Signals for decode_rom outputs
	signal s_dr_pla				: std_logic_vector(129 downto 0);

begin
	-- Instantiate predecode_register module
	UUT_predecode_register: predecode_register
	port map (
		i_clk_2				=> i_clk_2,
		i_db_instruction	=> i_db_instruction,
		o_pr_instruction	=> s_pr_instruction
	);

	-- Instantiate predecode_logic module
	UUT_predecode_logic: predecode_logic
	port map (
		i_clk_1				=> i_clk_1,
		i_irc_aic			=> '1',					-- i_irc_aic has not been implemented yet and set to '1'
		i_tgl_fetch			=> s_tgl_fetch,
		i_pr_instruction	=> s_pr_instruction,
		o_pl_instruction	=> s_pl_instruction,
		o_pl_implied		=> s_pl_implied,
		o_pl_tzpre			=> s_pl_tzpre
	);
	-- Instantiate instruction_register module
	UUT_instruction_register: instruction_register
	port map (
		i_clk_1				=> i_clk_1,
		i_tgl_fetch			=> s_tgl_fetch,
		i_pl_instruction	=> s_pl_instruction,
		o_ir_instruction	=> s_ir_instruction
	);

	-- Instantiate timing_generation_logic module
	UUT_timing_generation_logic: timing_generation_logic
	port map (
		i_clk_1				=> i_clk_1,
		i_clk_2				=> i_clk_2,
		i_rc_rdy			=> '1',					-- i_rc_rdy has not been implemented and set to '1'
		i_pl_tzpre			=> s_pl_tzpre,
		i_rcl_t_zero		=> '0',					-- i_rcl_t_zero has not been implemented and set to '0'
		i_rcl_t_res_1		=> '0',					-- i_rcl_t_res_1 has not been implemented and set to '0'
		o_tgl_timing_n		=> s_tgl_timing_n,
		o_tgl_fetch			=> s_tgl_fetch,
		o_tgl_sync			=> s_tgl_sync
	);

	-- Instantiate decode_rom module
	UUT_decode_rom: decode_rom
	port map (
		i_ir_instruction	=> s_ir_instruction,
		i_tgl_timing_n		=> s_tgl_timing_n,
		o_dr_pla			=> s_dr_pla
	);

	-- Assign output signal from predecode_register to the top-level output port
	o_pr_instruction		<= s_pr_instruction;

	-- Assign output signal from predecode_logic to the top-level output port
	o_pl_instruction		<= s_pl_instruction;
	o_pl_implied			<= s_pl_implied;
	o_pl_tzpre				<= s_pl_tzpre;

	-- Assign output signal from instruction_register to the top-level output port
	o_ir_instruction		<= s_ir_instruction;

	-- Assign output signal from timing_generation_logic to the top-level output port
	o_tgl_timing_n			<= s_tgl_timing_n;
	o_tgl_fetch				<= s_tgl_fetch;
	o_tgl_sync				<= s_tgl_sync;

	-- Assign output signal from decode_rom to the top-level output port
	o_dr_pla				<= s_dr_pla;

end Behavioral;
