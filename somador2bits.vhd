library ieee;
use ieee.std_logic_1164.all;

-- declaraçao
entity somador2bits is 
	port(	A, B : in std_ulogic_vector(1 downto 0);
			C	: out std_ulogic_vector(2 downto 0));
end somador2bits;
-- definiçao
architecture som2b_imp of somador2bits is 
	component somador_completo
	port(	a , b , c : in std_logic;
			sum,carry : out std_logic);
	end component;

	signal carry : std_logic;
	
begin
	bit0 : somador_completo port map(
		a	=> A(0),
		b	=> B(0),
		c	=> '0', --carry in
		sum => C(0),
		carry => carry); -- carry out do somador no signal carry

	bit1 : somador_completo port map(
		a	=> A(1),
		b	=> B(1),
		c	=> carry, -- carry in do somador no signal carry
		sum	=> C(1),
		carry => C(2));
end som2b_imp;
