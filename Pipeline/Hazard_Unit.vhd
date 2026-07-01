	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.numeric_std.ALL;
	  
	entity Hazard_Unit is
		port ( RA1E: in STD_LOGIC_VECTOR(1 downto 0);
				 RA2E: in STD_LOGIC_VECTOR(1 downto 0);
				 WA3M: in STD_LOGIC_VECTOR(1 downto 0);
				 WA3W: in STD_LOGIC_VECTOR(1 downto 0);
				 RegWriteM: in std_logic;
				 RegWriteW: in std_logic;
				 RA1D: in STD_LOGIC_VECTOR(1 downto 0);
				 RA2D: in STD_LOGIC_VECTOR(1 downto 0);
				 WA3E: in STD_LOGIC_VECTOR(1 downto 0);
				 MemtoRegE: in std_logic;
				 ForwardAE: out STD_LOGIC_VECTOR(1 downto 0);
				 ForwardBE: out STD_LOGIC_VECTOR(1 downto 0);
				 FlushE: out std_logic;
				 StallD: out std_logic;
				 StallF: out std_logic);

		end Hazard_Unit;
	  
	architecture Match of Hazard_Unit is
	  
	signal tmpF1: STD_LOGIC_VECTOR(1 downto 0);
	signal tmpF2: STD_LOGIC_VECTOR(1 downto 0);
	signal tmpS: std_logic := '0';
	
	begin
	  
	process(RA1E, RA2E, WA3M, WA3W, WA3E, RA1D, RA2D, RegWriteM, RegWriteW, MemtoRegE)
		
		begin
		
		-- Forward logic
	if ((RA1E = WA3M) and (RegWriteM = '1')) then
        tmpF1 <= "10";
    elsif ((RA1E = WA3W) and (RegWriteW = '1')) then
        tmpF1 <= "01";
    else 
        tmpF1 <= "00";
    end if;

    -- 2. Lógica de Forwarding B
    if ((RA2E = WA3M) and (RegWriteM = '1')) then
        tmpF2 <= "10";
    elsif ((RA2E = WA3W) and (RegWriteW = '1')) then
        tmpF2 <= "01";
    else 
        tmpF2 <= "00";
    end if;
		
		-- Stall logic
		if (((RA1D = WA3E) or (RA2D = WA3E)) and MemtoRegE = '1') then
			tmpS <= '1';
		else 
			tmpS <= '0';
		end if;
		
	end process;
	ForwardAE <= tmpF1;
	ForwardBE <= tmpF2;
	FlushE <= tmpS;
   StallD <= tmpS;
   StallF <= tmpS;
	 
	end Match;