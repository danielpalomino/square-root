LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY full_adder IS
	PORT(
		a, b, cin:	IN STD_LOGIC;
		s, cout:		OUT STD_LOGIC
	);
END full_adder;

ARCHITECTURE behavioral OF full_adder IS

BEGIN

s <= a xor b xor cin;
cout <= (a and b) or (a and cin) or (b and cin);
	
END behavioral;