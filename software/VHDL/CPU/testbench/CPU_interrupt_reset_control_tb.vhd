library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_interrupt_reset_control_tb is
end CPU_interrupt_reset_control_tb ;

architecture testbench of CPU_interrupt_reset_control_tb is

	
	constant clk_period : time := 500ns ;
	
	signal Si_clk 							: std_logic ;
	signal Si_phi1 							: std_logic ;
	signal Si_phi2 							: std_logic ;
	signal Si_nmi 							: std_logic ;
	signal Si_irq 							: std_logic ;
	signal Si_reset 						: std_logic ;
	signal Si_rdy 							: std_logic ;
	signal Si_t0 							: std_logic ;
	signal Si_t2_branch 					: std_logic ;
	signal Si_t5_break 					: std_logic ;
	signal Si_interrupt_flag 			: std_logic ;
	signal Sb_reset_out 					: std_logic ;
	signal Sb_reset_in_progress 		: std_logic ;
	signal Sb_interrupt_in_progress 	: std_logic ;
	signal Sb_break_done 				: std_logic ;
	signal So_aic 							: std_logic ;
	signal So_zero_adl 					: std_logic_vector(2 downto 0) ;
	
begin

	CPU_interrupt_reset_control_inst : entity work.CPU_interrupt_reset_control
				
				port map(
				
					i_clk 						=> Si_clk,
					i_phi1 						=> Si_phi1,
					i_phi2 						=> Si_phi2,
					i_nmi 						=> Si_nmi,
					i_irq 						=> Si_irq,
					i_reset 						=> Si_reset,
					i_rdy 						=> Si_rdy,
					i_t0 							=> Si_t0,
					i_t2_branch 				=> Si_t2_branch,
					i_t5_break 					=> Si_t5_break,
					i_interrupt_flag 			=> Si_interrupt_flag,
					b_reset_out 				=> Sb_reset_out,
					b_reset_in_progress 		=> Sb_reset_in_progress,
					b_interrupt_in_progress => Sb_interrupt_in_progress,
					b_break_done 				=> Sb_break_done,
					o_aic 						=> So_aic,
					o_zero_adl 					=> So_zero_adl
					
				) ;
				
	process_clk : process
		begin
		
			Si_clk <= '1' ;
			Si_phi1 <= '1' ;
			Si_phi2 <= '0' ;
			wait for clk_period/2 ;
			si_clk <= '0' ;
			wait for clk_period/2 ;
			Si_clk <= '1' ;
			Si_phi1 <= '0' ;
			Si_phi2 <= '1' ;
			wait for clk_period/2 ;
			si_clk <= '0' ;
			wait for clk_period/2 ;
			
		end process ;
		
	process_testbench : process
		begin
		
			-- Initializations
			Si_nmi <= '0';
			Si_irq <= '0';
			Si_reset <= '0';
			Si_rdy <= '1';
			Si_t0 <= '0';
			Si_t2_branch <= '0';
			Si_t5_break <= '0';
			Si_interrupt_flag <= '0';
    
			-- Wait for a few clock cycles for stability
			wait for clk_period * 5;
    
			-- Test Case 1: No interrupts or resets
			-- Set inputs accordingly
			Si_nmi <= '0';
			Si_irq <= '0';
			Si_reset <= '0';
			Si_rdy <= '1';
			Si_t0 <= '1'; -- Assuming default state
			Si_t2_branch <= '0'; -- Assuming default state
			Si_t5_break <= '0'; -- Assuming default state
			Si_interrupt_flag <= '0'; -- Assuming default state
    
			-- Wait for some time
			wait for clk_period * 10; -- Adjust timing as needed
    
			-- Test Case 2: Trigger a reset
			-- Set inputs accordingly
			Si_reset <= '1';
    
			-- Wait for some time
			wait for clk_period * 5; -- Adjust timing as needed
    
			-- Test Case 3: Trigger an NMI
			-- Set inputs accordingly
			Si_reset <= '0';
			Si_nmi <= '1';
    
			-- Wait for some time
			wait for clk_period * 5; -- Adjust timing as needed
    
			-- Test Case 4: Trigger an IRQ
			-- Set inputs accordingly
			Si_nmi <= '0';
			Si_irq <= '1';
    
			-- Wait for some time
			wait for clk_period * 5; -- Adjust timing as needed
    
			-- Test Case 5: Interrupt flag set
			-- Set inputs accordingly
			Si_irq <= '0';
			Si_interrupt_flag <= '1';
    
			-- Wait for some time
			wait for clk_period * 5; -- Adjust timing as needed
	
	end process ;

end testbench;
			