library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_test_execution is
	Port(
		i_clk: in STD_LOGIC;
		i_ir5:in STD_LOGIC;
		dl_to_db:in STD_LOGIC;
		dl_to_adl:in  STD_LOGIC;
		dl_to_adh:in STD_LOGIC;
		O_to_adh0:in STD_LOGIC;
		O_to_adh1_7:in STD_LOGIC;
		adh_to_abh:in STD_LOGIC;
		adl_to_abl:in STD_LOGIC;
		pcl_to_pcl:in STD_LOGIC;
		adl_to_pcl:in STD_LOGIC;
		i_to_pc:in STD_LOGIC;
		pcl_to_db:in STD_LOGIC;
		pcl_to_adl:in STD_LOGIC;
		pch_to_pch:in STD_LOGIC;
		adh_to_pch:in STD_LOGIC;
		pch_to_db:in STD_LOGIC;
		pch_to_adh:in STD_LOGIC;
		sb_to_adh:in STD_LOGIC;
		sb_to_db:in STD_LOGIC;
		O_to_adl0:in STD_LOGIC;
		O_to_adl1:in STD_LOGIC;
		O_to_adl2:in STD_LOGIC;
		s_to_adl:in STD_LOGIC;
		sb_to_s:in STD_LOGIC;
		s_to_s:in STD_LOGIC;
		s_to_sb:in STD_LOGIC;
		db_bar_to_add:in STD_LOGIC;
		db_to_add:in STD_LOGIC;
		adl_to_add:in STD_LOGIC;
		i_to_addc:in STD_LOGIC;
		sum_select:in STD_LOGIC;
		and_select:in STD_LOGIC;
		eor_select:in STD_LOGIC;
		or_select:in STD_LOGIC;
		shift_right_select:in STD_LOGIC;
		add_to_adl:in STD_LOGIC;
		add_to_sb_0_6:in STD_LOGIC;
		add_to_sb_7:in STD_LOGIC;
		O_to_add:in STD_LOGIC;
		sb_to_add:in STD_LOGIC;
		sb_to_ac:in STD_LOGIC;
		ac_to_db:in STD_LOGIC;
		ac_to_sb:in STD_LOGIC;
		sb_to_x:in STD_LOGIC;
		x_to_sb:in STD_LOGIC;
		sb_to_y:in STD_LOGIC;
		y_to_sb:in STD_LOGIC;
		p_to_db:in STD_LOGIC;
		db0_to_c:in STD_LOGIC;
		ir5_to_c:in STD_LOGIC;
		acr_to_c:in STD_LOGIC;
		db1_to_z:in STD_LOGIC;
		dbz_to_z:in STD_LOGIC;
		db2_to_i:in STD_LOGIC;
		ir5_to_i:in STD_LOGIC;
		db3_to_d:in STD_LOGIC;
		ir5_to_d:in STD_LOGIC;
		db6_to_v:in STD_LOGIC;
		avr_to_v:in STD_LOGIC;
		i_to_v:in STD_LOGIC;
		O_to_v:in STD_LOGIC;
		db7_to_n:in STD_LOGIC;
		o_address_bus:out STD_LOGIC_VECTOR (15 downto 0);
		i_data_bus: in STD_LOGIC_VECTOR (7 downto 0);
		o_data_bus: out STD_LOGIC_VECTOR (7 downto 0));
end CPU_test_execution;

