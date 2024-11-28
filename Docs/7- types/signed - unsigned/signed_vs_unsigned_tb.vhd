library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signed_vs_unsigned_tb is
end entity;

architecture sim of signed_vs_unsigned_tb is
    signal uns_counter : unsigned(7 downto 0) := (others => '0');
    signal sig_counter : signed(7 downto 0)   := (others => '0');

    signal uns4        : unsigned(3 downto 0) := "1000";    -- +8
    signal sig4        : signed(3 downto 0)   := "1000";    -- -8

    signal uns8        : unsigned(7 downto 0) := (others => '0');
    signal sig8        : signed(7 downto 0)   := (others => '0');
begin

    process is
    begin

        wait for 10 ns;

        uns_counter <= uns_counter + 1;
        sig_counter <= sig_counter + 1;

        uns8 <= uns8 + uns4;
        sig8 <= sig8 + sig4;

    end process;

end architecture;
