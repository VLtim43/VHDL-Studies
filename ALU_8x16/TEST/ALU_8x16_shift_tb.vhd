-- File: ALU_2x16_cout_tb.vhd
-- This tests the c_out behavior for rotate and shift operations
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_2x16_cout_tb IS
END ENTITY;

ARCHITECTURE behavior OF ALU_2x16_cout_tb IS

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
        b_in_tb <= "XXXX";

        -- RL (1000): 
        op_sel_tb <= "1000";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0111";
        WAIT FOR 5 ns;

        -- RR (1001): 
        op_sel_tb <= "1001";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0001";
        WAIT FOR 5 ns;

        -- RLC (1010): 
        op_sel_tb <= "1010";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0111";
        WAIT FOR 5 ns;

        -- RRC (1011): 
        op_sel_tb <= "1011";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0001";
        WAIT FOR 5 ns;

        -- SLL (1100): 
        op_sel_tb <= "1100";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0111";
        WAIT FOR 5 ns;

        -- SRL (1101): 
        op_sel_tb <= "1101";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0001";
        WAIT FOR 5 ns;

        -- SRA (1110): 
        op_sel_tb <= "1110";
        a_in_tb <= "1000";
        WAIT FOR 5 ns;
        a_in_tb <= "0001";
        WAIT FOR 5 ns;

        WAIT;
    END PROCESS;

END ARCHITECTURE;
