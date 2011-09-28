import os

gen = 'GEN_ALG: FOR i IN 1 TO ' + lim + ' GENERATE\n'
r = '\tr(i) <= r(i-1) + conv_std_logic_vector(1,n);\n'
d = '\td(i)
