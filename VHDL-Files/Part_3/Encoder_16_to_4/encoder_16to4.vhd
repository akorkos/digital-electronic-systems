library ieee;
use ieee.std_logic_1164.all;

entity encoder_16to4 is
    port (
        D_in    : in std_logic_vector(15 downto 0);
        Q_out   : out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavior of encoder_16to4 is
begin
    DUT : process(D_in)
    begin
        case D_in is
            when "0000000000000001" => Q_out <= "0000";
            when "0000000000000010" => Q_out <= "0001";
            when "0000000000000100" => Q_out <= "0010";
            when "0000000000001000" => Q_out <= "0011";
            when "0000000000010000" => Q_out <= "0100";
            when "0000000000100000" => Q_out <= "0101";
            when "0000000001000000" => Q_out <= "0110";
            when "0000000010000000" => Q_out <= "0111";
            when "0000000100000000" => Q_out <= "1000";
            when "0000001000000000" => Q_out <= "1001";
            when "0000010000000000" => Q_out <= "1010";
            when "0000100000000000" => Q_out <= "1011";
            when "0001000000000000" => Q_out <= "1100";
            when "0010000000000000" => Q_out <= "1101";
            when "0100000000000000" => Q_out <= "1110";
            when "1000000000000000" => Q_out <= "1111";
            when others => Q_out <= "XXXX";
        end case;   
    end process;
end architecture;