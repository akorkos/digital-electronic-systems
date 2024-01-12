library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    generic(
        N: integer  := 4
    );
    port (
        x_in, y_in  : in  std_logic_vector(N-1 downto 0);
        eq_out      : out std_logic
    );
end entity;

architecture behavior of comparator is
begin
    DUT : process(x_in, y_in)
    begin
        eq_out <= '1' when (x_in = y_in) 
        else '0';
  end process;
end architecture;