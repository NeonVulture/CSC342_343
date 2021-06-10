LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;

USE WORK.Ramos_Package_2.ALL;

entity Ramos_I_Instructions_Decoder is
	port ( CLK                          : in std_logic;
          Opcode                       : in std_logic_vector(2 downto 0);
          Imm									: in std_logic_vector(15 downto 0);
			 Rs_Data 	      				: in std_logic_vector(31 downto 0); -- Input data for registers Rs and Rt
          RD_Data          			   : out std_logic_vector(31 downto 0);
          Cout, V_FLAG, Z_FLAG, N_FLAG : out std_logic); -- Carry Out, Overflow, Zero, and Negative Flags
end Ramos_I_Instructions_Decoder;

architecture arch of Ramos_I_Instructions_Decoder is
	signal Imm_Out : std_logic_vector(15 downto 0);
	signal ImmExt, Rs_Out : std_logic_vector(31 downto 0);
	signal Overflow : std_logic;
   signal Out1, Out2, Out3 : std_logic_vector(31 downto 0);
	
	begin
	
	R1: Ramos_16bit_register port map(CLK,'1', '1', '1', Imm, Imm_Out);
   R2: Ramos_32Bit_Register port map(CLK,'1', '1', '1', Rs_Data, Rs_Out);
	 
	U1: Ramos_Sign_Zero_Ext port map(Imm_Out, ImmExt);
   U2: Ramos_NBit_Add_Sub port map (Rs_Out, ImmExt, '0', '0', Out1, Cout, Overflow, Z_FLAG, N_FLAG); --ADDI & ADDUI
	U3: Ramos_Bitwise_AND port map (Rs_Out, ImmExt, Out2); -- Bitwise ANDI 
   U4: Ramos_Bitwise_OR port map (Rs_Out, ImmExt, Out3); -- Bitwise ORI
	
	process(Opcode, Overflow) -- Choose whether or not to display V_Flag
   begin
    	if (Opcode = "001") then
			V_FLAG <= Overflow;
		elsif (Opcode = "010") then
			V_FLAG <= 'Z';
		end if;
   end process;

	process(Opcode, Out1, Out2, Out3)
   begin
      case Opcode is
			when "001" => RD_Data <= Out1;
         when "010" => RD_Data <= Out1;
         when "011" => RD_Data <= Out2;
			when "100" => RD_Data <= Out3;
			when others => RD_Data <= (others => 'Z');
      end case;
   end process;
	 
end arch;