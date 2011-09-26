LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset:		IN STD_LOGIC;
		number:		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		root:			OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

TYPE vetor IS ARRAY (0 TO 2**(n/2)) OF STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL r, d, s, t ,out_mux: vetor;

SIGNAL reg_number: STD_LOGIC_VECTOR (n-1 DOWNTO 0);

BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_number <= (OTHERS=>'0');
		root <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_number <= number;
		root <= out_mux(0) ((n-1)/2 DOWNTO 0);
	END IF;
END PROCESS;

r(0) <= "00000001";
d(0) <= "00000010";
s(0) <= "00000100";

GEN_ALG: FOR i IN 1 TO 2**(n/2) GENERATE
	r(i) <= r(i-1) + "00000001";
	d(i) <= d(i-1) + "00000010";
	s(i) <= s(i-1) + d(i) + "00000001";
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG;

t(2**(n/2)) <= reg_number - s(2**(n/2));

out_mux(2**(n/2)) <= r(2**(n/2));

GEN_MUX: FOR i IN 0 TO (2**(n/2))-1 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i) <= 	r(i)	WHEN '1',
				out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX;

END behavioral;