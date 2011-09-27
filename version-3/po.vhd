LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY po IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start: IN STD_LOGIC;
		en_r, en_s, en_d, en_t, en_s_neg: IN STD_LOGIC;
		number: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		mux0, mux1: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		mux_s: IN STD_LOGIC;
		ready: OUT STD_LOGIC;
		root: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	);

END po;

ARCHITECTURE behavioral OF po IS

SIGNAL op0, op1: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL resultado: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL r, s, d, s_neg, s_temp: STD_LOGIC_VECTOR (n-1 DOWNTO 0);

BEGIN

	PROCESS (clk, reset)
	BEGIN
		IF reset = '1' THEN
			r <= (OTHERS=>'0');
			s <= (OTHERS=>'0');
			d <= (OTHERS=>'0');
			s_neg <= (OTHERS=>'0');
			ready <= '0';
		ELSIF clk'EVENT AND clk = '1' THEN
			IF (start = '1') THEN
				r <= conv_std_logic_vector(1,n);
				d <= conv_std_logic_vector(2,n);
				s <= conv_std_logic_vector(4,n);
			ELSE
				IF en_r = '1' THEN
					r <= resultado;
				ELSIF en_s = '1' THEN
					s <= resultado;
				ELSIF en_d = '1' THEN
					d <= resultado;
				ELSIF en_t = '1' THEN
					ready <= resultado(n-1);
				ELSIF en_s_neg = '1' THEN
					s_neg <= resultado;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	WITH mux_s SELECT
	s_temp <= s WHEN '0',
	     not s WHEN OTHERS;
	
	WITH mux0 SELECT
	op0 <=	r		WHEN "00",
			d		WHEN "01",
			s_temp		WHEN "10",
			s_neg	WHEN OTHERS;
	
	WITH mux1 SELECT
	op1 <=	conv_std_logic_vector(1,n)	WHEN "00",
			conv_std_logic_vector(2,n)	WHEN "01",
			d			WHEN "10",
			number 	WHEN OTHERS;
	
	resultado <= op0 + op1;
	
	root <= r;
	
END behavioral;