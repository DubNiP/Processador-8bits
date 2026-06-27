Library ieee; 
use ieee.std_logic_1164.all; 

entity InstructionMemory is
   port(A: in STD_LOGIC_VECTOR (2 downto 0);
        RD: out STD_LOGIC_VECTOR(8 downto 0));
end InstructionMemory;

architecture Instruct_Mem of InstructionMemory is
signal tmp: STD_LOGIC_VECTOR(8 downto 0);
begin

process(A)
begin
    if (A = "000") then
        tmp <= "101000101";
    elsif (A = "001") then
        tmp <= "101001010";
    elsif (A = "010") then
        tmp <= "010101001";
    elsif (A = "011") then
        tmp <= "000010110";
    elsif (A = "100") then
        tmp <= "011011010";
    elsif (A = "101") then
        tmp <= "001010100";
    elsif (A = "110") then
        tmp <= "100000110";
    end if;

    RD <= tmp;
end process;

end Instruct_Mem;