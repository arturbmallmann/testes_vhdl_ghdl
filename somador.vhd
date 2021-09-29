library ieee;
use ieee.std_logic_1164.all;

entity somador_completo is
	port(	a , b , c : in std_logic;
			sum,carry : out std_logic);
end somador_completo;

architecture som_imp of somador_completo is
begin
	sum <= ( a xor b) xor c;
	carry <= (a and b) or (a and c) or (b and c);
end som_imp;
