LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
-- entity
ENTITY my_nand3 IS
    PORT (
        A, B, C : IN STD_LOGIC;
        F : OUT STD_LOGIC);
END my_nand3;
-- architecture
ARCHITECTURE exa_nand3 OF my_nand3
    IS
BEGIN
    F <= A NAND B;
END exa_nand3;
