entity wait_on_wait_until_tb is
end entity;

architecture sim of wait_on_wait_until_tb is
    signal count_up   : integer := 0;
    signal count_down : integer := 10;
begin

    process is
    begin

        count_up   <= count_up + 1;
        count_down <= count_down - 1;
        wait for 10 ns;

    end process;

    process is
    begin

        wait on count_up, count_down;
        report "up = " & integer'image(count_up) & ", down = " & integer'image(count_down);

    end process;

    process is
    begin

        wait until count_up = count_down;
        report "THIS IS MAGIC!!!!";

    end process;

end architecture;
