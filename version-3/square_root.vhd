LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start:	IN STD_LOGIC;
		number:		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		root:			OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS


BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		
	ELSIF clk'EVENT AND clk='1' THEN
		
	END IF;
END PROCESS;
	
END behavioral;