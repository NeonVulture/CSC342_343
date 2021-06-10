Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Bitwise_RightShiftArith is 
port ( A  : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_RightShiftArith;

architecture arch of Ramos_Bitwise_RightShiftArith is
begin
    result <= to_stdlogicvector(to_bitvector(A) sra 1);
end arch;
