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
		b_reset_out: buffer STD_LOGIC;
		b_reset_in_progress: buffer STD_LOGIC;
		b_interrupt_in_progress: buffer STD_LOGIC;
		b_break_done: buffer STD_LOGIC;
		o_aic: out STD_LOGIC;
		o_zero_adl: out STD_LOGIC_VECTOR(2 downto 0));
end CPU_interrupt_reset_control;

architecture Behavioral of CPU_interrupt_reset_control is
signal reg_reset: STD_LOGIC;
signal reg_reset_out: STD_LOGIC;
signal reg_clear_int_g: STD_LOGIC;
signal reg_nmi_1_or_vec: STD_LOGIC;
signal reg_break_done: STD_LOGIC;
signal reg_nmi_g: STD_LOGIC;
signal reg_reset_not_done: STD_LOGIC;
signal reg_nmi_g_delayed: STD_LOGIC;
signal reg_nmi_l: STD_LOGIC;
signal reg_nmi_delayed: STD_LOGIC;
signal reg_nmi: STD_LOGIC;
signal reg_vec: STD_LOGIC;
signal reg_interrupt_in_progress: STD_LOGIC;
signal reg_irq_delayed: STD_LOGIC;


signal nmi_g: STD_LOGIC;
signal nmi_l: STD_LOGIC;

begin
	b_reset_in_progress <= reg_reset_out or reg_reset_not_done;
	b_interrupt_in_progress <= b_break_done or reg_clear_int_g;
	nmi_g <= reg_nmi_1_or_vec and (reg_nmi_g or reg_break_done);
	nmi_l <= not reg_nmi_delayed and (not reg_nmi_g_delayed  or reg_nmi_l);
	
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_phi1 = '1' then
				b_reset_out <= reg_reset;
				reg_reset_not_done <= b_reset_in_progress and not b_break_done;
				reg_nmi_1_or_vec <= nmi_l or reg_vec or not reg_nmi;
			else
				reg_reset <= i_reset;
				reg_clear_int_g <= not(reg_interrupt_in_progress or ((not i_t0 or i_t2_branch) and not(nmi_g and ( i_interrupt_flag or b_break_done or not reg_irq_delayed))));
				reg_reset_out <= b_reset_out;
			end if;
		end if;
	end process;
end Behavioral;	