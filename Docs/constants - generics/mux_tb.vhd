library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_tb is
end entity;

architecture sim of mux_tb is
    constant BUS_WIDTH : integer := 10;

    signal input_1     : unsigned(BUS_WIDTH - 1 downto 0) := "00" & x"AA";
    signal input_2     : unsigned(BUS_WIDTH - 1 downto 0) := "00" & x"BB";
    signal input_3     : unsigned(BUS_WIDTH - 1 downto 0) := "00" & x"CC";
    signal input_4     : unsigned(BUS_WIDTH - 1 downto 0) := "00" & x"DD";

    signal sel_bits    : unsigned(1 downto 0) := "00";

    signal my_output   : unsigned(BUS_WIDTH - 1 downto 0);
begin

    i_mux: entity work.mux(rtl)
        generic map (
            BUS_WIDTH => BUS_WIDTH
        )
        port map (
            in_1      => input_1,
            in_2      => input_2,
            in_3      => input_3,
            in_4      => input_4,
            sel       => sel_bits,
            my_out    => my_output
        );

    process is
    begin

        wait for 20 ns;
        sel_bits <= sel_bits + 1;
        wait for 20 ns;
        sel_bits <= sel_bits + 1;
        wait for 20 ns;
        sel_bits <= sel_bits + 1;
        wait for 20 ns;
        sel_bits <= "UU";
        wait for 20 ns;
        wait;

    end process;

end architecture;
