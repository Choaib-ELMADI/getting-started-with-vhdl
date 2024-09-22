entity top is
    port (
        A: in  bit;
        F: out bit
    );
end entity;

architecture top_sim of top is
begin

	F <= not A;

end architecture;
