LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY po IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset:				IN STD_LOGIC;
		en_start, en_t:			IN STD_LOGIC;
		shift_r, shift_d, shift_s, shift_number:	IN STD_LOGIC;
		mux_r, mux_d, mux_s, mux_t: 	IN STD_LOGIC;
		number:				IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		t:						OUT STD_LOGIC;
		root:					OUT STD_LOGIC_VECTOR ((n-1)/2 DOWNTO 0)
	);

END po;

ARCHITECTURE behavioral OF po IS

COMPONENT full_adder IS
	PORT(
		a, b, cin:	IN STD_LOGIC;
		s, cout:		OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL cin_r, cin_d, cin_s, cin_t: STD_LOGIC;
SIGNAL reg_cout_r, reg_cout_d, reg_cout_s, reg_cout_t: STD_LOGIC;
SIGNAL r, d, s, reg_number, cons_one, cons_two: STD_LOGIC_VECTOR(n-1 DOWNTO 0);
SIGNAL s_r, s_d, s_s, s_t: STD_LOGIC;
SIGNAL cout_r, cout_d, cout_s, cout_t: STD_LOGIC;
SIGNAL not_s: STD_LOGIC;

BEGIN

PROCESS (clk, reset)

BEGIN
	IF reset = '1' THEN
		reg_number <= (OTHERS=>'0');
		t <= '0';
		root <= (OTHERS=>'0');
		r <= (OTHERS=>'0');
		d <= (OTHERS=>'0');
		s <= (OTHERS=>'0');
		reg_cout_r <= '0';
		reg_cout_d <= '0';
		reg_cout_s <= '0';
		reg_cout_t <= '0';
		cons_one <= (OTHERS=>'0');
		cons_two <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_cout_r <= cout_r;
		reg_cout_d <= cout_d;
		reg_cout_s <= cout_s;
		reg_cout_t <= cout_t;
		IF en_start = '1' THEN
			reg_number <= number;
			r <= conv_std_logic_vector(1,n);
			d <=conv_std_logic_vector(2,n);
			s <= conv_std_logic_vector(4,n);
			cons_one <= conv_std_logic_vector(1,n);
			cons_two <= conv_std_logic_vector(2,n);
		END IF;
		IF shift_r = '1' THEN
			r <= s_r & r(n-1 DOWNTO 1);
			cons_one <= cons_one(0) & cons_one(n-1 DOWNTO 1);
		END IF;
		IF shift_d = '1' THEN
			d <= s_d & d(n-1 DOWNTO 1);
			cons_two <= cons_two(0) & cons_two(n-1 DOWNTO 1);
		END IF;
		IF shift_s = '1' THEN
			s <= s_s & s(n-1 DOWNTO 1);
		END IF;
		IF shift_number = '1' THEN
		  reg_number <= reg_number(0) & reg_number(n-1 DOWNTO 1);
		END IF;
		IF en_t = '1' THEN
			t <= s_t;
			root <= r((n-1)/2 DOWNTO 0);
		END IF;
		
	END IF;
END PROCESS;

WITH mux_r SELECT
cin_r	<=	reg_cout_r	WHEN '0',
			'0'		WHEN OTHERS;

WITH mux_d SELECT
cin_d	<=	reg_cout_d	WHEN '0',
			'0'		WHEN OTHERS;

WITH mux_s SELECT
cin_s	<= reg_cout_s	WHEN '0',
			'1'		WHEN OTHERS;
			
WITH mux_t SELECT
cin_t	<=	reg_cout_t	WHEN '0',
			'1'		WHEN OTHERS;

COMPUTA_R: full_adder PORT MAP (
a => r(0),
b => cons_one(0),
cin => cin_r,
s => s_r,
cout => cout_r
);

COMPUTA_D: full_adder PORT MAP (
a => d(0),
b => cons_two(0),
cin => cin_d,
s => s_d,
cout => cout_d
);

COMPUTA_S: full_adder PORT MAP (
a => s(0),
b => d(n-1),-- sada do computa_d
cin => cin_s,
s => s_s,
cout => cout_s
);

TESTE: full_adder PORT MAP (
a => reg_number(0),
b => not_s,
cin => cin_t,
s => s_t,
cout => cout_t
);

not_s <= not(s(n-1));

END behavioral;