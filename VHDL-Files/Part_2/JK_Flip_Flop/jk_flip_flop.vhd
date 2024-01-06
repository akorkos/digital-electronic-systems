library ieee;
use ieee.std_logic_1164.all;

entity jk_flip_flop is
    port ( 
        J_in    : in  std_logic;
        K_in    : in  std_logic;
        rst     : in  std_logic;
        clk     : in  std_logic;
        Q_out   : inout std_logic
    );
end entity;

architecture behavior of jk_flip_flop is
begin
	DUT: process (rst, clk) is
	begin
		if rst = '1' then 
			Q_out <= '0';
		elsif(rising_edge(clk)) then
			if (J_in = '0' and K_in = '0') then
				Q_out <= Q_out;
			elsif (J_in = '0' and K_in = '1') then
				Q_out <= '0';
			elsif (J_in = '1' and K_in = '0') then
				Q_out <= '1';
			elsif (J_in = '1' and K_in = '1') then
				Q_out <= not (Q_out);
			end if;
		end if;	
	end process;
end behavior;