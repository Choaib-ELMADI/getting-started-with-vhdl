library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bits_detector_tb is
end entity;

architecture sim of bits_detector_tb is
    constant SIZE : integer := 4;
    signal   i_tb : std_logic_vector(SIZE - 1 downto 0) := (others => '0');
    signal   o_tb : std_logic;
begin

    i_bits_detector: entity work.bits_detector(rtl)
        generic map (SIZE => SIZE)
        port map (
            i => i_tb,
            o => o_tb
        );

    process is
    begin

        i_tb <= "0000";
        wait for 20 ns;

        i_tb <= "1000";
        wait for 20 ns;

        i_tb <= "1100";
        wait for 20 ns;

        i_tb <= "1110";
        wait for 20 ns;

        i_tb <= "1111";
        wait for 20 ns;

        wait;

    end process;

end architecture;
