library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector (3 downto 0)
    );
end entity;

architecture behavior of counter is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= "0000";
        elsif rising_edge(clk) then
            if count = "1001" then
                count <= "0000";
            else 
                count <= count + 1;
            end if;
        end if;
    end process;
end architecture;