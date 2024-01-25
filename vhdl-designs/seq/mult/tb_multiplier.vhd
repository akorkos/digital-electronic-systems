library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use std.env.finish;
 
entity tb_multiplier is
	generic (N: INTEGER := 4);
end tb_multiplier;
 
architecture behavior of tb_multiplier is 
   --Inputs
   signal clk: std_logic := '0';
   signal reset: std_logic := '0';
   signal s: std_logic := '0';
   signal dA: std_logic_vector (N-1 downto 0) := (others => '0');
   signal dB: std_logic_vector (N-1 downto 0) := (others => '0');

 	--Outputs
   signal P: std_logic_vector (2*N - 1 downto 0);
   signal done: std_logic;

   -- Clock period definitions
   constant clock_period: time := 10 ns;
begin
	-- Instantiate the Unit Under Test (UUT)
  uut: entity work.multiplier port map (clk, reset, s, dA, dB, P, done);

  -- Clock process definitions
  clock_process: process
  begin
  clk <= '0'; 
    wait for clock_period/2;
  clk <= '1'; 
    wait for clock_period/2;
  end process;

  -- Stimulus process
  stimulus: process
  begin		
    -- hold reset state for 100 ns.
    wait for 100 ns; reset <= '1';

    dA <= conv_std_logic_vector (13, N); -- "1101";
    dB <= conv_std_logic_vector (11, N); -- "1011";
    s <= '1'; wait for clock_period;
    s <= '0';
    wait for clock_period*(N+3); -- Multiplication takes at most N + 1 cycles
    
    dA <= conv_std_logic_vector (9, N);    -- "1001";
    dB <= conv_std_logic_vector (15, N);   -- "1111";
    s <= '1'; wait for clock_period;
    s <= '0';
    wait for clock_period*(N+3);
    finish;
  end process;
end architecture;