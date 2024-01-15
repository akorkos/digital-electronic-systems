library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_ram is
end tb_ram;

architecture behavior of tb_ram is
	signal clk, enable, rw: std_logic;
	signal address: std_logic_vector (3 downto 0);
	signal data: std_logic_vector (3 downto 0);
	constant clk_period: time := 1 ns;
begin
  RAM0: entity work.ram port map (clk, enable, rw, address, data);
	
	clk_process: process
	begin
		for i in 1 to 20 loop
			clk <= '1';
			wait for clk_period/4;
			clk <= '0';
			wait for clk_period/4;
		end loop;
	finish;
	end process;

	process
	begin
		wait for clk_period;
		enable <= '1';
		wait for clk_period;
		rw <= '1';
		address <= "0011";
		data <= "1001";
		wait for clk_period;
		rw <= '0';
		address <= "0001";
		data <= "ZZZZ";
		wait for clk_period;
		address <= "0011";
		data <= "ZZZZ";
		wait for clk_period;
		wait;
	end process;
end architecture;