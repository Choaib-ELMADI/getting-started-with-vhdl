library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_lights is
    generic (CLOCK_FREQUENCY : integer);
    port (
        clk          : in  std_logic;
        nRst         : in  std_logic;

        NORTH_RED    : out std_logic;
        NORTH_YELLOW : out std_logic;
        NORTH_GREEN  : out std_logic;
        WEST_RED     : out std_logic;
        WEST_YELLOW  : out std_logic;
        WEST_GREEN   : out std_logic
    );
end entity;

architecture rtl of traffic_lights is
    type t_state is (NORTH_NEXT, NORTH_READY, NORTH, STOP_NORTH, WEST_NEXT, WEST_READY, WEST, STOP_WEST);
    
    signal state   : t_state;
    signal counter : integer range 0 to CLOCK_FREQUENCY * 60;
begin

    process(clk) is

        procedure change_state(new_state: t_state; minutes: integer := 0; seconds: integer := 0) is
            variable total_seconds : integer;
            variable clock_cycles  : integer;
        begin

            total_seconds := seconds + minutes * 60;
            clock_cycles  := total_seconds * CLOCK_FREQUENCY - 1;

            if counter = clock_cycles then
                counter <= 0;
                state   <= new_state;
            end if;

        end procedure;

    begin

        if rising_edge(clk) then
            if nRst = '0' then
                state        <= NORTH_NEXT;
                counter      <=   0;
                NORTH_RED    <= '1';
                NORTH_YELLOW <= '0';
                NORTH_GREEN  <= '0';
                WEST_RED     <= '1';
                WEST_YELLOW  <= '0';
                WEST_GREEN   <= '0';
            else
                NORTH_RED    <= '0';
                NORTH_YELLOW <= '0';
                NORTH_GREEN  <= '0';
                WEST_RED     <= '0';
                WEST_YELLOW  <= '0';
                WEST_GREEN   <= '0';
                counter      <= counter + 1;

                case state is
                    when NORTH_NEXT  =>
                        NORTH_RED    <= '1';
                        WEST_RED     <= '1';
                        change_state(NORTH_READY, 0, 5);

                    when NORTH_READY =>
                        NORTH_RED    <= '1';
                        NORTH_YELLOW <= '1';
                        WEST_RED     <= '1';
                        change_state(NORTH, 0, 5);

                    when NORTH       =>
                        NORTH_GREEN  <= '1';
                        WEST_RED     <= '1';
                        change_state(STOP_NORTH, 1, 0);

                    when STOP_NORTH  =>
                        NORTH_YELLOW <= '1';
                        WEST_RED     <= '1';
                        change_state(WEST_NEXT, 0, 5);

                    when WEST_NEXT   =>
                        NORTH_RED    <= '1';
                        WEST_RED     <= '1';
                        change_state(WEST_READY, 0, 5);

                    when WEST_READY  =>
                        NORTH_RED    <= '1';
                        WEST_YELLOW  <= '1';
                        WEST_RED     <= '1';
                        change_state(WEST, 0, 5);

                    when WEST        =>
                        NORTH_RED    <= '1';
                        WEST_GREEN   <= '1';
                        change_state(STOP_WEST, 1, 0);

                    when STOP_WEST   =>
                        NORTH_RED    <= '1';
                        WEST_YELLOW  <= '1';
                        change_state(NORTH_NEXT, 0, 5);
                end case;
            end if;
        end if;

    end process;

end architecture;
