library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_tb is
end entity;

architecture sim of flipflop_tb is
    constant CLOCK_FREQUENCY : integer   := 100e6;                      -- 100 MHz
    constant CLOCK_PERIOD    : time      := 1000 ms / CLOCK_FREQUENCY;  -- 10  ns

    signal clk               : std_logic := '1';
    signal nRst              : std_logic := '0';
    signal my_in             : std_logic := '0';
    signal my_out            : std_logic;
begin

    -- Device Under Test (DUT)
    i_flipflop: entity work.flipflop(rtl) port map (
        clk       => clk,
        nRst      => nRst,
        my_input  => my_in,
        my_output => my_out
    );

    clk <= not clk after CLOCK_PERIOD / 2;

    process is
    begin

        nRst <= '1';

        wait for 20 ns;
        my_in <= '1';
        wait for 22 ns;
        my_in <= '0';
        wait for 6 ns;
        my_in <= '1';
        wait for 20 ns;

        nRst <= '0';

        wait;

    end process;

end architecture;
