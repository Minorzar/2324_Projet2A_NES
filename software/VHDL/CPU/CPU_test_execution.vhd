library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_test_execution is
	Port(
		i_clk: in STD_LOGIC;
		i_read_write: in STD_LOGIC;
		instruction_register:in STD_LOGIC_VECTOR (7 downto 0);
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
		o_address_bus:out unsigned (15 downto 0);
		io_data_bus:inout unsigned (7 downto 0));
end CPU_test_execution;

architecture Behavioral of CPU_test_execution is
	signal s_bus: unsigned (7 downto 0);
	signal d_bus: unsigned (7 downto 0);
	signal adl_bus: unsigned (7 downto 0);
	signal adh_bus: unsigned (7 downto 0);
	signal alu_result: unsigned (7 downto 0);
	signal alu_a_input: unsigned (7 downto 0);
	signal alu_b_input: unsigned (7 downto 0);
	signal timing_register: STD_LOGIC_VECTOR(5 downto 0);
	signal phi1: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal rdy: STD_LOGIC;
	signal acr: STD_LOGIC;
	signal avr: STD_LOGIC;
	signal pclc : STD_LOGIC;
	
begin
	
	a_input_register: entity work.CPU_a_input_register
	port map(i_clk => i_clk, i_sb_to_add => sb_to_add, i_O_to_add => O_to_add, i_s_bus => s_bus, o_output => alu_a_input);
	
	ac_register: entity work.CPU_ac_register
	port map(i_clk => i_clk, i_sb_to_ac => sb_to_ac, i_ac_to_sb => ac_to_sb, i_ac_to_db => ac_to_db, o_d_bus => d_bus, io_s_bus => s_bus);
	
	adder_hold_register: entity work.CPU_adder_hold_register
	port map(i_clk => i_clk, i_input => alu_result, i_add_to_adl => add_to_adl, i_add_to_sb_0_6 => add_to_sb_0_6, i_add_to_sb_7 => add_to_sb_7, o_adl_bus => adl_bus, o_s_bus => s_bus);
	
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
	port map(i_clk => i_clk, i_phi1 => phi1, i_phi2 => phi2, i_d_bus => d_bus, i_read_write => i_read_write, o_data_bus => io_data_bus);
	
	input_data_latch: entity work.CPU_input_data_latch
	port map(i_clk => i_clk, i_phi2 => phi2, i_data_bus => io_data_bus, i_dl_to_db => dl_to_db, i_dl_to_adl => dl_to_adl, i_dl_to_adh => dl_to_adh, o_d_bus => d_bus, o_adl_bus => adl_bus, o_adh_bus => adh_bus);
	
	p_register: entity work.CPU_p_register
	port map(i_clk => i_clk, i_ir5 => instruction_register(5), i_acr => acr, i_avr => avr, i_db0_to_c => db0_to_c, i_ir5_to_c => ir5_to_c, i_acr_to_c => acr_to_c, i_db1_to_z => db1_to_z, i_dbz_to_z => dbz_to_z, i_db2_to_i => db2_to_i, i_ir5_to_i => ir5_to_i, i_db3_to_d => db3_to_d, i_ir5_to_d => ir5_to_d, i_db6_to_v => db6_to_v, i_avr_to_v => avr_to_v, i_i_to_v => i_to_v, i_O_to_v => O_to_v, i_db7_to_n => db7_to_n, i_p_to_db => p_to_db, io_d_bus => d_bus);
	
	program_counter_low: entity work.CPU_program_counter_low
	port map(i_clk => i_clk, i_phi2 => phi2, i_adl_to_pcl => adl_to_pcl, i_pcl_to_adl => pcl_to_adl, i_pcl_to_db => pcl_to_db, i_pcl_increment => i_to_pc, i_pcl_reload => pcl_to_pcl, o_carry => pclc, o_d_bus => d_bus, io_adl_bus => adl_bus);
	
	program_counter_high: entity work.CPU_program_counter_high
	port map(i_clk => i_clk, i_phi2 => phi2, i_adh_to_pch => adh_to_pch, i_pch_to_adh => pch_to_adh, i_pch_to_db => pch_to_db, i_pcl_carry => pclc, i_pch_reload => pch_to_pch, o_d_bus => d_bus, io_adh_bus => adh_bus);
	
	pullup: entity work.CPU_pullup
	port map(io_s_bus => s_bus, io_d_bus => d_bus, io_adl_bus => adl_bus, io_adh_bus => adh_bus);
	
	stack_pointer: entity work.CPU_stack_pointer
	port map(i_clk => i_clk, i_sb_to_s => sb_to_s, i_s_to_sb => s_to_sb, i_s_to_adl => s_to_adl, i_s_hold => s_to_s);
	
	x_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_x, i_xy_to_sb => x_to_sb, io_s_bus => s_bus);
	
	y_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_y, i_xy_to_sb => y_to_sb, io_s_bus => s_bus);
	
end Behavioral;