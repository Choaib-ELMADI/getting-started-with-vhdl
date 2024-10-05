-----------------------------
--                         --
--    4 BITS FULL ADDER    --
--                         --
-----------------------------

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity;

architecture sim of full_adder_tb is
    signal number_1       : std_logic_vector(3 downto 0);
    signal number_2       : std_logic_vector(3 downto 0);
    signal sum            : std_logic_vector(3 downto 0);
    signal carry          : std_logic_vector(3 downto 0);
begin

    adder_0: entity work.full_adder(rtl)
        port map (
            a      => number_1(0),
            b      => number_2(0),
            prev_c => '0',
            s      => sum(0),
            c      => carry(0)
        );

    adder_1: entity work.full_adder(rtl)
        port map (
            a      => number_1(1),
            b      => number_2(1),
            prev_c => carry(0),
            s      => sum(1),
            c      => carry(1)
        );

    adder_2: entity work.full_adder(rtl)
        port map (
            a      => number_1(2),
            b      => number_2(2),
            prev_c => carry(1),
            s      => sum(2),
            c      => carry(2)
        );

    adder_3: entity work.full_adder(rtl)
        port map (
            a      => number_1(3),
            b      => number_2(3),
            prev_c => carry(2),
            s      => sum(3),
            c      => carry(3)
        );

    process is
    begin

        number_1 <= "0000"; number_2 <= "0000";
        wait for 10 ns;
        number_1 <= "0000"; number_2 <= "0001";
        wait for 10 ns;
        number_1 <= "0001"; number_2 <= "0001";
        wait for 10 ns;
        number_1 <= "0001"; number_2 <= "0011";
        wait for 10 ns;

        wait;

    end process;

end architecture;
