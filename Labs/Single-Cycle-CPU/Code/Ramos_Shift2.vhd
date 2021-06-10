Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Shift2 is 
port ( PC_In  : in std_logic_vector(31 downto 0);
       PC_Shift : out std_logic_vector(31 downto 0));
end Ramos_Shift2;

architecture arch of Ramos_Shift2 is
begin
    PC_Shift <= to_stdlogicvector(to_bitvector(PC_In) sll 2);
end arch;
