library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a      : in  std_logic;
        b      : in  std_logic;
        prev_c : in  std_logic;
        s      : out std_logic;
        c      : out std_logic
    );
end entity;

architecture rtl of full_adder is
begin

    process(a, b, prev_c) is
    begin

        s <= prev_c xor (a xor b);
        c <= (a and b) or ((a xor b) and prev_c);

    end process;

end architecture;
