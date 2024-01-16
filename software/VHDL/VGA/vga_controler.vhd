library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_controler is
    port (
        i_clk : in std_logic;
        i_rst_n : in std_logic;

        o_VGA_R : out std_logic_vector(7 downto 0);
        o_VGA_G : out std_logic_vector(7 downto 0);
        o_VGA_B : out std_logic_vector(7 downto 0);
        o_VGA_HS : out std_logic;
        o_VGA_VS : out std_logic;
        o_VGA_SYNC : out std_logic;
        o_VGA_BLANK : out std_logic;
        o_VGA_CLOCK : out std_logic
    );
end entity VGA_controler;

architecture rtl of VGA_controler is
    constant H_FRONT : integer := 16;   -- 16
    constant H_SYNC : integer := 96;    -- 96
    constant H_BACK : integer := 48;    -- 48
    constant H_ACT : integer := 640;    -- 640
    constant H_BLANK : integer := H_FRONT + H_SYNC + H_BACK;
    constant H_TOTAL : integer := H_BLANK + H_ACT;

    constant V_FRONT : integer := 11;   -- 11
    constant V_SYNC : integer := 2;     -- 2
    constant V_BACK : integer := 31;    -- 31
    constant V_ACT : integer := 480;    -- 480
    constant V_BLANK : integer := V_FRONT + V_SYNC + V_BACK;
    constant V_TOTAL : integer := V_BLANK + V_ACT;

    signal r_h_count : integer range 0 to H_TOTAL := 0;
    signal r_v_count : integer range 0 to V_TOTAL := 0;

    signal s_v_count_en : std_logic;

    signal r_VGA_HS : std_logic := '0';
begin
    o_VGA_SYNC <= '1';  -- This pin is unused
    o_VGA_CLOCK <= not (i_clk);

    o_VGA_BLANK <= '0' when (r_h_count < H_BLANK) or (r_v_count < V_BLANK) else '1';

    o_VGA_R <= std_logic_vector(to_unsigned(r_h_count, 8));
    o_VGA_G <= std_logic_vector(to_unsigned(r_v_count, 8));
    o_VGA_B <= (others => '0');

    p_h_counter : process (i_clk, i_rst_n)
    begin
        if (i_rst_n = '0') then
            r_h_count <= 0;
            o_VGA_HS <= '0';
            r_VGA_HS <= '0';
        elsif (rising_edge(i_clk)) then
            if (r_h_count < H_TOTAL) then
                r_h_count <= r_h_count + 1;
            else
                r_h_count <= 0;
            end if;

            -- In the .v example it's in the always@posedge so it's a reg I guess???
            if (r_h_count = H_FRONT - 1) then
                o_VGA_HS <= '0';
                r_VGA_HS <= '0';
            end if;
            if (r_h_count = H_FRONT + H_SYNC - 1) then
                o_VGA_HS <= '1';
                r_VGA_HS <= '1';
            end if;
        end if;
    end process p_h_counter;

    s_v_count_en <= '1' when (r_h_count = H_FRONT + H_SYNC - 1) else '0';

    p_v_counter : process(i_clk, i_rst_n)    
    begin
        if (i_rst_n = '0') then
            r_v_count <= 0;
            o_VGA_VS <= '0';
        elsif (rising_edge(i_clk)) then
            if (s_v_count_en = '1') then
                if (r_v_count < V_TOTAL) then
                    r_v_count <= r_v_count + 1;
                else
                    r_v_count <= 0;
                end if;

                if (r_v_count = V_FRONT - 1) then
                    o_VGA_VS <= '0';
                end if;
                if (r_v_count = V_FRONT + V_SYNC - 1) then
                    o_VGA_VS <= '1';
                end if;
            end if;
        end if;
    end process p_v_counter;

end architecture rtl;