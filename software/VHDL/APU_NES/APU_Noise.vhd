library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity APU_Noise is 
 port(
 
	i_clk                  : in std_logic;
	i_env_length_halt      : in std_logic;
	i_constant_volume_flag : in std_logic;
	i_env_volume           : in std_logic_vector(3 DOWNTO 0);
	i_loop_flag            : in std_logic;
	i_noise_period         : in std_logic_vector(3 DOWNTO 0);
	i_length_counter_load  : in std_logic_vector(4 DOWNTO 0);
	i_quarter_frame_en     : in std_logic;
	i_half_frame_en        : in std_logic;
	
	i_reset                : in std_logic;
 
	o_out_noise            : out std_logic_vector(3 downto 0)
 
);
end APU_noise;

architecture Behavorial of APU_noise is

signal timer_en   : std_logic;
signal shift_out  : std_logic;
signal length_out : std_logic;
signal env_out    : std_logic_vector(3 downto 0);
signal timer_table_out : std_logic_vector(10 downto 0);

begin
timer : entity work.timer
port map(

	i_clk   => i_clk,		  
   i_reset => i_reset,    
   i_timer => timer_table_out,
		  
   o_timer => timer_en
		  
);		

shift_register : entity work.shift_register
port map(

	i_data   => '0', --to define,
   i_shift  => '1',
   i_clk    => timer_en,
   o_data   => shift_out
		  
);

len_counter : entity work.length_counter
port map(

	i_length_counter_en => i_half_frame_en,
	i_frame_counter     => i_half_frame_en,
	i_clk               => i_clk,
	i_halt_flag         => i_env_length_halt,
	i_counter_load      => i_length_counter_load,
	
	o_enabler           => length_out
);


envelope_gen : entity work.envelope_gen
port map(

	i_start_flag        => '0',-- to define,
	i_loop_flag         => i_loop_flag,
	i_constant_vol_flag => i_constant_volume_flag,
	i_envelope_param    => i_env_volume,
	i_clk               => i_clk,
	i_frame_clk         => i_quarter_frame_en,
			
	o_envelope_out      => env_out
);

noise : entity work.noise

port map(

		i_clk 	    			=> i_clk,
		i_envelope_in			=> env_out,
		i_shift_register_in  => shift_out,
		i_length_counter_in  => length_out,
		
      o_noise_out        	=> o_out_noise
		
);

process(i_clk)
		begin
		if rising_edge(i_clk) then
			case i_noise_period is
					when "0000" => 
						timer_table_out <= "00000000100";
					when "0001" =>
						timer_table_out <= "00000001000";
					when "0010" =>
						timer_table_out <= "00000001110";
					when "0011" =>
						timer_table_out <= "00000011110";
					when "0100" =>
						timer_table_out <= "00000111100";
					when "0101" =>
						timer_table_out <= "00001011000";
					when "0110" =>
						timer_table_out <= "00001110110";
					when "0111" =>
						timer_table_out <= "00010010100";
					when "1000" =>
						timer_table_out <= "00010111100";
					when "1001" =>
						timer_table_out <= "00011101100";
					when "1010" =>
						timer_table_out <= "00101100010";
					when "1011" =>
						timer_table_out <= "00111011000";
					when "1100" =>
						timer_table_out <= "01011000100";
					when "1101" =>
						timer_table_out <= "01110110000";
					when "1110" =>
						timer_table_out <= "11101100010";
					when "1111" =>
						timer_table_out <= "11101100001"; -- not the valid value . Error on the datasheet ?
					end case;
				end if;
			end process;
end Behavorial;