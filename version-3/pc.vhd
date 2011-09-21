LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY pc IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset: IN STD_LOGIC;
		start, en_r, en_s, en_d, en_t, en_s_neg: OUT STD_LOGIC;
		mux0, mux1: OUT STD_LOGIC_VECTOR (1 DOWNTO 0 )
	);

END pc;

ARCHITECTURE behavioral OF pc IS

TYPE state IS (idle, inicio, not_s,

BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		
	ELSIF clk'EVENT AND clk='1' THEN
		
	END IF;
END PROCESS;

PROCESS (clk)
BEGIN
	CASE cs IS
		WHEN idle =>
			start <= '0';
			mux0 <= '0';
			mux1 <= '0';
			en_r <= '0';
			en_s <= '0';
			en_d <= '0';
			en_t <= '0';
			en_s_neg <= '0';
			IF 
		WHEN inicio =>

END PROCESS;
	
END behavioral;