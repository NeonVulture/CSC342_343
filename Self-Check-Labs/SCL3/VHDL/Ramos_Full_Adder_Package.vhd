-- This package contains component declarations for the following:
-- * Half Adder
-- * 1-Bit Full Adder
-- * 4-Bit Full Adder
-- * 4-Bit Full Adder/Subtractor

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

package Ramos_Full_Adder_Package is
	component Ramos_Half_Adder
		port( A, B : in std_logic;
				S, C : out std_logic);
	end component;

	component Ramos_1Bit_Adder_Comp
		Port ( A, B : in STD_LOGIC;
				  Cin : in STD_LOGIC;
              Sum : out STD_LOGIC;
             Cout : out STD_LOGIC);
	end component;
	
	component Ramos_4Bit_Full_Adder
		Port ( A, B          : in std_logic_vector(3 downto 0);
           Carry_In        : in std_logic;
           S               : out std_logic_vector(3 downto 0);
           Carry_Out       : out std_logic);
	end component;
	
	component Ramos_4Bit_Add_Sub
		Port ( A, B       : in std_logic_vector(3 downto 0);
				 Cin        : in std_logic;
				 Opcode		: in std_logic;
				 S          : out std_logic_vector(3 downto 0);
             Cout       : out std_logic);
	end component;
	
end Ramos_Full_Adder_Package;
