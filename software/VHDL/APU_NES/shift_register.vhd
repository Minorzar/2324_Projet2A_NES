library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port (
	 
        i_data   : in  std_logic;
        i_shift  : in  std_logic;
        i_clk    : in  std_logic;
        o_data   : out std_logic
		  
    );
	 
end shift_register;

architecture behavioral of shift_register is
    signal shift_reg : std_logic_vector(3 downto 0) := "0000";
begin
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_shift = '1' then
                shift_reg <= i_data & shift_reg(3 downto 1);
            end if;
        end if;
    end process;

    o_data <= shift_reg(0);
end behavioral;