library ieee;
use ieee.std_logic_1164.all;

entity dec3to8 is
	port (
		input  : in  std_logic_vector(2 downto 0);
		enable : in  std_logic;
		output : out std_logic_vector(7 downto 0)
	);
end dec3to8;

architecture arch of dec3to8 is
	begin
		process(input, enable)
			begin
				if enable = '1' then
					case(input) is
						when "000" 	=> output <= "00000001";
						when "001" 	=> output <= "00000010";
						when "010" 	=> output <= "00000100";
						when "011" 	=> output <= "00001000";
						when "100" 	=> output <= "00010000";
						when "101" 	=> output <= "00100000";
						when "110" 	=> output <= "01000000";
						when others => output <= "10000000";
					end case;
				else
					output <= "00000000";
				end if;
		end process;
end arch;
