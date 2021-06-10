LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.Ramos_Full_Adder_Package.ALL;

entity Ramos_NBit_Add_Sub is
    generic ( n : integer:= 2); -- Default case
    Port ( A, B                   : in std_logic_vector(n-1 downto 0);
           Cin                    : in std_logic;
           Opcode		  : in std_logic; -- Add when 0 / subtract when 1
           S                      : out std_logic_vector(n-1 downto 0);
           Cout                   : out std_logic);
end Ramos_NBit_Add_Sub;

architecture arch of Ramos_NBit_Add_Sub is
signal C, Sum, Complement : std_logic_vector(n-1 downto 0);
begin
	Complement <= B when Opcode = '0' else (NOT(B)+1); 
   U: Ramos_1Bit_Adder_Comp port map(A(0),Complement(0),Cin,Sum(0),C(0)); -- First iteration
   N_Add_Sub_Loop: for i in 1 to n-1 generate
       N_Add_Sub: Ramos_1Bit_Adder_Comp port map(A(i),Complement(i),C(i-1),Sum(i),C(i)); 
	end generate N_Add_Sub_Loop;
	
	Cout <= C(n-1);
	S <= Sum;
end arch;
