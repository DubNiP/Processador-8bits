library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_ULA_datamem is
  Port ( 
    clk       : in   STD_LOGIC;                    
	 
	 MemRegIN  : in   STD_LOGIC;
	 MemWriIN  : in   STD_LOGIC;
	 RegWriIN  : in   STD_LOGIC;
	 ULAIN     : in   STD_LOGIC_VECTOR(7 downto 0);
	 StrIN     : in   STD_LOGIC_VECTOR(7 downto 0);
	 bibitsIN  : in   STD_LOGIC_VECTOR(1 downto 0);

	 MemRegOUT : out  STD_LOGIC;
	 MemWriOUT : out  STD_LOGIC;
	 RegWriOUT : out  STD_LOGIC;
	 ULAOUT    : out  STD_LOGIC_VECTOR(7 downto 0);
	 StrOUT    : out  STD_LOGIC_VECTOR(7 downto 0);
	 bibitsOUT : out  STD_LOGIC_VECTOR(1 downto 0)
  );
end reg_ULA_datamem;

architecture Behavioral of reg_ULA_datamem is
begin
  process(clk) begin
    if rising_edge(clk) then
      MemRegOUT <= MemRegIN;
      MemWriOUT <= MemWriIN;
      RegWriOUT <= RegWriIN;
      ULAOUT    <= ULAIN;
      StrOUT    <= StrIN;
      bibitsOUT <= bibitsIN;      
                          
    end if;
  end process;
end Behavioral;