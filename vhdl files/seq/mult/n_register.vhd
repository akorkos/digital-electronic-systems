library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- N-bit Register
-- E = '1', clear = '0' --> Input data 'D' is copied on Q
-- E = '1', clear = '1' --> Q is cleared (0)
entity n_register is
   	generic (N: INTEGER:= 4);
	port ( 
		clk, reset	: in std_logic;
	    E, clear	: in std_logic; -- clear: Synchronous clear
		D			: in std_logic_vector (N-1 downto 0);
	    Q			: out std_logic_vector (N-1 downto 0));
end n_register;

architecture Behavioral of n_register is
	signal Qt		: std_logic_vector (N-1 downto 0);
begin
	process (reset, clk)
	begin
		if reset = '0' then
			Qt <= (others => '0');
		elsif (clk'event and clk = '1') then
			if E = '1' then	
				if clear = '1' then
					Qt <= (others => '0');
				else
					Qt <= D;
				end if;
			end if;
		end if;
	end process;
	Q <= Qt;
end Behavioral;

