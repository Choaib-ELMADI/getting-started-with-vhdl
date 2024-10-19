library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bits_counter is
    port (
        clk     : in  std_logic;
        n_reset : in  std_logic;
        counter : out unsigned(3 downto 0)
    );
end entity;


architecture rtl of four_bits_counter is
    signal count : unsigned(3 downto 0) := (others => '0');
begin

    process is
    begin

        if n_reset = '0' then
            count   <= (others => '0');
            counter <= (others => '0');
        else
            if rising_edge(clk) then
                count <= count + 1;
            end if;
        end if;

    end process;

    counter <= count;

end architecture;
