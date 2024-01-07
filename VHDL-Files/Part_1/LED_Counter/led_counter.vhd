library ieee;
use ieee.std_logic_1164.all;


entity led_counter is
    port (
        clk_lc   : in std_logic;
        reset_lc : in std_logic;
        Q_lc_out : out std_logic_vector (6 downto 0)
    );
end entity;

architecture behavior of led_counter is
    signal counter_value : std_logic_vector (3 downto 0);
begin
    COUNTER: entity work.counter port map (clk_lc, reset_lc, counter_value);

    LED: entity work.led_decoder port map (counter_value, Q_lc_out);
end architecture;