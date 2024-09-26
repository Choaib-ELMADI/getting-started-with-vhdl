entity signal_vs_variable_tb is
end entity;

architecture sim of signal_vs_variable_tb is
    signal sig: integer := 0;
begin

    process is
        variable var: integer := 0;
    begin

        report "";
        report "";
        report ".......... Process started ..........";
        var := var + 1;
        sig <= sig + 1;
        report "var = " & integer'image(var) & ", sig = " & integer'image(sig);
        report "";
        report "";
        wait for 10 ns;

    end process;

end architecture;
