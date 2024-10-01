library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop is
    port (
        clk       : in  std_logic;
        nRst      : in  std_logic;  -- negative reset
        my_input  : in  std_logic;
        my_output : out std_logic
    );
end entity;

architecture rtl of flipflop is
begin

    process(clk) is
    begin

        if rising_edge(clk) then
            if nRst = '0' then
                my_output <= '0';
            else
                my_output <= my_input;
            end if;
        end if;

    end process;

end architecture;
