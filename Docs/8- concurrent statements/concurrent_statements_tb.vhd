library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concurrent_statements_tb is
end entity;

architecture sim of concurrent_statements_tb is
    signal uns_1  : unsigned(5 downto 0) := (others => '0');
    signal mult_1 : unsigned(7 downto 0);
    signal mult_2 : unsigned(7 downto 0);
    signal mult_3 : unsigned(7 downto 0);
begin

    process is
    begin

        wait for 10 ns;
        uns_1 <= uns_1 + 1;

    end process;

    process is
    begin

        mult_1 <= uns_1 & "00";
        wait on uns_1;

    end process;

    process(uns_1) is
    begin

        mult_2 <= uns_1 & "00";

    end process;

    -- THIS IS A CONCURRENT STATEMENT
    mult_3 <= uns_1 & "00";

end architecture;
