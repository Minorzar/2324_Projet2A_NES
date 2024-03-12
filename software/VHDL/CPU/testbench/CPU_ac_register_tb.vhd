library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPUACRegister_tb is
end CPUACRegister_tb;

architecture testbench of CPUACRegister_tb is
	component CPU_ac_register
		Port(
			i_clk: in STD_LOGIC;
			i_sb_to_ac: in STD_LOGIC;
			i_ac_to_sb: in STD_LOGIC;
			i_ac_to_db: in STD_LOGIC;
			o_d_bus: out unsigned (7 downto 0);
			io_s_bus: inout unsigned (7 downto 0)
		);
	end component;
	
	constant CLK_period : time := 500 ns;
	
	signal Sio_s_bus: unsigned (7 downto 0);
	signal Si_clk: STD_LOGIC;
	signal Si_sb_to_ac: STD_LOGIC;
	signal Si_AC_to_SB: STD_LOGIC;
	signal Si_AC_to_DB: STD_LOGIC;
	signal So_D_Bus: unsigned (7 downto 0);
	
begin
    module: CPU_ac_register
				port map(
					i_clk => Si_clk,
					i_sb_to_ac => Si_sb_to_ac,
					i_ac_to_sb => Si_ac_to_sb,
					i_ac_to_db => Si_ac_to_db,
					o_d_bus => So_d_bus,
					io_s_bus => Sio_s_bus
				);

	CLK_process :process
	begin
		Si_clk<= '0';
		wait for CLK_period/2;
		Si_clk <= '1';
		wait for CLK_period/2;
	end process;

	process
	begin
		Si_sb_to_ac <='0';
		Si_ac_to_sb <='0';
		Si_ac_to_db <='0';
		So_d_bus <="10101010";
		Sio_s_bus <="00000001";
		wait for 10us;
		Si_sb_to_ac<='1';
		wait for 10us;
		Si_sb_to_ac<='0';
		wait for 10us;
		So_d_bus <= "ZZZZZZZZ";
		Si_ac_to_db <='1';
		wait for 10us;

	end process;

end testbench;
