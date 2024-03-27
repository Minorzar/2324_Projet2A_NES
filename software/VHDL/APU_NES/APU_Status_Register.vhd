library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity APU_Status_Register is
    Port (
        i_clk         : in  STD_LOGIC;
        i_reset       : in  STD_LOGIC;
        i_write_en    : in  STD_LOGIC;
        i_write_val   : in  STD_LOGIC_VECTOR(7 downto 0);
        i_read_en     : in  STD_LOGIC;
        o_read_val    : out STD_LOGIC_VECTOR(7 downto 0);
        o_dmc_irq     : out STD_LOGIC;
        o_frame_irq   : out STD_LOGIC;
        o_dmc_active  : out STD_LOGIC;
        o_pulse1_len  : out STD_LOGIC;
        o_pulse2_len  : out STD_LOGIC;
        o_triangle_len: out STD_LOGIC;
        o_noise_len   : out STD_LOGIC
    );
end APU_Status_Register;

architecture Behavioral of APU_Status_Register is
    type status_reg_state is (IDLE, WRITING, READING);
    signal state          : status_reg_state := IDLE;
    signal status_reg     : std_logic_vector(7 downto 0) := (others => '0');
    signal dmc_bytes_rem : unsigned(7 downto 0) := (others => '0');
    signal frame_irq_flag : std_logic := '0';
    signal dmc_irq_flag   : std_logic := '0';
    signal temp_pulse1_len  : std_logic := '0';
    signal temp_pulse2_len  : std_logic := '0';
    signal temp_triangle_len: std_logic := '0';
    signal temp_noise_len   : std_logic := '0';
begin

    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_reset = '1' then
                state <= IDLE;
                status_reg <= (others => '0');
                dmc_bytes_rem <= (others => '0');
                frame_irq_flag <= '0';
                dmc_irq_flag <= '0';
            else
                case state is
                    when IDLE =>
                        if i_write_en = '1' then
                            state <= WRITING;
                        elsif i_read_en = '1' then
                            state <= READING;
                        end if;
                    when WRITING =>
                        status_reg <= i_write_val;
                        -- Update DMC bytes remaining
                        dmc_bytes_rem <= unsigned(i_write_val(7 downto 0)) when i_write_val(7) = '1' else (others => '0');
                        -- Clear DMC interrupt flag
                        dmc_irq_flag <= '0';
                        state <= IDLE;
                    when READING =>
                        -- Set read value
                        o_read_val <= status_reg;
                        -- Set length counters
                        temp_pulse1_len <= status_reg(0);
                        temp_pulse2_len <= status_reg(1);
                        temp_triangle_len <= status_reg(2);
                        temp_noise_len <= status_reg(3);
                        -- Clear frame interrupt flag
                        frame_irq_flag <= '0';
                        -- Check if DMC bytes remaining is more than 0
                        o_dmc_active <= '1' when dmc_bytes_rem > 0 else '0';
                        state <= IDLE;
                end case;
            end if;
        end if;
    end process;

    -- Output interrupts
    o_dmc_irq <= dmc_irq_flag;
    o_frame_irq <= frame_irq_flag;

    -- Assign outputs from signals
    o_pulse1_len <= temp_pulse1_len;
    o_pulse2_len <= temp_pulse2_len;
    o_triangle_len <= temp_triangle_len;
    o_noise_len <= temp_noise_len;

end Behavioral;