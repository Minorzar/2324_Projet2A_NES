library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_adder_hold_register_tb is
end CPU_adder_hold_register_tb ;

architecture testbench of CPU_adder_hold_register_tb is

	component CPU_adder_hold_register is
		
		Port(
		
			i_clk					: in std_logic ;
			i_input				: in unsigned (7 downto 0) ;
			i_add_to_adl		: in std_logic ;
			i_add_to_sb_0_6	: in std_logic ;
			i_add_to_sb_7		: in std_logic ;
			o_adl_bus			: out unsigned (7 downto 0) ;
			o_s_bus				: out unsigned (7 downto 0)
		
		);
		
	end component;
	
	constant clk_period : time := 500ns ;
	
	signal Si_clk					: std_logic ;
	signal Si_input				: unsigned (7 downto 0) ;
	signal Si_add_to_adl			: std_logic ;
	signal Si_add_to_sb_0_6		: std_logic ;
	signal Si_add_to_sb_7		: std_logic ;
	signal So_adl_bus				: unsigned (7 downto 0) ;
	signal So_s_bus				: unsigned (7 downto 0) ;
	
begin

	module : CPU_adder_hold_register
				port map(
				
					i_clk					=> Si_clk,
					i_input				=> Si_input,
					i_add_to_adl		=> Si_add_to_adl,
					i_add_to_sb_0_6	=> Si_add_to_sb_0_6,
					i_add_to_sb_7		=> Si_add_to_sb_7,
					o_adl_bus			=> So_adl_bus,
					o_s_bus				=> So_s_bus
					
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
			
			-- Initialisation (everyone off except input)
			Si_input <= "10101010" ;
			Si_add_to_adl <= '0' ;
			Si_add_to_sb_0_6 <= '0' ;
			Si_add_to_sb_7 <= '0' ;
			
			wait for 1ms ;
			
			-- sb with 0-6 on and 7 off
			Si_add_to_sb_0_6 <= '1' ;
			
			wait for 1ms ;
			
			-- sb with 0-6 off and 7 on
			Si_add_to_sb_0_6 <= '0' ;
			Si_add_to_sb_7 <= '1' ;
			
			wait for 1ms ;
			
			-- sb specified with 0-6 on and 7 on
			Si_add_to_sb_0_6 <= '1' ;
			
			wait for 1ms ;
			
			-- adl on with 0-6 off and 7 off
			Si_add_to_sb_0_6 <= '0' ;
			Si_add_to_sb_7 <= '0' ;
			Si_add_to_adl <= '1' ;
			
			wait for 1ms ;
			
			-- adl on with 0-6 on and 7 off
			Si_add_to_sb_0_6 <= '1' ;
			
			wait for 1ms ;
			
			-- adl on with 0-6 off and 7 on
			Si_add_to_sb_0_6 <= '0' ;
			Si_add_to_sb_7 <= '1' ;
			
			wait for 1ms ;
			
			--adl on with 0-6 on and 7 on
			Si_add_to_sb_0_6 <= '1' ;
			
			wait for 1ms ;
			
		end process ;
		
end testbench ;			
	