library IEEE; use IEEE.STD_LOGIC_1164.all;

---Decoder, ele recebe Op e Funct para definir se é aritmetica/logica OU ldr/str



entity decoder is ---main control decoder

    port(
    Op: in STD_LOGIC;
    Funct: in STD_LOGIC_VECTOR(1 downto 0);
    RegW, MemW: out STD_LOGIC;
    MemtoReg, ALUSrc: out STD_LOGIC;
    RegSrc: out STD_LOGIC;
    ALUControl: out STD_LOGIC_VECTOR(1 downto 0)
    );
end decoder;

architecture behave of decoder is

    signal controls: STD_LOGIC_VECTOR(5 downto 0);
    signal ALUOp: STD_LOGIC;
    signal op2: STD_LOGIC_VECTOR(2 downto 0);
begin
    op2 <= (Op & Funct(1) & Funct(0));
    process(op2) begin --- Main Decoder
    case (op2) is                       
        when "101" => controls <= "111010";  --str
        when "111" => controls <= "111010";  --str
        when "100" => controls <= "111100";  --ldr
        when "110" => controls <= "111100";  --ldr
        when others => controls <= "000101";
    end case;
    end process;
    
    
    RegSrc   <= controls(5);
   ALUSrc   <= controls(4);
   MemtoReg <= controls(3);
   RegW     <= controls(2);
   MemW     <= controls(1);
   ALUOp    <= controls(0);
    process(ALUOp, Funct) begin --- ALU Decoder
    if (ALUOp = '1') then
        case funct(1 downto 0) is
            when "10" => ALUControl <= "10"; --- ADD
            when "11" => ALUControl <= "11"; --- SUB
            when "01" => ALUControl <= "01"; --- AND
            when "00" => ALUControl <= "00"; --- ORR
            when others => ALUControl <= "00";
        end case;
    else
        ALUControl <= "10";
    end if;
    end process;
end behave;