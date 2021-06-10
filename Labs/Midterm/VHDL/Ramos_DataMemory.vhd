Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_DataMemory is 
	generic (K:integer:=32; -- Number of buts per word
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
	 if (wren = '1') then -- Write TO memory
	    mem_array(to_integer(unsigned(address))) <= data;
	 elsif (wren = '0') then -- Read FROM memory
	    mem_array <= ( 0 => "00000000000001000000000010000000",
			   1 => "00000000000000000000000100010011",
			   2 => "00100000000011000000000000000010",
			   3 => "00000000000000000000000000000011",
			   4 => "00000000000111000000000010000100",
			   others =>"00000000000000000000000000000000");
 	    q <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	 end if;
       end if;
       q <= mem_array(to_integer(unsigned(address)));
    end process;

    
end arch;

process(