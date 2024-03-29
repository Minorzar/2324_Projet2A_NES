library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_test_control is
	Port(
		i_clk: in STD_LOGIC;
		i_irq: in STD_LOGIC;
		i_nmi: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		i_reset: in STD_LOGIC;
		i_set_overflow: in STD_LOGIC;
		i_db7: in STD_LOGIC; -- d_bus(7)
		i_acr: in STD_LOGIC; --ALU carry
		i_p_register_out: in STD_LOGIC_VECTOR(7 downto 0); --status register
		o_read_write: out STD_LOGIC;
		i_data_bus: in unsigned (7 downto 0);
		o_sync: out STD_LOGIC;
		
		--control signals outputted from random_control_logic
		
		o_dl_to_db: out STD_LOGIC;
		o_dl_to_adl: out STD_LOGIC;
		o_dl_to_adh: out STD_LOGIC;
		o_O_to_adh0: out STD_LOGIC;
		o_O_to_adh1_7: out STD_LOGIC;
		o_adh_to_abh: out STD_LOGIC;
		o_adl_to_abl: out STD_LOGIC;
		o_pcl_to_pcl: out STD_LOGIC;
		o_adl_to_pcl: out STD_LOGIC;
		o_i_to_pc: out STD_LOGIC;
		o_pcl_to_db: out STD_LOGIC;
		o_pcl_to_adl: out STD_LOGIC;
		o_pch_to_pch: out STD_LOGIC;
		o_adh_to_pch: out STD_LOGIC;
		o_pch_to_db: out STD_LOGIC;
		o_pch_to_adh: out STD_LOGIC;
		o_sb_to_adh: out STD_LOGIC;
		o_sb_to_db: out STD_LOGIC;
		o_s_to_adl: out STD_LOGIC;
		o_sb_to_s: out STD_LOGIC;
		o_s_to_s: out STD_LOGIC;
		o_s_to_sb: out STD_LOGIC;
		o_db_bar_to_add: out STD_LOGIC;
		o_db_to_add: out STD_LOGIC;
		o_adl_to_add: out STD_LOGIC;
		o_i_to_addc: out STD_LOGIC;
		o_sum_select: out STD_LOGIC;
		o_and_select: out STD_LOGIC;
		o_eor_select: out STD_LOGIC;
		o_or_select: out STD_LOGIC;
		o_shift_right_select: out STD_LOGIC;
		o_add_to_adl: out STD_LOGIC;
		o_add_to_sb_0_6: out STD_LOGIC;
		o_add_to_sb_7: out STD_LOGIC;
		o_O_to_add: out STD_LOGIC;
		o_sb_to_add: out STD_LOGIC;
		o_sb_to_ac: out STD_LOGIC;
		o_ac_to_db: out STD_LOGIC;
		o_ac_to_sb: out STD_LOGIC;
		o_sb_to_x: out STD_LOGIC;
		o_x_to_sb: out STD_LOGIC;
		o_sb_to_y: out STD_LOGIC;
		o_y_to_sb: out STD_LOGIC;
		o_p_to_db: out STD_LOGIC;
		o_db0_to_c: out STD_LOGIC;
		o_ir5_to_c: out STD_LOGIC;
		o_acr_to_c: out STD_LOGIC;
		o_db1_to_z: out STD_LOGIC;
		o_dbz_to_z: out STD_LOGIC;
		o_db2_to_i: out STD_LOGIC;
		o_ir5_to_i: out STD_LOGIC;
		o_db3_to_d: out STD_LOGIC;
		o_ir5_to_d: out STD_LOGIC;
		o_db6_to_v: out STD_LOGIC;
		o_avr_to_v: out STD_LOGIC;
		o_0_to_v: out STD_LOGIC;
		o_1_to_v: out STD_LOGIC;
		o_db7_to_n:out STD_LOGIC);
		
end CPU_test_control;
architecture Structural of CPU_test_control is
	
	signal decode_rom_output: STD_LOGIC_VECTOR (129 downto 0);
	signal instruction_register: STD_LOGIC_VECTOR (7 downto 0);
	signal timing_register: STD_LOGIC_VECTOR(5 downto 0);
	signal phi1: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal rdy: STD_LOGIC;
	signal avr: STD_LOGIC;
	signal pclc : STD_LOGIC;
	signal reset: STD_LOGIC;
	signal reset_in_progress: STD_LOGIC;
	signal interrupt_in_progress: STD_LOGIC;
	signal break_done: STD_LOGIC;
	signal break_in_progress: STD_LOGIC;
	signal implied_addressing: STD_LOGIC;
	signal two_cycle: STD_LOGIC;
	signal zero_adl: STD_LOGIC_VECTOR(2 downto 0);
	signal t1_reset: STD_LOGIC;
	signal t_zero: STD_LOGIC;
	signal buf_read_write: STD_LOGIC;
	
