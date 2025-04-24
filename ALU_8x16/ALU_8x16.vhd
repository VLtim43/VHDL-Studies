-- File: ALU_8x16
-- _______________________________________
-- | op_sel |       Operation            |
-- |--------|----------------------------|
-- | 0000   |  A - B                     | 
-- | 0001   |  A - B - Cin               | 
-- | 0010   |  A + B                     | 
-- | 0011   |  A + B + Cin               | 
-- | 0100   |  A and B                   |
-- | 0101   |  A or B                    |
-- | 0110   |  A xor B                   |
-- | 0111   |  Bypass B                  | 
-- | 1000   |  Rotate Left A             |
-- | 1001   |  Rotate Right A            |
-- | 1010   |  Rotate Left A w/ Carry    |
-- | 1011   |  Rotate Right A w/ Carry   |
-- | 1100   |  Shift Logical Left A      |
-- | 1101   |  Shift Logical Right A     |
-- | 1110   |  Shift Arithmetic Right A  |
-- | 1111   |  NOT A                     |
-- ---------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_8x16 IS
    PORT (
        a_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input A
        b_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input B
        c_in : IN STD_LOGIC; -- Carry In (used in RLC, RRC)
        op_sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Operation Select

        r_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Result
        z_out : OUT STD_LOGIC; -- Zero Flag
        v_out : OUT STD_LOGIC; -- Overflow Flag
        c_out : OUT STD_LOGIC -- Carry/rotate-out
    );
END ENTITY;

ARCHITECTURE rtl OF ALU_8x16 IS

    SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL overflow : STD_LOGIC;
    SIGNAL zero_flag : STD_LOGIC;
    SIGNAL carry_out : STD_LOGIC;

BEGIN

    -- Operations
    result <=
        STD_LOGIC_VECTOR(unsigned(a_in) - unsigned(b_in)) WHEN op_sel = "0000" ELSE -- SUB
        STD_LOGIC_VECTOR(unsigned(a_in) + unsigned(b_in)) WHEN op_sel = "0010" ELSE -- ADD
        (a_in AND b_in) WHEN op_sel = "0100" ELSE -- AND
        (a_in OR b_in) WHEN op_sel = "0101" ELSE -- OR
        (a_in XOR b_in) WHEN op_sel = "0110" ELSE -- XOR
        (b_in) WHEN op_sel = "0111" ELSE -- PASS_B
        (a_in(6 DOWNTO 0) & a_in(7)) WHEN op_sel = "1000" ELSE -- RL
        (a_in(0) & a_in(7 DOWNTO 1)) WHEN op_sel = "1001" ELSE -- RR
        (a_in(6 DOWNTO 0) & c_in) WHEN op_sel = "1010" ELSE -- RLC
        (c_in & a_in(7 DOWNTO 1)) WHEN op_sel = "1011" ELSE -- RRC
        (a_in(6 DOWNTO 0) & '0') WHEN op_sel = "1100" ELSE -- SLL
        ('0' & a_in(7 DOWNTO 1)) WHEN op_sel = "1101" ELSE -- SRL
        (a_in(7) & a_in(7 DOWNTO 1)) WHEN op_sel = "1110" ELSE -- SRA
        (NOT a_in) WHEN op_sel = "1111" ELSE -- NOT
        (OTHERS => '0');

    -- Overflow Handler (only ADD and SUB)
    overflow <=
        '1' WHEN op_sel = "0010" AND
        ((a_in(7) = '0' AND b_in(7) = '0' AND result(7) = '1') OR
        (a_in(7) = '1' AND b_in(7) = '1' AND result(7) = '0')) ELSE
        '1' WHEN op_sel = "0000" AND
        ((a_in(7) = '0' AND b_in(7) = '1' AND result(7) = '1') OR
        (a_in(7) = '1' AND b_in(7) = '0' AND result(7) = '0')) ELSE
        '0';

    -- Carry-out logic
    carry_out <=
        a_in(7) WHEN op_sel = "1000" ELSE -- RL
        a_in(0) WHEN op_sel = "1001" ELSE -- RR
        a_in(7) WHEN op_sel = "1010" ELSE -- RLC
        a_in(0) WHEN op_sel = "1011" ELSE -- RRC
        a_in(7) WHEN op_sel = "1100" ELSE -- SLL
        a_in(0) WHEN op_sel = "1101" ELSE -- SRL
        a_in(0) WHEN op_sel = "1110" ELSE -- SRA
        '0';

    -- Zero flag
    zero_flag <= '1' WHEN result = X"00" ELSE
        '0';

    -- Outputs
    r_out <= result;
    z_out <= zero_flag;
    v_out <= overflow;
    c_out <= carry_out;

END ARCHITECTURE;
