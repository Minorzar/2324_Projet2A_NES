library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_interrupt_reset_control is
	Port(
		i_clk: in STD_LOGIC;
		i_phi1: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_nmi: in STD_LOGIC;
		i_irq: in STD_LOGIC;
		i_reset: in STD_LOGIC;
		i_rdy: in STD_LOGIC;
		i_t0: in STD_LOGIC;
		i_t2_branch: in STD_LOGIC;
		i_t5_break: in STD_LOGIC;
		i_interrupt_flag: in STD_LOGIC;
		o_reset_out: buffer STD_LOGIC;
		o_reset_in_progress: buffer STD_LOGIC;
		o_interrupt_in_progress: buffer STD_LOGIC;
		o_break_done: buffer STD_LOGIC;
		o_aic: out STD_LOGIC;
		o_zero_adl: out STD_LOGIC_VECTOR(2 downto 0));
end CPU_interrupt_reset_control;

architecture Behavioral of CPU_interrupt_reset_control is
signal reg_reset: STD_LOGIC;
signal reg_reset_out: STD_LOGIC;
signal reg_clear_int_g: STD_LOGIC;
signal reg_break_done: STD_LOGIC;
signal reg_nmi_g: STD_LOGIC;
signal reg_reset_not_done: STD_LOGIC;
signal reg_nmi_g_delayed: STD_LOGIC;
signal reg_nmi_l: STD_LOGIC;
signal reg_nmi_l_or_vec: STD_LOGIC;
signal reg_nmi_delayed: STD_LOGIC;
signal reg_vec: STD_LOGIC_VECTOR(1 downto 0);
signal reg_vec_or: STD_LOGIC;
signal reg_interrupt_in_progress: STD_LOGIC;
signal reg_irq_delayed: STD_LOGIC;
signal reg_nmi_p: STD_LOGIC;
signal reg_irq: STD_LOGIC;


signal nmi_g: STD_LOGIC;
signal nmi_l: STD_LOGIC;
signal vec: STD_LOGIC_VECTOR(1 downto 0);
signal vec_or: STD_LOGIC;

signal buf_reset_out: STD_LOGIC;
signal buf_reset_in_progress: STD_LOGIC;
signal buf_interrupt_in_progress: STD_LOGIC;
signal buf_break_done: STD_LOGIC;


begin
	buf_reset_in_progress <= reg_reset_out or reg_reset_not_done;
	buf_interrupt_in_progress <= buf_break_done or reg_clear_int_g;
	nmi_g <= reg_nmi_l_or_vec and (reg_nmi_g or reg_break_done);
	nmi_l <= not reg_nmi_delayed and (not reg_nmi_g_delayed  or reg_nmi_l);
	buf_break_done <= i_rdy and reg_vec(1);
	vec(0) <= i_t5_break and i_rdy;
	vec_or <= vec(0) or vec(1);
	o_aic <= buf_reset_in_progress or buf_interrupt_in_progress;
	
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_phi1 = '1' then
				buf_reset_out <= reg_reset;
				reg_reset_not_done <= buf_reset_in_progress and not buf_break_done;
				reg_nmi_l_or_vec <= nmi_l or reg_vec_or or not reg_nmi_p;
				reg_break_done <= buf_break_done;
				reg_nmi_g_delayed <= reg_nmi_g;
				reg_irq_delayed <= reg_irq;
				reg_interrupt_in_progress <= buf_interrupt_in_progress;
				vec(1) <= reg_vec(0) or ( not i_rdy and vec(1));
			else
				reg_nmi_delayed <= reg_nmi_p;
				reg_nmi_p <= i_nmi;
				reg_reset <= i_reset;
				reg_clear_int_g <= not(reg_interrupt_in_progress or ((not i_t0 or i_t2_branch) and not(nmi_g and ( i_interrupt_flag or buf_break_done or not reg_irq_delayed))));
				reg_reset_out <= buf_reset_out;
				reg_nmi_g <= nmi_g;
				reg_vec <= vec;
				reg_nmi_l <= nmi_l;
				reg_vec_or <= vec_or;
				reg_irq <= i_irq;
				o_zero_adl(2) <= not( nmi_g or not vec_or or buf_reset_in_progress);
				o_zero_adl(1) <= vec_or and buf_reset_in_progress;
				o_zero_adl(0) <= vec(0);
			end if;
		end if;
	end process;
	
	o_reset_out <= buf_reset_out;
	o_reset_in_progress <= buf_reset_in_progress;
	o_interrupt_in_progress <= buf_interrupt_in_progress;
	o_break_done <= buf_break_done;
	
end Behavioral;	