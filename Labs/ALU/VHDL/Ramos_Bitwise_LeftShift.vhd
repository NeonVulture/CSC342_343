Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Bitwise_LeftShift is 
port ( A  : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_LeftShift;

architecture arch of Ramos_Bitwise_LeftShift is
begin
    result <= to_stdlogicvector(to_bitvector(A) sll 1);
    --result <= shift_left(A, ); 
end arch;