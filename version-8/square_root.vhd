LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start: IN STD_LOGIC;
		number:		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		ready:			OUT STD_LOGIC;
		root:			OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

TYPE state IS (idle, inicio, start_masc, computa, diff, teste, set_bit0, set_bit1, shift_masc);
SIGNAL cs, ns: state;

SIGNAL sub, reg_number, s: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL masc, r: STD_LOGIC_VECTOR ((n-1)/2 DOWNTO 0);

BEGIN

PROCESS (clk, reset)

BEGIN

	IF reset = '1' THEN
		cs <= idle;
	ELSIF clk'EVENT AND clk='1' THEN
		cs <= ns;
	END IF;
END PROCESS;

PROCESS (cs, start)
BEGIN
	CASE cs IS
		WHEN idle =>
			ready <= '0';
			IF start = '1' THEN
				ns <= inicio;
			ELSE
				ns <= idle;
			END IF;
		WHEN inicio =>
			reg_number <= number;
			r <= (OTHERS=>'0');
			masc <= (OTHERS=>'0');
			masc((n-1)/2) <= '1';
			ns <= start_masc;
		WHEN start_masc =>
		  r <= masc or r;
		  ns <= computa;		
		WHEN computa =>
			s <= r*r;
			ns <= diff;
		WHEN diff =>
		  sub <= reg_number - s;
		  ns <= teste;
		WHEN teste =>
			IF sub(n-1) = '1' THEN
				ns <= set_bit0;
			ELSE
				ns <= set_bit1;
			END IF;
	  WHEN set_bit1 =>
      IF masc = "0000" THEN
        root <= r;
        ready <= '1';
        ns <= idle;
      ELSE
        r <= masc or r;
        ns <= shift_masc;
      END IF;
		WHEN set_bit0 =>
			r <= not(masc) and r;
			ns <= shift_masc;
		WHEN shift_masc =>
		  masc <= '0' & masc((n-1)/2 DOWNTO 1);
		  ns <= start_masc;
	END CASE;
END PROCESS;

END behavioral;