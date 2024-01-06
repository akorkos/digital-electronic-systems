library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    port(
        A,B     : in std_logic_vector(1 downto 0);
        result  : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavior of multiplier is
begin
    process(A,B)
    variable mult1 : std_logic_vector(2 downto 0);
    variable mult2 : std_logic_vector(5 downto 0);
    begin
        mult1 := '0' & A;
        mult2 := "0000" & B;

        for i in 1 to 3 loop
            if mult2(0) = '1' then
                mult2(5 downto 3) := std_logic_vector(unsigned(mult2(5 downto 3)) + unsigned(mult1(2 downto 0)));
            end if;
            mult2(5 downto 0) := '0' & mult2(5 downto 1);
        end loop;

        result <= mult2 (3 downto 0);
    end process;
end architecture;