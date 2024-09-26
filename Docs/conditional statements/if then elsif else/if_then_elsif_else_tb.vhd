entity if_then_elsif_else_tb is
end entity;

architecture sim of if_then_elsif_else_tb is
    signal up   : integer := 0;
    signal down : integer := 10;
begin

    process is
    begin

        up   <= up + 1;
        down <= down - 1;
        wait for 10 ns;

    end process;

    process is
    begin

        wait on up, down;

        if (up > down) then
            report "UP is larger.";
        elsif (up < down) then
            report "DOWN is larger.";
        else
            report "UP = DOWN";
        end if;

    end process;

end architecture;
