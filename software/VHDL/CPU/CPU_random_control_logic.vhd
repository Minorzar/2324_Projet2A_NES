library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_random_control_logic is
	Port(
		i_clk: in STD_LOGIC;
		i_rdy: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_dr: in STD_LOGIC_VECTOR(129 downto 0);--the decode ROM array
		i_reset: in STD_LOGIC ;
		i_reset_in_progress: in STD_LOGIC;
		i_break_in_progress: in STD_LOGIC;
		i_break_done: in STD_LOGIC;
		i_implied_addressing: in STD_LOGIC;
		i_two_cycle: in STD_LOGIC;
		i_set_overflow: in STD_LOGIC;
		i_t0: in STD_LOGIC;
		i_ir5: in STD_LOGIC;
		i_db7: in STD_LOGIC;
		i_alu_carry_out: in STD_LOGIC;
		i_zero_adl0: in STD_LOGIC;
		i_p_register: in STD_LOGIC_VECTOR(7 downto 0);
		o_dl_to_db: out STD_LOGIC :='0';
		o_dl_to_adl: out STD_LOGIC :='0';
		o_dl_to_adh: out STD_LOGIC :='0';
		o_O_to_adh0: out STD_LOGIC :='0';
		o_O_to_adh1_7: out STD_LOGIC :='0';
		o_adh_to_abh: out STD_LOGIC :='0';
		o_adl_to_abl: out STD_LOGIC :='0';
		o_pcl_to_pcl: out STD_LOGIC :='0';
		o_adl_to_pcl: out STD_LOGIC :='0';
		o_i_to_pc: out STD_LOGIC :='0';
		o_pcl_to_db: out STD_LOGIC :='0';
		o_pcl_to_adl: out STD_LOGIC :='0';
		o_pch_to_pch: out STD_LOGIC :='0';
		o_adh_to_pch: out STD_LOGIC :='0';
		o_pch_to_db: out STD_LOGIC :='0';
		o_pch_to_adh: out STD_LOGIC :='0';
		o_sb_to_adh: out STD_LOGIC :='0';
		o_sb_to_db: out STD_LOGIC :='0';
		o_s_to_adl: out STD_LOGIC :='0';
		o_sb_to_s: out STD_LOGIC :='0';
		o_s_to_s: out STD_LOGIC :='0';
		o_s_to_sb: out STD_LOGIC :='0';
		o_db_bar_to_add: out STD_LOGIC :='0';
		o_db_to_add: out STD_LOGIC :='0';
		o_adl_to_add: out STD_LOGIC :='0';
		o_i_to_addc: out STD_LOGIC :='0';
		o_sum_select: out STD_LOGIC :='0';
		o_and_select: out STD_LOGIC :='0';
		o_eor_select: out STD_LOGIC :='0';
		o_or_select: out STD_LOGIC :='0';
		o_shift_right_select: out STD_LOGIC :='0';
		o_add_to_adl: out STD_LOGIC :='0';
		o_add_to_sb_0_6: out STD_LOGIC :='0';
		o_add_to_sb_7: out STD_LOGIC :='0';
		o_O_to_add: out STD_LOGIC :='0';
		o_sb_to_add: out STD_LOGIC :='0';
		o_sb_to_ac: out STD_LOGIC :='0';
		o_ac_to_db: out STD_LOGIC :='0';
		o_ac_to_sb: out STD_LOGIC :='0';
		o_sb_to_x: out STD_LOGIC :='0';
		o_x_to_sb: out STD_LOGIC :='0';
		o_sb_to_y: out STD_LOGIC :='0';
		o_y_to_sb: out STD_LOGIC :='0';
		o_p_to_db: out STD_LOGIC :='0';
		o_db0_to_c: out STD_LOGIC :='0';
		o_ir5_to_c: out STD_LOGIC :='0';
		o_acr_to_c: out STD_LOGIC :='0';
		o_db1_to_z: out STD_LOGIC :='0';
		o_dbz_to_z: out STD_LOGIC :='0';
		o_db2_to_i: out STD_LOGIC :='0';
		o_ir5_to_i: out STD_LOGIC :='0';
		o_db3_to_d: out STD_LOGIC :='0';
		o_ir5_to_d: out STD_LOGIC :='0';
		o_db6_to_v: out STD_LOGIC :='0';
		o_avr_to_v: out STD_LOGIC :='0';
		o_0_to_v: out STD_LOGIC :='0';
		o_1_to_v: out STD_LOGIC :='0';
		o_db7_to_n:out STD_LOGIC :='0';
		o_t1_reset:out STD_LOGIC :='0';
		o_read_write:out STD_LOGIC :='0';
		o_reg_reset:out STD_LOGIC :='1');
