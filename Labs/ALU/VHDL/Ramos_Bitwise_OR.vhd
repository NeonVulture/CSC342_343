Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

entity Ramos_Bitwise_OR is 
port ( A, B   : in std_logic_vector(31 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_OR;

architecture arch of Ramos_Bitwise_OR is
begin
    result <= A OR B;
end arch;