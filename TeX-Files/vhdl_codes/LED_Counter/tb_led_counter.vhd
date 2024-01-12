library ieee;
use ieee.std_logic_1164.all;
use std.env.finish;

entity tb_led_counter is
end entity;

architecture bench of tb_led_counter is
    component led_counter is
        port(
            clk     : in std_logic;
            reset   : in std_logic;
            led     : out std_logic_vector(6 downto 0)
        );
    end component;

    constant clk_period : time := 10 ns;

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal led      : std_logic_vector(6 downto 0) := "0000000";
begin
    DUT: entity work.led_counter port map(clk, reset, led);

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stimulus : process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 450 ns;
        finish;
    end process;
end architecture;
