ENTITY xor_gate_tb IS END;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
ARCHITECTURE xor_gate_tb OF xor_gate_tb IS

    COMPONENT xor_gate
        PORT (
            in1 : IN STD_LOGIC;
            in2 : IN STD_LOGIC;
            o : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL i_1 : STD_LOGIC;
    SIGNAL i_2 : STD_LOGIC;

BEGIN

    xor1 : xor_gate PORT MAP(in1 => i_1, in2 => i_2, o => OPEN);
    estimulo : PROCESS
    BEGIN
        WAIT FOR 5 ns;
        i_1 <= '0';
        i_2 <= '0';
        WAIT FOR 5 ns;
        i_1 <= '1';
        WAIT FOR 5 ns;
        i_2 <= '1';
        WAIT FOR 5 ns;
        i_1 <= '0';
        WAIT;
    END PROCESS estimulo;

END xor_gate_tb;
