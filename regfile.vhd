library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity regfile is -- three-port register file

	port(clk:  in STD_LOGIC;
		we3:  in STD_LOGIC;
		ra1, ra2, wa3: in STD_LOGIC_VECTOR(1 downto 0);
		wd3:  in STD_LOGIC_VECTOR(7 downto 0);
		rd1, r2d2:  out STD_LOGIC_VECTOR(7 downto 0);
		reg_out0 : out STD_LOGIC_VECTOR(7 downto 0);
      reg_out1 : out STD_LOGIC_VECTOR(7 downto 0);
      reg_out2 : out STD_LOGIC_VECTOR(7 downto 0)
	);
end regfile;

architecture behave of regfile is

	type ramtype is array (2 downto 0) of
		STD_LOGIC_VECTOR(7 downto 0);
	signal mem: ramtype:= (others => "00000000");

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
		reg_out0 <= mem(0);
      reg_out1 <= mem(1);
      reg_out2 <= mem(2);
		
	end process;
end;
