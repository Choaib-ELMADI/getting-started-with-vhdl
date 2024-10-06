library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bits_detector is
    generic (
        SIZE: integer := 4
    );
    port (
        i: in  std_logic_vector(SIZE - 1 downto 0);
        o: out std_logic
    );
end entity;

architecture rtl of bits_detector is
begin

    process(i) is
        variable sum: integer := 0;
    begin

        for j in 0 to SIZE - 1 loop
            if i(j) = '1' then
                sum := sum + 1;
            end if;
        end loop;

        if (sum = 2 or sum = 3) then
            o <= '1';
        else
            o <= '0';
        end if;

        sum := 0;

    end process;

end architecture;
