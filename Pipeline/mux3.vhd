library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3 is
    Port (
        dado_cima  : in  STD_LOGIC_VECTOR(7 downto 0);
        dado_meio  : in  STD_LOGIC_VECTOR(7 downto 0);
        dado_baixo : in  STD_LOGIC_VECTOR(7 downto 0);
        sel        : in  STD_LOGIC_VECTOR(1 downto 0);
        saida      : out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux3;

architecture Behavioral of mux3 is
begin
    process(dado_cima, dado_meio, dado_baixo, sel)
    begin
        case sel is
            when "00"   => saida <= dado_cima;
            when "01"   => saida <= dado_meio;
            when "10"   => saida <= dado_baixo;
            when others => saida <= (others => '0');
        end case;
    end process;
end Behavioral;