-- File: ALU_4x3_tb.vhd
-- _________________________________________________________________
-- |   A   |   B   |   S   |      Operation      |        O        |
-- |-------|-------|-------|---------------------|-----------------|
-- | 1010  | 1001  | 000   |       A + B         |      0011       |
-- | 1010  | 1001  | 001   |       A - B         |      0001       |
-- | 1010  | 1001  | 010   |     A and B         |      1000       |
-- | 1010  | 1001  | 011   |      A or B         |      1011       |
-- | 1010  | 1001  | 100   |     A xor B         |      0011       |
-- | 1010  | 1001  | 101   |       not A         |      0101       |
-- | 1010  | 1001  | 110   |       not B         |      0110       |
-- | 1010  | 1001  | 111   |         Z           |      ZZZZ       |
-- -----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_4x3_tb IS
END ENTITY;

ARCHITECTURE behavior OF ALU_4x3_tb IS

    COMPONENT ALU_4x3
        PORT (
            A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            O : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL A_tb : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
    SIGNAL B_tb : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
    SIGNAL S_tb : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL O_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    UUT : ALU_4x3
    PORT MAP(
        A => A_tb,
        B => B_tb,
        S => S_tb,
        O => O_tb
    );

    stim_proc : PROCESS
    BEGIN
        -- A + B
        S_tb <= "000";
        WAIT FOR 10 ns;
        -- A - B
        S_tb <= "001";
        WAIT FOR 10 ns;
        -- A and B
        S_tb <= "010";
        WAIT FOR 10 ns;
        -- A or B
        S_tb <= "011";
        WAIT FOR 10 ns;
        -- A xor B
        S_tb <= "100";
        WAIT FOR 10 ns;
        S_tb <= "101";
        -- not A
        WAIT FOR 10 ns;
        -- not B
        S_tb <= "110";
        -- Z (high impedance)
        WAIT FOR 10 ns;
        S_tb <= "111";
        WAIT FOR 10 ns;

        WAIT;
    END PROCESS;

END ARCHITECTURE;
