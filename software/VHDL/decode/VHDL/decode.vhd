library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
    Port (
        i_clk_2             : in std_logic;
        i_db_instruction    : in std_logic_vector(7 downto 0);
        o_pr_instruction    : out std_logic_vector(7 downto 0)
    );
end decode;

architecture Behavioral of decode is
    -- Component declaration for predecode_register
    component predecode_register is
        Port (
            i_clk_2             : in std_logic;
            i_db_instruction    : in std_logic_vector(7 downto 0);
            o_pr_instruction    : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signal for output from predecode_register
    signal s_pr_instruction : std_logic_vector(7 downto 0);

begin

    -- Instantiate predecode_register module
    UUT_register: predecode_register
    port map (
        i_clk_2 => i_clk_2,
        i_db_instruction => i_db_instruction,
        o_pr_instruction => s_pr_instruction
    );

    -- Assign output signal from predecode_register to the top-level output port
    o_pr_instruction <= s_pr_instruction;

end Behavioral;
