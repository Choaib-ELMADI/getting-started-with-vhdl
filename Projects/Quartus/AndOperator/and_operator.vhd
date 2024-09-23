entity and_operator is
    port (
        a: in  bit;
        b: in  bit;
        s: out bit
    );
end entity;

architecture sim of and_operator is
begin

    s <= a and b;

end architecture;
