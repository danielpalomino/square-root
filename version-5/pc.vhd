LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY pc IS
	GENERIC (n: INTEGER:=8);
	PORT(
		clk, reset, start					: IN STD_LOGIC;
		t								: IN STD_LOGIC;
		en_start, en_t					: OUT STD_LOGIC;
		shift_r, shift_d, shift_s, shift_number			: OUT STD_LOGIC;
		mux_r, mux_d, mux_s, mux_t	: OUT STD_LOGIC;
		ready							: OUT STD_LOGIC		
	);
END pc;

ARCHITECTURE behavioral OF pc IS

TYPE state IS (idle, inicio, start_rd, start_s, start_t, computa, teste);
SIGNAL cs, ns: state;
SIGNAL flag: STD_LOGIC;

BEGIN

PROCESS (clk, reset)
BEGIN
	IF reset = '1' THEN
		cs <= idle;
		flag <= '0';
	ELSIF clk'EVENT AND clk='1' THEN
		cs <= ns;
		flag <= not flag;
	END IF;
END PROCESS;

PROCESS (cs, start, flag)
VARIABLE cont: INTEGER;
BEGIN
	CASE cs IS
		WHEN idle =>
			cont:=0;
			en_start <= '0';
			en_t <= '0';
			shift_r <= '0';
			shift_d <= '0';
			shift_s <= '0';
			shift_number <= '0';
			mux_r <= '0';
			mux_d <= '0';
			mux_s <= '0';
			mux_t <= '0';
			ready <= '0';
			IF start = '1' THEN
				ns <= inicio;
			ELSE
				ns <= idle;
			END IF;
		WHEN inicio =>
			en_start <= '1';
			ns <= start_rd;
		WHEN start_rd =>
			cont:= 0;
			en_start <= '0';
			mux_r <= '1';
			mux_d <= '1';
			shift_r <= '1';
			shift_d <= '1';
			ns <= start_s;
		WHEN start_s =>
			cont:= cont + 1;
			shift_s <= '1';
			mux_r <= '0';
			mux_d <= '0';
			mux_s <= '1';
			ns <= start_t;
		WHEN start_t =>
			cont:= cont + 1;		
			shift_number <= '1';	
			mux_s <= '0';
			mux_t <= '1';
			ns <= computa;
		WHEN computa =>
			cont:= cont + 1;
			mux_t <= '0';
			IF cont = 8 THEN
			  shift_r <= '0';
			  shift_d <= '0';
				ns <= computa;
			ELSIF cont = 9 THEN
			  shift_s <= '0';
			  en_t <= '1';
			  ns <= computa;
			ELSIF cont = 10 THEN
			  shift_number <= '0';
			  en_t <= '0';
			  ns <= teste;			
			ELSE
				ns <= computa;
			END IF;
		WHEN teste =>
			IF t = '0' THEN
				ns <= start_rd;
			ELSE
				ready <= '1';
				ns <= idle;
			END IF;
	END CASE;
			

END PROCESS;
	
END behavioral;