LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY xor_gate IS
    PORT (
        in1 : IN STD_LOGIC;
        in2 : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END xor_gate;

ARCHITECTURE hardware OF xor_gate IS
BEGIN

    o <= in1 XOR in2;

END hardware;
