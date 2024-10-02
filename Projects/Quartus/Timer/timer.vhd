library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
    generic (CLOCK_FREQUENCY : integer := 10);
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
begin

    process(clk) is
    begin

        if rising_edge(clk) then
            if nRst = '0' then
                periods <= 0;
                seconds <= 0;
                minutes <= 0;
                hours   <= 0;
            else
                --$ TRUE EVERY SECOND 
                if periods = CLOCK_FREQUENCY - 1 then
                    periods <= 0;

                    --? TRUE EVERY MINUTE
                    if seconds = 59 then
                        seconds <= 0;

                        --* TRUE EVERY HOUR
                        if minutes = 59 then
                            minutes <= 0;

                            --! TRUE EVERY DAY
                            if hours = 23 then
                                hours <= 0;
                            else
                                hours <= hours + 1;
                            end if;
                        else
                            minutes <= minutes + 1;
                        end if;
                    else
                        seconds <= seconds + 1;
                    end if;
                else
                    periods <= periods + 1;
                end if;
            end if;
        end if;

    end process;

end architecture;
