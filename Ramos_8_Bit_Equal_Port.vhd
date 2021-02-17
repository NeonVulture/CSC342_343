library ieee;
use ieee.std_logic_1164.all;

entity Ramos_8_Bit_Equal_Port is
port (a, b: in std_logic_vector(7 downto 0); --change 1 to 7
     aeqb : out std_logic);
end Ramos_8_Bit_Equal_Port;


architecture arch of Ramos_8_Bit_Equal_Port is
    --component declaration...we are telling the compiler
    --which components we want to use from the library.
    component Ramos_Equal
    port (i0, i1: in std_logic;
             eq : out std_logic);
    end component;
    signal e0,e1,e2,e3,e4,e5,e6,e7: std_logic;
    begin
    
    --instantiates two one-bit comparators
    H1: Ramos_Equal port map(i0=>a(0), i1=>b(0), eq=>e0);
    H2: Ramos_Equal port map(i0=>a(1), i1=>b(1), eq=>e1);
    H3: Ramos_Equal port map(i0=>a(2), i1=>b(2), eq=>e2);
    H4: Ramos_Equal port map(i0=>a(3), i1=>b(3), eq=>e3);
    H5: Ramos_Equal port map(i0=>a(4), i1=>b(4), eq=>e4);
    H6: Ramos_Equal port map(i0=>a(5), i1=>b(5), eq=>e5);
    H7: Ramos_Equal port map(i0=>a(6), i1=>b(6), eq=>e6);
    H8: Ramos_Equal port map(i0=>a(7), i1=>b(7), eq=>e7);    
    --a and b are equal if individual bits are equal.
    aeqb <= e0 and e1 and e2 and e3 and e4 and e5 and e6 and e7;
end arch;