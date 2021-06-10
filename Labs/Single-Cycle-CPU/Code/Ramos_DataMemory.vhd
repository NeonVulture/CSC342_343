Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_DataMemory is 
	port(
	   clock: in std_logic;
	   MemWr : in std_logic; -- Control signal
	   MemRd : in std_logic; -- Control signal
	   dataWr : in std_logic_vector(31 downto 0); 
	   address: in std_logic_vector(31 downto 0);
	   dataRd : out std_logic_vector(31 downto 0));
	end Ramos_DataMemory;

architecture arch of Ramos_DataMemory is
   signal MemAddr : std_logic_vector(31 downto 0);
   type mem is array(0 to 63) of std_logic_vector(31 downto 0);
   signal mem_array: mem :=((others => (others=> '0')));
   
   begin
   MemAddr <= address(31 downto 0);
   process(clock)
   begin
      if(rising_edge(Clock)) then
			if (MemWr = '1') then -- Write to memory
				mem_array(to_integer(unsigned(MemAddr))) <= dataWr;
			
			end if;
      end if;
   end process;
	dataRd <= mem_array(to_integer(unsigned(MemAddr))) when (MemRd ='1') else x"00000000"; -- Read from memory
    
end arch;
