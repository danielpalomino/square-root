LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY square_root IS
	GENERIC (n: INTEGER:=32);
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

r(0) <= conv_std_logic_vector(1,n);
d(0) <= conv_std_logic_vector(2,n);
s(0) <= conv_std_logic_vector(4,n);

GEN_ALG_0: FOR i IN 1 TO 1024 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_0 ;

GEN_ALG_1: FOR i IN 1025 TO 2048 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_1 ;

GEN_ALG_2: FOR i IN 2049 TO 3072 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_2 ;

GEN_ALG_3: FOR i IN 3073 TO 4096 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_3 ;

GEN_ALG_4: FOR i IN 4097 TO 5120 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_4 ;

GEN_ALG_5: FOR i IN 5121 TO 6144 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_5 ;

GEN_ALG_6: FOR i IN 6145 TO 7168 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_6 ;

GEN_ALG_7: FOR i IN 7169 TO 8192 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_7 ;

GEN_ALG_8: FOR i IN 8193 TO 9216 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_8 ;

GEN_ALG_9: FOR i IN 9217 TO 10240 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_9 ;

GEN_ALG_10: FOR i IN 10241 TO 11264 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_10 ;

GEN_ALG_11: FOR i IN 11265 TO 12288 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_11 ;

GEN_ALG_12: FOR i IN 12289 TO 13312 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_12 ;

GEN_ALG_13: FOR i IN 13313 TO 14336 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_13 ;

GEN_ALG_14: FOR i IN 14337 TO 15360 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_14 ;

GEN_ALG_15: FOR i IN 15361 TO 16384 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_15 ;

GEN_ALG_16: FOR i IN 16385 TO 17408 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_16 ;

GEN_ALG_17: FOR i IN 17409 TO 18432 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_17 ;

GEN_ALG_18: FOR i IN 18433 TO 19456 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_18 ;

GEN_ALG_19: FOR i IN 19457 TO 20480 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_19 ;

GEN_ALG_20: FOR i IN 20481 TO 21504 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_20 ;

GEN_ALG_21: FOR i IN 21505 TO 22528 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_21 ;

GEN_ALG_22: FOR i IN 22529 TO 23552 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_22 ;

GEN_ALG_23: FOR i IN 23553 TO 24576 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_23 ;

GEN_ALG_24: FOR i IN 24577 TO 25600 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_24 ;

GEN_ALG_25: FOR i IN 25601 TO 26624 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_25 ;

GEN_ALG_26: FOR i IN 26625 TO 27648 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_26 ;

GEN_ALG_27: FOR i IN 27649 TO 28672 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_27 ;

GEN_ALG_28: FOR i IN 28673 TO 29696 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_28 ;

GEN_ALG_29: FOR i IN 29697 TO 30720 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_29 ;

GEN_ALG_30: FOR i IN 30721 TO 31744 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_30 ;

GEN_ALG_31: FOR i IN 31745 TO 32768 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_31 ;

GEN_ALG_32: FOR i IN 32769 TO 33792 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_32 ;

GEN_ALG_33: FOR i IN 33793 TO 34816 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_33 ;

GEN_ALG_34: FOR i IN 34817 TO 35840 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_34 ;

GEN_ALG_35: FOR i IN 35841 TO 36864 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_35 ;

GEN_ALG_36: FOR i IN 36865 TO 37888 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_36 ;

GEN_ALG_37: FOR i IN 37889 TO 38912 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_37 ;

GEN_ALG_38: FOR i IN 38913 TO 39936 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_38 ;

GEN_ALG_39: FOR i IN 39937 TO 40960 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_39 ;

GEN_ALG_40: FOR i IN 40961 TO 41984 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_40 ;

GEN_ALG_41: FOR i IN 41985 TO 43008 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_41 ;

GEN_ALG_42: FOR i IN 43009 TO 44032 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_42 ;

GEN_ALG_43: FOR i IN 44033 TO 45056 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_43 ;

GEN_ALG_44: FOR i IN 45057 TO 46080 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_44 ;

GEN_ALG_45: FOR i IN 46081 TO 47104 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_45 ;

GEN_ALG_46: FOR i IN 47105 TO 48128 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_46 ;

GEN_ALG_47: FOR i IN 48129 TO 49152 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_47 ;

GEN_ALG_48: FOR i IN 49153 TO 50176 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_48 ;

GEN_ALG_49: FOR i IN 50177 TO 51200 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_49 ;

GEN_ALG_50: FOR i IN 51201 TO 52224 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_50 ;

GEN_ALG_51: FOR i IN 52225 TO 53248 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_51 ;

GEN_ALG_52: FOR i IN 53249 TO 54272 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_52 ;

GEN_ALG_53: FOR i IN 54273 TO 55296 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_53 ;

GEN_ALG_54: FOR i IN 55297 TO 56320 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_54 ;

GEN_ALG_55: FOR i IN 56321 TO 57344 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_55 ;

GEN_ALG_56: FOR i IN 57345 TO 58368 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_56 ;

GEN_ALG_57: FOR i IN 58369 TO 59392 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_57 ;

GEN_ALG_58: FOR i IN 59393 TO 60416 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_58 ;

GEN_ALG_59: FOR i IN 60417 TO 61440 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_59 ;

GEN_ALG_60: FOR i IN 61441 TO 62464 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_60 ;

GEN_ALG_61: FOR i IN 62465 TO 63488 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_61 ;

GEN_ALG_62: FOR i IN 63489 TO 64512 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_62 ;

