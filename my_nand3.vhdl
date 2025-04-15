-- File: my_nand3.vhd
ENTITY my_nand3 IS
    PORT (
        A, B, C : IN BIT;
        F : OUT BIT
    );
END my_nand3;

ARCHITECTURE exa_nand3 OF my_nand3 IS
BEGIN
    -- NAND operation using BIT type
    F <= NOT (A AND B AND C);
END exa_nand3;
