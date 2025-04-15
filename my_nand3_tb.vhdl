ENTITY my_nand3_tb IS
END my_nand3_tb;

ARCHITECTURE tb OF my_nand3_tb IS

    COMPONENT my_nand3
        PORT (
            A, B, C : IN BIT;
            F : OUT BIT
        );
    END COMPONENT;

    SIGNAL A_s, B_s, C_s : BIT := '0';
    SIGNAL F_s : BIT;

    -- Function to convert BIT to single-character STRING
    FUNCTION bit_to_str(b : BIT) RETURN STRING IS
    BEGIN
        IF b = '0' THEN
            RETURN "0";
        ELSE
            RETURN "1";
        END IF;
    END;

BEGIN

    UUT : my_nand3
    PORT MAP(
        A => A_s,
        B => B_s,
        C => C_s,
        F => F_s
    );

    STIM_PROC : PROCESS
        PROCEDURE print_state IS
        BEGIN
            REPORT bit_to_str(A_s) & bit_to_str(B_s) & bit_to_str(C_s) & " => " & bit_to_str(F_s);
        END PROCEDURE;
    BEGIN
        A_s <= '0';
        B_s <= '0';
        C_s <= '0';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '0';
        B_s <= '0';
        C_s <= '1';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '0';
        B_s <= '1';
        C_s <= '0';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '0';
        B_s <= '1';
        C_s <= '1';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '1';
        B_s <= '0';
        C_s <= '0';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '1';
        B_s <= '0';
        C_s <= '1';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '1';
        B_s <= '1';
        C_s <= '0';
        WAIT FOR 10 ns;
        print_state;
        A_s <= '1';
        B_s <= '1';
        C_s <= '1';
        WAIT FOR 10 ns;
        print_state;

        WAIT;
    END PROCESS;

END tb;
