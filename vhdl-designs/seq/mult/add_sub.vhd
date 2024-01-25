library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub is
	generic (N: INTEGER:= 4);
	port(
		addsub: in std_logic; -- addsub = 0 (add), addsub = 1 (sub)
		x, y: in std_logic_vector (N-1 downto 0);
		s: out std_logic_vector (N-1 downto 0);
		overflow: out std_logic;
		cout: out std_logic);
end add_sub;

architecture structure of add_sub is
	component full_adder
		port( 
			x_in, y_in, c_in : in  std_logic;
    		s_out, c_out: out std_logic
		);
	end component;

	signal c: std_logic_vector (N downto 0);
	signal yx: std_logic_vector (N-1 downto 0);
begin
   	c(0) <= addsub; 
	cout <= c(N);
	overflow <= c(N) xor c(N-1);	

	gi: for i in 0 to N-1 generate
			yx(i) <= y(i) xor addsub;
			fi: full_adder port map (
				c_in => c(i), x_in => x(i), y_in => yx(i), s_out => s(i), 
				c_out => c(i+1)
			);
	    end generate;
end structure;