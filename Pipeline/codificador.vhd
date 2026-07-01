library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity codificador is
port(
	x0, x1, x2, x3: in std_logic;
	F0, F1, F2, F3, F4, F5, F6: out std_logic
);
end codificador;
architecture GATE_LEVEL of codificador is
	begin
		F0 <= not((x3 and not(x2) and not(x1)) or (not(x3) and x2 and x0) or (not(x0) and not(x2)) or (x3 and not(x0)) or (x2 and x1) or (not (x3) and (x1)));
		F1 <= not((not(x3) and not(x1) and not(x0)) or (not(x3) and x1 and x0) or (x3 and not(x1)and x0) or (not (x3) and not (x2)) or (not(x2) and not(x0)));
		F2 <= not((not(x3) and x2) or ((x3) and not (x2)) or (not(x1) and (x0)) or (not (x3) and not (x1)) or (not(x3) and x0));
		F3 <= not(((x2) and not(x1) and x0) or ((x3) and not (x1)) or (not(x3) and not (x2) and not(x0)) or (not (x2) and (x1) and x0) or (x2 and x1 and not(x0)));
		F4 <= not((not(x2) and not(x0)) or ((x3) and (x2)) or (x1 and not(x0)) or (x3 and x1));
		F5 <= not((not(x3) and x2 and not(x1)) or ((x3) and not(x2)) or (not (x1) and not(x0)) or (x3 and x1) or (not (x0) and x2));
		F6 <= not((x1 and not(x0)) or (x3 and not(x2)) or (x3 and x0) or (not(x2) and x1) or (not(x3) and x2 and not(x1)));
	end GATE_LEVEL;
	