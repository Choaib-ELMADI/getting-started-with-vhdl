entity tb_1_wait_for is
end entity;

architecture sim of tb_1_wait_for is
begin

    process is
    begin

        report "Hello, World! This is a test!!";
        wait for 10 ns;

    end process;

end architecture;