begin
	
	clock_generator: entity work.CPU_clock_generator
	port map(i_clk => i_clk, o_phi1 => phi1, o_phi2 => phi2);
	
	decode: entity work.decode
	port map(i_clk => i_clk, i_clk_1 => phi1, i_clk_2 => phi2, i_db_instruction => std_logic_vector(i_data_bus), i_aic => not break_in_progress, i_rdy => rdy, i_t_zero => t_zero, i_t_res_1 => t1_reset, o_pl_implied => implied_addressing, o_pl_tzpre => two_cycle, o_ir_instruction => instruction_register, o_tgl_timing_n => timing_register, o_tgl_sync => o_sync, o_dr_pla => decode_rom_output);
	
	random_control_logic: entity work.CPU_random_control_logic
	port map(i_clk => i_clk, i_rdy => rdy, i_phi1 => phi1, i_phi2 => phi2, i_dr => decode_rom_output, i_reset => reset, i_reset_in_progress => reset_in_progress, i_break_in_progress => break_in_progress, i_break_done => break_done, i_implied_addressing => implied_addressing, i_two_cycle => two_cycle, i_set_overflow => i_set_overflow, i_t0 => timing_register(0), i_ir5 => instruction_register(5), i_db7 => i_db7, i_alu_carry_out => i_acr, i_zero_adl0 => zero_adl(0), i_p_register => i_p_register_out,
	o_dl_to_db => o_dl_to_db, o_dl_to_adl => o_dl_to_adl, o_dl_to_adh => o_dl_to_adh, o_O_to_adh0 => o_O_to_adh0, o_O_to_adh1_7 => o_O_to_adh1_7, o_adh_to_abh => o_adh_to_abh, o_adl_to_abl => o_adl_to_abl, o_pcl_to_pcl => o_pcl_to_pcl, o_adl_to_pcl => o_adl_to_pcl, o_i_to_pc => o_i_to_pc, o_pcl_to_db => o_pcl_to_db, o_pcl_to_adl => o_pcl_to_adl, o_pch_to_pch => o_pch_to_pch, o_adh_to_pch => o_adh_to_pch, o_pch_to_db => o_pch_to_db, o_pch_to_adh => o_pch_to_adh, o_sb_to_adh => o_sb_to_adh, o_sb_to_db => o_sb_to_db, o_s_to_adl => o_s_to_adl,
	o_sb_to_s => o_sb_to_s, o_s_to_s => o_s_to_s, o_s_to_sb => o_s_to_sb, o_db_bar_to_add => o_db_bar_to_add, o_db_to_add => o_db_to_add, o_adl_to_add => o_adl_to_add, o_i_to_addc => o_i_to_addc, o_sum_select => o_sum_select, o_and_select => o_and_select, o_eor_select => o_eor_select, o_or_select => o_or_select, o_shift_right_select => o_shift_right_select, o_add_to_adl => o_add_to_adl, o_add_to_sb_0_6 => o_add_to_sb_0_6, o_add_to_sb_7 => o_add_to_sb_7, o_O_to_add => o_O_to_add, o_sb_to_add => o_sb_to_add, o_sb_to_ac => o_sb_to_ac, o_ac_to_db => o_ac_to_db,
	o_ac_to_sb => o_ac_to_sb, o_sb_to_x => o_sb_to_x, o_x_to_sb => o_x_to_sb, o_sb_to_y => o_sb_to_y, o_y_to_sb => o_y_to_sb, o_p_to_db => o_p_to_db, o_db0_to_c => o_db0_to_c, o_ir5_to_c => o_ir5_to_c, o_acr_to_c => o_acr_to_c, o_db1_to_z => o_db1_to_z, o_dbz_to_z => o_dbz_to_z, o_db2_to_i => o_db2_to_i, o_ir5_to_i => o_ir5_to_i, o_db3_to_d => o_db3_to_d, o_ir5_to_d => o_ir5_to_d, o_db6_to_v => o_db6_to_v, o_avr_to_v => o_avr_to_v, o_1_to_v => o_1_to_v, o_0_to_v => o_0_to_v, o_db7_to_n => o_db7_to_n, o_t1_reset => t1_reset, o_read_write => buf_read_write, o_reg_reset => t_zero);
	
	ready_control: entity work.CPU_ready_control
	port map(i_clk => i_clk, i_phi2 => phi2, i_ready => i_ready, i_read_write => buf_read_write, o_rdy => rdy);
	
	reset_interrupt_control: entity work.CPU_interrupt_reset_control
	port map(i_clk => i_clk, i_phi1 => phi1, i_phi2 => phi2, i_nmi => i_nmi, i_irq => i_irq, i_reset => i_reset, i_rdy => i_ready, i_t0 => timing_register(0), i_t2_branch => decode_rom_output(80), i_t5_break => decode_rom_output(22), i_interrupt_flag => i_p_register_out(2), o_reset_out => reset, o_reset_in_progress => reset_in_progress, o_interrupt_in_progress => interrupt_in_progress, o_break_done => break_done, o_aic => break_in_progress, o_zero_adl => zero_adl);
	
	o_read_write <= buf_read_write;
	
end Structural;