-- File: ALU_8x16_tb.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_8x16_tb IS
END ENTITY;

ARCHITECTURE behavior OF ALU_8x16_tb IS

    COMPONENT ALU_8x16
        PORT (
            a_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            b_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            c_in : IN STD_LOGIC;
            op_sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            r_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            z_out : OUT STD_LOGIC;
            v_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a_in_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL b_in_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL c_in_tb : STD_LOGIC;
    SIGNAL op_sel_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL r_out_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL z_out_tb : STD_LOGIC;
    SIGNAL v_out_tb : STD_LOGIC;

BEGIN

    UUT : ALU_8x16
    PORT MAP(
        a_in => a_in_tb,
        b_in => b_in_tb,
        c_in => c_in_tb,
        op_sel => op_sel_tb,
        r_out => r_out_tb,
        z_out => z_out_tb,
        v_out => v_out_tb
    );

    stim_proc : PROCESS
    BEGIN
        a_in_tb <= "00000000"; -- example A
        b_in_tb <= "00000000"; -- example B
        c_in_tb <= '0';

        -- 0) A - B
        op_sel_tb <= "0000";
        WAIT FOR 5 ns;

        -- 1) A - B - Cin
        op_sel_tb <= "0001";
        WAIT FOR 5 ns;

        -- 2) A + B
        op_sel_tb <= "0010";
        WAIT FOR 5 ns;

        -- 3) A + B + Cin
        op_sel_tb <= "0011";
        WAIT FOR 5 ns;

        -- 4) A and B
        op_sel_tb <= "0100";
        WAIT FOR 5 ns;

        -- 5) A or B
        op_sel_tb <= "0101";
        WAIT FOR 5 ns;

        -- 6) A xor B
        op_sel_tb <= "0110";
        WAIT FOR 5 ns;

        -- 7) Bypass B
        op_sel_tb <= "0111";
        WAIT FOR 5 ns;

        -- 8) Rotate Left A
        op_sel_tb <= "1000";
        WAIT FOR 5 ns;

        -- 9) Rotate Right A
        op_sel_tb <= "1001";
        WAIT FOR 5 ns;

        -- 10) Rotate Left A with Carry
        op_sel_tb <= "1010";
        WAIT FOR 5 ns;

        -- 11) Rotate Right A with Carry
        op_sel_tb <= "1011";
        WAIT FOR 5 ns;

        -- 12) Shift Logical Left A
        op_sel_tb <= "1100";
        WAIT FOR 5 ns;

        -- 13) Shift Logical Right A
        op_sel_tb <= "1101";
        WAIT FOR 5 ns;

        -- 14) Shift Arithmetic Right A
        op_sel_tb <= "1110";
        WAIT FOR 5 ns;

        -- 15) NOT A
        op_sel_tb <= "1111";
        WAIT FOR 5 ns;

        WAIT;
    END PROCESS;

END ARCHITECTURE;
