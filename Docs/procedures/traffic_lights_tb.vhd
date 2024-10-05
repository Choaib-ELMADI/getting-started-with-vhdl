library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_lights_tb is
end entity;

architecture sim of traffic_lights_tb is
    constant CLOCK_FREQUENCY : integer   := 100;
    constant CLOCK_PERIOD    : time      := 1000 ms / CLOCK_FREQUENCY;

    signal clk               : std_logic := '1';
    signal nRst              : std_logic := '0';

    signal NORTH_RED         : std_logic;
    signal NORTH_YELLOW      : std_logic;
    signal NORTH_GREEN       : std_logic;
    signal WEST_RED          : std_logic;
    signal WEST_YELLOW       : std_logic;
    signal WEST_GREEN        : std_logic;
begin

    i_traffic_lights: entity work.traffic_lights(rtl)
        generic map (CLOCK_FREQUENCY => CLOCK_FREQUENCY)
        port map (
            clk  => clk,
            nRst => nRst,

            NORTH_RED    => NORTH_RED,
            NORTH_YELLOW => NORTH_YELLOW,
            NORTH_GREEN  => NORTH_GREEN,
            WEST_RED     => WEST_RED,
            WEST_YELLOW  => WEST_YELLOW,
            WEST_GREEN   => WEST_GREEN
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
