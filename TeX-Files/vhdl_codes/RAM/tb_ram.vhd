library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_ram is
end tb_ram;

architecture behav of tb_ram is
    signal clk      : std_logic;
    signal enable   : std_logic;
    signal rw       : std_logic;
    signal addrs    : std_logic_vector (3 downto 0);
    signal data     : std_logic_vector (3 downto 0);
    constant clk_t  : time := 1 ns;
begin

    RAM0: entity work.ram port map (clk,enable,rw,addrs,data);

    clock : process
    begin
        for i in 1 to 20 loop
            clk <= '1';
            wait for clk_t/4;
            clk <= '0';
            wait for clk_t/4;
        end loop;

        finish;
    end process;

    process
    begin
        wait for clk_t;
        enable <= '1';
        wait for clk_t;
        rw <= '1';
        addrs <= "0011";
        data <= "1001";
        wait for clk_t;
        rw <= '0';
        addrs <= "0001";
        data <= "ZZZZ";
        wait for clk_t;
        addrs <= "0011";
        data <= "ZZZZ";
        wait for clk_t;
        wait;
    end process;
end behav;