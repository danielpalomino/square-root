LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8)
	PORT(
		clk, reset: 	IN STD_LOGIC;
		n: 			IN STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

BEGIN

PROCESS
	
	
END behavioral;