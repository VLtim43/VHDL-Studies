library ieee;
use ieee.std_logic_1164.all;

entity hello is
end entity;

architecture behav of hello is
begin
  process
  begin
    report "Hello, World!";
    wait;
  end process;
end architecture;


