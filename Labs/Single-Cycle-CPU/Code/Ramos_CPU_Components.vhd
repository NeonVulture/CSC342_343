Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

package Ramos_CPU_Components is

component Ramos_Instruction_Memory
	port( 
          InstrAddress : in std_logic_vector(31 downto 0); -- 32 Bit instruction address from (PC Register) 
	    	 Opcode       : out std_logic_vector(5 downto 0); -- 6 bit Opcode
          Rs, Rt, Rd   : out std_logic_vector(4 downto 0); -- 5 Bit addresses
          Shmat        : out std_logic_vector(4 downto 0); -- 5 Bit shift ammount (for sll & srl)
		    Funct        : out std_logic_vector(5 downto 0); -- 6 Bit Function code (for R-Type Instructions)
			 Immediate    : out std_logic_vector(15 downto 0); -- 16 Bit Immediate
			 Jump_Address : out std_logic_vector(31 downto 0)); -- Effective Jump Address
end component;

component Ramos_Control_Unit
	port(
        Opcode   : in std_logic_vector(5 downto 0); -- 6 Bit Opcode from 32 Bit instruction
        Funct    : in std_logic_vector(5 downto 0); -- 6 Bit function field
        -- Control Signals 
		  ExtOp	: out std_logic;
		  ALUCtrl: out std_logic_vector(3 downto 0);
		  RegWr  : out std_logic;
	     RegDst : out std_logic; -- 0 => Rt ; 1 => Rd
        ALUSrc : out std_logic; -- 0 => BusB ; 1 => ImmExt
        MemToReg : out std_logic;
        MemWr : out std_logic;
        Branch : out std_logic;
		  Jump  : out std_logic);
end component;

component Ramos_2to1_Mux_5Bit
	port ( D0, D1 : in STD_LOGIC_VECTOR(4 downto 0);
			 SEL	  : in STD_LOGIC;
			 OUT1   : out STD_LOGIC_VECTOR(4 downto 0));
end component;

component Ramos_2to1_Mux
	port ( D0, D1 : in STD_LOGIC_VECTOR(31 downto 0);
			 SEL	  : in STD_LOGIC;
			 OUT1   : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component Ramos_RegisterFile
	port(
	   Clock: in std_logic;
	   RegWr : in std_logic; 
      BusW : in std_logic_vector(31 downto 0);
	   Rw  : in std_logic_vector(4 downto 0);
	   Ra : in std_logic_vector(4 downto 0);
	   Rb : in std_logic_vector(4 downto 0);
	   BusA : out std_logic_vector(31 downto 0);
	   BusB : out std_logic_vector(31 downto 0));
end component;

component Ramos_ALU
	port(
        ALUCtrl    : in std_logic_vector(3 downto 0); -- Input comes from ALUControl
        Operand1   : in std_logic_vector(31 downto 0); -- BusA 
        Operand2   : in std_logic_vector(31 downto 0); -- BusB  or ImmExt
	     ALUResultU : out std_logic_vector(31 downto 0); -- Upper 32-Bit Result (For Mult and Div only!)
		  ALUResultL : out std_logic_vector(31 downto 0); -- Lower 32-Bit Result
        V_FLAG, Z_FLAG, N_FLAG, Cout : out std_logic); -- ALU Output flags
end component;

component Ramos_DataMemory
	port(
	   clock: in std_logic;
	   MemWr : in std_logic; -- Control signal
	   MemRd : in std_logic; -- Control signal
      dataWr: in std_logic_vector(31 downto 0);
	   address: in std_logic_vector(31 downto 0);
	   dataRd : out std_logic_vector(31 downto 0));
end component;

component Ramos_SignZero_Ext
	port( A     : in std_logic_vector(15 downto 0);
			 ExtOp : in std_logic;
          Output: out std_logic_vector(31 downto 0));
end component;

component Ramos_PC_Register
	port (   
          Clock: in std_logic; 
			 PC_In : in std_logic_vector(31 downto 0);
			 PC_Out : out std_logic_vector(31 downto 0));
end component;

component Ramos_Adder
	Port(
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

end Ramos_CPU_Components;
