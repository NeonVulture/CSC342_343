Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_InstructionMemory is 
	generic (K:integer:=32; -- Number of bits per word
		 A:integer:=5); -- Number of address bits
	port(
	   clock: in std_logic;
	   wren : in std_logic :='0'; -- Set to 0 to initially read from memory :: Set 1 to initially write to memory
           data: in std_logic_vector(K-1 downto 0);
	   address: in std_logic_vector(A-1 downto 0);
	   q : out std_logic_vector(K-1 downto 0));
end Ramos_InstructionMemory;

architecture arch of Ramos_InstructionMemory is
   type mem is array(0 to 31) of std_logic_vector(K-1 downto 0);
   signal mem_array: mem;
   
   begin
   process(clock)
   begin
      if(clock'event and clock = '1') then
	 if (wren = '1') then -- Write TO memory
	    mem_array(to_integer(unsigned(address))) <= data;
	 elsif (wren = '0') then -- Read FROM memory
	    mem_array <= ( 0 => "00111100000000010001000000000001", -- lui MIPS Instruction 
							 1 => "00001000000100000000000000001100", -- j MIPS Instruction 
							 2 => "00000010001100101000000000100000", -- add MIPS Instruction 
							 3 => "00000010001100101000000000100010", -- sub MIPS Instruction 
							 4 => "00010110000100110000000000000010", -- bne MIPS Instruction 
						others =>"00000000000000000000000000000000"); 
 	    q <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	 end if;
       end if;
       q <= mem_array(to_integer(unsigned(address)));
    end process;

    
end arch;