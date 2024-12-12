library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processor is
	generic (
		mv  : std_logic_vector := "000";
		mvi : std_logic_vector := "001";
		add : std_logic_vector := "010";
		sub : std_logic_vector := "011"
	);

	port (
		clock, aResetn, Run : in     std_logic;
		Din                 : in     std_logic_vector(8 downto 0);
		BusWires            : buffer std_logic_vector(8 downto 0);
		Done                : buffer std_logic
	);
end processor;

architecture arch of processor is
	component dec3to8 is
		port (
			input  : in  std_logic_vector(2 downto 0);
			enable : in  std_logic;
			output : out std_logic_vector(7 downto 0)
		);
	end component;

	component reg_n is
		generic (N: integer := 9);

		port (
			clock  : in  std_logic;
			enable : in  std_logic;
			D	   : in  std_logic_vector(N-1 downto 0);
			Q	   : out std_logic_vector(N-1 downto 0)
		);
	end component;

	type state_type is (T0, T1, T2, T3);

	signal Tcycle_D, Tcycle_Q : state_type;
	signal Rin, Rout, Xregn, Yregn : std_logic_vector(7 downto 0);
	signal DinOut, Gout, Ain, Gin, IRin, AddSub : std_logic;
	signal R0, R1, R2, R3, R4, R5, R6, R7, IR, G, A : std_logic_vector(8 downto 0);
	signal I : std_logic_vector(2 downto 0);
	signal sel : std_logic_vector(9 downto 0);
	signal sum : std_logic_vector(8 downto 0);

	begin
		I <= IR(8 downto 6);

		U1: dec3to8 port map (input => IR(5 downto 3), enable => '1', output => Xregn);
		U2: dec3to8 port map (input => IR(2 downto 0), enable => '1', output => Yregn);
	
		process(Tcycle_Q, Run, Done)
			begin
				case(Tcycle_Q) is
					when T0	=>
						if run = '0' then
							Tcycle_D <= T0;
						else
							Tcycle_D <= T1;
						end if;

					when T1  =>
						if Done = '1' then
							Tcycle_D <= T0;
						else
							Tcycle_D <= T2;
						end if;

					when T2  =>
						Tcycle_D <= T3;

					when T3  =>
						Tcycle_D <= T0;
				end case;
		end process;
	
		-- Donner ci-dessous la description VHDL qui
		-- Compléter cette partie de contrôle
		-- en indiquant les valeurs des signaux de contrôle
		-- pour chaque instruction selon les états

		process(Tcycle_Q, I)
			begin
				case(Tcycle_Q) is
					when T0	=> 
						-- ...

					when T1 => 
						case(I) is
							when mv =>
								-- ...

						end case;

					-- ...

				end case;
		end process;
	
		process(clock, aResetn)
			begin
				if aResetn = '0' then
					Tcycle_Q <= T0;
				elsif rising_edge(clock) then
					Tcycle_Q <= Tcycle_D;
				end if;
		end process;
	
		-- Dataflow
	
		-- Décrire l'additionneur/soustracteur dans le process suivant
	
		process(A, Buswires)
		begin
			-- ...
		end process;

		sel <= DinOut & Rout & Gout;

		-- Donner ci-dessous la description comportementale du multiplexeur
		-- ...
	
		-- Donner ci-dessos la description structurelle des registres des processeur 
		-- ...
end arch;
