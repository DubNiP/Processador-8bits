library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_datamem is
  Port ( 
    clk       : in   STD_LOGIC;                    
	 
	 MemRegIN  : in   STD_LOGIC;
	 RegWriIN  : in   STD_LOGIC;
	 RDIN      : in   STD_LOGIC_VECTOR(7 downto 0);
	 ULAIN     : in   STD_LOGIC_VECTOR(7 downto 0);
	 bibitsIN  : in   STD_LOGIC_VECTOR(1 downto 0);

	 MemRegOUT : out  STD_LOGIC;
	 RegWriOUT : out  STD_LOGIC;
	 RDOUT     : out  STD_LOGIC_VECTOR(7 downto 0);
	 ULAOUT    : out  STD_LOGIC_VECTOR(7 downto 0);
	 bibitsOUT : out  STD_LOGIC_VECTOR(1 downto 0)
  );
end reg_datamem;

architecture Behavioral of reg_datamem is
begin
  process(clk) begin
    if rising_edge(clk) then
      MemRegOUT <= MemRegIN;
      RegWriOUT <= RegWriIN;
		RDOUT     <= RDIN;
      ULAOUT    <= ULAIN;
      bibitsOUT <= bibitsIN;      
                          
    end if;
  end process;
end Behavioral;