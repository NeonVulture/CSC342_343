LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Ramos_1Bit_Adder_Package.ALL;

entity Ramos_4Bit_Full_Adder is
port(A, B             : std_logic_vector(3 downto 0);
     Carry_In         : in std_logic;
     S                : out std_logic_vector(3 downto 0);
     Carry_Out        : out std_logic);
end Ramos_4Bit_Full_Adder;

architecture structure of Ramos_4Bit_Full_Adder is
    signal C : std_logic_vector(1 to 3);

    begin
    U0: Ramos_1Bit_Adder_Comp port map(A(0),B(0),Carry_In,S(0),C(1));
    U1: Ramos_1Bit_Adder_Comp port map(A(1),B(1),C(1),S(1),C(2));
    U2: Ramos_1Bit_Adder_Comp port map(A(2),B(2),C(2),S(2),C(3));
    U3: Ramos_1Bit_Adder_Comp port map(A(3),B(3),C(3),S(3),Carry_Out);
end structure;
