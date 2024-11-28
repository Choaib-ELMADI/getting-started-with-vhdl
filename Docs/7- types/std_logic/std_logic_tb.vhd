library ieee;
use ieee.std_logic_1164.all;

entity std_logic_tb is
end entity;

architecture sim of std_logic_tb is
    signal sig_1: std_logic := '0';
    signal sig_2: std_logic;
    signal sig_3: std_logic;
begin

    process is
    begin

        wait for 10 ns;
        sig_1 <= not sig_1;

    end process;

    process is
    begin

        sig_2 <= 'Z';
        sig_3 <= '0';
        wait for 10 ns;

        sig_2 <= 'X';
        sig_3 <= 'W';
        wait for 10 ns;

        sig_2 <= 'H';
        sig_3 <= 'L';
        wait for 10 ns;

        sig_2 <= 'U';
        sig_3 <= '-';
        wait for 10 ns;

    end process;

end architecture;
