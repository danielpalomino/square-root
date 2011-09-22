LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start:	IN STD_LOGIC;
		number:		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		ready:			OUT STD_LOGIC;
		root:			OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

SIGNAL en_number: STD_LOGIC;
SIGNAL r, s, d, sub: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL t: STD_LOGIC;

TYPE state IS (idle, inicio, computa0, computa1, teste, fim);
SIGNAL cs, ns: state;

BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		cs <= idle;
	ELSIF clk'EVENT AND clk='1' THEN
		cs <= ns;
	END IF;
END PROCESS;

PROCESS (clk)
BEGIN
	CASE cs IS
		WHEN idle =>
			IF start = '1' THEN
				ns <= inicio;
			ELSE
				ns <= idle;
			END IF;
		WHEN inicio =>
			ready <= '0';
			r <= "00000001";
			d <= "00000010";
			s <= "00000100";
			t <= '1';
			ns <= computa0;
		WHEN computa0 =>
			r <= r + 1;
			d <= d + 2;
			ns <= computa1;
		WHEN computa1 =>
			s <= s + d + 1;
			r <= r + 1;
			d <= d + 2;
			ns <= teste;
		WHEN teste =>
			sub <= number - s;
			t <= not(sub(n-1));
			IF t = '0' THEN
				ns <= fim;
			ELSE
				s <= s + d + 1;
				r <= r + 1;
				d <= d + 2;
				ns <= teste;
			END IF;
		WHEN fim =>
			r <= r - 2;
			root <= r((n-1)/2 DOWNTO 0);
			ready <= '1';
			ns <= idle;
	END CASE;
END PROCESS;	
	
END behavioral;