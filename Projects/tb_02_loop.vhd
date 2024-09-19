entity tb_02_loop is
end entity;

architecture sim of tb_02_loop is
begin

    process is
    begin

        report "Hello, World!";

        loop
            report "Inside the world!";
	        exit;
        end loop;

        report "Goodbye, World!";
        wait;

    end process;

end architecture;
