library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity APU_register is 
	port(
	
		clk : in std_logic;
		
		-- for the read/write part of the register	
		
		addr : in unsigned(15 downto 0);
		data : inout unsigned(7 downto 0);
		--data : inout std_logic_vector(7 downto 0);
		
		en : in std_logic;
		w_en : in std_logic; 
		
		
		-- all register out
		
		--PULSE_1
		
			--x00
				o_duty_puls_1 : out std_logic_vector(1 downto 0):=(others => '0');
				o_counter_1: out std_logic:='0';
				o_cte_volum_1: out std_logic:='0';
				o_var_volum_1: out std_logic_vector(3 downto 0):=(others => '0');
			
			--x01
				o_sweep_unit_enable_1 : out std_logic:='0';
				o_sweep_unit_peride_1 : out std_logic_vector(2 downto 0):=(others => '0');
				o_sweep_unit_negate_1 : out std_logic:='0';
				o_sweep_unit_shift_count_1 : out std_logic_vector(2 downto 0):=(others => '0');
				
			--x02
				o_timer_low_1 : out std_logic_vector(7 downto 0):=(others => '0');
			--x03
				o_length_counter_load_1 : out std_logic_vector(4 downto 0):=(others => '0');
				o_timer_high_1 : out std_logic_vector(2 downto 0):=(others => '0');
				
				
		--PULSE 2
			
			--x04
				o_duty_puls_2 : out std_logic_vector(1 downto 0):=(others => '0');
				o_counter_2: out std_logic:='0';
				o_cte_volum_2: out std_logic:='0';
				o_var_volum_2: out std_logic_vector(3 downto 0):=(others => '0');
			--x05
				o_sweep_unit_enable_2 : out std_logic:='0';
				o_sweep_unit_peride_2 : out std_logic_vector(2 downto 0):=(others => '0');
				o_sweep_unit_negate_2 : out std_logic:='0';
				o_sweep_unit_shift_count_2 : out std_logic_vector(2 downto 0):=(others => '0');
			--x06
				o_timer_low_2 : out std_logic_vector(7 downto 0):=(others => '0');
			--x07
				o_length_counter_load_2 : out std_logic_vector(4 downto 0):=(others => '0');
				o_timer_high_2 : out std_logic_vector(2 downto 0):=(others => '0');
				
				
		--TRIANGLE CHANNEL
			
			--x08
				o_length_counter_control : out std_logic:='0';
				o_linear_counter_reload_value : out std_logic_vector(6 downto 0):=(others => '0');
			--x0A
				o_timer_low_tri: out std_logic_vector(7 downto 0):=(others => '0');
			--x0B
				o_length_counter_load_tri : out std_logic_vector(4 downto 0):=(others => '0');
				o_timer_high_tri : out std_logic_vector(2 downto 0):=(others => '0');
			
			
		--NOISE CHANNEL
		
			--x0C
				o_loop_envelope_counter_noise : out std_logic:='0';
				o_constant_volume_noise : out std_logic:='0';
				o_envelope_periode_noise: out std_logic_vector(3 downto 0):=(others => '0');
			--x0E
				o_loop_noise : out std_logic:='0';
				o_noise_period_noise : out std_logic_vector(3 downto 0):=(others => '0');
			--x0F
				o_length_counter_load_noise : out std_logic_vector(4 downto 0):=(others => '0');
			
			
		--DMC CHANNEL
			--x10
				o_IRQ_enable : out std_logic:='0';
				o_loop_sample : out std_logic:='0';
				o_frequency_index : out std_logic_vector(3 downto 0):=(others => '0');
			--x11
				o_direct_load : out std_logic_vector(6 downto 0):=(others => '0');
			--x12
				o_sample_adresse : out std_logic_vector(7 downto 0):=(others => '0');
			--x13
				o_sample_length : out std_logic_vector(7 downto 0):=(others => '0');
		
		
		-- OTHERS
		
			--x15
			
					-- IF READ
			
				o_interrupt : out std_logic:='0';
				o_frame : out std_logic:='0';
			
					-- EVERY TIME
			
				o_control_dmc_enable : out std_logic:='0';
				o_control_length_counter_enable_noise : out std_logic:='0';
				o_control_length_counter_enable_tri : out std_logic:='0';
				o_control_length_counter_enable_2 : out std_logic:='0';
				o_control_length_counter_enable_1 : out std_logic:='0';
			--x17
				o_5_frame_sequence :  out std_logic:='0';
				o_disable_frame_interrupte :  out std_logic:='0'
	);
end APU_register; 


