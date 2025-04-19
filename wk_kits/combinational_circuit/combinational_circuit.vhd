-- File: conbinational_circuit.vhd

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY combinational_circuit IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        C : IN STD_LOGIC;
        O : OUT STD_LOGIC
    );
END ENTITY combinational_circuit;

ARCHITECTURE hardware OF combinational_circuit IS

    SIGNAL OR1 : STD_LOGIC;
    SIGNAL OR2 : STD_LOGIC;
    SIGNAL OR3 : STD_LOGIC;

BEGIN
    OR1 <= (NOT A) AND (NOT B);
    OR2 <= (NOT B) AND (NOT C);
    OR3 <= A AND (NOT C);

    O <= (OR1 OR OR2 OR OR3);

END ARCHITECTURE hardware;
