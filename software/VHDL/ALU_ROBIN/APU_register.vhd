library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity APU_register is 
	port(
	
		clk : in std_logic;
		
		-- for the read/write part of the register	
		
		addr : in unsigned(15 downto 0);
		data : inout std_logic_vector(7 downto 0);
		
		w_en : in std_logic; 
		
		
		-- all register out
		
		--PULSE_1
		
			--x00
				o_duty_puls_1 : out std_logic_vector(1 downto 0);
				o_counter_1: out std_logic;
				o_cte_volum_1: out std_logic;
				o_var_volum_1: out std_logic_vector(3 downto 0);
			
			--x01
				o_sweep_unit_enable_1 : out std_logic;
				o_sweep_unit_peride_1 : out std_logic_vector(2 downto 0);
				o_sweep_unit_negate_1 : out std_logic;
				o_sweep_unit_shift_count_1 : out std_logic_vector(2 downto 0);
				
			--x02
				o_timer_low_1 : out std_logic_vector(7 downto 0);
			--x03
				o_length_counter_load_1 : out std_logic_vector(4 downto 0);
				o_timer_high_1 : out std_logic_vector(2 downto 0);
				
				
		--PULSE 2
			
			--x04
				o_duty_puls_2 : out std_logic_vector(1 downto 0);
				o_counter_2: out std_logic;
				o_cte_volum_2: out std_logic;
				o_var_volum_2: out std_logic_vector(3 downto 0);
			--x05
				o_sweep_unit_enable_2 : out std_logic;
				o_sweep_unit_peride_2 : out std_logic_vector(2 downto 0);
				o_sweep_unit_negate_2 : out std_logic;
				o_sweep_unit_shift_count_2 : out std_logic_vector(2 downto 0);
			--x06
				o_timer_low_2 : out std_logic_vector(7 downto 0);
			--x07
				o_length_counter_load_2 : out std_logic_vector(4 downto 0);
				o_timer_high_2 : out std_logic_vector(2 downto 0);
				
				
		--TRIANGLE CHANNEL
			
			--x08
				o_length_counter_control : out std_logic;
				o_linear_counter_reload_value : out std_logic_vector(6 downto 0);
			--x0A
				o_timer_low_tri: out std_logic_vector(7 downto 0);
			--x0B
				o_length_counter_load_tri : out std_logic_vector(4 downto 0);
				o_timer_high_tri : out std_logic_vector(2 downto 0);
			
			
		--NOISE CHANNEL
		
			--x0C
				o_loop_envelope_counter_noise : out std_logic;
				o_constant_volume_noise : out std_logic;
				o_envelope_periode_noise: out std_logic_vector(3 downto 0);
			--x0E
				o_loop_noise : out std_logic;
				o_noise_period_noise : out std_logic_vector(3 downto 0);
			--x0F
				o_length_counter_load_noise : out std_logic_vector(4 downto 0);
			
			
		--DMC CHANNEL
			--x10
				o_IRQ_enable : out std_logic;
				o_loop_sample : out std_logic;
				o_frequency_index : out std_logic_vector(3 downto 0);
			--x11
				o_direct_load : out std_logic_vector(6 downto 0);
			--x12
				o_sample_adresse : out std_logic_vector(7 downto 0);
			--x13
				o_sample_length : out std_logic_vector(7 downto 0);
		
		
		-- OTHERS
		
			--x15
			
					-- IF READ
			
				o_interrupt : out std_logic;
				o_frame : out std_logic;
			
					-- EVERY TIME
			
				o_control_dmc_enable : out std_logic;
				o_control_length_counter_enable_noise : out std_logic;
				o_control_length_counter_enable_tri : out std_logic;
				o_control_length_counter_enable_2 : out std_logic;
				o_control_length_counter_enable_1 : out std_logic;
			--x17
				o_5_frame_sequence :  out std_logic;
				o_disable_frame_interrupte :  out std_logic
	);
end APU_register; 


