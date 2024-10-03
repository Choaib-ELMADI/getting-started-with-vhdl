library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    generic (CLOCK_FREQUENCY : integer := 100);
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

architecture rtl of fsm is
    type t_state is (NORTH_NEXT, NORTH_READY, NORTH, STOP_NORTH, WEST_NEXT, WEST_READY, WEST, STOP_WEST);
    
    signal state   : t_state;
    signal counter : integer range 0 to CLOCK_FREQUENCY * 60;
begin

    process(clk) is
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
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= NORTH_READY;
                        end if;

                    when NORTH_READY =>
                        NORTH_RED    <= '1';
                        NORTH_YELLOW <= '1';
                        WEST_RED     <= '1';
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= NORTH;
                        end if;

                    when NORTH       =>
                        NORTH_GREEN  <= '1';
                        WEST_RED     <= '1';
                        if counter = CLOCK_FREQUENCY * 60 - 1 then
                            counter  <= 0;
                            state    <= STOP_NORTH;
                        end if;

                    when STOP_NORTH  =>
                        NORTH_YELLOW <= '1';
                        WEST_RED     <= '1';
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= WEST_NEXT;
                        end if;

                    when WEST_NEXT   =>
                        NORTH_RED    <= '1';
                        WEST_RED     <= '1';
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= WEST_READY;
                        end if;

                    when WEST_READY  =>
                        NORTH_RED    <= '1';
                        WEST_YELLOW  <= '1';
                        WEST_RED     <= '1';
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= WEST;
                        end if;

                    when WEST        =>
                        NORTH_RED    <= '1';
                        WEST_GREEN   <= '1';
                        if counter = CLOCK_FREQUENCY * 60 - 1 then
                            counter  <= 0;
                            state    <= STOP_WEST;
                        end if;

                    when STOP_WEST   =>
                        NORTH_RED    <= '1';
                        WEST_YELLOW  <= '1';
                        if counter = CLOCK_FREQUENCY * 5 - 1 then
                            counter  <= 0;
                            state    <= NORTH_NEXT;
                        end if;
                end case;
            end if;
        end if;

    end process;

end architecture;
