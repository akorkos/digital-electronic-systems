library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_jk_flip_flop is
end entity;

architecture bench of tb_jk_flip_flop is
    component jk_flip_flop is
        port ( 
            J_in    : in  std_logic;
            K_in    : in  std_logic;
            rst     : in  std_logic;
            clk     : in  std_logic;
            Q_out   : inout std_logic
        );
    end component;

    signal J_tb_in  : std_logic := '0';
    signal K_tb_in  : std_logic := '0';
    signal rst_n_tb : std_logic := '0';
    signal clk_tb   : std_logic := '0';
    signal Q_tb_out : std_logic;

    constant clk_period : time := 10 ns;

begin
    DUT : jk_flip_flop port map (
        J_in => J_tb_in, K_in => K_tb_in, rst => rst_n_tb, clk => clk_tb, Q_out => Q_tb_out
    );

    clk_process : process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    stimulus : process
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
