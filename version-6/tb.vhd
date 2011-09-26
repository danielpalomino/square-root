LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT square_root
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         number : IN  std_logic_vector(7 downto 0);
         root : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal number : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal root : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: square_root PORT MAP (
          clk => clk,
          reset => reset,
          number => number,
          root => root
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
		reset <= '1';
      wait for 20ns;
		reset <= '0';
		number <= "00011001";
		wait for 20ns;
		number <= "00101001";
		wait for 20ns;
    number <= "01000000";
    wait for 20ns;
    number <= "01101111";

      wait;
   end process;

END;
