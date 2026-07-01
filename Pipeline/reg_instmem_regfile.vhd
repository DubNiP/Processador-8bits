library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_instmem_regfile is
  Port ( 
    clk  : in  STD_LOGIC;                    
    en   : in  STD_LOGIC;
    im   : in  STD_LOGIC_VECTOR(8 downto 0); 
    rf   : out STD_LOGIC_VECTOR(8 downto 0)  
  );
end reg_instmem_regfile;

architecture Behavioral of reg_instmem_regfile is
begin
  process(clk) begin
    if rising_edge(clk) then
      if en = '0' then
        rf <= im;
      end if;
    end if;
  end process;
end Behavioral;