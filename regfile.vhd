library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity regfile is -- three-port register file

	port(clk:  in STD_LOGIC;
		we3:  in STD_LOGIC;
		ra1, ra2, wa3: in STD_LOGIC_VECTOR(1 downto 0);
		wd3:  in STD_LOGIC_VECTOR(7 downto 0);
		rd1, r2d2:  out STD_LOGIC_VECTOR(7 downto 0));
	
end;

architecture behae of regfile is

	type ramtype is array (7 downto 0) of
		STD_LOGIC_VECTOR(7 downto 0);
	signal mem: ramtype;

begin

	process(clk) begin
	if rising_edge(clk) then
		if we3 = '1' then mem(to_integer(unsigned(wa3))) <= wd3;
		end if;
	end if;
	end process;
	process(ra1, ra2, mem) begin
		
		rd1 <= mem(to_integer(unsigned(ra1)));
		r2d2 <= mem(to_integer(unsigned(ra2)));
		
	end process;
end;
