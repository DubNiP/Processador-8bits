library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all; 

entity dmem is 
    port(
        clk : in  STD_LOGIC;
        we  : in  STD_LOGIC;                      -- 1 para gravar, 0 para ler
        a   : in  STD_LOGIC_VECTOR(7 downto 0);   
        wd  : in  STD_LOGIC_VECTOR(7 downto 0);   -- escrita
        rd  : out STD_LOGIC_VECTOR(7 downto 0)    -- leitura
    );
end entity;

architecture behave of dmem is
    type ramtype is array (255 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal mem : ramtype := (others => (others => '0')); 
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

end architecture;