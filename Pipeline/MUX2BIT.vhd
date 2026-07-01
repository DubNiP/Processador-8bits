library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2BIT is
    Port (
        A    : in  STD_LOGIC_VECTOR(1 downto 0); 
        B    : in  STD_LOGIC_VECTOR(1 downto 0); 
        C  : in  STD_LOGIC;                    
        S    : out STD_LOGIC_VECTOR(1 downto 0)  
    );
end MUX2BIT;

architecture Behavioral of MUX2BIT is
begin
    process(A, B, C)
    begin
        if C = '0' then
            S <= A;
        else
            S <= B;
        end if;
    end process;
end Behavioral;