library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_random_control_logic is
	Port(
		i_clk: in STD_LOGIC;
		i_rdy: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_set_overflow: in STD_LOGIC;
		i_dr: in unsigned(129 downto 0);--the decode ROM array
		i_reset: in STD_LOGIC;
		i_reset_in_progress: in STD_LOGIC;
		i_break_in_progress: in STD_LOGIC;
		i_implied_addressing: in STD_LOGIC;
		i_two_cycle: in STD_LOGIC;
		i_t0: in STD_LOGIC;
		i_ir5: in STD_LOGIC;
		i_db7: in STD_LOGIC;
		i_alu_carry_out: in STD_LOGIC;
		i_break_done: in STD_LOGIC;
		i_zero_adl0: in STD_LOGIC;
		i_p_register: STD_LOGIC_VECTOR(7 downto 0);
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
		b_pch_to_db: buffer STD_LOGIC;
		o_pch_to_adh: out STD_LOGIC;
		o_sb_to_adh: out STD_LOGIC;
		o_sb_to_db: out STD_LOGIC;
		o_O_to_adl0: out STD_LOGIC;
		o_O_to_adl1: out STD_LOGIC;
		o_O_to_adl2: out STD_LOGIC;
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
		o_i_to_v: out STD_LOGIC;
		o_db7_to_n:out STD_LOGIC;
		o_read_write:out STD_LOGIC);
end CPU_random_control_logic;

architecture Dataflow of CPU_random_control_logic is

signal reg_adh_to_pch: STD_LOGIC;
signal reg_sb_to_adh: STD_LOGIC;
signal reg_sync: STD_LOGIC;
signal reg_indirect_address: STD_LOGIC;
signal reg_rdy_phi1: STD_LOGIC;
signal reg_rdy_phi1_delayed: STD_LOGIC;
signal reg_rdy_phi2: STD_LOGIC;
signal reg_rdy_phi2_delayed: STD_LOGIC;
signal reg_op_shift_inc_dec_mem: STD_LOGIC;
signal reg_shift_inc_dec_mem: STD_LOGIC;
signal reg_shift_inc_dec_mem_delayed: STD_LOGIC;
signal reg_shift_inc_dec_mem_rdy: STD_LOGIC;
signal reg_shift_inc_dec_mem_rdy_delayed: STD_LOGIC;
signal reg_adl_to_pcl: STD_LOGIC;
signal reg_pcl_to_pcl: STD_LOGIC;
signal reg_i_to_pc: STD_LOGIC;
signal reg_break_in_progress: STD_LOGIC;
signal reg_next_pc: STD_LOGIC;
signal reg_pcl_to_db: STD_LOGIC;
signal reg_sb_to_ac: STD_LOGIC;
signal reg_ac_to_db: STD_LOGIC;
signal reg_ac_to_sb: STD_LOGIC;

variable br_taken: STD_LOGIC;
variable store: STD_LOGIC;
variable op_mem: STD_LOGIC;

