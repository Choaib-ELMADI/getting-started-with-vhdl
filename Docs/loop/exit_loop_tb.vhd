entity exit_loop_tb is
end entity;

architecture sim of exit_loop_tb is
begin

    process is  -- Process loop
    begin

        report "Hello!";

        loop        -- Repeat a set of statements
            report "Hi!!";
            exit;   -- Immediately terminate loop
        end loop;

        report "Goodbye!";
        wait;

    end process;

end architecture;