architecture APU_register_rtf of APU_register is

	subtype DAT is std_logic_vector(7 downto 0); --:=(others => '0');
	--type MEMORY is array (0 to 2**16) of DAT;
	type MEMORY is array (0 to 19) of DAT;
	signal reg : MEMORY:=(others => "00000000");
	
	signal index : integer:=0;
	signal s_data : unsigned(7 downto 0);	

	begin 
		process(clk)
			begin
				if (rising_edge(clk)) then
					if(en='1') then
						if (w_en='1') then
							reg(index)<=std_logic_vector(s_data);
						else
						
							
							o_interrupt <=reg(15)(7); -- cause read only
							--to_integer("0100000000010101")
							o_frame <=reg(15)(6); -- cause read only

							
						end if;
					end if;
				end if; 
	end process; 
	
	s_data <= data;
	data <=unsigned(reg(index))  when w_en = '0' else  (others => 'Z') ;

	
	process(clk)
	 begin
		if(rising_edge(clk)) then
	 	case addr is 
		 when "0100000000000000" =>
			index<=0;
		 when "0100000000000001" =>
			 index<=1;
		 when "0100000000000010" =>
			 index<=2;
		 when "0100000000000011" =>
			 index<=3;
		 when "0100000000000100" =>
			 index<=4;
		 when "0100000000000101" =>
			 index<=5;
		 when "0100000000000110" =>
			 index<=6;
		 when "0100000000000111" =>
			 index<=7;
		 when "0100000000001000" =>
			 index<=8;
		 when "0100000000001010" =>
			 index<=9;
		 when "0100000000001011" =>
			 index<=10;
		 when "0100000000001100" =>
			 index<=11;
		 when "0100000000001110" =>
			 index<=12;
		 when "0100000000001111" =>
			 index<=13;
		 when "0100000000010000" =>
			 index<=14;
		 when "0100000000010001" =>
			 index<=15;
		 when "0100000000010010" =>
			 index<=16;
		 when "0100000000010011" =>
			 index<=17;
		 when "0100000000010101" =>
			 index<=18;
		 when others =>
			 index<=19;
		 end case;
		end if;
	 end process;
	
	
	
	
	
	-- ASSIGNEMENT OF ALL VAR
	
	
	--x00
				o_duty_puls_1 <=reg(0)(7 downto 6);
				o_counter_1 <=reg(0)(5);
				o_cte_volum_1 <=reg(0)(4);
				o_var_volum_1 <=reg(0)(3 downto 0);
				--"0100000000000000"
			
	--x01
				o_sweep_unit_enable_1 <=reg(1)(7);
				o_sweep_unit_peride_1 <=reg(1)(6 downto 4);
				o_sweep_unit_negate_1 <=reg(1)(3);
				o_sweep_unit_shift_count_1 <=reg(1)(2 downto 0);
				--"0100000000000001"
	
	--x02
				o_timer_low_1 <=reg(2)(7 downto 0);
				--0100000000000010
	
	--x03
				o_length_counter_load_1 <=reg(3)(7 downto 3);
				o_timer_high_1 <=reg(3)(2 downto 0);
				--0100000000000011
	
	--x04
				o_duty_puls_2 <=reg(4)(7 downto 6);
				o_counter_2 <=reg(4)(5);
				o_cte_volum_2 <=reg(4)(4);
				o_var_volum_2 <=reg(4)(3 downto 0);
				--0100000000000100
				
	--x05
				o_sweep_unit_enable_2 <=reg(5)(7);
				o_sweep_unit_peride_2 <=reg(5)(6 downto 4);
				o_sweep_unit_negate_2 <=reg(5)(3);
				o_sweep_unit_shift_count_2 <=reg(5)(2 downto 0);
				--0100000000000101
	
	--x06
				o_timer_low_2 <=reg(6)(7 downto 0);
				--0100000000000110
	
	--x07
				o_length_counter_load_2 <=reg(7)(7 downto 3);
				o_timer_high_2 <=reg(7)(2 downto 0);
				--0100000000000111
				
	--x08
				o_length_counter_control <=reg(8)(7);
				o_linear_counter_reload_value <=reg(8)(6 downto 0);
				--0100000000001000
				
	--x0A
				o_timer_low_tri<=reg(9)(7 downto 0);
				--0100000000001010
				
	--x0B
				o_length_counter_load_tri <=reg(10)(7 downto 3);
				o_timer_high_tri <=reg(10)(2 downto 0);
				--0100000000001011
				
	--x0C
				o_loop_envelope_counter_noise <=reg(11)(5);
				o_constant_volume_noise <=reg(11)(4);
				o_envelope_periode_noise<=reg(11)(3 downto 0);
				--0100000000001100
				
	--x0E
				o_loop_noise <=reg(12)(7);
				o_noise_period_noise <=reg(12)(3 downto 0);
				--0100000000001110
				
	--x0F
				o_length_counter_load_noise <=reg(13)(7 downto 3);
				--"0100000000001111"

	--x10
				o_IRQ_enable <=reg(14)(7);
				o_loop_sample <=reg(14)(6);
				o_frequency_index <=reg(14)(3 downto 0);
				--0100000000010000
				
	--x11
				o_direct_load <=reg(15)(6 downto 0);
				--0100000000010001
				
	--x12
				o_sample_adresse <=reg(16)(7 downto 0);
				--0100000000010010
				
	--x13
				o_sample_length <=reg(17)(7 downto 0);
				--0100000000010011
		
	--x15	
				o_control_dmc_enable <=reg(18)(4);
				o_control_length_counter_enable_noise <=reg(18)(3);
				o_control_length_counter_enable_tri <=reg(18)(2);
				o_control_length_counter_enable_2 <=reg(18)(1);
				o_control_length_counter_enable_1 <=reg(18)(0);
				--0100000000010101
				
	--x17
				o_5_frame_sequence <=reg(19)(7);
				o_disable_frame_interrupte <=reg(19)(6);
				--0100000000010111
	
end APU_register_rtf; 
