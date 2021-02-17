 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 
 entity Ramos_Multiplexer is
	port ( S : in STD_LOGIC;
			 X : in STD_LOGIC;
			 Y : in STD_LOGIC;
			 M : out STD_LOGIC);
end Ramos_Multiplexer;

architecture arch of Ramos_Multiplexer is
begin
	M <= (X AND (NOT S)) OR (Y AND S);
end arch;