Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Bitwise_RightShift is 
port ( A  : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_RightShift;

architecture arch of Ramos_Bitwise_RightShift is
begin
    result <= to_stdlogicvector(to_bitvector(A) srl 1);
end arch;
