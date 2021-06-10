LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Half_Adder is
	port( A, B : in std_logic;
			S, C : out std_logic);
end Ramos_Half_Adder;

architecture arch of Ramos_Half_Adder is
begin
-- Process P1 defines the Sum
P1: process (A,B)
	begin
		S <= A XOR B;
	end process; 
-- Process P2 deines the Carry
P2: process (A,B)
	begin
		C <= A AND B;
	end process;
end arch;
