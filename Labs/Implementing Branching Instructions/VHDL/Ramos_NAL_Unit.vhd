Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.Ramos_Components_Package.ALL;

entity Ramos_NAL_Unit is -- A unit to compute the next address of the next instruction via BEQ, BNE, J MIPS instruction
	port ( Clock1, Clock2 : in std_logic;
			 Instruction : in std_logic_vector(31 downto 0); -- 32 Bit instruction 
			 PC_In : in std_logic_vector(31 downto 0);
			 InstrAddr : out std_logic_vector(31 downto 0));
end Ramos_NAL_Unit;

architecture arch of Ramos_NAL_Unit is

signal Opcode : std_logic_vector(5 downto 0); -- Do I need this?
signal Rs, Rt : std_logic_vector(4 downto 0); -- Registers address ports (indicies) of RS, Rt
signal Imm   : std_logic_vector(15 downto 0); -- 16 Bit Immediate
signal BusA, BusB : std_logic_vector(31 downto 0);-- Output data registers Rs and Rt to be compared
signal EqualCond : std_logic; -- Condition determining whether a branching occurs (i.e. PcSrc)
signal PC_Out : std_logic_vector(31 downto 0); -- 32 Bit register
signal ImmExt : std_logic_vector(31 downto 0); -- Signed Exetended 32-Bit Imm
signal Addr1, Addr2 : std_logic_vector(31 downto 0); -- For calculating the two possible Instruction Addresses
signal NextAddr : std_logic_vector(31 downto 0); -- Final Address to be chosen by 2-1 Mux

begin

-- Instruction Register to output Opcode, Rs, Rt Indicies, and Immediate field value
U0: Ramos_Instruction_Register port map(Instruction, Opcode, Rs, Rt, Imm);
-- Register File (values for CLK, WREN, RST, and Wraddress don't matter since we are not writing to any register) 
U1: Ramos_RegisterFile port map(Clock2, '0', '0', X"00000000", "00000", Rs, Rt, BusA, BusB);
-- Compare if BusA and BusB of Reg file are equal and set EqualCond flag accordingly
U2: Ramos_Comparator port map(BusA, BusB, EqualCond); 
-- Sign extend the 16-Bit Immediate field 
U3: Ramos_Sign_Zero_Ext port map (Imm, ImmExt); 
-- Program Counter (All that matters is Clock, PC_In are provided. WREN = RDEN = CHEN = 1)
U4: Ramos_32Bit_Register port map(Clock1, '1', '1', '1', PC_In, PC_Out);
-- Compute the two possible addresses
U5: Ramos_Adder port map(PC_Out, X"00000004", Addr1); -- PC + 4
U6: Ramos_Adder port map(Addr1, ImmExt, Addr2); -- PC + ImmExt + 4
-- Select the appropriate address and store it in NextAddr (Do I need to feed it to PC Reg Again?)
U7: Ramos_2to1_Mux port map(Addr1, Addr2, EqualCond, NextAddr); 
InstrAddr <= NextAddr; -- Address of next instruction
end arch;