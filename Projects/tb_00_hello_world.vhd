entity tb_00_hello_world is
end entity;

architecture sim of tb_00_hello_world is
begin

    process is
    begin

        report "Hello, World! This is a testbench!!";
        wait;

    end process;

end architecture;
