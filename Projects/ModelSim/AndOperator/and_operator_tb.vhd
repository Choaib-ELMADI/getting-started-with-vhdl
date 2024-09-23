entity and_operator_tb is
end entity;

architecture tb_sim of and_operator_tb is

    component and_operator
        port (
            a: in  bit;
            b: in  bit;
            s: out bit
        );
    end component;

    signal a_tb, b_tb, s_tb: bit;

begin

    DUT: and_operator port map (a_tb, b_tb, s_tb);

    process is
    begin

        a_tb <= '0'; b_tb <= '0';
        wait for 25 ns;

        a_tb <= '1'; b_tb <= '0';
        wait for 25 ns;

        a_tb <= '0'; b_tb <= '1';
        wait for 25 ns;

        a_tb <= '1'; b_tb <= '1';
        wait for 25 ns;

    end process;

end architecture;