architecture Behavioral of CPU_test_execution is
	signal s_bus: STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	signal d_bus: STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	signal adl_bus: STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	signal adh_bus: STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
	signal alu_result: STD_LOGIC_VECTOR (7 downto 0);
	signal alu_a_input: STD_LOGIC_VECTOR (7 downto 0);
	signal alu_b_input: STD_LOGIC_VECTOR (7 downto 0);
	signal timing_register: STD_LOGIC_VECTOR(5 downto 0);
	signal phi1: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal rdy: STD_LOGIC;
	signal acr: STD_LOGIC;
	signal avr: STD_LOGIC;
	signal pclc : STD_LOGIC;
	
	signal ac_out: STD_LOGIC_VECTOR(7 downto 0);
	signal adder_hold_out: STD_LOGIC_VECTOR(7 downto 0);
	signal data_out: STD_LOGIC_VECTOR(7 downto 0);
	signal input_data_out: STD_LOGIC_VECTOR(7 downto 0);
	signal program_counter_low_out: STD_LOGIC_VECTOR(7 downto 0);
	signal program_counter_high_out: STD_LOGIC_VECTOR(7 downto 0);
	signal stack_pointer_out: STD_LOGIC_VECTOR(7 downto 0);
	signal x_out: STD_LOGIC_VECTOR(7 downto 0);
	signal y_out: STD_LOGIC_VECTOR(7 downto 0);
	signal p_register_out: STD_LOGIC_VECTOR(7 downto 0);

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
	port map(i_a_register => alu_a_input, i_b_register => alu_b_input, i_sum_select => sum_select, i_and_select => and_select, i_eor_select => eor_select, i_or_select => or_select, i_shift_right_select => shift_right_select, i_carry => i_to_addc, o_result => alu_result, o_carry => acr, o_overflow => avr);
	
	b_input_register: entity work.CPU_b_input_register
	port map(i_clk => i_clk, i_adl_to_add => adl_to_add, i_db_to_add => db_to_add, i_db_bar_to_add => db_bar_to_add, i_d_bus => d_bus, i_adl_bus => adl_bus, o_output => alu_b_input);
	
	clock_generator: entity work.CPU_clock_generator
	port map(i_clk => i_clk, o_phi1 => phi1, o_phi2 => phi2);
	
	data_output_register_buffer: entity work.CPU_data_output_register_buffer
	port map(i_clk => i_clk, i_phi1 => phi1, i_d_bus => d_bus, o_reg_out => o_data_bus);
	
	input_data_latch: entity work.CPU_input_data_latch
	port map(i_clk => i_clk, i_phi2 => phi2, i_data_bus => i_data_bus, o_reg_out => input_data_out);
	
	p_register: entity work.CPU_p_register
	port map(i_clk => i_clk, i_ir5 => i_ir5, i_acr => acr, i_avr => avr, i_db0_to_c => db0_to_c, i_ir5_to_c => ir5_to_c, i_acr_to_c => acr_to_c, i_db1_to_z => db1_to_z, i_dbz_to_z => dbz_to_z, i_db2_to_i => db2_to_i, i_ir5_to_i => ir5_to_i, i_db3_to_d => db3_to_d, i_ir5_to_d => ir5_to_d, i_db6_to_v => db6_to_v, i_avr_to_v => avr_to_v, i_i_to_v => i_to_v, i_O_to_v => O_to_v, i_db7_to_n => db7_to_n, i_d_bus => d_bus, o_reg_out => p_register_out);
	
	program_counter_low: entity work.CPU_program_counter_low
	port map(i_clk => i_clk, i_phi2 => phi2, i_adl_to_pcl => adl_to_pcl, i_pcl_increment => i_to_pc, i_pcl_reload => pcl_to_pcl, i_adl_bus => adl_bus, o_carry => pclc, o_reg_out => program_counter_low_out);
	
	program_counter_high: entity work.CPU_program_counter_high
	port map(i_clk => i_clk, i_phi2 => phi2, i_adh_to_pch => adh_to_pch, i_pcl_carry => pclc, i_pch_reload => pch_to_pch, i_adh_bus => adh_bus, o_reg_out => program_counter_high_out);
	
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
						'0' when O_to_adl0 = '1' else
						'1';
	
	adl_bus(1) <= adder_hold_out(1) when add_to_adl = '1' else
						stack_pointer_out(1) when s_to_adl = '1' else
						program_counter_low_out(1) when pcl_to_adl = '1' else
						input_data_out(1) when dl_to_adl = '1' else
						'0' when O_to_adl1 = '1' else
						'1';
	
	adl_bus(2) <= adder_hold_out(2) when add_to_adl = '1' else
						stack_pointer_out(2) when s_to_adl = '1' else
						program_counter_low_out(2) when pcl_to_adl = '1' else
						input_data_out(2) when dl_to_adl = '1' else
						'0' when O_to_adl2 = '1' else
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
	
end Behavioral;