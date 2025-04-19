-- File: conbinational_circuit_tb.vhd
-- _____________________________
-- |  A  |  B  |  C  |  O (out) |
-- |-----|-----|-----|----------|
-- |  0  |  0  |  0  |    1     |
-- |  0  |  0  |  1  |    1     |
-- |  0  |  1  |  0  |    0     |
-- |  0  |  1  |  1  |    0     |
-- |  1  |  0  |  0  |    1     |
-- |  1  |  0  |  1  |    0     |
-- |  1  |  1  |  0  |    1     |
-- |  1  |  1  |  1  |    0     |
-- -----------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

ENTITY combinational_circuit_tb IS END;

ARCHITECTURE behavior OF combinational_circuit_tb IS

    COMPONENT combinational_circuit
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            C : IN STD_LOGIC;
            O : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A_tb : STD_LOGIC := '0';
    SIGNAL B_tb : STD_LOGIC := '0';
    SIGNAL C_tb : STD_LOGIC := '0';
    SIGNAL O_tb : STD_LOGIC;

BEGIN

    UUT : combinational_circuit
    PORT MAP(
        A => A_tb,
        B => B_tb,
        C => C_tb,
        O => O_tb
    );

    stim_proc : PROCESS
    BEGIN
        -- Test 000
        A_tb <= '0';
        B_tb <= '0';
        C_tb <= '0';
        WAIT FOR 5 ns;

        -- Test 001
        A_tb <= '0';
        B_tb <= '0';
        C_tb <= '1';
        WAIT FOR 5 ns;

        -- Test 010
        A_tb <= '0';
        B_tb <= '1';
        C_tb <= '0';
        WAIT FOR 5 ns;

        -- Test 011
        A_tb <= '0';
        B_tb <= '1';
        C_tb <= '1';
        WAIT FOR 5 ns;

        -- Test 100
        A_tb <= '1';
        B_tb <= '0';
        C_tb <= '0';
        WAIT FOR 5 ns;

        -- Test 101
        A_tb <= '1';
        B_tb <= '0';
        C_tb <= '1';
        WAIT FOR 5 ns;

        -- Test 110
        A_tb <= '1';
        B_tb <= '1';
        C_tb <= '0';
        WAIT FOR 5 ns;

        -- Test 111
        A_tb <= '1';
        B_tb <= '1';
        C_tb <= '1';
        WAIT;
    END PROCESS stim_proc;

END ARCHITECTURE behavior;
