library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all; 

entity dmem is 
    port(
        clk : in  STD_LOGIC;
        we  : in  STD_LOGIC;                     
        a   : in  STD_LOGIC_VECTOR(7 downto 0);   
        wd  : in  STD_LOGIC_VECTOR(7 downto 0);  
        rd  : out STD_LOGIC_VECTOR(7 downto 0);
	
		  ram_pos0 : out STD_LOGIC_VECTOR(7 downto 0);
        ram_pos1 : out STD_LOGIC_VECTOR(7 downto 0);
        ram_pos2 : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture behave of dmem is
    type ramtype is array (2 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal mem : ramtype := (
        0 => "00000001", 
        1 => "00000010", 
        2 => "00000011",
       
        others => "00000000" 
    );
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                mem(to_integer(unsigned(a))) <= wd;
            end if;
        end if;
    end process;

    rd <= mem(to_integer(unsigned(a)));
	 ram_pos0 <= mem(0);
    ram_pos1 <= mem(1);
    ram_pos2 <= mem(2);

end architecture;