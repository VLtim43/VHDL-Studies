-- File: inverter.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverter is
    Port (
        a : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end inverter;

architecture behavior of inverter is
begin
    y <= not a;
end behavior;
