LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY pc IS
	PORT(
		clk, reset, ready, start: IN STD_LOGIC;
		start_po, en_r, en_s, en_d, en_t, en_s_neg: OUT STD_LOGIC;
		mux0, mux1: OUT STD_LOGIC_VECTOR (1 DOWNTO 0 )
	);

END pc;

ARCHITECTURE behavioral OF pc IS

TYPE state IS (idle, inicio, not_s, inc_s, diff, teste, computa_r, computa_d, computa_s0, computa_s1, fim);
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
			start_po <= '0';
			mux0 <= "00";
			mux1 <= "00";
			en_r <= '0';
			en_s <= '0';
			en_d <= '0';
			en_t <= '0';
			en_s_neg <= '0';
			IF (start = '1') THEN
				ns <= inicio;
			ELSE
				ns <= idle;
			END IF;
		WHEN inicio =>
			start_po <= '1';
			ns <= not_s;
		WHEN not_s =>
			start_po <= '0';
			en_s <= '0';
			en_s_neg <= '1';
			ns <= inc_s;
		WHEN inc_s =>
			en_s_neg <= '1';
			mux0 <= "11";
			mux1 <= "00";
			ns <= diff;
		WHEN diff =>
			en_s_neg <= '0';
			en_t <= '1';
			mux0 <= "11";
			mux1 <= "11";
			ns <= teste;
		WHEN teste =>
			en_t <= '0';
			IF ready = '0' THEN
				ns <= fim;
			ELSE
				ns <= computa_r;
			END IF;
		WHEN computa_r =>
			en_r <= '1';
			mux0 <= "00";
			mux1 <= "00";
			ns <= computa_d;
		WHEN computa_d =>
			en_r <= '0';
			en_d <= '1';
			mux0 <= "01";
			mux1 <= "01";
			ns <= computa_s0;
		WHEN computa_s0 =>
			en_d <= '0';
			en_s <= '1';
			mux0 <= "10";
			mux1 <= "10";
			ns <= computa_s1;
		WHEN computa_s1 =>
			en_s <= '1';
			mux0 <= "10";
			mux1 <= "00";
			ns <= not_s;
		WHEN fim =>
			en_r <= '0';
			ns <= idle;
	END CASE;
	
END PROCESS;
	
END behavioral;