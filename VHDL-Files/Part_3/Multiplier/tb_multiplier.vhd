library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_multiplier is
end tb_multiplier;

architecture behavior of tb_multiplier is
    signal A,B : std_logic_vector(1 downto 0) := "00";
    signal result : std_logic_vector(3 downto 0);
    constant clk : time := 1 ns;
begin

    MUL0 : entity work.multiplier port map (A,B,result);

    process
    begin
        wait for clk;
        A <= "01";
        B <= "10";
        wait for clk;
        A <= "11";
        B <= "10";
        wait for clk;
        A <= "11";
        B <= "11";
        wait for clk;
        --assert false report "EoT" severity note;
        wait;
        finish;
    end process;
end architecture;