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
		generic (N : integer := 9);
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

		process(Tcycle_Q, I)
			begin
				DinOut <= '0'; Gout <= '0'; Ain <= '0'; Gin <= '0'; IRin<= '0';
				AddSub <= '0'; Rin <= "00000000"; Rout <= "00000000"; Done <= '0';

				case(Tcycle_Q) is
					when T0	=> IRin <= '1';

					when T1 =>
						case(I) is
							when mv		=> Rout <= Yregn; Rin <= Xregn; Done <='1';
							when mvi	=> Dinout <='1'; Rin <= Xregn; Done <='1';
							when add	=> Rout <= Xregn; Ain <= '1'; 
							when others => Rout <= Xregn; Ain <= '1'; 
						end case;

					when T2 => 
						case(I) is
							when add 	=> Rout <= Yregn; Gin <='1';
							when others => Rout <= Yregn; Gin <='1'; AddSub <='1';
						end case;

					when T3 => 
						case(I) is
							when add	=> Gout <='1'; Rin <= Xregn; Done <='1';
							when others => Gout <='1'; Rin <= Xregn; Done <='1';
						end case;
				end case;
		end process;

		process(clock, aResetn)
			begin
				if aResetn = '0' then
					Tcycle_Q <=T0;
				elsif rising_edge(clock) then
					Tcycle_Q <= Tcycle_D;
				end if;
		end process;

		-- Dataflow

		process(A, Buswires)
			begin
				if AddSub = '0' then
					sum <= std_logic_vector(signed(A) + signed(BusWires));
				else
					sum <= std_logic_vector(signed(A) - signed(BusWires));
				end if;
		end process;

		sel <= DinOut & Rout & Gout;

		process(Din, R0, R1, R2, R3, R4, R5, R6, R7, G, sel)
			begin
				case(sel) is
					when "1000000000" => BusWires <= Din;
					when "0100000000" => BusWires <= R7;
					when "0010000000" => BusWires <= R6;
					when "0001000000" => BusWires <= R5;
					when "0000100000" => BusWires <= R4;
					when "0000010000" => BusWires <= R3;
					when "0000001000" => BusWires <= R2;
					when "0000000100" => BusWires <= R1;
					when "0000000010" => BusWires <= R0;
					when "0000000001" => BusWires <= G;
					when others 	  => BusWires <= Din;
				end case;
		end process;

		Reg0  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(0), D => BusWires, Q => R0);
		Reg1  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(1), D => BusWires, Q => R1);
		Reg2  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(2), D => BusWires, Q => R2);
		Reg3  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(3), D => BusWires, Q => R3);
		Reg4  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(4), D => BusWires, Q => R4);
		Reg5  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(5), D => BusWires, Q => R5);		
		Reg6  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(6), D => BusWires, Q => R6);
		Reg7  : reg_n generic map(N => 9) port map (clock => clock, enable => Rin(7), D => BusWires, Q => R7);
		Reg8  : reg_n generic map(N => 9) port map (clock => clock, enable => Ain,    D => BusWires, Q => A);		
		Reg9  : reg_n generic map(N => 9) port map (clock => clock, enable => IRin,   D => Din,      Q => IR);					
		Reg10 : reg_n generic map(N => 9) port map (clock => clock, enable => Gin,    D => sum,      Q => G);

end arch;
