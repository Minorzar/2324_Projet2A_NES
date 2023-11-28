library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_File is
  Port (
    clk          : in STD_LOGIC;      -- Clock input
    reset        : in STD_LOGIC;      -- Reset input
    enable       : in STD_LOGIC;      -- Enable input
    data_input   : in STD_LOGIC_VECTOR(7 downto 0); -- Data input
    read_addr    : in STD_LOGIC_VECTOR(2 downto 0); -- Read address
    write_addr   : in STD_LOGIC_VECTOR(2 downto 0); -- Write address
    data_output  : out STD_LOGIC_VECTOR(7 downto 0) -- Data output
  );
end Register_File;

architecture Behavioral of Register_File is
  signal registers : STD_LOGIC_VECTOR(7 downto 0); -- Register array

begin
  process(clk, reset)
  begin
    if reset = '1' then
      registers <= (others => '0');
    elsif rising_edge(clk) then
      if enable = '1' then
        -- Read operation
        data_output <= registers(to_integer(unsigned(read_addr));
        
        -- Write operation
        registers(to_integer(unsigned(write_addr)) <= data_input;
      end if;
    end if;
  end process;
end Behavioral;
