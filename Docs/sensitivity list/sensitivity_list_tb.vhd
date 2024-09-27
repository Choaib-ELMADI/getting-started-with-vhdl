entity sensitivity_list_tb is
end entity;

architecture sim of sensitivity_list_tb is
    signal signal_1: integer := 0;
    signal signal_2: integer := 0;
begin

    process is
    begin

        signal_1 <= signal_1 + 2;
        signal_2 <= signal_2 + 1;
        wait for 10 ms;

    end process;

    process(signal_1) is
    begin

        report "Signal 1 changed, signal_1 = " & integer'image(signal_1);

    end process;

end architecture;
