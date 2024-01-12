library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_comparator is
end tb_comparator;

architecture behavior of tb_comparator is
    signal x_in, y_in   : std_logic_vector(3 downto 0) := "0000";
    signal eq_out       : std_logic;
    constant clk        : time := 1 ns;
begin
    DUT : entity work.comparator port map (x_in, y_in, eq_out);
    process
    begin
        wait for clk;
        x_in <= "0001";
        y_in <= "0000";
        wait for clk;
        x_in <= "0110";
        y_in <= "0110";
        wait for clk;
        wait;
        finish;
    end process;
end architecture;