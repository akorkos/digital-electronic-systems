library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_jk_flip_flop is
end entity;

architecture behavior of tb_jk_flip_flop is
	signal J_tb_in: std_logic := '0';
	signal K_tb_in: std_logic := '0';
	signal rst_n_tb: std_logic := '0';
	signal clk_tb: std_logic := '0';
	signal Q_tb_out: std_logic;

	constant clk_period : time := 10 ns;

begin
	UUT: entity work.jk_flip_flop port map (J_tb_in, K_tb_in, rst_n_tb, clk_tb, Q_tb_out);

	clk_process : process
	begin
		clk_tb <= '0';
		wait for clk_period/2;
		clk_tb <= '1';
		wait for clk_period/2;
	end process;

	stimulus: process
	begin
		J_tb_in <= '1';
		K_tb_in <= '0';
		rst_n_tb <= '0';
		wait for 20 ns;
		assert(Q_tb_out = '1') report "Error in q" severity failure;

		J_tb_in <= '0';
		K_tb_in <= '0';
		rst_n_tb <= '0';
		wait for 20 ns;
		assert(Q_tb_out = '1') report "Error in q" severity failure;

		J_tb_in <= '0';
		K_tb_in <= '1';
		rst_n_tb <= '0';
		wait for 20 ns;
		assert(Q_tb_out = '0') report "Error in q" severity failure;

		J_tb_in <= '1';
		K_tb_in <= '1';
		rst_n_tb <= '0';
		wait for 20 ns;
		assert(Q_tb_out = '0') report "Error in q" severity failure;

		J_tb_in <= '1';
		K_tb_in <= '1';
		rst_n_tb <= '1';
		wait for 20 ns;
		assert(Q_tb_out = '0') report "Error in q" severity failure;
		
		finish;
	end process;
end architecture;
