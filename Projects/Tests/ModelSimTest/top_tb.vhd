entity top_tb is
end entity;

architecture top_tb_sim of top_tb is
    component top
        port (
            A: in  bit;
            F: out bit
	);
    end component;

    signal A_tb, F_tb: bit;

begin

    DUT1: top port map (A_tb, F_tb);

    process is
    begin

	A_tb <= '0'; wait for 10 ns;
	A_tb <= '1'; wait for 10 ns;

    end process;

end architecture;
