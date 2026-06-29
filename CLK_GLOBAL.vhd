library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity gerador_clocks is
    Port ( 
        clk_in   : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        clk_pc   : out STD_LOGIC; -- PC
        clk_reg  : out STD_LOGIC; -- Register File
        clk_mem  : out STD_LOGIC  -- Data Memory
    );
end gerador_clocks;

architecture Behavioral of gerador_clocks is
    signal contador : unsigned(1 downto 0);

begin
    process(clk_in, reset)
    begin
        if reset = '1' then
            contador <= "00";
        elsif rising_edge(clk_in) then
            contador <= contador + 1;
        end if;
    end process;

    clk_pc  <= '1' when contador = "00" else '0';
    
    clk_reg <= '1' when contador = "11" else '0';
    
    clk_mem <= '1' when contador = "10" else '0';

end Behavioral;