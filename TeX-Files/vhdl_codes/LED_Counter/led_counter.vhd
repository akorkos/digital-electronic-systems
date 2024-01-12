library ieee;
use ieee.std_logic_1164.all;

entity led_counter is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        Q_out : out std_logic_vector (6 downto 0)
    );
end entity;

architecture behavior of led_counter is
    component led_decoder is
        port ( 
            clk : in std_logic;
            d   : in  std_logic_vector (3 downto 0);
            s   : out std_logic_vector (6 downto 0)
    );
    end component;

    component counter is
        port (
            clk   : in std_logic;
            reset : in std_logic;
            count : out std_logic_vector (3 downto 0)
        );
    end component;

    signal counter_value : std_logic_vector (3 downto 0);
begin
    LED: led_decoder port map (clk, counter_value, Q_out);
    COUNT: counter port map (clk, reset, counter_value);
end architecture;