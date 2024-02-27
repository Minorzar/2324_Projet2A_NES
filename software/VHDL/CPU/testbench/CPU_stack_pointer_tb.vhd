library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_stack_pointer_tb is
end CPU_stack_pointer_tb ;

architecture testbench of CPU_stack_pointer_tb is

	component CPU_stack_pointer
		port(
			
			i_clk			: in STD_LOGIC;
			i_sb_to_s	: in STD_LOGIC;
			i_s_to_sb	: in STD_LOGIC;
			i_s_to_adl	: in STD_LOGIC;
			i_s_hold		: in STD_LOGIC;
			o_adl_bus	: out unsigned (7 downto 0);
			io_s_bus		: inout unsigned (7 downto 0)
		
		);
	
	end component ;
	
	constant clk_period : time := 500ns ;
	
	signal Si_clk 			: std_logic ;
	signal Si_sb_to_s 	: std_logic ;
	signal Si_s_to_sb 	: std_logic ;
	signal Si_s_to_adl	: std_logic ;
	signal Si_s_hold 		: std_logic ;
	signal So_adl_bus		: unsigned(7 downto 0) ;
	signal Sio_s_bus 		: unsigned(7 downto 0) ;
	
begin
	
	module : CPU_stack_pointer
				port map(
					
					i_clk 		=> Si_clk,
					i_sb_to_s 	=> Si_sb_to_s,
					i_s_to_sb 	=> Si_s_to_sb,
					i_s_to_adl 	=> Si_s_to_adl,
					i_s_hold 	=> Si_s_hold,
					o_adl_bus 	=> So_adl_bus,
					io_s_bus 	=> Sio_s_bus
				
				);
				
	clk_process : process
		begin
		
			Si_clk <= '1' ;
			wait for clk_period/2 ;
			Si_clk <= '0' ;
			wait for clk_period/2 ;
			
		end process ;
		
	
	testbench_process : process
		begin
		
			Sio_s_bus <= "10101010" ;
			
			-- nothing with hold
			Si_sb_to_s <= '0' ;
			Si_s_hold <= '1' ;
			Si_s_to_sb <= '0' ;
			Si_s_to_adl <= '0' ;
			
			wait for 1ms ;
			
			-- nothing without hold
			Si_s_hold <= '0' ;
			
			wait for 1ms ;
		
			-- sb to s with hold 
			Si_sb_to_s <= '1' ;
			Si_s_hold <= '1' ;
			
			wait for 1ms ;
			
			-- s to sb with hold
			Si_sb_to_s <= '0' ;
			Si_s_to_sb <= '1' ;
		
			wait for 1ms ;
			
			-- s to adl with hold
			Si_s_to_sb <= '0' ;
			Si_s_to_adl <= '1' ;
			
			wait for 1ms ;
			
			-- sb to s without hold
			Si_s_to_adl <= '0' ;
			Si_sb_to_s <= '1' ;
			Si_s_hold <= '0' ;
			
			wait for 1ms ;
			
			-- s to sb without hold
			Si_sb_to_s <= '0' ;
			Si_s_to_sb <= '1' ;
		
			wait for 1ms ;
			
			-- s to adl without hold
			Si_s_to_sb <= '0' ;
			Si_s_to_adl <= '1' ;
			
			wait for 1ms ;
			
		end process ;
		
end testbench ;