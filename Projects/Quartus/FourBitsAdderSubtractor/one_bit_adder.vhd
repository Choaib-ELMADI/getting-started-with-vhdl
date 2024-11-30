library ieee;
use ieee.std_logic_1164.all;

entity one_bit_adder is
    port (
        a, b : in  std_logic;
        cin  : in  std_logic;
        s    : out std_logic;
        cout : out std_logic
    );
end entity;

architecture arch of one_bit_adder is
begin

    s    <= a xor b xor cin;
    cout <= (a and b) or ((a xor b) and cin);

end architecture;
