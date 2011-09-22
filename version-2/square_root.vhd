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

SIGNAL reg_number, r, d, s: STD_LOGIC_VECTOR(n-1 DOWNTO 0);

TYPE state IS (idle, inicio, diff, teste, computa0, computa1, fim);
SIGNAL cs, ns: state;

SIGNAL sub: STD_LOGIC_VECTOR (n-1 DOWNTO 0);

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
			reg_number <= (OTHERS=>'0');
			r <= (OTHERS=>'0');
			d <= (OTHERS=>'0');
			s <= (OTHERS=>'0');
			root <= (OTHERS=>'0');
			ready <= '0';
			IF (start = '1') THEN
				ns <= inicio;
			ELSE
				ns <= idle;
			END IF;
		WHEN inicio =>
			reg_number <= number;
			r <= "00000001";
			d <= "00000010";
			s <= "00000100";
			ns <= teste;
		WHEN diff =>
			sub <= (reg_number) - (s);
		WHEN teste =>
			IF sub(n-1)='1' THEN
				ns <= fim;
			ELSE
				ns <= computa0;
			END IF;
		WHEN computa0 =>
			r <= r + 1;
			d <= d + 2;
			ns <= computa1;
		WHEN computa1 =>
			s <= s + d + 1;
			ns <= teste;
		WHEN fim =>
			root <= r ((n-1)/2 DOWNTO 0);
			ready <= '1';
			ns <= idle;
	END CASE;
END PROCESS;	
	
END behavioral;