library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	Port(
		i_clk: in STD_LOGIC;
		i_irq: in STD_LOGIC;
		i_nmi: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		i_reset: in STD_LOGIC;
		i_set_overflow: in STD_LOGIC;
		o_address_bus: out STD_LOGIC_VECTOR (15 downto 0);
		o_read_write: out STD_LOGIC;
		i_data_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_data_bus: out STD_LOGIC_VECTOR (7 downto 0);
		o_sync: out STD_LOGIC);

end CPU;
architecture Behavioral of CPU is
	signal s_bus: STD_LOGIC_VECTOR (7 downto 0);
	signal d_bus: STD_LOGIC_VECTOR (7 downto 0);
	signal adl_bus: STD_LOGIC_VECTOR (7 downto 0);
	signal adh_bus: STD_LOGIC_VECTOR (7 downto 0);
	signal alu_result: STD_LOGIC_VECTOR (7 downto 0);
	signal alu_a_input: STD_LOGIC_VECTOR (7 downto 0);
	signal alu_b_input: STD_LOGIC_VECTOR (7 downto 0);
	signal decode_rom_output: STD_LOGIC_VECTOR (129 downto 0);
	signal p_register_out: STD_LOGIC_VECTOR (7 downto 0);
	signal instruction_register: STD_LOGIC_VECTOR (7 downto 0);
	signal timing_register: STD_LOGIC_VECTOR(5 downto 0);
	signal phi1: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal rdy: STD_LOGIC;
	signal acr: STD_LOGIC;
	signal avr: STD_LOGIC;
	signal pclc : STD_LOGIC;
	signal reset: STD_LOGIC;
	signal reset_in_progress: STD_LOGIC;
	signal break_done: STD_LOGIC;
	signal break_in_progress: STD_LOGIC;
	signal implied_addressing: STD_LOGIC;
	signal two_cycle: STD_LOGIC;
	signal zero_adl: STD_LOGIC_VECTOR(2 downto 0);
	signal dl_to_db: STD_LOGIC;
	signal dl_to_adl: STD_LOGIC;
	signal dl_to_adh: STD_LOGIC;
	signal O_to_adh0: STD_LOGIC;
	signal O_to_adh1_7: STD_LOGIC;
	signal adh_to_abh: STD_LOGIC;
	signal adl_to_abl: STD_LOGIC;
	signal pcl_to_pcl: STD_LOGIC;
	signal adl_to_pcl: STD_LOGIC;
	signal i_to_pc: STD_LOGIC;
	signal pcl_to_db: STD_LOGIC;
	signal pcl_to_adl: STD_LOGIC;
	signal pch_to_pch: STD_LOGIC;
	signal adh_to_pch: STD_LOGIC;
	signal pch_to_db: STD_LOGIC;
	signal pch_to_adh: STD_LOGIC;
	signal sb_to_adh: STD_LOGIC;
	signal sb_to_db: STD_LOGIC;	
	signal s_to_adl: STD_LOGIC;
	signal sb_to_s: STD_LOGIC;
	signal s_to_s: STD_LOGIC;
	signal s_to_sb: STD_LOGIC;
	signal db_bar_to_add: STD_LOGIC;
	signal db_to_add: STD_LOGIC;
	signal adl_to_add: STD_LOGIC;
	signal i_to_addc: STD_LOGIC;
	signal sum_select: STD_LOGIC;
	signal and_select: STD_LOGIC;
	signal eor_select: STD_LOGIC;
	signal or_select: STD_LOGIC;
	signal shift_right_select: STD_LOGIC;
	signal add_to_adl: STD_LOGIC;
	signal add_to_sb_0_6: STD_LOGIC;
	signal add_to_sb_7: STD_LOGIC;
	signal O_to_add: STD_LOGIC;
	signal sb_to_add: STD_LOGIC;
	signal sb_to_ac: STD_LOGIC;
	signal ac_to_db: STD_LOGIC;
	signal ac_to_sb: STD_LOGIC;
	signal sb_to_x: STD_LOGIC;
	signal x_to_sb: STD_LOGIC;
	signal sb_to_y: STD_LOGIC;
	signal y_to_sb: STD_LOGIC;
	signal p_to_db: STD_LOGIC;
	signal db0_to_c: STD_LOGIC;
	signal ir5_to_c: STD_LOGIC;
	signal acr_to_c: STD_LOGIC;
	signal db1_to_z: STD_LOGIC;
	signal dbz_to_z: STD_LOGIC;
	signal db2_to_i: STD_LOGIC;
	signal ir5_to_i: STD_LOGIC;
	signal db3_to_d: STD_LOGIC;
	signal ir5_to_d: STD_LOGIC;
	signal db6_to_v: STD_LOGIC;
	signal avr_to_v: STD_LOGIC;
	signal i_to_v: STD_LOGIC;
	signal O_to_v: STD_LOGIC;
	signal db7_to_n: STD_LOGIC;
	signal t1_reset: STD_LOGIC;
	signal t_zero: STD_LOGIC;
	signal buf_read_write: STD_LOGIC;
	
	signal ac_out: STD_LOGIC_VECTOR(7 downto 0);
	signal adder_hold_out: STD_LOGIC_VECTOR(7 downto 0);
	signal data_out: STD_LOGIC_VECTOR(7 downto 0);
	signal input_data_out: STD_LOGIC_VECTOR(7 downto 0);
	signal program_counter_low_out: STD_LOGIC_VECTOR(7 downto 0);
	signal program_counter_high_out: STD_LOGIC_VECTOR(7 downto 0);
	signal stack_pointer_out: STD_LOGIC_VECTOR(7 downto 0);
	signal x_out: STD_LOGIC_VECTOR(7 downto 0);
	signal y_out: STD_LOGIC_VECTOR(7 downto 0);
	
