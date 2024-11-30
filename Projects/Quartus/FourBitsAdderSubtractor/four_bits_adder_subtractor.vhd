library ieee;
use ieee.std_logic_1164.all;

entity four_bits_adder_subtractor is
    port (
        A, B      : in  std_logic_vector(3 downto 0);
        op        : in  std_logic;
        Res       : out std_logic_vector(3 downto 0);
        ovf, cout : out std_logic
    );
end entity;

architecture arch of four_bits_adder_subtractor is

    component one_bit_adder is
        port (
            a, b : in  std_logic;
            cin  : in  std_logic;
            s    : out std_logic;
            cout : out std_logic
        );
    end component;

    signal c  : std_logic_vector(3 downto 0);
    signal nB : std_logic_vector(3 downto 0);

begin

    nB <= (op & op & op & op) xor B;

    r0: one_bit_adder port map (a => A(0), b => nB(0), cin => op,   s => Res(0), cout => c(0));
    r1: one_bit_adder port map (a => A(1), b => nB(1), cin => c(0), s => Res(1), cout => c(1));
    r2: one_bit_adder port map (a => A(2), b => nB(2), cin => c(1), s => Res(2), cout => c(2));
    r3: one_bit_adder port map (a => A(3), b => nB(3), cin => c(2), s => Res(3), cout => c(3));

    ovf  <= c(3) xor c(2);
    cout <= c(3);

end architecture;
