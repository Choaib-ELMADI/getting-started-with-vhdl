entity while_loop_tb is
end entity;

architecture sim of while_loop_tb is
begin

    process is
        variable i: integer := 0;
    begin

        while i <= 10 loop
            report "Hi, I am number " & integer'image(i);
            i := i + 1;
            wait for 25 ns;
        end loop;
        wait;

    end process;

end architecture;
