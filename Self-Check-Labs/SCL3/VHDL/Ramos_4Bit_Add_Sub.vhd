LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ramos_4Bit_Add_Sub is
port(A, B       				 : in std_logic_vector(3 downto 0);
	   Cin         				 : in std_logic;
	   Opcode		  				 : in std_logic; -- Add when 0 / subtract when 1
     S          				 : out std_logic_vector(3 downto 0);
     Cout        				 : out std_logic);
end Ramos_4Bit_Add_Sub;

architecture structure of Ramos_4Bit_Add_Sub is
    signal C, Sum, Complement : std_logic_vector(3 downto 0);
	 component Ramos_1Bit_Adder_Comp is
			Port ( A, B : in STD_LOGIC;
					  Cin : in STD_LOGIC;
                 Sum : out STD_LOGIC;
                Cout : out STD_LOGIC);
	 end component;
    begin
	 Complement <= B when Opcode = '0' else (NOT(B)+1); 
    U0: Ramos_1Bit_Adder_Comp port map(A(0),Complement(0),Cin,Sum(0),C(0));
    U1: Ramos_1Bit_Adder_Comp port map(A(1),Complement(1),C(0),Sum(1),C(1));
    U2: Ramos_1Bit_Adder_Comp port map(A(2),Complement(2),C(1),Sum(2),C(2));
    U3: Ramos_1Bit_Adder_Comp port map(A(3),Complement(3),C(2),Sum(3),C(3));
	 Cout <= C(3);
	 S <= Sum;
end structure;
