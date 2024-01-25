library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register is
	Port (
		i_clk : in STD_LOGIC;								  				-- Clock signal
		i_opcode : in STD_LOGIC_VECTOR(7 downto 0);					-- Input opcode
		i_adressing_mode : in STD_LOGIC_VECTOR(2 downto 0);		-- Input addressing mode
		i_register_select : in STD_LOGIC_VECTOR(2 downto 0);  	-- Input register select
		o_opcode : out STD_LOGIC_VECTOR(7 downto 0);		  			-- Output opcode
		o_adressing_mode : out STD_LOGIC_VECTOR(2 downto 0);  	-- Output addressing mode
		o_register_select : out STD_LOGIC_VECTOR(2 downto 0)  	-- Output register select
	);
end instruction_register;

architecture Behavioral of instruction_register is
	signal s_opcode : STD_LOGIC_VECTOR(7 downto 0);
	signal s_adressing_mode : STD_LOGIC_VECTOR(2 downto 0);
	signal s_register_select : STD_LOGIC_VECTOR(2 downto 0);
begin
	-- Process to update internal signals on rising edge of clock
	process(i_clk)
	begin
		if rising_edge(i_clk) then
			s_opcode <= i_opcode;
			s_adressing_mode <= i_adressing_mode;
			s_register_select <= i_register_select;
		end if;
	end process;

	-- Output signals
	o_opcode <= s_opcode;
	o_adressing_mode <= s_adressing_mode;
	o_register_select <= s_register_select;

end Behavioral;
