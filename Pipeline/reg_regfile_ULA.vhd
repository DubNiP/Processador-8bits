library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_regfile_ULA is
  Port ( 
    clk       : in   STD_LOGIC;                    
    clr       : in   STD_LOGIC;
	 
	 MemRegIN  : in   STD_LOGIC;
	 MemWriIN  : in   STD_LOGIC;
	 RegWriIN  : in   STD_LOGIC;
	 AluCtlIN  : in   STD_LOGIC_VECTOR(1 downto 0);
	 AluSrcIN  : in   STD_LOGIC;
	 rd1IN     : in   STD_LOGIC_VECTOR(7 downto 0);
	 r2d2IN    : in   STD_LOGIC_VECTOR(7 downto 0);
	 bibitsIN  : in   STD_LOGIC_VECTOR(1 downto 0);
    extIN     : in   STD_LOGIC_VECTOR(7 downto 0); 
	 RA1D		  : in   STD_LOGIC_VECTOR(1 downto 0); 
	 RA2D		  : in   STD_LOGIC_VECTOR(1 downto 0); 
	 
	 MemRegOUT : out  STD_LOGIC;
	 MemWriOUT : out  STD_LOGIC;
	 RegWriOUT : out  STD_LOGIC;
	 AluCtlOUT : out  STD_LOGIC_VECTOR(1 downto 0);
	 AluSrcOUT : out  STD_LOGIC;
	 rd1OUT    : out  STD_LOGIC_VECTOR(7 downto 0);
	 r2d2OUT   : out  STD_LOGIC_VECTOR(7 downto 0);
	 bibitsOUT : out  STD_LOGIC_VECTOR(1 downto 0);
    extOUT    : out  STD_LOGIC_VECTOR(7 downto 0);
	 RA1E		  : out   STD_LOGIC_VECTOR(1 downto 0); 
	 RA2E		  : out   STD_LOGIC_VECTOR(1 downto 0)
  );
end reg_regfile_ULA;

architecture Behavioral of reg_regfile_ULA is
begin
  process(clk) begin
    if rising_edge(clk) then
      if clr = '1' then
        MemRegOUT <= '0';
        MemWriOUT <= '0';
        RegWriOUT <= '0';
        AluCtlOUT <= (others => '0');
        AluSrcOUT <= '0';
        rd1OUT    <= (others => '0');
        r2d2OUT   <= (others => '0');
        bibitsOUT <= (others => '0');
        extOUT    <= (others => '0');
		  RA1E <= (others => '0');
		  RA2E <= (others => '0');
		  
      else
        MemRegOUT <= MemRegIN;
        MemWriOUT <= MemWriIN;
        RegWriOUT <= RegWriIN;
        AluCtlOUT <= AluCtlIN;
        AluSrcOUT <= AluSrcIN;
        rd1OUT    <= rd1IN;
        r2d2OUT   <= r2d2IN;
        bibitsOUT <= bibitsIN;
        extOUT    <= extIN;       
		  RA1E <= RA1D;
		  RA2E <= RA2D;
                          
      end if;
    end if;
  end process;
end Behavioral;