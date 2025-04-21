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
        -- Test ADD operation (op_sel = "0010")
        op_sel_tb <= "0010";
        c_in_tb <= '0';

        -- 1) 00000000 + 00000000 = 00000000 (zero flag = 1, overflow = 0)
        a_in_tb <= "00000000";
        b_in_tb <= "00000000";
        WAIT FOR 5 ns;

        -- 2) 00000001 + 00000001 = 00000010 (zero flag = 0, overflow = 0)
        a_in_tb <= "00000001";
        b_in_tb <= "00000001";
        WAIT FOR 5 ns;

        -- 3) 01111111 + 00000001 = 10000000 (overflow = 1)
        a_in_tb <= "01111111";
        b_in_tb <= "00000001";
        WAIT FOR 5 ns;

        -- 4) 11111111 + 00000001 = 00000000 (wrap around, zero = 1)
        a_in_tb <= "11111111";
        b_in_tb <= "00000001";
        WAIT FOR 5 ns;

        -- 5) 10000000 + 10000000 = 00000000 (overflow = 1)
        a_in_tb <= "10000000";
        b_in_tb <= "10000000";
        WAIT FOR 5 ns;

        WAIT;
    END PROCESS;

END ARCHITECTURE;
