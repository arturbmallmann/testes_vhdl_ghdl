library IEEE;
use ieee.std_logic_1164.all;
-- use ieee.numeric_bit.all;
use work.constantes.all;
use ieee.numeric_std.all;

-- similar a uma declaracao
entity test_bench_e is
-- teste bench nao usa entradas e saidas
end entity;

-- similar a uma definicao
architecture test_bench of test_bench_e is
	signal clock	: std_logic := '0';
	signal counter1 : std_ulogic_vector (N downto 0);
	signal counter2 : std_ulogic_vector (N downto 0);
	signal resultado : std_ulogic_vector (N+1 downto 0):=(others => '0');
	component somador_loop
	port(	A, B : in std_ulogic_vector(N downto 0);
		C	: out std_ulogic_vector(N+1 downto 0));
	end component;
begin
	clock <= not clock after 5 ns;
	process is
    		variable count : unsigned (N downto 0) := (others => '0');
	begin
		if count = "11111" then
			count := (others => '0');
		else
			count := count + 1;
		end if;
		counter1 <= STD_ULOGIC_VECTOR (count);
		report "Hello World";
		wait for 5 ns;
	end process;
	process is
		variable count2 : unsigned (N downto 0):=(others => '0');
	begin
		counter2 <= STD_ULOGIC_VECTOR(count2);
		-- counter2 <= std_ulogic_vector (count2);
		-- my_slv <= std_logic_vector(to_unsigned(my_int, my_slv'length));
		if count2 = "11111" then
			count2 := (others => '0');
		else
			count2 := count2 + 1;
		end if;
		wait for 80 ns;
	end process;

	som : somador_loop port map(
		A => counter1,
		B => counter2,
		C => resultado
		);
end test_bench ;
