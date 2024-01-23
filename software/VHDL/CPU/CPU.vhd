library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	Port(
		i_clk: in STD_LOGIC;
		i_irq: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		i_test_ir5: in STD_LOGIC;
		i_test_vector: in STD_LOGIC_VECTOR(60 downto 0);
		o_address_bus: out unsigned (15 downto 0);
		b_read_write: buffer STD_LOGIC;
		io_data_bus: inout unsigned (7 downto 0));
end CPU;
architecture Behavioral of CPU is
	signal s_bus: unsigned (7 downto 0);
	signal d_bus: unsigned (7 downto 0);
	signal adl_bus: unsigned (7 downto 0);
	signal adh_bus: unsigned (7 downto 0);
	signal alu_result: unsigned (7 downto 0);
	signal alu_a_input: unsigned (7 downto 0);
	signal alu_b_input: unsigned (7 downto 0);
	signal phi1: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal acr: STD_LOGIC:='0';
	signal avr: STD_LOGIC:='0';
	signal pclc : STD_LOGIC;
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
	signal O_to_adl0: STD_LOGIC;
	signal O_to_adl1: STD_LOGIC;
	signal O_to_adl2: STD_LOGIC;
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
	signal db7_to_n: STD_LOGIC;
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
	port map(i_clk => i_clk, b_phi1 => phi1, o_phi2 => phi2);
	
	data_output_register_buffer: entity work.CPU_data_output_register_buffer
	port map(i_clk => i_clk, i_phi1 => phi1, i_phi2 => phi2, i_d_bus => d_bus, i_read_write => b_read_write, o_data_bus => io_data_bus);
	
	input_data_latch: entity work.CPU_input_data_latch
	port map(i_clk => i_clk, i_phi2 => phi2, i_data_bus => io_data_bus, i_dl_to_db => dl_to_db, i_dl_to_adl => dl_to_adl, i_dl_to_adh => dl_to_adh, o_d_bus => d_bus, o_adl_bus => adl_bus, o_adh_bus => adh_bus);
	
	p_register: entity work.CPU_p_register
	port map(i_clk => i_clk, i_ir5 => i_test_ir5, i_acr => acr, i_avr => avr, i_db0_to_c => db0_to_c, i_ir5_to_c => ir5_to_c, i_acr_to_c => acr_to_c, i_db1_to_z => db1_to_z, i_dbz_to_z => dbz_to_z, i_db2_to_i => db2_to_i, i_ir5_to_i => ir5_to_i, i_db3_to_d => db3_to_d, i_ir5_to_d => ir5_to_d, i_db6_to_v => db6_to_v, i_avr_to_v => avr_to_v, i_i_to_v => i_to_v, i_db7_to_n => db7_to_n, i_p_to_db => p_to_db, io_d_bus => d_bus);
	
	program_counter_low: entity work.CPU_program_counter_low
	port map(i_clk => i_clk, i_adl_to_pcl => adl_to_pcl, i_pcl_to_adl => pcl_to_adl, i_pcl_to_db => pcl_to_db, i_pcl_increment => i_to_pc, i_pcl_reload => pcl_to_pcl, o_carry => pclc, o_d_bus => d_bus, io_adl_bus => adl_bus);
	
	program_counter_high: entity work.CPU_program_counter_high
	port map(i_clk => i_clk, i_adh_to_pch => adh_to_pch, i_pch_to_adh => pch_to_adh, i_pch_to_db => pch_to_db, i_pcl_carry => pclc, i_pch_reload => pch_to_pch, o_d_bus => d_bus, io_adh_bus => adh_bus);
	
	random_control_logic: entity work.CPU_random_control_logic_test
	port map(i_clk => i_clk, i_test_vector => i_test_vector, o_dl_to_db => dl_to_db, o_dl_to_adl => dl_to_adl, o_dl_to_adh => dl_to_adh, o_O_to_adh0 => O_to_adh0, o_O_to_adh1_7 => O_to_adh1_7, o_adh_to_abh => adh_to_abh, o_adl_to_abl => adl_to_abl, o_pcl_to_pcl => pcl_to_pcl, o_adl_to_pcl => adl_to_pcl, o_i_to_pc => i_to_pc, o_pcl_to_db => pcl_to_db, o_pcl_to_adl => pcl_to_adl, o_pch_to_pch => pch_to_pch, o_adh_to_pch => adh_to_pch, o_pch_to_db => pch_to_db, o_pch_to_adh => pch_to_adh, o_sb_to_adh => sb_to_adh, o_sb_to_db => sb_to_db, o_O_to_adl0 => O_to_adl0, o_O_to_adl1 => O_to_adl1, o_O_to_adl2 => O_to_adl2, o_s_to_adl => s_to_adl, o_sb_to_s => sb_to_s, o_s_to_s => s_to_s, o_s_to_sb => s_to_sb, o_db_bar_to_add => db_bar_to_add, o_db_to_add => db_to_add, o_adl_to_add => adl_to_add,
	o_i_to_addc => i_to_addc, o_sum_select => sum_select, o_and_select => and_select, o_eor_select =>eor_select, o_or_select =>or_select, o_shift_right_select => shift_right_select, o_add_to_adl => add_to_adl, o_add_to_sb_0_6 => add_to_sb_0_6, o_add_to_sb_7 => add_to_sb_7, o_O_to_add => O_to_add, o_sb_to_add => sb_to_add, o_sb_to_ac => sb_to_ac, o_ac_to_db => ac_to_db, o_ac_to_sb => ac_to_sb, o_sb_to_x => sb_to_x, o_x_to_sb => x_to_sb, o_sb_to_y => sb_to_y, o_y_to_sb => y_to_sb, o_p_to_db => p_to_db, o_db0_to_c => db0_to_c, o_ir5_to_c => ir5_to_c, o_acr_to_c => acr_to_c, o_db1_to_z => db1_to_z, o_dbz_to_z => dbz_to_z, o_db2_to_i => db2_to_i, o_ir5_to_i => ir5_to_i, o_db3_to_d => db3_to_d, o_ir5_to_d => ir5_to_d, o_db6_to_v => db6_to_v, o_avr_to_v => avr_to_v, o_i_to_v => i_to_v, o_db7_to_n => db7_to_n, o_read_write => b_read_write);
	
	stack_pointer: entity work.CPU_stack_pointer
	port map(i_clk => i_clk, i_sb_to_s => sb_to_s, i_s_to_sb => s_to_sb, i_s_to_adl => s_to_adl, i_s_hold => s_to_s);
	
	x_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_x, i_xy_to_sb => x_to_sb, io_s_bus => s_bus);
	
	y_register: entity work.CPU_xy_register
	port map(i_clk => i_clk, i_sb_to_xy => sb_to_y, i_xy_to_sb => y_to_sb, io_s_bus => s_bus);
	
	process(i_clk)
	begin
		if (rising_edge(i_clk)) then
			if phi2 = '1' then
				d_bus <= (others => '1');
				s_bus <= (others => '1');
				adl_bus <= (others => '1');
				adh_bus <= (others => '1');
			else
				s_bus <= (others => 'Z');
				adl_bus(7 downto 3) <= (others => 'Z');
				if sb_to_db = '1' then
					d_bus <= s_bus;
					else d_bus <= (others => 'Z');
				end if;
				if sb_to_adh = '1' then
					adh_bus <= s_bus;
				else
					if O_to_adh0 = '1' then
						adh_bus(0) <= '0';
					else adh_bus(0) <= 'Z';
					end if;
					if O_to_adh1_7 = '1' then
						adl_bus(7 downto 1) <= (others => '0');
					else adh_bus(7 downto 1) <= (others => 'Z');
					end if;
				end if;
				if O_to_adl0 = '1' then
					adl_bus(0) <= '0';
					else adl_bus(0) <= 'Z';
				end if;
				if O_to_adl1 = '1' then
					adl_bus(1) <= '0';
					else adl_bus(1) <= 'Z';
				end if;
				if O_to_adl2 = '1' then
					adl_bus(2) <= '0';
					else adl_bus(2) <= 'Z';
				end if;
			end if;
		end if;
	end process;
end Behavioral;