 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 
 entity Ramos_2_1_Mux is
	port ( S : in STD_LOGIC;
			 in1 : in STD_LOGIC;
			 in2 : in STD_LOGIC;
			 out1 : out STD_LOGIC);
end Ramos_2_1_Mux;

architecture behavioral of Ramos_2_1_Mux is
begin
	out1 <= (in1 AND (NOT S)) OR (in2 AND S);
end behavioral;
