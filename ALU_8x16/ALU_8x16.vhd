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
-- File: ALU_8x16.vhd
-- File: ALU_8x16.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_8x16 IS
    PORT (
        a_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input A
        b_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input B
        c_in : IN STD_LOGIC; -- Carry In
        op_sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Operation Select

        r_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Result
        z_out : OUT STD_LOGIC; -- Zero Flag
        v_out : OUT STD_LOGIC -- Overflow Flag
    );
END ENTITY;

ARCHITECTURE rtl OF ALU_8x16 IS

    SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL overflow : STD_LOGIC;
    SIGNAL zero_flag : STD_LOGIC;

BEGIN

    -- Output assignment
    r_out <= result;
    z_out <= zero_flag;
    v_out <= overflow;

    -- For now, all operations just output a_in
    WITH op_sel SELECT
        result <=
        a_in WHEN "0000", -- A - B
        a_in WHEN "0001", -- A - B - Cin
        a_in WHEN "0010", -- A + B
        a_in WHEN "0011", -- A + B + Cin
        a_in WHEN "0100", -- A and B
        a_in WHEN "0101", -- A or B
        a_in WHEN "0110", -- A xor B
        a_in WHEN "0111", -- Bypass B
        a_in WHEN "1000", -- Rotate Left A
        a_in WHEN "1001", -- Rotate Right A
        a_in WHEN "1010", -- Rotate Left A w/ Carry
        a_in WHEN "1011", -- Rotate Right A w/ Carry
        a_in WHEN "1100", -- Shift Logical Left A
        a_in WHEN "1101", -- Shift Logical Right A
        a_in WHEN "1110", -- Shift Arithmetic Right A
        a_in WHEN "1111", -- NOT A
        (OTHERS => '0') WHEN OTHERS;

    -- Zero flag: 1 if result is all zeros
    zero_flag <= '1' WHEN result = X"00" ELSE
        '0';

    -- Overflow: not relevant for now
    overflow <= '0';

END ARCHITECTURE;
