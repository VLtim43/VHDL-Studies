LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand3_tb IS
END nand3_tb;

ARCHITECTURE tb OF nand3_tb IS

    COMPONENT nand3
        PORT (
            A, B, C : IN STD_LOGIC;
            F : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A_s, B_s, C_s : STD_LOGIC := '0';
    SIGNAL F_s : STD_LOGIC;

    -- Function to convert STD_LOGIC to single-character STRING
    FUNCTION sl_to_str(s : STD_LOGIC) RETURN STRING IS
    BEGIN
        IF s = '0' THEN
            RETURN "0";
        ELSIF s = '1' THEN
            RETURN "1";
        ELSE
            RETURN "X"; -- For undefined cases
        END IF;
    END;

BEGIN

    UUT : nand3
    PORT MAP(
        A => A_s,
        B => B_s,
        C => C_s,
        F => F_s
    );

    STIM_PROC : PROCESS
        PROCEDURE print_state IS
        BEGIN
            REPORT sl_to_str(A_s) & sl_to_str(B_s) & sl_to_str(C_s) & " => " & sl_to_str(F_s);
        END PROCEDURE;
    BEGIN
        A_s <= '0';
        B_s <= '0';
        C_s <= '0';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '0';
        B_s <= '0';
        C_s <= '1';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '0';
        B_s <= '1';
        C_s <= '0';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '0';
        B_s <= '1';
        C_s <= '1';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '1';
        B_s <= '0';
        C_s <= '0';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '1';
        B_s <= '0';
        C_s <= '1';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '1';
        B_s <= '1';
        C_s <= '0';
        WAIT FOR 5 ns;
        print_state;
        A_s <= '1';
        B_s <= '1';
        C_s <= '1';
        WAIT FOR 5 ns;
        print_state;

        WAIT;
    END PROCESS;

END tb;
