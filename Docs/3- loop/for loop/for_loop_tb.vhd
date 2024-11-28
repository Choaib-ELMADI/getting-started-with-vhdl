entity for_loop_tb is
end entity;

architecture sim of for_loop_tb is
begin

    process is
    begin

        for counter in 0 to 9 loop
            report "Hi, I am number " & integer'image(counter);
            wait for 400 ms;
        end loop;
        wait;

    end process;

end architecture;
