library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
    port(
        clk     : in std_logic;
        enable  : in std_logic;
        rw      : in std_logic;
        addrs   : in std_logic_vector (3 downto 0);
        data    : inout std_logic_vector (3 downto 0)
    );
end ram;

architecture behav of ram is
    type ram_t is array (0 to 15) of std_logic_vector(3 downto 0);
    signal tmp_ram: ram_t;
begin
    process (clk)
    begin
        if (clk = '1' and clk'event) then
            if enable = '1' then
                if rw = '1' then
                    tmp_ram(to_integer(unsigned(addrs))) <= data;
                elsif rw = '0' then
                    data <= tmp_ram(to_integer(unsigned(addrs)));
                else
                    data <= (data'range => 'Z');
                end if;
            end if;
        end if;
    end process;
end behav;