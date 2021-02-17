Library ieee;
use ieee.std_logic_1164.all;

entity Ramos_Equal is
    port ( I0, I1 : in std_logic;
               Eq : out std_logic);
end Ramos_Equal;

architecture arch of Ramos_Equal is

begin
    EQ <= ((NOT I0) AND (NOT I1)) OR (I0 AND I1); -- I0'I1' + I0I1
end arch;