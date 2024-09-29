library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity case_when_tb is
end entity;

architecture sim of case_when_tb is
    signal in_1  : unsigned(7 downto 0) := x"AA";
    signal in_2  : unsigned(7 downto 0) := x"BB";
    signal in_3  : unsigned(7 downto 0) := x"CC";
    signal in_4  : unsigned(7 downto 0) := x"DD";

    signal sel   : unsigned(1 downto 0) := (others => '0');

    signal out_1 : unsigned(7 downto 0);
    signal out_2 : unsigned(7 downto 0);
begin

    process is
    begin

        wait for 25 ns;
        sel <= sel + 1;

    end process;

    -- MULTIPLEXER USING IF STATEMENTS
    process(sel, in_1, in_2, in_3, in_4) is
    begin

        if sel = "00" then
            out_1 <= in_1;
        elsif sel = "01" then
            out_1 <= in_2;
        elsif sel = "10" then
            out_1 <= in_3;
        elsif sel = "11" then
            out_1 <= in_4;
        else
            out_1 <= (others => 'X');
        end if;

    end process;

    -- MULTIPLEXER USING CASE STATEMENTS
    process(sel, in_1, in_2, in_3, in_4) is
    begin

        case sel is
            when "00"   => out_2 <= in_1;
            when "01"   => out_2 <= in_2;
            when "10"   => out_2 <= in_3;
            when "11"   => out_2 <= in_4;
            when others => out_2 <= (others => 'X');
        end case;

    end process;

end architecture;
