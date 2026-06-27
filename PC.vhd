library IEEE; use IEEE.STD_LOGIC_1164.all;
entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is
    
begin
    process(clk,reset)
    begin
        if(reset='1') then
                pc_out <= (others=>'0');
        elsif clk='1' then
                pc_out<=pc_in;
        end if;
    end process;

end Behavioral;