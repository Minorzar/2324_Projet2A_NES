library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity CPU_clock_generator_tb is
end CPU_clock_generator_tb ;

architecture testbench of CPU_clock_generator_tb is

	component CPU_clock_generator
		Port(
			i_clk: in std_logic ;
			b_phi1: buffer std_logic ;
			o_phi2: buffer std_logic 
		);
		
	end component ;
	
	constant clk_period : time := 500ns ;

	signal Si_clk : std_logic ;
	signal Sb_phi1 : std_logic := '1';
	signal So_phi2 : std_logic ;
	
begin

	module : CPU_clock_generator
				port map(
					i_clk => Si_clk,
					b_phi1 => Sb_phi1,
					o_phi2 => So_phi2
				);

	clk_process : process
	begin
			
		si_clk <= '0' ;
		wait for clk_period/2 ;
		si_clk <= '1' ;
		wait for clk_period/2 ;
		
	end process ;
	
end testbench ;