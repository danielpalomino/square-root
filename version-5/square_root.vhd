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

COMPONENT po IS
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

END COMPONENT;

COMPONENT pc IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start					: IN STD_LOGIC;
		t								: IN STD_LOGIC;
		en_start, en_t					: OUT STD_LOGIC;
		shift_r, shift_d, shift_s, shift_number			: OUT STD_LOGIC;
		mux_r, mux_d, mux_s, mux_t	: OUT STD_LOGIC;
		ready							: OUT STD_LOGIC		
	);
END COMPONENT;

SIGNAL t								: STD_LOGIC;
SIGNAL en_start, en_t					: STD_LOGIC;
SIGNAL shift_r, shift_d, shift_s, shift_number			: STD_LOGIC;
SIGNAL mux_r, mux_d, mux_s, mux_t	: STD_LOGIC;
BEGIN

PARTE_OPERATIVA: po GENERIC MAP (n) PORT MAP (
clk => clk,
reset => reset,
en_start => en_start,
en_t => en_t,
shift_r => shift_r,
shift_d => shift_d,
shift_s => shift_s,
shift_number => shift_number,
mux_r => mux_r,
mux_d => mux_d,
mux_s => mux_s,
mux_t => mux_t,
number => number,
t => t,
root => root
);

PARTE_CONTROLE: pc GENERIC MAP (n) PORT MAP(
clk => clk,
reset => reset,
start => start,
t => t,
en_start => en_start,
en_t => en_t,
shift_r => shift_r,
shift_d => shift_d,
shift_s => shift_s,
shift_number => shift_number,
mux_r => mux_r,
mux_d => mux_d,
mux_s => mux_s,
mux_t => mux_t,
ready => ready
);

END behavioral;