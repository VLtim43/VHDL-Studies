-- File: ALU_8x16.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU_8x16 IS
    PORT (
        a_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input A
        b_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Input B
        c_in : IN STD_LOGIC; -- Carry In (not used yet)
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

    -- Operations
    result <=
        STD_LOGIC_VECTOR(unsigned(a_in) - unsigned(b_in)) WHEN op_sel = "0000" ELSE -- SUB
        STD_LOGIC_VECTOR(unsigned(a_in) + unsigned(b_in)) WHEN op_sel = "0010" ELSE -- ADD
        (OTHERS => '0');

    -- Overflow Handler
    overflow <=
        -- ADD overflow
        '1' WHEN op_sel = "0010" AND
        ((a_in(7) = '0' AND b_in(7) = '0' AND result(7) = '1') OR
        (a_in(7) = '1' AND b_in(7) = '1' AND result(7) = '0')) ELSE
        -- SUB overflow
        '1' WHEN op_sel = "0000" AND
        ((a_in(7) = '0' AND b_in(7) = '1' AND result(7) = '1') OR
        (a_in(7) = '1' AND b_in(7) = '0' AND result(7) = '0')) ELSE
        '0';

    -- Zero flag: 1 if result is zero
    zero_flag <= '1' WHEN result = X"00" ELSE
        '0';

    r_out <= result;
    z_out <= zero_flag;
    v_out <= overflow;
END ARCHITECTURE;