architecture APU_register_rtf of APU_register is

	subtype DAT is std_logic_vector(7 downto 0);
	type MEMORY is array (0 to 2**16) of DAT;
	--type MEMORY is array (0 to 18) of DAT
	signal reg: MEMORY;
	
	--signal index is integer;
	
	begin 
	
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (w_en='1') then
				reg(to_integer((addr)))<=data;
			else
			
				--data<=reg(to_integer(addr));
				
				o_interrupt <=reg(to_integer("0100000000010101"))(7); -- cause read only
				o_frame <=reg(to_integer("0100000000010101"))(6); -- cause read only
				
			end if;
		end if; 
	end process; 
	
	
	data <=reg(to_integer(addr))  when w_en = '0' else  "ZZZZZZZZ" ;
	
	--process(addr)
	-- begin
	-- case addr is 
	-- when "0100000000000000" =>
		-- index<=0;
	-- when "0100000000000001" =>
		-- index<=1;
	-- when "0100000000000010" =>
		-- index<=2;
	-- when "0100000000000011" =>
		-- index<=3;
	-- when "0100000000000100" =>
		-- index<=4;
	-- when "0100000000000101" =>
		-- index<=5;
	-- when "0100000000000110" =>
		-- index<=6;
	-- when "0100000000000111" =>
		-- index<=7;
	-- when "0100000000001000" =>
		-- index<=8;
	-- when "0100000000001001" =>
		-- index<=9;
	-- when "0100000000001010" =>
		-- index<=10;
	-- when "0100000000001011" =>
		-- index<=11;
	-- when "0100000000001100" =>
		-- index<=12;
	-- when "0100000000001101" =>
		-- index<=13;
	-- when "0100000000001110" =>
		-- index<=14;
	-- when "0100000000001111" =>
		-- index<=15;
	-- when "0100000000010000" =>
		-- index<=16;
	-- when "0100000000010001" =>
		-- index<=17;
	-- when others =>
		-- index<=18;
	-- end process;
	
	
	
	
	
	-- ASSIGNEMENT OF ALL VAR
	
	
	--x00
				o_duty_puls_1 <=reg(to_integer("0100000000000000"))(7 downto 6);
				o_counter_1 <=reg(to_integer("0100000000000000"))(5);
				o_cte_volum_1 <=reg(to_integer("0100000000000000"))(4);
				o_var_volum_1 <=reg(to_integer("0100000000000000"))(3 downto 0);
			
	--x01
				o_sweep_unit_enable_1 <=reg(to_integer("0100000000000001"))(7);
				o_sweep_unit_peride_1 <=reg(to_integer("0100000000000001"))(6 downto 4);
				o_sweep_unit_negate_1 <=reg(to_integer("0100000000000001"))(3);
				o_sweep_unit_shift_count_1 <=reg(to_integer("0100000000000001"))(2 downto 0);
	
	--x02
				o_timer_low_1 <=reg(to_integer("0100000000000010"))(7 downto 0);
	
	--x03
				o_length_counter_load_1 <=reg(to_integer("0100000000000011"))(7 downto 3);
				o_timer_high_1 <=reg(to_integer("0100000000000011"))(2 downto 0);
	
	--x04
				o_duty_puls_2 <=reg(to_integer("0100000000000100"))(7 downto 6);
				o_counter_2 <=reg(to_integer("0100000000000100"))(5);
				o_cte_volum_2 <=reg(to_integer("0100000000000100"))(4);
				o_var_volum_2 <=reg(to_integer("0100000000000100"))(3 downto 0);
				
	--x05
				o_sweep_unit_enable_2 <=reg(to_integer("0100000000000101"))(7);
				o_sweep_unit_peride_2 <=reg(to_integer("0100000000000101"))(6 downto 4);
				o_sweep_unit_negate_2 <=reg(to_integer("0100000000000101"))(3);
				o_sweep_unit_shift_count_2 <=reg(to_integer("0100000000000101"))(2 downto 0);
	
	--x06
				o_timer_low_2 <=reg(to_integer("0100000000000110"))(7 downto 0);
	
	--x07
				o_length_counter_load_2 <=reg(to_integer("0100000000000111"))(7 downto 3);
				o_timer_high_2 <=reg(to_integer("0100000000000111"))(2 downto 0);
				
	--x08
				o_length_counter_control <=reg(to_integer("0100000000001000"))(7);
				o_linear_counter_reload_value <=reg(to_integer("0100000000001000"))(6 downto 0);
				
	--x0A
				o_timer_low_tri<=reg(to_integer("0100000000001010"))(7 downto 0);
				
	--x0B
				o_length_counter_load_tri <=reg(to_integer("0100000000001011"))(7 downto 3);
				o_timer_high_tri <=reg(to_integer("0100000000001011"))(2 downto 0);
				
	--x0C
				o_loop_envelope_counter_noise <=reg(to_integer("0100000000001100"))(5);
				o_constant_volume_noise <=reg(to_integer("0100000000001100"))(4);
				o_envelope_periode_noise<=reg(to_integer("0100000000001100"))(3 downto 0);
				
	--x0E
				o_loop_noise <=reg(to_integer("0100000000001110"))(7);
				o_noise_period_noise <=reg(to_integer("0100000000001110"))(3 downto 0);
				
	--x0F
				o_length_counter_load_noise <=reg(to_integer("0100000000001111"))(7 downto 3);

	--x10
				o_IRQ_enable <=reg(to_integer("0100000000010000"))(7);
				o_loop_sample <=reg(to_integer("0100000000010000"))(6);
				o_frequency_index <=reg(to_integer("0100000000010000"))(3 downto 0);
				
	--x11
				o_direct_load <=reg(to_integer("0100000000010001"))(6 downto 0);
				
	--x12
				o_sample_adresse <=reg(to_integer("0100000000010010"))(7 downto 0);
				
	--x13
				o_sample_length <=reg(to_integer("0100000000010011"))(7 downto 0);
		
	--x15	
				o_control_dmc_enable <=reg(to_integer("0100000000010101"))(4);
				o_control_length_counter_enable_noise <=reg(to_integer("0100000000010101"))(3);
				o_control_length_counter_enable_tri <=reg(to_integer("0100000000010101"))(2);
				o_control_length_counter_enable_2 <=reg(to_integer("0100000000010101"))(1);
				o_control_length_counter_enable_1 <=reg(to_integer("0100000000010101"))(0);
				
	--x17
				o_5_frame_sequence <=reg(to_integer("0100000000010111"))(7);
				o_disable_frame_interrupte <=reg(to_integer("0100000000010111"))(6);
	
end APU_register_rtf; 
