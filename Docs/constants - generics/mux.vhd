library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
    generic (
        BUS_WIDTH : integer
    );
    port (
        in_1      : in unsigned(BUS_WIDTH - 1 downto 0);
        in_2      : in unsigned(BUS_WIDTH - 1 downto 0);
        in_3      : in unsigned(BUS_WIDTH - 1 downto 0);
        in_4      : in unsigned(BUS_WIDTH - 1 downto 0);

        sel       : in unsigned(1 downto 0);

        my_out    : out unsigned(BUS_WIDTH - 1 downto 0)
    );
end entity;

architecture rtl of mux is
begin

    process(sel, in_1, in_2, in_3, in_4) is
    begin

        case sel is
            when "00"   => my_out <= in_1;
            when "01"   => my_out <= in_2;
            when "10"   => my_out <= in_3;
            when "11"   => my_out <= in_4;
            when others => my_out <= (others => 'X');
        end case;

    end process;

end architecture;
