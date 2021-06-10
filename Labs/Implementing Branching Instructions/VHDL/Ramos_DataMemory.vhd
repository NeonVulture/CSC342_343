Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_DataMemory is 
	generic (K:integer:=32; -- Number of bits per word
		 A:integer:=5); -- Number of address bits
	port(
	   clock: in std_logic;
	   wren : in std_logic :='0'; -- Set to 0 to initially read from memory :: Set 1 to initially write to memory
       data: in std_logic_vector(K-1 downto 0);
	   address: in std_logic_vector(A-1 downto 0);
	   q : out std_logic_vector(K-1 downto 0));
end Ramos_DataMemory;

architecture arch of Ramos_DataMemory is
   type mem is array(0 to 15) of std_logic_vector(K-1 downto 0);
   signal mem_array: mem;
   
   begin
   process(clock)
   begin
    if(clock'event and clock = '1') then
        if (wren = '1') then
            mem_array(to_integer(unsigned(address))) <= data;
        end if;
    end if;
    end process;
    
    q <= mem_array(to_integer(unsigned(address)));
    
end arch;