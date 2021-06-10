Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

package Ramos_Components_Package is

component Ramos_Adder -- Adder to compute instruction addresses
	PORT(
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component Ramos_2to1_Mux -- 2 to 1 (32 Bit) multiplexer to select address
    port ( D0, D1 : in STD_LOGIC_VECTOR(31 downto 0);
		   SEL	  : in STD_LOGIC;
		   OUT1   : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component Ramos_Comparator -- 32 Bit comparator (compares contents of BusA and BusB data lines) 
    PORT(
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		aeb		: OUT STD_LOGIC );
end component;

component Ramos_32Bit_Register -- 32 Bit Register for PC
    port ( Ramos_CLK  : in std_logic;
           Ramos_WREN : in std_logic;
           Ramos_RDEN : in std_logic;
           Ramos_CHEN : in std_logic;
           Ramos_DATA : in std_logic_vector(31 downto 0);
           Ramos_Curr_PC : out std_logic_vector(31 downto 0));
end component;


component Ramos_RegisterFile -- 
	port( clock: in std_logic;
	      wren : in std_logic; 
	      rst  : in std_logic;
         data : in std_logic_vector(31 downto 0);
	      waddress  : in std_logic_vector(4 downto 0);
	      raddress1 : in std_logic_vector(4 downto 0);
	      raddress2 : in std_logic_vector(4 downto 0);
	      q1 : out std_logic_vector(31 downto 0);
	      q2 : out std_logic_vector(31 downto 0));
end component;

component Ramos_Instruction_Register
	port( Instruction : in std_logic_vector(31 downto 0); 
			 Opcode : out std_logic_vector(5 downto 0); -- 6 bit Opcode
          Rs, Rt : out std_logic_vector(4 downto 0); -- 5 Bit addresses
			 Immediate : out std_logic_vector(15 downto 0)); -- 16 Bit Immediate
end component;

component Ramos_Sign_Zero_Ext
    port( A     : in std_logic_vector(15 downto 0);
          Output: out std_logic_vector(31 downto 0));
end component;

end package;