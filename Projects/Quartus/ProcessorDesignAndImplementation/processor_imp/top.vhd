library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	port (
		KEY  : in  std_logic_vector(1 downto 0);
		SW   : in  std_logic_vector(9 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end top;

architecture rtl_arch of top is
begin
	p: entity work.processor
		port map (
			aResetn  => key(0),
			clock    => key(1),
			Din      => SW(8 downto 0),
			Run      => SW(9),
			Done     => ledr(9),
			BusWires => ledr(8 downto 0)  		
		);
end rtl_arch;
