library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
    generic (CLOCK_FREQUENCY : integer);
    port (
        clk       : in    std_logic;
        nRst      : in    std_logic;
        seconds   : inout integer;
        minutes   : inout integer;
        hours     : inout integer
    );
end entity;

architecture rtl of timer is
    signal periods : integer;

    procedure increment_wrap
        (
            signal   counter    : inout integer;
            constant wrap_value : in    integer;
            constant enable     : in    boolean;
            variable wrapped    : out   boolean
        ) is
    begin
        if enable then
            if counter = wrap_value then
                wrapped := true;
                counter <= 0;
            else
                wrapped := false;
                counter <= counter + 1;
            end if;
        end if;
    end procedure;
begin

    process(clk) is
        variable wrap: boolean;
    begin

        if rising_edge(clk) then
            if nRst = '0' then
                periods <= 0;
                seconds <= 0;
                minutes <= 0;
                hours   <= 0;
            else
                increment_wrap(periods, CLOCK_FREQUENCY - 1, true, wrap);
                increment_wrap(seconds,                  59, wrap, wrap);
                increment_wrap(minutes,                  59, wrap, wrap);
                increment_wrap(hours,                    23, wrap, wrap);
            end if;
        end if;

    end process;

end architecture;
