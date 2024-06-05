-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity
Entity switches is
  port(A, B: in std_logic;
       S   : out std_logic);
end switches;

-- Architecture
architecture arch_sw1 of switches is
  
begin
  
  S <= A and B;
  
end architecture arch_sw1;
