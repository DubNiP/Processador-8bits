library IEEE; use IEEE.STD_LOGIC_1164.all;
entity extend is
    port(
        Instr  : in  STD_LOGIC_VECTOR(1 downto 0);
        ExtImm : out STD_LOGIC_VECTOR(7 downto 0)  
    );
end;

architecture behave of extend is
begin
    ExtImm <= "000000" & Instr;
end;