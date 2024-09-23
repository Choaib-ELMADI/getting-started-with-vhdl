entity wait_for_tb is
end entity;

architecture sim of wait_for_tb is
begin:

    report "Hi!";
    wait for 10 ns;     -- Delay the execution of the program
    report "Hello!";
    wait for 10 ns;     -- Delay the execution of the program

end architecture;