begin
	
	a_input_register: entity work.CPU_a_input_register
	port map(i_clk => i_clk, i_sb_to_add => sb_to_add, i_O_to_add => O_to_add, i_s_bus => s_bus, o_output => alu_a_input);
	
	ac_register: entity work.CPU_ac_register
	port map(i_clk => i_clk, i_sb_to_ac => sb_to_ac, i_s_bus => s_bus, o_reg_out => ac_out);
	
	adder_hold_register: entity work.CPU_adder_hold_register
	port map(i_clk => i_clk, i_input => alu_result, o_reg_out => adder_hold_out);
	
	address_bus_high_register: entity work.CPU_address_bus_register
	port map(i_clk => i_clk, i_phi1 => phi1, i_adlh_to_ablh => adh_to_abh, o_address_bus => o_address_bus(15 downto 8), i_adlh_bus => adh_bus);
	
	address_bus_low_register: entity work.CPU_address_bus_register
	port map(i_clk => i_clk, i_phi1 => phi1, i_adlh_to_ablh => adl_to_abl, o_address_bus => o_address_bus(7 downto 0), i_adlh_bus => adl_bus);
	
	alu: entity work.CPU_ALU
	port map(i_clk => i_clk, i_a_register => alu_a_input, i_b_register => alu_b_input, i_sum_select => sum_select, i_and_select => and_select, i_eor_select => eor_select, i_or_select => or_select, i_shift_right_select => shift_right_select, i_carry => i_to_addc, o_result => alu_result, o_carry => acr, o_overflow => avr);
	
	b_input_register: entity work.CPU_b_input_register
	port map(i_clk => i_clk, i_adl_to_add => adl_to_add, i_db_to_add => db_to_add, i_db_bar_to_add => db_bar_to_add, i_d_bus => d_bus, i_adl_bus => adl_bus, o_output => alu_b_input);
	
	clock_generator: entity work.CPU_clock_generator
	port map(i_clk => i_clk, o_phi1 => phi1, o_phi2 => phi2);
	
	data_output_register_buffer: entity work.CPU_data_output_register_buffer
	port map(i_clk => i_clk, i_phi1 => phi1, i_d_bus => d_bus, o_reg_out => o_data_bus);
	
	decode: entity work.decode
	port map(i_clk => i_clk, i_clk_1 => phi1, i_clk_2 => phi2, i_db_instruction => i_data_bus, i_aic => not break_in_progress, i_rdy => rdy, i_t_zero => t_zero, i_t_res_1 => t1_reset, o_pl_implied => implied_addressing, o_pl_tzpre => two_cycle, o_ir_instruction => instruction_register, o_tgl_timing_n => timing_register, o_tgl_sync => o_sync, o_dr_pla => decode_rom_output);
	
	input_data_latch: entity work.CPU_input_data_latch
	port map(i_clk => i_clk, i_phi2 => phi2, i_data_bus => i_data_bus, o_reg_out => input_data_out);
	
	p_register: entity work.CPU_p_register
	port map(i_clk => i_clk, i_ir5 => instruction_register(5), i_acr => acr, i_avr => avr, i_db0_to_c => db0_to_c, i_ir5_to_c => ir5_to_c, i_acr_to_c => acr_to_c, i_db1_to_z => db1_to_z, i_dbz_to_z => dbz_to_z, i_db2_to_i => db2_to_i, i_ir5_to_i => ir5_to_i, i_db3_to_d => db3_to_d, i_ir5_to_d => ir5_to_d, i_db6_to_v => db6_to_v, i_avr_to_v => avr_to_v, i_i_to_v => i_to_v, i_O_to_v => O_to_v, i_db7_to_n => db7_to_n, i_d_bus => d_bus, o_reg_out => p_register_out);
	
	program_counter_low: entity work.CPU_program_counter_low
	port map(i_clk => i_clk, i_phi2 => phi2, i_adl_to_pcl => adl_to_pcl, i_pcl_increment => i_to_pc, i_pcl_reload => pcl_to_pcl, i_adl_bus => adl_bus, o_carry => pclc, o_reg_out => program_counter_low_out);
	
	program_counter_high: entity work.CPU_program_counter_high
	port map(i_clk => i_clk, i_phi2 => phi2, i_adh_to_pch => adh_to_pch, i_pcl_carry => pclc, i_pch_reload => pch_to_pch, i_adh_bus => adh_bus, o_reg_out => program_counter_high_out);
	
	random_control_logic: entity work.CPU_random_control_logic
	port map(i_clk => i_clk, i_rdy => rdy, i_phi1 => phi1, i_phi2 => phi2, i_dr => decode_rom_output, i_reset => reset, i_reset_in_progress => reset_in_progress, i_break_in_progress => break_in_progress, i_break_done => break_done, i_implied_addressing => implied_addressing, i_two_cycle => two_cycle, i_set_overflow => i_set_overflow, i_t0 => timing_register(0), i_ir5 => instruction_register(5), i_db7 => d_bus(7), i_alu_carry_out => acr, i_zero_adl0 => zero_adl(0), i_p_register => p_register_out,
	o_dl_to_db => dl_to_db, o_dl_to_adl => dl_to_adl, o_dl_to_adh => dl_to_adh, o_O_to_adh0 => O_to_adh0, o_O_to_adh1_7 => O_to_adh1_7, o_adh_to_abh => adh_to_abh, o_adl_to_abl => adl_to_abl, o_pcl_to_pcl => pcl_to_pcl, o_adl_to_pcl => adl_to_pcl, o_i_to_pc => i_to_pc, o_pcl_to_db => pcl_to_db, o_pcl_to_adl => pcl_to_adl, o_pch_to_pch => pch_to_pch, o_adh_to_pch => adh_to_pch, o_pch_to_db => pch_to_db, o_pch_to_adh => pch_to_adh, o_sb_to_adh => sb_to_adh, o_sb_to_db => sb_to_db, o_s_to_adl => s_to_adl,
	o_sb_to_s => sb_to_s, o_s_to_s => s_to_s, o_s_to_sb => s_to_sb, o_db_bar_to_add => db_bar_to_add, o_db_to_add => db_to_add, o_adl_to_add => adl_to_add, o_i_to_addc => i_to_addc, o_sum_select => sum_select, o_and_select => and_select, o_eor_select =>eor_select, o_or_select =>or_select, o_shift_right_select => shift_right_select, o_add_to_adl => add_to_adl, o_add_to_sb_0_6 => add_to_sb_0_6, o_add_to_sb_7 => add_to_sb_7, o_O_to_add => O_to_add, o_sb_to_add => sb_to_add, o_sb_to_ac => sb_to_ac, o_ac_to_db => ac_to_db,
	o_ac_to_sb => ac_to_sb, o_sb_to_x => sb_to_x, o_x_to_sb => x_to_sb, o_sb_to_y => sb_to_y, o_y_to_sb => y_to_sb, o_p_to_db => p_to_db, o_db0_to_c => db0_to_c, o_ir5_to_c => ir5_to_c, o_acr_to_c => acr_to_c, o_db1_to_z => db1_to_z, o_dbz_to_z => dbz_to_z, o_db2_to_i => db2_to_i, o_ir5_to_i => ir5_to_i, o_db3_to_d => db3_to_d, o_ir5_to_d => ir5_to_d, o_db6_to_v => db6_to_v, o_avr_to_v => avr_to_v, o_1_to_v => i_to_v, o_0_to_v => O_to_v, o_db7_to_n => db7_to_n, o_t1_reset => t1_reset, o_read_write => buf_read_write, o_reg_reset => t_zero);
	
	ready_control: entity work.CPU_ready_control
	port map(i_clk => i_clk, i_phi2 => phi2, i_ready => i_ready, i_read_write => buf_read_write, o_rdy => rdy);
	
	reset_interrupt_control: entity work.CPU_interrupt_reset_control
	port map(i_clk => i_clk, i_phi1 => phi1, i_phi2 => phi2, i_nmi => i_nmi, i_irq => i_irq, i_reset => i_reset, i_rdy => i_ready, i_t0 => timing_register(0), i_t2_branch => decode_rom_output(80), i_t5_break => decode_rom_output(22), i_interrupt_flag => p_register_out(2), o_reset_out => reset, o_reset_in_progress => reset_in_progress, o_interrupt_in_progress => open, o_break_done => break_done, o_aic => break_in_progress, o_zero_adl => zero_adl);
	
	stack_pointer: entity work.CPU_stack_pointer
	port map(i_clk => i_clk, i_sb_to_s => sb_to_s, i_s_hold => s_to_s, i_s_bus => s_bus, o_reg_out => stack_pointer_out);
	
	x_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_x, i_s_bus => s_bus, o_reg_out => x_out);
	
	y_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_y, i_s_bus => s_bus, o_reg_out => y_out);
	
	
	d_bus <= ac_out when ac_to_db ='1' else
				p_register_out when p_to_db = '1' else
				program_counter_low_out when pcl_to_db = '1' else
				program_counter_high_out when pch_to_db = '1' else
				input_data_out when dl_to_db = '1' else
				s_bus when sb_to_db = '1' else
				(others => '1');
	
	s_bus(7) <= ac_out(7) when ac_to_sb = '1' else
				x_out(7) when x_to_sb = '1' else
				y_out(7) when y_to_sb = '1' else
				stack_pointer_out(7) when s_to_sb = '1' else
				adder_hold_out(7) when add_to_sb_7 = '1' else
				d_bus(7) when sb_to_db = '1' else
				adh_bus(7) when sb_to_adh = '1' else
				'1';
	
	s_bus(6 downto 0) <= ac_out(6 downto 0) when ac_to_sb = '1' else
				x_out(6 downto 0) when x_to_sb = '1' else
				y_out(6 downto 0) when y_to_sb = '1' else
				stack_pointer_out(6 downto 0) when s_to_sb = '1' else
				adder_hold_out(6 downto 0) when add_to_sb_0_6 = '1' else
				d_bus(6 downto 0) when sb_to_db = '1' else
				adh_bus(6 downto 0) when sb_to_adh = '1' else
				(others => '1');
	
	adl_bus(0) <= adder_hold_out(0) when add_to_adl = '1' else
						stack_pointer_out(0) when s_to_adl = '1' else
						program_counter_low_out(0) when pcl_to_adl = '1' else
						input_data_out(0) when dl_to_adl = '1' else
						'0' when zero_adl(0) = '1' else
						'1';
	
	adl_bus(1) <= adder_hold_out(1) when add_to_adl = '1' else
						stack_pointer_out(1) when s_to_adl = '1' else
						program_counter_low_out(1) when pcl_to_adl = '1' else
						input_data_out(1) when dl_to_adl = '1' else
						'0' when zero_adl(1) = '1' else
						'1';
	
	adl_bus(2) <= adder_hold_out(2) when add_to_adl = '1' else
						stack_pointer_out(2) when s_to_adl = '1' else
						program_counter_low_out(2) when pcl_to_adl = '1' else
						input_data_out(2) when dl_to_adl = '1' else
						'0' when zero_adl(2) = '1' else
						'1';
	
	adl_bus(7 downto 3) <= adder_hold_out(7 downto 3) when add_to_adl = '1' else
						stack_pointer_out(7 downto 3) when s_to_adl = '1' else
						program_counter_low_out(7 downto 3) when pcl_to_adl = '1' else
						input_data_out(7 downto 3) when dl_to_adl = '1' else
						(others => '1');
	
	adh_bus(0) <= program_counter_high_out(0) when pch_to_adh = '1' else
						input_data_out(0) when dl_to_adh = '1' else
						s_bus(0) when sb_to_adh = '1' else
						'0' when O_to_adh0 = '1' else
						'1';
	
	adh_bus(7 downto 1) <= program_counter_high_out(7 downto 1) when pch_to_adh = '1' else
						input_data_out(7 downto 1) when dl_to_adh = '1' else
						s_bus(7 downto 1) when sb_to_adh = '1' else
						(others => '0') when O_to_adh1_7 = '1' else
						(others => '1');
	
	o_read_write <= buf_read_write;
	
end Behavioral;