GEN_ALG_63: FOR i IN 64513 TO 65536 GENERATE
	r(i) <= r(i-1) + conv_std_logic_vector(1,n);
	d(i) <= d(i-1) + conv_std_logic_vector(2,n);
	s(i) <= s(i-1) + d(i) + conv_std_logic_vector(1,n);
	t(i-1) <= reg_number - s(i-1);
END GENERATE GEN_ALG_63 ;

t(2**(n/2)) <= reg_number - s(2**(n/2));

out_mux(2**(n/2)) <= r(2**(n/2));

GEN_MUX_0: FOR i IN 1 TO 1023 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_0;

GEN_MUX_1: FOR i IN 1024 TO 2047 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_1;

GEN_MUX_2: FOR i IN 2048 TO 3071 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_2;

GEN_MUX_3: FOR i IN 3072 TO 4095 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_3;

GEN_MUX_4: FOR i IN 4096 TO 5119 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_4;

GEN_MUX_5: FOR i IN 5120 TO 6143 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_5;

GEN_MUX_6: FOR i IN 6144 TO 7167 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_6;

GEN_MUX_7: FOR i IN 7168 TO 8191 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_7;

GEN_MUX_8: FOR i IN 8192 TO 9215 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_8;

GEN_MUX_9: FOR i IN 9216 TO 10239 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_9;

GEN_MUX_10: FOR i IN 10240 TO 11263 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_10;

GEN_MUX_11: FOR i IN 11264 TO 12287 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_11;

GEN_MUX_12: FOR i IN 12288 TO 13311 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_12;

GEN_MUX_13: FOR i IN 13312 TO 14335 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_13;

GEN_MUX_14: FOR i IN 14336 TO 15359 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_14;

GEN_MUX_15: FOR i IN 15360 TO 16383 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_15;

GEN_MUX_16: FOR i IN 16384 TO 17407 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_16;

GEN_MUX_17: FOR i IN 17408 TO 18431 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_17;

GEN_MUX_18: FOR i IN 18432 TO 19455 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_18;

GEN_MUX_19: FOR i IN 19456 TO 20479 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_19;

GEN_MUX_20: FOR i IN 20480 TO 21503 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_20;

GEN_MUX_21: FOR i IN 21504 TO 22527 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_21;

GEN_MUX_22: FOR i IN 22528 TO 23551 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_22;

GEN_MUX_23: FOR i IN 23552 TO 24575 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_23;

GEN_MUX_24: FOR i IN 24576 TO 25599 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_24;

GEN_MUX_25: FOR i IN 25600 TO 26623 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_25;

GEN_MUX_26: FOR i IN 26624 TO 27647 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_26;

GEN_MUX_27: FOR i IN 27648 TO 28671 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_27;

GEN_MUX_28: FOR i IN 28672 TO 29695 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_28;

GEN_MUX_29: FOR i IN 29696 TO 30719 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_29;

GEN_MUX_30: FOR i IN 30720 TO 31743 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_30;

GEN_MUX_31: FOR i IN 31744 TO 32767 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_31;

GEN_MUX_32: FOR i IN 32768 TO 33791 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_32;

GEN_MUX_33: FOR i IN 33792 TO 34815 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_33;

GEN_MUX_34: FOR i IN 34816 TO 35839 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_34;

GEN_MUX_35: FOR i IN 35840 TO 36863 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_35;

GEN_MUX_36: FOR i IN 36864 TO 37887 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_36;

GEN_MUX_37: FOR i IN 37888 TO 38911 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_37;

GEN_MUX_38: FOR i IN 38912 TO 39935 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_38;

GEN_MUX_39: FOR i IN 39936 TO 40959 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_39;

GEN_MUX_40: FOR i IN 40960 TO 41983 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_40;

GEN_MUX_41: FOR i IN 41984 TO 43007 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_41;

GEN_MUX_42: FOR i IN 43008 TO 44031 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_42;

GEN_MUX_43: FOR i IN 44032 TO 45055 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_43;

GEN_MUX_44: FOR i IN 45056 TO 46079 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_44;

GEN_MUX_45: FOR i IN 46080 TO 47103 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_45;

GEN_MUX_46: FOR i IN 47104 TO 48127 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_46;

GEN_MUX_47: FOR i IN 48128 TO 49151 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_47;

GEN_MUX_48: FOR i IN 49152 TO 50175 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_48;

GEN_MUX_49: FOR i IN 50176 TO 51199 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_49;

GEN_MUX_50: FOR i IN 51200 TO 52223 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_50;

GEN_MUX_51: FOR i IN 52224 TO 53247 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_51;

GEN_MUX_52: FOR i IN 53248 TO 54271 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_52;

GEN_MUX_53: FOR i IN 54272 TO 55295 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_53;

GEN_MUX_54: FOR i IN 55296 TO 56319 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_54;

GEN_MUX_55: FOR i IN 56320 TO 57343 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_55;

GEN_MUX_56: FOR i IN 57344 TO 58367 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_56;

GEN_MUX_57: FOR i IN 58368 TO 59391 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_57;

GEN_MUX_58: FOR i IN 59392 TO 60415 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_58;

GEN_MUX_59: FOR i IN 60416 TO 61439 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_59;

GEN_MUX_60: FOR i IN 61440 TO 62463 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_60;

GEN_MUX_61: FOR i IN 62464 TO 63487 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_61;

GEN_MUX_62: FOR i IN 63488 TO 64511 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_62;

GEN_MUX_63: FOR i IN 64512 TO 65535 GENERATE
WITH t(i)(n-1) SELECT
out_mux(i)	<=	r(i)	WHEN '1',
			out_mux(i+1) WHEN OTHERS;
END GENERATE GEN_MUX_63;


END behavioral;
