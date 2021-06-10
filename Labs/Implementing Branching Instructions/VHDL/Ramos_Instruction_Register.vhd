-- Instruction Register (IR) 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Ramos_Instruction_Register is
    port( Instruction : in std_logic_vector(31 downto 0); 
			 Opcode : out std_logic_vector(5 downto 0); -- 6 bit Opcode
          Rs, Rt : out std_logic_vector(4 downto 0); -- 5 Bit addresses
			 Immediate : out std_logic_vector(15 downto 0)); -- 16 Bit Immediate
end Ramos_Instruction_Register;

architecture arch of Ramos_Instruction_Register is 
begin

Opcode <= Instruction(31 downto 26); -- Needed?
Rs <= Instruction(25 downto 21);
Rt <= Instruction(20 downto 16);
Immediate <= Instruction(15 downto 0);
	
end arch;