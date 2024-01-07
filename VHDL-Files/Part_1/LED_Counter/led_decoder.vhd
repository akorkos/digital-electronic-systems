library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.ALL;

entity led_decoder is
    port ( 
        d : in  std_logic_vector (3 downto 0);
        s : out std_logic_vector (6 downto 0)
    );
end entity;

architecture behavior of led_decoder is
-- DUT: process(d)
begin
    s<="1110111" when d="0000" else
    "0010010" when d="0001" else
    "1011101" when d="0010" else
    "1011011" when d="0011" else
    "0111010" when d="0100" else
    "1101011" when d="0101" else
    "1101111" when d="0110" else
    "1010010" when d="0111" else
    "1111111" when d="1000" else
    "1111011" when d="1001" else
    "1111110" when d="1010" else
    "0101111" when d="1011" else
    "1100101" when d="1100" else
    "0011111" when d="1101" else
    "1101101" when d="1110" else
    "1101100";
end architecture;