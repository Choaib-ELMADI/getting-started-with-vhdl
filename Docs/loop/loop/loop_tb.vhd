entity loop_tb is
end entity;

architecture sim of loop_tb is
begin

    process is  -- Process loop
    begin

        report "Hello!";

        loop    -- Repeat a set of statements
            report "Hi!!";
            wait for 10 ns;
        end loop;

        report "Goodbye!";
        wait;

    end process;

end architecture;
