-- decode.vhd
--
-- This VHDL module implements the top-level decode module for the NES FPGA project.
--
-- Description:
-- The decoder is responsible for interpreting incoming instruction bytes, deriving control signals,
-- and facilitating proper instruction execution within the 6502 processor architecture.

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
	--------------------------------------
	-- Predecode Register --
	--------------------------------------
	-- Component declaration
	component predecode_register is
		port (
			i_clk_2				: in std_logic;							-- Input clock signal (rising edge)
			i_db_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from the data bus
			o_pr_instruction	: out std_logic_vector(7 downto 0)		-- Output instruction
		);
	end component;

	-- Output signal(s)
	signal s_pr_instruction		: std_logic_vector(7 downto 0);


	--------------------------------------
	-- Predecode Logic --
	--------------------------------------
	-- Component declaration
	component predecode_logic is
		port (
			i_clk_1				: in std_logic;							-- Input clock signal (rising edge)
			i_irc_aic			: in std_logic;							-- Input assert interrupt control signal from interrupt_and_reset_control (break in progress)
			i_tgl_fetch			: in std_logic;							-- Input fetch signal from timing_generation_logic
			i_pr_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from predecode_register
			o_pl_instruction	: out std_logic_vector(7 downto 0);		-- Output predecoded instruction
			o_pl_implied		: out std_logic;						-- Output signal (active high) indicating an opcode with implied addressing mode
			o_pl_tzpre			: out std_logic							-- Output signal (active low) indicating a two-cycle opcode
		);
	end component;

	-- Output signal(s)
	signal s_pl_instruction		: std_logic_vector(7 downto 0);
	signal s_pl_implied			: std_logic;
	signal s_pl_tzpre			: std_logic;


	--------------------------------------
	-- Instruction Register --
	--------------------------------------
	-- Component declaration
	component instruction_register is
		port (
			i_clk_1				: in std_logic;							-- Input clock signal (rising edge)
			i_tgl_fetch			: in std_logic;							-- Input fetch signal from timing_generation_logic
			i_pl_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from predecode_logic
			o_ir_instruction	: out std_logic_vector(7 downto 0)		-- Output instruction from instruction_register
		);
	end component;

	-- Output signal(s)
	signal s_ir_instruction		: std_logic_vector(7 downto 0);


	--------------------------------------
	-- Timing Generation Logic --
	--------------------------------------
	-- Component declaration
	component timing_generation_logic is
		port (
			i_clk_1				: in std_logic;							-- Input clock signal (rising edge)
			i_clk_2				: in std_logic;							-- Input clock signal (rising edge)
			i_rc_rdy			: in std_logic;							-- Input signal from ready_control indicating ready (active high)
			i_pl_tzpre			: in std_logic;							-- Input signal from predecode_logic indicating a two-cycle opcode (active low)
			i_rcl_t_zero		: in std_logic;							-- Input signal from random_control_logic to reset timing registers (active high)
			i_rcl_t_res_1		: in std_logic;							-- Input signal from random_control_logic indicating pre-latched version of sync signal on clk_1
			o_tgl_timing_n		: out std_logic_vector(5 downto 0);		-- Output signal indicating T-n value (active low)
			o_tgl_fetch			: out std_logic;						-- Output signal indicating instruction fetch
			o_tgl_sync			: out std_logic							-- Output signal indicating instruction fetch in progress (active high)
		);
	end component;

	-- Output signal(s)
	signal s_tgl_timing_n		: std_logic_vector(5 downto 0);
	signal s_tgl_fetch			: std_logic;
	signal s_tgl_sync			: std_logic;


	--------------------------------------
	-- Decode ROM --
	--------------------------------------
	-- Component declaration
	component decode_rom is
		port (
			i_ir_instruction	: in std_logic_vector(7 downto 0);		-- Input instruction from instruction_register
			i_tgl_timing_n		: in std_logic_vector(5 downto 0);		-- Input T-n value from timing_generation_logic
			o_dr_pla			: out std_logic_vector(129 downto 0)	-- Output programmable logic array
		);
	end component;

	-- Output signal(s)
	signal s_dr_pla				: std_logic_vector(129 downto 0);

begin
	--------------------------------------
	-- Predecode Register --
	--------------------------------------
	-- Instantiate module
	UUT_predecode_register: predecode_register
	port map (
		i_clk_2				=> i_clk_2,
		i_db_instruction	=> i_db_instruction,
		o_pr_instruction	=> s_pr_instruction
	);

	-- Assign output signal(s)
	o_pr_instruction		<= s_pr_instruction;


	--------------------------------------
	-- Predecode Logic --
	--------------------------------------
	-- Instantiate module
	UUT_predecode_logic: predecode_logic
	port map (
		i_clk_1				=> i_clk_1,
		i_irc_aic			=> '1',					-- Interrupt Reset Control has not been implemented yet
		i_tgl_fetch			=> s_tgl_fetch,
		i_pr_instruction	=> s_pr_instruction,
		o_pl_instruction	=> s_pl_instruction,
		o_pl_implied		=> s_pl_implied,
		o_pl_tzpre			=> s_pl_tzpre
	);

	-- Assign output signal(s)
	o_pl_instruction		<= s_pl_instruction;
	o_pl_implied			<= s_pl_implied;
	o_pl_tzpre				<= s_pl_tzpre;


	--------------------------------------
	-- Instruction Register --
	--------------------------------------
	-- Instantiate module
	UUT_instruction_register: instruction_register
	port map (
		i_clk_1				=> i_clk_1,
		i_tgl_fetch			=> s_tgl_fetch,
		i_pl_instruction	=> s_pl_instruction,
		o_ir_instruction	=> s_ir_instruction
	);

	-- Assign output signal(s)
	o_ir_instruction		<= s_ir_instruction;


	--------------------------------------
	-- Timing Generation Logic --
	--------------------------------------
	-- Instantiate module
	UUT_timing_generation_logic: timing_generation_logic
	port map (
		i_clk_1				=> i_clk_1,
		i_clk_2				=> i_clk_2,
		i_rc_rdy			=> '1',					-- Ready Control has not been implemented yet
		i_pl_tzpre			=> s_pl_tzpre,
		i_rcl_t_zero		=> '0',					-- Random Control Logic has not been implemented yet
		i_rcl_t_res_1		=> '0',					-- Random Control Logic has not been implemented yet
		o_tgl_timing_n		=> s_tgl_timing_n,
		o_tgl_fetch			=> s_tgl_fetch,
		o_tgl_sync			=> s_tgl_sync
	);

	-- Assign output signal(s)
	o_tgl_timing_n			<= s_tgl_timing_n;
	o_tgl_fetch				<= s_tgl_fetch;
	o_tgl_sync				<= s_tgl_sync;


	--------------------------------------
	-- Decode ROM --
	--------------------------------------
	-- Instantiate module
	UUT_decode_rom: decode_rom
	port map (
		i_ir_instruction	=> s_ir_instruction,
		i_tgl_timing_n		=> s_tgl_timing_n,
		o_dr_pla			=> s_dr_pla
	);

	-- Assign output signal(s)
	o_dr_pla				<= s_dr_pla;

end Behavioral;