end CPU_random_control_logic;

architecture Behavioral of CPU_random_control_logic is
--combinational signals used to simplify expressions
signal br_taken: STD_LOGIC;
signal op_mem: STD_LOGIC;
signal store: STD_LOGIC;
signal op_ands: STD_LOGIC;
signal z_test: STD_LOGIC;
signal short_circuit_branch_add: STD_LOGIC;
signal short_circuit: STD_LOGIC;
signal stack_op_rdy: STD_LOGIC;
signal bb_or_cpxy_or_inxy: STD_LOGIC;
signal pre_adl_to_add: STD_LOGIC; 
signal pre_db_bar_to_add: STD_LOGIC;
signal adh_math: STD_LOGIC;
signal pre_add_sb06: STD_LOGIC;
signal inc_sb: STD_LOGIC;
signal alu_cout_held_if_not_rdy: STD_LOGIC;
signal dl_to_pch: STD_LOGIC;
signal srs: STD_LOGIC;
signal db_to_p: STD_LOGIC;

--internal registers
signal reg_adh_to_pch: STD_LOGIC :='0';
signal reg_indirect_address: STD_LOGIC :='0';
signal reg_rdy_phi1: STD_LOGIC :='0';
signal reg_rdy_phi1_delayed: STD_LOGIC :='0';
signal reg_rdy_phi2: STD_LOGIC :='0';
signal reg_rdy_phi2_delayed: STD_LOGIC :='0';
signal reg_reset: STD_LOGIC :='0';
signal reg_op_t3_branch_rdy: STD_LOGIC :='0';
signal reg_op_shift_inc_dec_mem: STD_LOGIC :='0';
signal reg_shift_inc_dec_mem: STD_LOGIC :='0';
signal reg_shift_inc_dec_mem_delayed: STD_LOGIC :='0';
signal reg_shift_inc_dec_mem_rdy: STD_LOGIC :='0';
signal reg_shift_inc_dec_mem_rdy_delayed: STD_LOGIC :='0';
signal reg_ind_y_or_abs_idx: STD_LOGIC :='0';
signal reg_force_t_res_x: STD_LOGIC :='0';
signal reg_t1_reset: STD_LOGIC :='0';
signal reg_pre_fetch: STD_LOGIC :='0';
signal reg_branch_back: STD_LOGIC :='0';
signal reg_branch_back_delayed: STD_LOGIC :='0';
signal reg_short_circuit_branch_add: STD_LOGIC :='0';
signal reg_t2_br: STD_LOGIC :='0';
signal reg_short_circuit: STD_LOGIC :='0';
signal reg_short_circuit_hold: STD_LOGIC :='0';
signal reg_bb_or_cpxy_or_inxy: STD_LOGIC :='0';
signal reg_return_and_adl_add: STD_LOGIC :='0';
signal reg_inc_sb: STD_LOGIC :='0';
signal reg_c_set: STD_LOGIC :='0';
signal reg_alu_cout_held_if_not_rdy: STD_LOGIC :='0';
signal reg_alu_cout_held_if_not_rdy_delayed: STD_LOGIC :='0';
signal reg_need_sb7: STD_LOGIC :='0';
signal reg_need_sb7_delayed: STD_LOGIC :='0';
signal reg_carry_flag: STD_LOGIC :='0';
signal reg_rdy_srs: STD_LOGIC :='0';
signal reg_srs: STD_LOGIC :='0';
signal reg_srs_delayed: STD_LOGIC :='0';
signal reg_pd_load: STD_LOGIC :='0';
signal reg_pla_109: STD_LOGIC :='0';
signal reg_pla_113: STD_LOGIC :='0';
signal reg_mem_write: STD_LOGIC :='0';
signal reg_set_overflow: STD_LOGIC :='0';
signal reg_set_overflow_delayed: STD_LOGIC :='0';
signal reg_set_overflow_delayed_again: STD_LOGIC :='0';
signal reg_adl_to_pcl: STD_LOGIC :='0';
signal reg_pcl_to_adl: STD_LOGIC :='0';
signal reg_pcl_to_pcl: STD_LOGIC :='0';
signal reg_i_to_pc: STD_LOGIC :='0';
signal reg_break_in_progress: STD_LOGIC :='0';
signal reg_next_pc: STD_LOGIC :='0';
signal reg_pcl_to_db: STD_LOGIC :='0';
signal reg_sb_to_ac: STD_LOGIC :='0';
signal reg_ac_to_db: STD_LOGIC :='0';
signal reg_ac_to_sb: STD_LOGIC :='0';
signal reg_sb_to_x: STD_LOGIC :='0';
signal reg_x_to_sb: STD_LOGIC :='0';
signal reg_sb_to_y: STD_LOGIC :='0';
signal reg_y_to_sb: STD_LOGIC :='0';
signal reg_sb_to_s: STD_LOGIC :='0';
signal reg_adl_to_add: STD_LOGIC :='0';
signal reg_db_bar_to_add: STD_LOGIC :='0';
signal reg_db_to_add: STD_LOGIC :='0';
signal reg_o_to_add: STD_LOGIC :='0';
signal reg_and_select: STD_LOGIC :='0';
signal reg_eor_select: STD_LOGIC :='0';
signal reg_or_select: STD_LOGIC :='0';
signal reg_shift_right_select: STD_LOGIC :='0';
signal reg_sum_select: STD_LOGIC :='0';
signal reg_t_res_x: STD_LOGIC :='0';

