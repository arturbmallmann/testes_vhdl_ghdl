library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constantes.all;
-- use work.somador_completo.all;
-- declaraçao
entity somador_loop is 
	port(	A, B : in std_ulogic_vector(N downto 0);
			C	: out std_ulogic_vector(N+1 downto 0));
	end somador_loop;
-- definiçao
architecture som2b_imp of somador_loop is 
	component somador_completo
	port(	a , b , c : in std_logic;
			sum,carry : out std_logic);
	end component;

	-- signal carry : std_logic;
	-- signal carry: std_ulogic_vector(10 downto 0); NAO FUNCIONOU
	signal carry: std_logic_vector(N+1 downto 0);

	constant first : integer := 0;
	constant f1 : std_logic := '0';
begin
--	C(0) <=  first; -- atribui 0 ao primeiro bit de carry in
	-- C(0) <= '0';
	-- C(0) <= f1;
	carry(0) <= f1;
	C(N+1) <= carry(N+1); --no puede ser depues

	bits_for : for i in 0 to N generate
		bit1 : somador_completo port map(
			a	=> A(i),
			b	=> B(i),
			c	=> carry(i), -- carry in do somador no signal carry
			sum	=> C(i),
			-- carry => C(i+1)
			carry => carry(i+1)
			);
	end generate;
end som2b_imp;
