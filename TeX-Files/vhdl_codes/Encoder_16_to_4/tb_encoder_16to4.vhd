library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;

entity tb_encoder_16to4 is
end entity;

architecture bench of tb_encoder_16to4 is
    signal D_tb_in : std_logic_vector(15 downto 0);
    signal Q_tb_out: std_logic_vector(3 downto 0);
begin
    DUT: entity work.encoder_16to4 port map (D_tb_in, Q_tb_out);
    process
        file f_in : text open read_mode is "encoder_16to4_test.txt";
        
        variable current_read_line   : line;
        variable current_read_field1 : std_logic_vector(0 to 15);
        variable current_read_field2 : std_logic_vector(0 to 3);

        begin
            while (not endFile(f_in)) loop
                readline(f_in, current_read_line);
                read(current_read_line, current_read_field1);
                read(current_read_line, current_read_field2);

                D_tb_in     <= current_read_field1;
                wait for 50 ns;

                assert(Q_tb_out = current_read_field2);
            end loop;
            wait;
    end process;
end architecture;