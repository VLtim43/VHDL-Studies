-- File: ALU_4x3_tb.vhd
-- ____________________
-- |   S   |     O    |
-- |-------|----------|
-- |  000  |  A + B   |
-- |  001  |  A - B   |
-- |  010  |  A and B |
-- |  011  |  A or B  |
-- |  100  |  A xor B |
-- |  101  |  not A   |
-- |  110  |  not B   |
-- |  111  |  Z       |
-- --------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ALU_4x3 IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        O : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY;
ARCHITECTURE hardware OF ALU_4x3 IS

BEGIN
    PROCESS (A, B, S)
    BEGIN
        CASE S IS
            WHEN "000" => O <= A + B;
            WHEN "001" => O <= A - B;
            WHEN "010" => O <= A AND B;
            WHEN "011" => O <= A OR B;
            WHEN "100" => O <= A XOR B;
            WHEN "101" => O <= NOT A;
            WHEN "110" => O <= NOT B;

            WHEN OTHERS => O <= "ZZZZ";
        END CASE;
    END PROCESS;
END hardware;