begin
	--br_taken := not i_ir5 xor (( i_dr(121) and not i_dr(126) and i_p_register()) or ( not i_dr(121) and not i_dr(126) and i_p_register()) or (i_dr(121) and i_dr(126) and i_p_register()) or (not i_dr(121) and i_dr(126) and i_p_register));
	--op_mem := i_dr(111) or i_dr(122) or i_dr(123) or i_dr(124) or i_dr(125);
	store := i_dr(97) and op_mem;
	
	
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_phi1 = '1' then
				reg_rdy_phi1 <= i_rdy;
				reg_rdy_phi2_delayed <= reg_rdy_phi2;
				reg_shift_inc_dec_mem <= reg_op_shift_inc_dec_mem or (not i_rdy and reg_shift_inc_dec_mem_delayed);
				reg_shift_inc_dec_mem_rdy_delayed <= reg_shift_inc_dec_mem_rdy;
				reg_break_in_progess <= i_break_in_progress;
				reg_pcl_to_db <= b_pch_to_db and i_rdy;
				
			else
				reg_rdy_phi2 <= i_rdy;
				reg_rdy_phi1_delayed <= reg_rdy_phi1;
				reg_shift_inc_dec_mem_rdy <= reg_shift_inc_dec_mem and i_rdy;
				reg_op_shift_inc_dec_mem <= i_rdy and (i_dr(106) or i_dr(107)) and (i_dr(111) or i_dr(122) or i_dr(123) or i_dr(124) or i_dr(125));
				reg_adl_to_pcl <= (i_dr(93) and i_phi1) or i_dr(84) or i_t0 or not reg_pcl_adl;
				reg_adh_to_pch <= i_t0 or reg_sync or i_dr(80) or i_dr(83) or i_dr(84) or i_dr(93);
				reg_next_pc <= (not i_dr(80) and not i_dr(93) and reg_adl_to_pcl) or ( not br_taken and i_dr(80));
				reg_i_to_pc <= i_rdy and not i_implied_addressing and reg_next_pc;
				reg_sb_to_ac <= i_dr(58) or i_dr(59) or i_dr(60) or i_dr(61) or i_dr(62) or i_dr(63) or i_dr(64);
				reg_ac_to_db <= (i_dr(79) and store) or i_dr(74);
				reg_ac_to_sb <= (i_dr(69) or i_dr(70)) or (not i_dr(64) and i_dr(65)) or i_dr(66) or i_dr(67) or i_dr(68);
				o_dl_to_adl <= i_dr(81) or i_dr(82);
				o_dl_to_adh <= (i_t0 and (i_dr(94) or i_dr(95) or i_dr(96))) or i_dr(84) or i_dr(89) or i_dr(90) or i_dr(91);
				o_sb_to_adh <= i_dr(71) or i_dr(72) or i_dr(73) or i_dr(93);
				o_adh_to_abh <= ((((i_dr(28) or i_dr(56) or i_dr(84) or i_dr(89) or i_dr(90) or i_dr(91) or reg_adh_to_pch) and i_rdy) or (reg_rdy_phi1 and alu_cout_held_if_not_rdy and reg_sb_to_adh))and not i_dr(93)) or zero_adl0;
				o_adl_to_abl <= not (i_dr(71) or i_dr(72) or not i_rdy)  and not ( shift_inc_dec_mem_c1 or shift_inc_dec_mem_rdy_c2_c1);
				o_pcl_to_adl <= reg_pcl_to_adl;
				o_pch_to_adh <= i_dr(93) or not(reg_pcl_adl or (i_t0 and (i_dr(94) or i_dr(95) or i_dr(96))) or (rdy_phi2_delayed and i_dr(73)));
				b_pch_to_db <= i_dr(77) or i_dr(78);
				o_pcl_to_db <= reg_pcl_to_db;
			end if;
		end if;
	end process;
	o_adh_to_pch <= reg_adh_to_pch and i_phi1;
	o_pch_to_pch <= (not reg_adh_to_pch) and i_phi1;
	o_adl_pcl <= reg_adl_to_pcl and i_phi1;
	o_pcl_to_pcl <= (not reg_adl_to_pcl) and i_phi1;
	reg_pcl_to_adl <= i_dr(56) or i_dr(80) or i_dr(83) or (i_t0 and (not reg_rdy_phi1) and not (i_dr(94) or i_dr(95) or i_dr(96))) or reg_t_res_1;
	reg_dl_to_pch <= i_t0 and (i_dr(94) or i_dr(95) or i_dr(96));
	o_i_to_pc <= (reg_i_to_pc and reg_break_in_progess) or (reg_break_in_progess and reg_short_circuit_branch_add);
	o_sb_to_ac <= reg_sb_to_ac and i_phi1;
	o_ac_to_db <= reg_ac_to_db and i_phi1;
	o_ac_to_sb <= reg_ac_to_sb and i_phi1;
end Dataflow;
