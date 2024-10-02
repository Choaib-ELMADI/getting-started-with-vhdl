library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_tb is
end entity;

architecture sim of timer_tb is
    --! 10 Hz frequency for simulation purposes
    constant CLOCK_FREQUENCY : integer   := 10;
    constant CLOCK_PERIOD    : time      := 1000 ms / CLOCK_FREQUENCY;

    signal clk               : std_logic := '1';
    signal nRst              : std_logic := '0';

    signal seconds           : integer   := 0;
    signal minutes           : integer   := 0;
    signal hours             : integer   := 0;
begin

    i_timer: entity work.timer(rtl)
        generic map (CLOCK_FREQUENCY => CLOCK_FREQUENCY)
        port map (
            clk     => clk,
            nRst    => nRst,
            seconds => seconds,
            minutes => minutes,
            hours   => hours
        );

    clk <= not clk after CLOCK_PERIOD / 2;

    process is
    begin

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        nRst <= '1';
        wait;

    end process;

end architecture;
