library IEEE; use IEEE.STD_LOGIC_1164.all;use IEEE.NUMERIC_STD.all;
entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable : in STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (2 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is
    
begin
    process(clk,reset, enable)
    begin
		if (enable = '1') then
			  if(reset='1') then
						 pc_out <= (others=>'0');
			  elsif rising_edge(clk) then
						 pc_out <= std_logic_vector(unsigned(pc_in) + 1);         
			  end if;
		end if;
    end process;

end Behavioral;


   