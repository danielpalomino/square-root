LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start:	IN STD_LOGIC;
		number:		IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		pronto:			OUT STD_LOGIC;
		root:			OUT STD_LOGIC_VECTOR((n-1)/2 DOWNTO 0)
	);

END square_root;

ARCHITECTURE behavioral OF square_root IS

COMPONENT po  IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start: IN STD_LOGIC;
		en_r, en_s, en_d, en_t, en_s_neg: IN STD_LOGIC;
		number: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		mux0, mux1: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		ready: OUT STD_LOGIC;
		root: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
	);

END COMPONENT;

COMPONENT pc IS
	PORT(
		clk, reset, ready, start: IN STD_LOGIC;
		start_po, en_r, en_s, en_d, en_t, en_s_neg, pronto: OUT STD_LOGIC;
		mux0, mux1: OUT STD_LOGIC_VECTOR (1 DOWNTO 0 )
	);

END COMPONENT;

SIGNAL reg_number, temp_root: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
SIGNAL start_po, en_r, en_s, en_d, en_t, en_s_neg, ready: STD_LOGIC;
SIGNAL mux0, mux1: STD_LOGIC_VECTOR (1 DOWNTO 0 );

BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_number <= (OTHERS=>'0');
		root <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_number <= number;
		root <= temp_root((n-1)/2 DOWNTO 0);
	END IF;
END PROCESS;

PARTE_OPERATIVA: po GENERIC MAP (n) PORT MAP (
clk => clk,
reset => reset,
start => start_po,
en_r => en_r,
en_s => en_s,
en_d => en_d,
en_t => en_t,
en_s_neg => en_s_neg,
number => reg_number,
mux0 => mux0,
mux1 => mux1,
ready => ready,
root => temp_root
);

PARTE_CONTROLE: pc PORT MAP (
clk => clk,
reset => reset,
ready => ready,
start => start,
start_po => start_po,
en_r => en_r,
en_s => en_s,
en_d => en_d,
en_t => en_t,
en_s_neg => en_s_neg,
pronto => pronto,
mux0 => mux0,
mux1 => mux1
);
	
END behavioral;