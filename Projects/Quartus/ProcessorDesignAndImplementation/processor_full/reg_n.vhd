library ieee;
use ieee.std_logic_1164.all;

entity reg_n is
	generic (N : integer := 9);
	port (
		clock  : in  std_logic;
		enable : in  std_logic;
		D	   : in  std_logic_vector(N-1 downto 0);
		Q	   : out std_logic_vector(N-1 downto 0)
	);
end reg_n;

architecture arch of reg_n is
	begin
		process(clock) 
			begin
				if rising_edge(clock) then
					if enable = '1' then
						Q <= D;
					end if;
				end if;
		end process;
end arch;
