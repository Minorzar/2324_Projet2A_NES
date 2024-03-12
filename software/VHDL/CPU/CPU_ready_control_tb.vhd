library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ready_control_tb is
end CPU_ready_control_tb;

architecture testbench of CPU_ready_control_tb is
	component CPU_ready_control
		Port(
		i_clk: in STD_LOGIC;
		i_phi2: in STD_LOGIC;
		i_ready: in STD_LOGIC;
		i_read_write: in STD_LOGIC;
		o_rdy: out STD_LOGIC);
	end component;
	constant CLK_period : time := 500 ns;
	signal clk: STD_LOGIC;
	signal phi2: STD_LOGIC;
	signal ready: STD_LOGIC;
	signal read_write: STD_LOGIC;
	signal rdy: STD_LOGIC;
begin
   module: CPU_ready_control port map(i_clk => clk, i_phi2 => phi2, i_ready => ready, i_read_write => read_write, o_rdy => rdy);

	CLK_process :process
	begin
		clk <= '1';
		phi2 <= '0';
		wait for CLK_period/2;
		clk<= '0';
		wait for CLK_period/2;
		clk <= '1';
		phi2 <= '1';
		wait for CLK_period/2;
		clk<= '0';
		wait for CLK_period/2;
	end process;

	
	process
	begin
		ready <= '0';
		read_write <= '0';
		rdy <='0';
		wait for 2 us;
		rdy <= '1';
		wait for 2 us;
		read_write <= '1';
		wait for 2 us;
		read_write <= '0';
	end process;

end testbench;
