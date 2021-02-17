library ieee;
use ieee.std_logic_1164.all;

entity Ramos_2_Bit_Equal_Port is
port (a, b: in std_logic_vector(1 downto 0);
     aeqb : out std_logic);
end Ramos_2_Bit_Equal_Port;


architecture arch of Ramos_2_Bit_Equal_Port is
    --component declaration...we are telling the compiler
    --which components we want to use from the library.
    component Ramos_Equal
    port (I0, I1: in std_logic;
             Eq : out std_logic);
    end component;
    signal e0,e1: std_logic;
    begin
    
    --instantiates two one-bit comparators
    H1: Ramos_Equal port map(i0=>a(0), i1=>b(0), eq=>e0);
    H2: Ramos_Equal port map(i0=>a(1), i1=>b(1), eq=>e1);
    --a and b are equal if individual bits are equal.
    aeqb <= e0 and e1;
end arch;