--dummy signals that allow to use the values of outputs
signal buf_pch_to_db: STD_LOGIC :='0';
signal buf_sb_to_adh: STD_LOGIC :='0';
signal buf_acr_to_c: STD_LOGIC :='0';
signal buf_dbz_to_z: STD_LOGIC :='0';
signal buf_t1_reset: STD_LOGIC :='0';

begin
	br_taken <= not i_ir5 xor (( i_dr(121) and not i_dr(126) and i_p_register(0)) or ( not i_dr(121) and not i_dr(126) and i_p_register(1)) or (i_dr(121) and i_dr(126) and i_p_register(7)) or (not i_dr(121) and i_dr(126) and i_p_register(6)));
	op_mem <= i_dr(111) or i_dr(122) or i_dr(123) or i_dr(124) or i_dr(125);
	store <= i_dr(97) and op_mem;
	op_ands<= i_dr(69) or i_dr(70);
	z_test <= (i_dr(14) or i_dr(15) or i_dr(16) or i_dr(18) or i_dr(19) or i_dr(20)or i_dr(58) or i_dr(59) or i_dr(60) or i_dr(61) or i_dr(62) or i_dr(63) or i_dr(64) or op_ands or reg_shift_inc_dec_mem_rdy_delayed);
	short_circuit_branch_add <= reg_op_t3_branch_rdy and (i_alu_carry_out or reg_branch_back) and not (i_alu_carry_out and reg_branch_back);
	short_circuit <= short_circuit_branch_add or reg_short_circuit_hold;
	stack_op_rdy <= reg_rdy_phi1 and (i_dr(21) or i_dr(22) or i_dr(23) or i_dr(24) or i_dr(25) or i_dr(26));
	bb_or_cpxy_or_inxy <= i_dr(49) or i_dr(50) or (not reg_branch_back and i_dr(93));
	pre_adl_to_add <= (i_dr(33) and not i_dr(34)) or i_dr(35) or i_dr(36) or i_dr(37) or i_dr(38) or i_dr(39) or not i_rdy;
	pre_db_bar_to_add <= i_rdy and (i_dr(51) or i_dr(56) or bb_or_cpxy_or_inxy);
	adh_math <= i_dr(71) or i_dr(72) or i_dr(73);
	pre_add_sb06 <= adh_math or reg_t1_reset or reg_shift_inc_dec_mem_rdy_delayed or i_dr(56) or stack_op_rdy;
	inc_sb <= i_dr(39) or i_dr(40) or i_dr(41) or i_dr(42) or i_dr(43) or (i_dr(44) and reg_shift_inc_dec_mem);
	alu_cout_held_if_not_rdy <= not( i_alu_carry_out and reg_rdy_phi1_delayed) or (reg_rdy_phi1_delayed and reg_alu_cout_held_if_not_rdy_delayed);
	dl_to_pch <= i_t0 and (i_dr(94) or i_dr(95) or i_dr(96));
	srs <= i_dr(75) or (reg_shift_inc_dec_mem and i_dr(76));
	db_to_p <= i_rdy and reg_pd_load;
	
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_phi1 = '1' then
				reg_rdy_phi1 <= i_rdy;
				reg_rdy_phi2_delayed <= reg_rdy_phi2;
				reg_shift_inc_dec_mem <= reg_op_shift_inc_dec_mem or (not i_rdy and reg_shift_inc_dec_mem_delayed);
				reg_shift_inc_dec_mem_rdy_delayed <= reg_shift_inc_dec_mem_rdy;
				reg_alu_cout_held_if_not_rdy <= alu_cout_held_if_not_rdy;
				reg_pcl_to_db <= buf_pch_to_db and i_rdy;
				reg_t1_reset <= buf_t1_reset;
				if reg_branch_back_delayed = 'X' then
					reg_branch_back <= '1';
				else
					reg_branch_back <= (i_db7 or not reg_t2_br) and (reg_branch_back_delayed or reg_t2_br);
				end if;
				reg_short_circuit <= short_circuit;
				if reg_need_sb7_delayed = 'X' then
					reg_need_sb7 <= '0';
				else
					reg_need_sb7 <= (not reg_carry_flag and reg_rdy_srs) or (not reg_rdy_srs and reg_need_sb7_delayed);
				end if;
				reg_srs_delayed <= reg_srs;
				reg_set_overflow <= i_set_overflow;
				reg_set_overflow_delayed_again <= reg_set_overflow_delayed;
				reg_t_res_x <= (i_rdy and not alu_cout_held_if_not_rdy and not reg_ind_y_or_abs_idx and not (i_dr(97) or i_dr(106) or i_dr(107))) or reg_force_t_res_x or i_break_done;
				reg_break_in_progress <= i_break_in_progress;
				reg_short_circuit_branch_add <= short_circuit_branch_add;
				o_and_select <= reg_and_select;
				o_eor_select <= reg_eor_select;
				o_or_select <= reg_or_select;
				o_sum_select <= reg_sum_select;
				o_shift_right_select <= reg_shift_right_select;
				o_read_write <= not (reg_mem_write and i_rdy and not i_reset_in_progress);
				o_i_to_addc <= reg_return_and_adl_add or reg_inc_sb or reg_bb_or_cpxy_or_inxy or reg_c_set;
				
			else
				reg_rdy_phi2 <= i_rdy;
				reg_rdy_phi1_delayed <= reg_rdy_phi1;
				reg_ind_y_or_abs_idx <= not (i_dr(91) or i_dr(92));
				reg_shift_inc_dec_mem_rdy <= reg_shift_inc_dec_mem and i_rdy;
				reg_op_shift_inc_dec_mem <= i_rdy and (i_dr(106) or i_dr(107)) and (i_dr(111) or i_dr(122) or i_dr(123) or i_dr(124) or i_dr(125));
				reg_force_t_res_x <= i_reset or (reg_pre_fetch and not reg_reset) or (i_rdy and not(i_dr(100) or i_dr(101) or i_dr(102) or i_dr(103) or i_dr(104) or i_dr(105) or reg_shift_inc_dec_mem_rdy_delayed or (op_mem and not (i_dr(106) or i_dr(107)) and not i_dr(96))));
				reg_reset <= i_reset;
				reg_pre_fetch <= (not i_rdy and reg_t1_reset) or (i_rdy and (i_t0 or (not br_taken and i_dr(80))));
				reg_t2_br <= i_dr(80);
				reg_short_circuit_hold <= not (reg_rdy_phi1 or not i_reset or not reg_short_circuit);
				reg_op_t3_branch_rdy <= i_dr(93) and reg_rdy_phi1_delayed;
				reg_bb_or_cpxy_or_inxy <= bb_or_cpxy_or_inxy;
				reg_return_and_adl_add <= i_dr(47) and pre_adl_to_add;
				reg_c_set <= i_dr(54) or (i_p_register(0) and (reg_shift_inc_dec_mem or i_t0) and (i_dr(52) or i_dr(53)));
				reg_alu_cout_held_if_not_rdy_delayed <= reg_alu_cout_held_if_not_rdy;
				reg_srs <= srs;
				reg_rdy_srs <= reg_rdy_phi1 and srs;
				reg_pd_load <= i_dr(114) or i_dr(115);
				reg_pla_109 <= i_dr(109);
				reg_pla_113 <= i_dr(113);
				reg_set_overflow_delayed <= reg_set_overflow;
				reg_mem_write <= reg_shift_inc_dec_mem or reg_shift_inc_dec_mem_rdy_delayed or i_dr(98) or i_dr(100) or store or i_dr(77) or i_dr(78) or reg_pcl_to_db;
				reg_o_to_add <= stack_op_rdy  or i_break_done or inc_sb or not i_rdy or i_dr(30)or i_dr(31) or i_dr(45) or i_dr(47) or i_dr(48);
				reg_adl_to_pcl <= (i_dr(93) and i_phi1) or i_dr(84) or i_t0 or not reg_pcl_to_adl;
				reg_adh_to_pch <= i_t0 or reg_t1_reset or i_dr(80) or i_dr(83) or i_dr(84) or i_dr(93);
				reg_next_pc <= (not i_dr(80) and not i_dr(93) and reg_adl_to_pcl) or ( not br_taken and i_dr(80));
				reg_i_to_pc <= i_rdy and not i_implied_addressing and reg_next_pc;
				reg_sb_to_ac <= i_dr(58) or i_dr(59) or i_dr(60) or i_dr(61) or i_dr(62) or i_dr(63) or i_dr(64);
				reg_ac_to_db <= (i_dr(79) and store) or i_dr(74);
				reg_ac_to_sb <= (i_dr(69) or i_dr(70)) or (not i_dr(64) and i_dr(65)) or i_dr(66) or i_dr(67) or i_dr(68);
				reg_sb_to_x <= i_dr(14) or i_dr(15) or i_dr(16);
				reg_x_to_sb <= (store and i_dr(12)) or ( i_dr(6) and not i_dr(7) ) or i_dr(8) or i_dr(9) or i_dr(10) or i_dr(11) or i_dr(13);
				reg_sb_to_y <= i_dr(18) or i_dr(19) or i_dr(20);
				reg_y_to_sb <= (store and i_dr(0)) or (i_dr(6) and i_dr(7)) or i_dr(1) or i_dr(2) or i_dr(3) or i_dr(4) or i_dr(5);
				reg_sb_to_s <= i_dr(13) or (i_rdy and i_dr(48)) or stack_op_rdy;
				reg_adl_to_add <= pre_adl_to_add;
				reg_db_bar_to_add <= pre_db_bar_to_add;
				reg_db_to_add <= pre_adl_to_add and not pre_db_bar_to_add;
				reg_and_select <= op_ands;
				reg_eor_select <= i_dr(29);
				reg_or_select <= i_dr(32) or not i_rdy;
				reg_shift_right_select <= i_dr(75) or (i_dr(76) and reg_shift_inc_dec_mem);
				reg_sum_select <= not (op_ands or i_dr(29) or i_dr(32) or not i_rdy or i_dr(75) or (i_dr(76) and reg_shift_inc_dec_mem));
				reg_inc_sb <= inc_sb;
				reg_carry_flag <= i_p_register(0);
				reg_need_sb7_delayed <= reg_need_sb7;
				reg_branch_back_delayed <= reg_branch_back;
				reg_shift_inc_dec_mem_delayed <= reg_shift_inc_dec_mem;
				o_dl_to_adl <= i_dr(81) or i_dr(82);
				o_O_to_adh0 <= i_dr(81) or i_dr(82);
				o_O_to_adh1_7 <= i_dr(57) or i_dr(81) or i_dr(82);
				o_dl_to_adh <= dl_to_pch or i_dr(84) or i_dr(89) or i_dr(90) or i_dr(91);
				buf_sb_to_adh <= adh_math or i_dr(93);
				o_adh_to_abh <= ((((i_dr(28) or i_dr(56) or i_dr(84) or i_dr(89) or i_dr(90) or i_dr(91) or reg_adh_to_pch) and i_rdy) or (reg_rdy_phi1 and alu_cout_held_if_not_rdy and buf_sb_to_adh))and not i_dr(93)) or i_zero_adl0;
				o_adl_to_abl <= not (i_dr(71) or i_dr(72) or not i_rdy)  and not ( reg_shift_inc_dec_mem or reg_shift_inc_dec_mem_rdy_delayed);
				o_pcl_to_adl <= reg_pcl_to_adl;
				o_pch_to_adh <= i_dr(93) or not(reg_pcl_to_adl or dl_to_pch or (reg_rdy_phi2_delayed and i_dr(73)));
				buf_pch_to_db <= i_dr(77) or i_dr(78);
				o_pcl_to_db <= reg_pcl_to_db;
				o_sb_to_db <= i_dr(48) or ((store and i_dr(0)) or (store and i_dr(12))) or i_dr(67) or i_dr(80) or (reg_shift_inc_dec_mem and i_dr(55)) or (z_test and not op_ands) or reg_t1_reset;
				o_s_to_adl <= i_dr(35) or (reg_rdy_phi1 and i_dr(21));
				o_add_to_adl <= not ( adh_math or not(i_dr(26) or i_dr(84) or i_dr(85) or i_dr(86) or i_dr(87) or i_dr(88) or i_dr(89)));
				o_add_to_sb_7 <= pre_add_sb06 and (reg_need_sb7 or reg_srs_delayed or not i_dr(27));
				buf_acr_to_c <= i_dr(112) or i_dr(116) or i_dr(117) or i_dr(118) or i_dr(119) or (i_dr(107) and reg_shift_inc_dec_mem_delayed);
				o_1_to_v <= not( reg_set_overflow or not reg_set_overflow_delayed_again);
				o_0_to_v <= i_dr(127);
				o_dl_to_db <= i_dr(80) or i_dr(102) or reg_shift_inc_dec_mem or i_break_done or inc_sb or i_dr(45) or i_dr(46) or i_dr(47) or i_dr(48) or (not i_dr(128) and (i_t0 or i_dr(83)));
				o_s_to_sb <= i_dr(17);
				o_add_to_sb_0_6 <= pre_add_sb06;
			end if;
		end if;
	end process;
	
	o_adh_to_pch <= reg_adh_to_pch and i_phi1;
	o_pch_to_pch <= (not reg_adh_to_pch) and i_phi1;
	o_adl_to_pcl <= reg_adl_to_pcl and i_phi1;
	o_pcl_to_pcl <= (not reg_adl_to_pcl) and i_phi1;
	reg_pcl_to_adl <= i_dr(56) or i_dr(80) or i_dr(83) or (i_t0 and (not reg_rdy_phi1) and not (i_dr(94) or i_dr(95) or i_dr(96))) or reg_t1_reset;
	o_i_to_pc <= (reg_i_to_pc and reg_break_in_progress) or (reg_break_in_progress and reg_short_circuit_branch_add);
	o_sb_to_ac <= reg_sb_to_ac and i_phi1;
	o_ac_to_db <= reg_ac_to_db and i_phi1;
	o_ac_to_sb <= reg_ac_to_sb and i_phi1;
	o_sb_to_x <= reg_sb_to_x and i_phi1;
	o_x_to_sb <= reg_x_to_sb and i_phi1;
	o_sb_to_y <= reg_sb_to_y and i_phi1;
	o_y_to_sb <= reg_y_to_sb and i_phi1;
	buf_t1_reset <= (reg_pre_fetch and reg_reset) or (i_rdy and ((reg_op_t3_branch_rdy and (i_alu_carry_out or reg_branch_back) and not (i_alu_carry_out and reg_branch_back)) or reg_short_circuit_hold));
	o_sb_to_s <= reg_sb_to_s and i_phi1;
	o_s_to_s <= not reg_sb_to_s and i_phi1;
	o_adl_to_add <= reg_adl_to_add and i_phi1;
	o_db_bar_to_add <= reg_db_bar_to_add and i_phi1;
	o_db_to_add <= reg_db_to_add and i_phi1;
	o_o_to_add <= reg_o_to_add and i_phi1;
	o_sb_to_add <= not reg_o_to_add and i_phi1;
	o_db0_to_c <= db_to_p;
	o_db1_to_z <= db_to_p;
	o_db2_to_i <= db_to_p;
	o_db3_to_d <= db_to_p;
	o_db7_to_n <= not( reg_pla_109 or (not buf_dbz_to_z and not reg_pd_load));
	buf_dbz_to_z <= z_test or i_dr(109) or buf_acr_to_c;
	o_ir5_to_d <= i_dr(120);
	o_db6_to_v <= reg_pd_load or reg_pla_113;
	o_p_to_db <= i_dr(98) or i_dr(99);
	o_ir5_to_i <= i_dr(108);
	o_ir5_to_c <= i_dr(110);
	o_avr_to_v <= i_dr(112);
	o_reg_reset <= not reg_t_res_x;
	
	o_pch_to_db <= buf_pch_to_db;
	o_sb_to_adh <= buf_sb_to_adh;
	o_acr_to_c <= buf_acr_to_c;
	o_dbz_to_z <= buf_dbz_to_z;
	o_t1_reset <= buf_t1_reset;
end Behavioral;
