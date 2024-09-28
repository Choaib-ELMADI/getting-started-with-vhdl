library ieee;
use ieee.std_logic_1164.all;

entity std_logic_vector_tb is
end entity;

architecture sim of std_logic_vector_tb is
    signal slv_1: std_logic_vector(7 downto 0);
    signal slv_2: std_logic_vector(7 downto 0) := (others => '0');
    signal slv_3: std_logic_vector(7 downto 0) := (others => '1');
    signal slv_4: std_logic_vector(7 downto 0) := x"AA";            -- hexadecimal representation
    signal slv_5: std_logic_vector(7 downto 0) := "10101010";       -- binary representation
    signal slv_6: std_logic_vector(7 downto 0) := "01010101";       -- descending, bit 0 is LSB
    signal slv_7: std_logic_vector(0 to 7)     := "01010101";       -- ascending, bit 0 is MSB
    signal slv_8: std_logic_vector(7 downto 0) := "00000001";
begin

    process is
    begin

        wait for 10 ns;

        for i in slv_8'left downto slv_8'right + 1 loop
            slv_8(i) <= slv_8(i-1);
        end loop;
        slv_8(slv_8'right) <= slv_8(slv_8'left);

    end process;

end architecture;
