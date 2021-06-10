LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.Ramos_CPU_Components.ALL;

entity Ramos_CPU is
	port(
			Clock : in std_logic;
			Result: out std_logic_vector(63 downto 0) -- 64-Bit ALU Result
		);
		
end Ramos_CPU;

architecture arch of Ramos_CPU is
	signal Opcode, Funct 			: std_logic_vector(5 downto 0);
	signal Rs, Rt, Rd, Shmat		: std_logic_vector(4 downto 0);
	signal Immediate					: std_logic_vector(15 downto 0);
	signal JumpAddr					: std_logic_vector(31 downto 0);
	-- Control Signals
	signal ExtOp, RegWr, RegDst, ALUSrc, MemWr, MemRd, MemToReg, Branch, Jump : std_logic;
	signal PCSrc : std_logic;
	signal ALUCtrl : std_logic_vector(3 downto 0);
	-- ALU signals
	signal Operand1, Operand2, ALUResultU, ALUResultL, BusB: std_logic_vector(31 downto 0);
	signal V_FLAG, Z_FLAG, N_FLAG, Cout : std_logic;
	-- Multiplexer Outputs
	signal Rw   : std_logic_vector(4 downto 0);
	signal BusW : std_logic_vector(31 downto 0);
	signal NextAddr : std_logic_vector(31 downto 0);
	-- Data Memory Signals
	signal MemDataOut : std_logic_vector(31 downto 0);
	-- Instruction Fetch Signals
	signal ImmExt, ImmExtShift : std_logic_vector(31 downto 0);	
	signal Addr1, Addr2 : std_logic_vector(31 downto 0);
	signal PC_Out : std_logic_vector(31 downto 0);
	signal CurrAddr,CurrAddrTemp : std_logic_vector(31 downto 0);
	
	begin
	-- Fetch and decode current instruction from Instruction Memory and set data paths via control unit
	PC: Ramos_PC_Register port map(Clock, CurrAddr, NextAddr);
	InstrMem: Ramos_Instruction_Memory port map(NextAddr, Opcode, Rs, Rt, Rd, Shmat, Funct, Immediate, JumpAddr); -- Decode instruction into fields
	CU: Ramos_Control_Unit port map(Opcode, Funct, ExtOp, ALUCtrl, RegWr, RegDst, ALUSrc, MemToReg, MemWr, Branch, Jump); -- Set all control signals
	-- Prepare instruction executing by selecting destination address and values of both operands
	M1: Ramos_2to1_Mux_5Bit port map(Rt, Rd, RegDst, Rw); -- If RegDst = 0, then Rw <= Rt, else Rw <= rd
	RefFile: Ramos_RegisterFile port map(Clock, RegWr, BusW, Rw, Rs, Rt, Operand1, BusB); -- Determine value of first operand1 and busB
	M2: Ramos_2to1_Mux port map(BusB, ImmExt, ALUSrc, Operand2); -- If ALUSrc = 0, then operand2 <= BusB, else operand2 <= ImmExt
	-- Execute Arithimetic Operation
	ALU: Ramos_ALU port map(ALUCtrl, Operand1, Operand2, ALUResultU, ALUResultL, V_FLAG, Z_FLAG, N_FLAG, Cout);
	PCSrc <= Branch AND Z_FLAG; -- Define PCSrc control signal
	-- Write to Data Memory
	DataMem: Ramos_DataMemory port map(Clock, MemWr, MemRd, BusB, ALUResultU, MemDataOut);
	M3: Ramos_2to1_Mux port map(ALUResultL, MemDataOut ,MemToReg, BusW); -- If MemToReg = 0, then BusW <= ALUResultL, else BusW <= MemDataOut
	-- Instruction Fetch Unit (Get address of next instrction)
	SZExt: Ramos_SignZero_Ext port map(Immediate, ExtOp, ImmExt); -- Compute the sign extended Imm. field
	ImmExtShift <= to_stdlogicvector(to_bitvector(ImmExt) sll 2); -- Multiply by 4 via shift ImmExt left by 2 (ImmExtShift <= ImmExt << 2)
	PC_Adder: Ramos_Adder port map(NextAddr, X"00000004", Addr1); -- Compute Addr1 <= PC + 4
	Branch_Adder: Ramos_Adder port map(Addr1, ImmExtShift, Addr2); -- Compute Branch address Addr2 <= PC+4+ImmExtShift
	M4: Ramos_2to1_Mux port map(Addr1, Addr2, PCSrc, CurrAddrTemp); -- If PCSrc <= 0, then NextAddr = Addr1, else NextAddr <= Addr2
	M5: Ramos_2to1_Mux port map(CurrAddrTemp, JumpAddr, Jump, PC_Out); -- If Jump = 0, then NextAddr = PC_Out, else NextAddr = JumpAddr
	Result(63 downto 32) <= ALUResultU;
	Result(31 downto 0) <= ALUResultL;
end arch;
