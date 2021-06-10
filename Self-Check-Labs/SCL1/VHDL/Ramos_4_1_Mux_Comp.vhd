library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Ramos_4_1_Mux_Comp is
	port (IA,IB,IC,ID: in std_logic;
		   S1, S2     : in std_logic;
		   Output     : out std_logic);
end Ramos_4_1_Mux_Comp;

architecture behavioral of Ramos_4_1_Mux_Comp is
    component Ramos_2_1_Mux
        port ( in1, in2, S : in std_logic;
               out1        : out std_logic);
    end component;
	 
	 signal M1, M2 : std_logic;
	 begin
    U0: Ramos_2_1_Mux port map(IA,IB,S1,M1);
    U1: Ramos_2_1_Mux port map(IC,ID,S1,M2);
    U2: Ramos_2_1_Mux port map(M1,M2,S2,Output);
end behavioral;
