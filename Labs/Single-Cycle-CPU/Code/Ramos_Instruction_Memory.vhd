-- Get instruction and decode a 32-bit MIPS instructions into the respective elements (Opcode, Rt, Rd, Funct, Shmat, Imm) 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Ramos_Instruction_Memory is
    port( 
          InstrAddress : in std_logic_vector(31 downto 0); -- 32 Bit instruction address from (PC Register) 
	    	  Opcode       : out std_logic_vector(5 downto 0); -- 6 bit Opcode
          Rs, Rt, Rd   : out std_logic_vector(4 downto 0); -- 5 Bit addresses
          Shmat        : out std_logic_vector(4 downto 0); -- 5 Bit shift ammount (for sll & srl)
		      Funct        : out std_logic_vector(5 downto 0); -- 6 Bit Function code (for R-Type Instructions)
			    Immediate    : out std_logic_vector(15 downto 0); -- 16 Bit Immediate
			    Jump_Address : out std_logic_vector(31 downto 0)); -- Effective Jump Address
end Ramos_Instruction_Memory;

architecture arch of Ramos_Instruction_Memory is 
type mem is array(0 to 127) of std_logic_vector(31 downto 0);
   signal mem_array: mem;
   signal Instruction : std_logic_vector(31 downto 0);
   begin
   
	-- Machine code for MIPS program begins here
	-- Each address is incremented by 4
	mem_array(0) <= X"20100007"; -- addu $s0, $zero, 7
  mem_array(4) <= X"20110007"; -- addu $s1, $zero, 7
	mem_array(8) <= X"02309021"; -- addu $s2, $s1, $s0
	mem_array(12) <= X"02119823"; -- subu $s3, $s0, $s1 
	mem_array(16) <= X"12130002"; -- beq $s0, $s3, L2
	mem_array(20) <= X"02300018"; -- mult $s1, $s0 
	mem_array(24) <= X"08100008"; -- j L1
	mem_array(28) <= X"0230001A"; -- div $s1, $s0
	mem_array(32) <= X"02508021"; -- addu, $s0, $s2, $s0
	-- Machine code for MIPS program ends here
 	    
	
        Instruction <= mem_array(to_integer(unsigned(InstrAddress)));
	
	-- Decode Instruction into necessary fields
	Opcode <= Instruction(31 downto 26); 
	Rs <= Instruction(25 downto 21);
	Rt <= Instruction(20 downto 16);
	Rd <= Instruction(15 downto 11);
	Shmat <= Instruction(10 downto 6);
	Funct <= Instruction(5 downto 0);
	Immediate <= Instruction(15 downto 0);
	Jump_Address <= InstrAddress(31 downto 28) & Instruction(25 downto 0) & "00";
	
end arch;
