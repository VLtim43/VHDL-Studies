LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- File: nand3.vhd
ENTITY nand3 IS
    PORT (
        A, B, C : IN STD_LOGIC;
        F : OUT STD_LOGIC
    );
END nand3;

ARCHITECTURE exa_nand3 OF nand3 IS
BEGIN
    -- NAND operation using BIT type
    F <= NOT (A AND B AND C);
END exa_nand3;
