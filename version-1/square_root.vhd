LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset: 	IN STD_LOGIC;
		number:	IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		root:		OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

BEGIN

PROCESS (clk, reset)
VARIABLE r,d,s,t: INTEGER;
BEGIN

	IF reset = '1' THEN
		
	ELSIF clk'EVENT AND clk='1' THEN
		r:=1;
		d:=2;
		s:=4;
		t:=1;
		WHILE t=1 LOOP
			r:=r+1;
			d:=d+2;
			s:=s+d+1;
			IF s > conv_integer(number) THEN
				t:=0;
			ELSE
				t:=1;
			END IF;
		END LOOP;
		root<= conv_std_logic_vector(r,(n/2));
	END IF;

END PROCESS;
	
	
END behavioral;