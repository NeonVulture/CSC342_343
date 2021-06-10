Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
entity Ramos_Bitwise_LeftShift is 
port ( Input  : in std_logic_vector(31 downto 0);
       --Shamt  : in std_logic_vector(4 downto 0);
       result : out std_logic_vector(31 downto 0));
end Ramos_Bitwise_LeftShift;

architecture arch of Ramos_Bitwise_LeftShift is
begin
    result <= to_stdlogicvector(to_bitvector(Input) sll 1);
    --result <= Input(25 downto 0) & "00";
end arch;
