Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

package Ramos_ALU_Components_Package is

    component Ramos_NBit_Add_Sub
    Port ( A, B                   : in std_logic_vector(31 downto 0);
           Cin                    : in std_logic;
           Opcode	            	 : in std_logic; -- Add when 0 / subtract when 1
           S                      : out std_logic_vector(31 downto 0);
           Cout                   : out std_logic;
           V_FLAG, Z_FLAG, N_FLAG : out std_logic);
    end component;
	 
	 component Ramos_Division_LPM
	 Port (
		denom		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		numer		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		quotient		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		remain		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	 );
	 end component;
	 
	 component Ramos_Multiply_LPM
	 Port
	 (
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
	 end component;
	 
    component Ramos_Bitwise_AND
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_NOR
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_OR
    port ( A, B   : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;

    component Ramos_Bitwise_LeftShift
    port ( Input  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;
    
    component Ramos_Bitwise_RightShift
    port ( A  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;

    component Ramos_Bitwise_RightShiftArith
    port ( A  : in std_logic_vector(31 downto 0);
           result : out std_logic_vector(31 downto 0));
    end component;

	component Ramos_Adder -- Adder to compute instruction addresses
	PORT(
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
	end component;


end Ramos_ALU_Components_Package;
