library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_tb is
end entity;

architecture sim of full_adder_tb is
    signal a_tb: std_logic_vector(3 downto 0);
    signal b_tb: std_logic_vector(3 downto 0);
    signal s_tb: std_logic_vector(4 downto 0);
begin

    i_full_adder: entity work.full_adder(rtl)
        port map (
            a => a_tb,
            b => b_tb,
            s => s_tb
        );

    process is
    begin

        a_tb <= "0000"; b_tb <= "0000";
        wait for 25 ns;
        a_tb <= "0001"; b_tb <= "0000";
        wait for 25 ns;
        a_tb <= "0000"; b_tb <= "0001";
        wait for 25 ns;
        a_tb <= "0001"; b_tb <= "0001";
        wait for 25 ns;
        a_tb <= "0011"; b_tb <= "0001";
        wait for 25 ns;
        a_tb <= "0011"; b_tb <= "0011";
        wait for 25 ns;

    end process;

end architecture;
