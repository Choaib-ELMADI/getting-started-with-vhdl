library ieee;
use ieee.std_logic_1164.all;

entity four_bits_adder_subtractor_tb is
end entity;

architecture sim of four_bits_adder_subtractor_tb is

    component four_bits_adder_subtractor is
        port (
            A, B      : in  std_logic_vector(3 downto 0);
            op        : in  std_logic;
            Res       : out std_logic_vector(3 downto 0);
            ovf, cout : out std_logic
        );
    end component;

    signal A, B      : std_logic_vector(3 downto 0);
    signal op        : std_logic;
    signal Res       : std_logic_vector(3 downto 0);
    signal ovf, cout : std_logic;

begin

    DUT: four_bits_adder_subtractor port map (A, B, op, Res, ovf, cout);

    process is
    begin

        op <= '0'; --! ADDITION

        A <= "0000"; B <= "0000";
        wait for 10 ns;

        A <= "0100"; B <= "1001";
        wait for 10 ns;

        A <= "1010"; B <= "0100";
        wait for 10 ns;

        A <= "1111"; B <= "0001";
        wait for 10 ns;

        A <= "1010"; B <= "1001";
        wait for 10 ns;

        A <= "1000"; B <= "1001";
        wait for 10 ns;

        op <= '1'; --! SUBTRACTION

        A <= "0000"; B <= "0000";
        wait for 10 ns;

        A <= "0100"; B <= "1001";
        wait for 10 ns;

        A <= "1010"; B <= "0100";
        wait for 10 ns;

        A <= "1111"; B <= "0001";
        wait for 10 ns;

        A <= "1010"; B <= "1001";
        wait for 10 ns;

        A <= "1000"; B <= "1001";
        wait for 10 ns;

        wait;

    end process;

end architecture;
