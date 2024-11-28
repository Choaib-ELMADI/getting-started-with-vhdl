library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_tb is
end entity;

architecture sim of mux_tb is
    signal in_1  : unsigned(7 downto 0) := x"AA";
    signal in_2  : unsigned(7 downto 0) := x"BB";
    signal in_3  : unsigned(7 downto 0) := x"CC";
    signal in_4  : unsigned(7 downto 0) := x"DD";

    signal sel   : unsigned(1 downto 0) := (others => '0');

    signal out_1 : unsigned(7 downto 0);
begin

    -- CREATE AN INSTANCE OF mux WITH THE ARCHITECTURE rtl
    i_mux: entity work.mux(rtl) port map (
        sel    => sel,
        in_1   => in_1,
        in_2   => in_2,
        in_3   => in_3,
        in_4   => in_4,
        my_out => out_1
    );

    process is
    begin

        wait for 10 ns;
        sel <= sel + 1;
        wait for 10 ns;
        sel <= sel + 1;
        wait for 10 ns;
        sel <= sel + 1;
        wait for 10 ns;
        sel <= sel + 1;
        wait for 10 ns;
        sel <= "UU";
        wait;

    end process;

end architecture;
