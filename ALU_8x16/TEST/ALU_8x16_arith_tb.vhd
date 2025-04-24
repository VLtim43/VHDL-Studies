-- File: ALU_2x16_arith_tb.vhd
-- This tests the SUB, ADD operations (SUBC and ADDC reserved)
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_2x16_arith_tb IS
END ENTITY;

ARCHITECTURE behavior OF ALU_2x16_arith_tb IS

    COMPONENT ALU_2x16
        PORT (
            a_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            b_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            c_in : IN STD_LOGIC;
            op_sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            r_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            z_out : OUT STD_LOGIC;
            v_out : OUT STD_LOGIC;
            c_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a_in_tb : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL b_in_tb : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL c_in_tb : STD_LOGIC := '0';
    SIGNAL op_sel_tb : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_out_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL z_out_tb : STD_LOGIC;
    SIGNAL v_out_tb : STD_LOGIC;
    SIGNAL c_out_tb : STD_LOGIC;

BEGIN

    UUT : ALU_2x16
    PORT MAP(
        a_in => a_in_tb,
        b_in => b_in_tb,
        c_in => c_in_tb,
        op_sel => op_sel_tb,
        r_out => r_out_tb,
        z_out => z_out_tb,
        v_out => v_out_tb,
        c_out => c_out_tb
    );

    stim_proc : PROCESS
    BEGIN
        -- SUB (0000): a_in - b_in
        op_sel_tb <= "0000";
        a_in_tb <= "0100";
        b_in_tb <= "0010";
        WAIT FOR 5 ns;
        a_in_tb <= "0010";
        b_in_tb <= "0100";
        WAIT FOR 5 ns;
        a_in_tb <= "1111";
        b_in_tb <= "1111";
        WAIT FOR 5 ns;
        a_in_tb <= "0000";
        b_in_tb <= "0001";
        WAIT FOR 5 ns;

        -- SUBC (0001): a_in - b_in - c_in (not implemented yet)
        -- op_sel_tb <= "0001";
        -- WAIT FOR 20 ns; -- Placeholder for future SUBC tests

        -- ADD (0010): a_in + b_in
        op_sel_tb <= "0010";
        a_in_tb <= "0001";
        b_in_tb <= "0001";
        WAIT FOR 5 ns;
        a_in_tb <= "1111";
        b_in_tb <= "0001";
        WAIT FOR 5 ns;
        a_in_tb <= "1000";
        b_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0000";
        b_in_tb <= "0000";
        WAIT FOR 5 ns;

        -- ADDC (0011): a_in + b_in + c_in (not implemented yet)
        -- op_sel_tb <= "0011";
        -- WAIT FOR 20 ns; -- Placeholder for future ADDC tests

        WAIT;
    END PROCESS;

END ARCHITECTURE;
