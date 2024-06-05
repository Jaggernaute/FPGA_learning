-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity for Testbench
entity tb_switches is
end tb_switches;

-- Architecture for Testbench
architecture behavior of tb_switches is

  -- Component Declaration for the Unit Under Test (UUT)
  component switches
    port(
      A : in std_logic;
      B : in std_logic;
      S : out std_logic
    );
  end component;

  -- Signal declarations to connect to the UUT
  signal A : std_logic := '0';
  signal B : std_logic := '0';
  signal S : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: switches port map (
    A => A,
    B => B,
    S => S
  );

  -- Stimulus process to apply test vectors
  stim_proc: process
  begin
    -- Test case 1: A = '0', B = '0'
    A <= '0';
    B <= '0';
    wait for 10 ns;

    -- Test case 2: A = '0', B = '1'
    A <= '0';
    B <= '1';
    wait for 10 ns;

    -- Test case 3: A = '1', B = '0'
    A <= '1';
    B <= '0';
    wait for 10 ns;

    -- Test case 4: A = '1', B = '1'
    A <= '1';
    B <= '1';
    wait for 10 ns;

    -- End of simulation
    wait;
  end process;

end architecture behavior;

