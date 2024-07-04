-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
Entity switches is
  port(A, B   : in std_logic;
       S1, S2 : out std_logic);
end switches;

-- Architecture
architecture arch_sw1 of switches is
  
begin
  
  S1 <= A;
  S2 <= B;
  
end architecture arch_sw1;
