library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
    port (
        a: in  std_logic_vector(3 downto 0);
        b: in  std_logic_vector(3 downto 0);
        s: out std_logic_vector(4 downto 0)
    );
end entity;

architecture rtl of full_adder is
begin

    process(a, b) is
    begin

        s <= std_logic_vector(unsigned('0' & a) + unsigned('0' & b));

    end process;

end architecture;
