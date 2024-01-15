library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is
  port (
    ABCD_in : in  std_logic_vector(3 downto 0);
    Sel_in  : in  std_logic_vector(1 downto 0);
    Q_out   : out std_logic
  );
end entity;

architecture behavior of mux_4to1 is
begin
  DUT: process(ABCD_in, Sel_in)
  begin
    case Sel_in is
      when "00"   => Q_out <= ABCD_in(0);
      when "01"   => Q_out <= ABCD_in(1);
      when "10"   => Q_out <= ABCD_in(2);
      when "11"   => Q_out <= ABCD_in(3);
      when others => Q_out <= 'X';
    end case;
  end process;
end architecture;
