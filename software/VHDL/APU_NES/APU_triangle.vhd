------------------------------------------------------------------------------

-- Made by Xteck for the Nes projet in ENSEA (2023-2024)

-- This is the triangle full

------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity APU_triangle is 
port(
	clk: in std_logic;
	i_reset: in std_logic;
	i_en_req: in std_logic;
	
	i_linear_counter_load: in std_logic_vector(6 downto 0);
	i_lenght_counter_load : in std_logic_vector(4 downto 0);
	
	i_half_frame_enabler: in std_logic;
	i_lenght_counter_halt_linear_counter_control:in std_logic;	
	
	
	i_timer_low: in std_logic_vector(6 downto 0);
	i_timer_high: in std_logic_vector(2 downto 0);
	
	o_level         :	out STD_LOGIC_VECTOR(3 DOWNTO 0)
);
end APU_triangle; 



architecture APU_triangle_rtf of APU_triangle is

signal enable_lenght: std_logic;
signal enable_linear: std_logic;
signal s_timer :std_logic;

 triangle : entity work.triangle
port map (

			i_en_seq  =>    s_timer,  
			i_reset   =>    i_reset,
			i_clk     =>	 clk,
			i_linear_counter => enable_linear,
			i_length_counter => enable_lenght,
			o_level   => o_level
);



APU_lenght_counter : entity work.APU_lenght port map (

		   i_length_counter_en   =>  i_lenght_counter_halt_linear_counter_control,
		   i_frame_counter 	 	 =>  , 
		   i_clk 					 =>  clk,
		   i_halt_flag 			 => i_half_frame_enabler,
		   i_counter_load 		 => i_lenght_counter_load,
			
		   o_enabler 			 	 => enable_lenght
);




APU_linear_counter : entity work.APU_linear_counter port map (

		   i_linear_counter_en   => i_lenght_counter_halt_linear_counter_control,
		   i_clk 					 =>  clk,
		   i_halt_flag 			 => i_half_frame_enabler,
			i_frame_counter		 => 
		   i_counter_load 		 => i_linear_counter_load,
			
		   o_enabler 			 	 => enable_linear

); 



 timer : entity work.timer port map(
 
        i_clk        => clk,
        i_reset       => i_reset,
        i_timer   => i_timer_low & i_timer_high
        o_timer   => s_timer
);

 
end APU_triangle_rtf;