library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_1Bit_Adder_Comp is
    Port ( A, B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Ramos_1Bit_Adder_Comp;


architecture LogicFunc of Ramos_1Bit_Adder_Comp is
	signal S1, CO1, CO2 : std_logic;
	component Ramos_Half_Adder is
		port( A, B : in std_logic;
				S, C : out std_logic);
	end component;
	begin
	U0: Ramos_Half_Adder port map(A, B, S1, CO1);
	U1: Ramos_Half_Adder port map(S1, Cin, Sum, CO2);
   Cout <= CO1 OR CO2;
end LogicFunc;
