entity hello_world_tb is
end entity;

architecture sim of hello_world_tb is
begin

    process is
    begin

        report "Hello, World! What's Up?";
        wait;

    end process;

end architecture;
