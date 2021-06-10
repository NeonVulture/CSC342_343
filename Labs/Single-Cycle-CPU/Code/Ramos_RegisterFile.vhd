Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Ramos_RegisterFile is 
	port(
	   Clock: in std_logic;
	   RegWr : in std_logic; 
     BusW : in std_logic_vector(31 downto 0);
	   Rw  : in std_logic_vector(4 downto 0);
	   Ra : in std_logic_vector(4 downto 0);
	   Rb : in std_logic_vector(4 downto 0);
	   BusA : out std_logic_vector(31 downto 0);
	   BusB : out std_logic_vector(31 downto 0)
	);
end Ramos_RegisterFile;

architecture arch of Ramos_RegisterFile is
   type reg is array(0 to 31) of std_logic_vector(31 downto 0);
   signal reg_array: reg;
   	begin
   	
	process(Clock, RegWr)
   begin 
	--BusA <= reg_array(to_integer(unsigned(Ra)));
	--BusB <= reg_array(to_integer(unsigned(Rb)));
	if (rising_edge(Clock)) then 
		if (RegWr = '1') then
			reg_array(to_integer(unsigned(Rw))) <= BusW;
		end if;
		
	end if;
  	end process;
	
	BusA <= X"00000000" when Ra = "00000" else reg_array(to_integer(unsigned(Ra)));
  BusB <= X"00000000" when Rb = "00000" else reg_array(to_integer(unsigned(Rb)));
    
    
end arch;
