library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bits_counter_tb is
end entity;

architecture sim of four_bits_counter_tb is
    constant CLOCK_FREQUENCY : integer              := 10;
    constant CLOCK_PERIOD    : time                 := 1000 ms / CLOCK_FREQUENCY;

    signal   clk             : std_logic            := '0';
    signal   n_reset         : std_logic            := '1';
    signal   counter         : unsigned(3 downto 0) := (others => '0');
begin

    i_four_bits_counter: entity work.four_bits_counter(rtl)
        port map (
            clk     => clk,
            n_reset => n_reset,
            counter => counter
        );

    clk <= not clk after CLOCK_PERIOD / 2; -- Each 50ms

    process is
    begin

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        n_reset <= '0';
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        n_reset <= '1';
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait;

    end process;

end architecture;
