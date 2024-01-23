library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CPU_xy_register_tb is
end CPU_xy_register_tb ;

architecture testbench of CPU_xy_register_tb is

	component CPU_xy_register
		port(
			i_clk: in std_logic;
			i_sb_to_xy: in std_logic;
			i_xy_to_sb: in std_logic;
			io_s_bus: inout unsigned (7 downto 0)
		);
		
	end component ;
		
	constant clk_period : time := 500ns ;
		
	signal Si_clk: std_logic ;
	signal Si_sb_to_xy : std_logic ;
	signal Si_xy_to_sb : std_logic ;
	signal Sio_s_bus : unsigned (7 downto 0) ;
		
begin
	module : CPU_xy_register
				port map(
					i_clk => Si_clk,
					i_sb_to_xy => Si_sb_to_xy,
					i_xy_to_sb => Si_xy_to_sb,
					io_s_bus => Sio_s_bus
				) ;
					
	clk_process : process
	begin
			
		si_clk <= '0' ;
		wait for clk_period/2 ;
		si_clk <= '1' ;
		wait for clk_period/2 ;
		
	end process ;
		
	tb_process : process
	begin
		
		Sio_s_bus <= "10101010" ;
		Si_sb_to_xy <= '0' ;
		Si_xy_to_sb <= '0' ;
		wait for 1ms ;
		Si_sb_to_xy <= '1' ;
		wait for 1ms ;
		Si_sb_to_xy <= '0' ;
		Sio_s_bus <= "01010101" ;
		wait for 1ms ;
		Si_xy_to_sb <= '1' ;
			
	end process ;
	
end testbench ;