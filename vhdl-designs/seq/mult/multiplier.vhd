library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier is
	generic (N: INTEGER	:= 4);
	port (
		clk, reset, s: in std_logic;
		dA, dB: in std_logic_vector (N-1 downto 0);
		P: out std_logic_vector (2*N-1 downto 0);
		done: out std_logic
	);
end multiplier;

architecture Behavioral of multiplier is
	component parallel_shift_reg
		generic (
			N: INTEGER := 4;
			DIR: STRING := "LEFT"
		);
		port ( 
			clk, reset: in std_logic;
			din, E, s_l: in std_logic; --din: shiftin input
			D: in std_logic_vector (N-1 downto 0);
			Q: out std_logic_vector (N-1 downto 0);
			shift_out: out std_logic
		);
	end component;
	
	component add_sub
		generic (N: INTEGER := 4);
		port(	
			addsub: in std_logic;
			x, y: in std_logic_vector (N-1 downto 0);
			s: out std_logic_vector (N-1 downto 0);
			overflow, cout: out std_logic
		);
	end component;
	
	component n_register
		generic (N: INTEGER := 4);
		port ( 
			clk, reset: in std_logic;
			E, clear: in std_logic; -- clear: Synchronous clear
			D: in std_logic_vector (N-1 downto 0);
			Q: out std_logic_vector (N-1 downto 0)
		);
	end component;

	type state is (S1, S2, S3);
	signal y: state;
	
	signal L, E, EP, sclrP, z: std_logic;
	signal B: std_logic_vector (N-1 downto 0);
	signal A, dAx, dP, Pt: std_logic_vector (2*N -1 downto 0);

begin
rA: parallel_shift_reg generic map (N => 2*N, DIR => "LEFT")
    port map (
		clk => clk, reset => reset, din => '0', 
		s_l => L, E => E, D => dAx, Q => A
	);
	dAx (2*N-1 downto N)<= (others =>'0');
	dAx (N-1 downto 0)	<= dA;

rB: parallel_shift_reg generic map (N => N, DIR => "RIGHT")
    port map (
		clk => clk, reset => reset, din => '0',
		s_l => L, E => E, D => dB, Q => B
	);
	 
-- n-bit NOR gate:
	process (B)
		variable result_or: std_logic;
	begin
		result_or := '0';
		for i in B'range loop -- 'range: iterates through all bits in 'A'
			result_or := result_or or B(i);
		end loop;		
		z <= not (result_or);
	end process;
	 
--Adder:
ga: add_sub generic map (N => 2*N)
    port map (addsub => '0', x => A, y => Pt, s => dP);
	 
--Register P:
rP: n_register generic map (N => 2*N)
	port map (
		clk => clk, reset => reset, E => EP,
	  	clear => sclrP, D => dP, Q => Pt
	);
	P <= Pt;

--FSM:
	Transitions: process (reset, clk, s, z, B(0))
	begin
	if reset = '0' then -- asynchronous signal
		y <= S1; 		-- if reset asserted, go to initial state: S1			
	elsif (clk'event and clk = '1') then
		case y is
			when S1 => if s = '1' then y <= S2; else y <= S1; end if;
			when S2 => if z = '1' then y <= S3; else y <= S2; end if;
			when S3 => if s = '1' then y <= S3; else y <= S1; end if;
		end case;
	end if;
	end process;
	
	Outputs: process (y, s, z, B(0))
	begin
--Initialization of output signals
	sclrP <= '0'; EP <= '0'; L <= '0'; E <= '0'; done <= '0';
	case y is
		when S1 => 
			sclrP <= '1'; EP <= '1';
			if s = '1' then
				L <= '1'; E <= '1';
			end if;
		when S2 =>
			E <= '1';
			if z = '0' then
				if B(0) = '1' then EP <= '1'; end if;
			end if;
		when S3 =>
			done <= '1';
	end case;
	end process;
end Behavioral;