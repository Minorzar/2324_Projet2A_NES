library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity predecode_logic is
	Port (
		i_clk : in STD_LOGIC;												-- Input clock signal
		i_resg : in STD_LOGIC;												-- Input reset global signal
		i_intg : in STD_LOGIC;												-- Input interrupt global signal
		i_instruction : in STD_LOGIC_VECTOR(7 downto 0);			-- Input instruction
		i_status_register : in STD_LOGIC_VECTOR(7 downto 0);		-- Input status register
		o_opcode : out STD_LOGIC_VECTOR(7 downto 0);					-- Output opcode
		o_adressing_mode : out STD_LOGIC_VECTOR(2 downto 0);		-- Output addressing mode
		o_register_select : out STD_LOGIC_VECTOR(2 downto 0);		-- Output register select
		o_cycle_counter : out STD_LOGIC_VECTOR(3 downto 0)			-- Output cycle counter
	);
end predecode_logic;

architecture Behavioral of predecode_logic is
	signal s_opcode : STD_LOGIC_VECTOR(7 downto 0);
	signal s_adressing_mode : STD_LOGIC_VECTOR(2 downto 0);
	signal s_register_select : STD_LOGIC_VECTOR(2 downto 0);
	signal s_cycle_counter : STD_LOGIC_VECTOR(3 downto 0);
	
	-- Instruction (aaabbbcc)
	signal s_aaa : STD_LOGIC_VECTOR(2 downto 0);
	signal s_bbb : STD_LOGIC_VECTOR(2 downto 0);
	signal s_cc : STD_LOGIC_VECTOR(1 downto 0);

	-- Instruction (xxy10000)
	signal s_xx : STD_LOGIC_VECTOR(1 downto 0);
	signal s_y : STD_LOGIC;
	 
	-- Status Register flags
	signal s_flag_N : STD_LOGIC; -- Negative flag
	signal s_flag_V : STD_LOGIC; -- Overflow flag
	signal s_flag_Z : STD_LOGIC; -- Zero flag
	signal s_flag_C : STD_LOGIC; -- Carry flag

begin
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			if i_resg = '1' or i_intg = '1' then
				s_opcode <= (others => '0');
				s_adressing_mode <= (others => '0');
				s_register_select <= (others => '0');
				s_cycle_counter <= (others => '0');
			else
				-- Determine opcode, addressing mode, and cycles based on i_instruction
				-- You will need to complete this part based on your design
				-- s_opcode <= ...;
				-- s_adressing_mode <= ...;
				-- s_register_select <= ...;
				-- s_cycle_counter <= ...;
			end if;
		end if;
	end process;

	-- Output signals
	o_opcode <= s_opcode;
	o_adressing_mode <= s_adressing_mode;
	o_register_select <= s_register_select;
	o_cycle_counter <= s_cycle_counter;

end Behavioral;
