Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Ramos_PC_Register is 
	port (   
          Clock: in std_logic; 
			 PC_In : in std_logic_vector(31 downto 0);
			 PC_Out : out std_logic_vector(31 downto 0));
end Ramos_PC_Register;

architecture arch of Ramos_PC_Register is 
signal temp: std_logic_vector(31 downto 0);
begin
    process(Clock, PC_In)
    begin
        if (rising_edge(Clock)) then
            temp <= PC_In; 
        end if;
    end process;
    PC_Out <= temp;
end arch;
