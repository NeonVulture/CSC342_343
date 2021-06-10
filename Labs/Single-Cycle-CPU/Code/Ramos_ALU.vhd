-- This file defines the behavior of an ALU  
Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.RAMOS_ALU_COMPONENTS_PACKAGE.ALL;

entity Ramos_ALU is
	port(
        ALUCtrl    : in std_logic_vector(3 downto 0); -- Input comes from ALUControl
        Operand1   : in std_logic_vector(31 downto 0); -- BusA 
        Operand2   : in std_logic_vector(31 downto 0); -- BusB  or ImmExt
	     ALUResultU : out std_logic_vector(31 downto 0); -- Upper 32-Bit Result (For Mult and Div only!)
		  ALUResultL : out std_logic_vector(31 downto 0); -- Lower 32-Bit Result
        V_FLAG, Z_FLAG, N_FLAG, Cout : out std_logic); -- ALU Output flags
end Ramos_ALU;

architecture arch of Ramos_ALU is 
	signal Overflow, OpSel : std_logic;
	signal Result2 : std_logic_vector(63 downto 0); -- Product
	signal Result1, Result4, Result5, Result6, Result7, Result8, Result9 : std_logic_vector(31 downto 0);
   signal Result2U, Result2L, Result3U, Result3L : std_logic_vector(31 downto 0);
	
	begin
    process(ALUCtrl) -- For NBit_Adder_Sub
    begin
        if (ALUCtrl = "0000") then
            OpSel <= '0'; -- Add
        elsif (ALUCtrl = "0001") then
            OpSel <= '1'; -- Sub
        end if;
    end process;

    U1: Ramos_NBit_Add_Sub port map (Operand1, Operand2, '0', OpSel, Result1, Cout, V_FLAG, Z_FLAG, N_FLAG); -- add/sub with no carry-in
    
    U2: Ramos_Multiply_LPM port map(Operand1, Operand2, Result2); -- Multiply
	 -- Split 64-Bit product into two 32-bit upper and lower results.
	 Result2U <= Result2(63 downto 32);
	 Result2L <= Result2(31 downto 0);
    U3: Ramos_Division_LPM port map(Operand1, Operand2, Result3L, Result3U); -- Divide
	 U4: Ramos_Bitwise_AND port map (Operand1, Operand2, Result4); -- Bitwise AND/ANDI
    U5: Ramos_Bitwise_OR port map (Operand1, Operand2, Result5); -- Bitwise ORI
	 U6: Ramos_Bitwise_NOR port map (Operand1, Operand2, Result6); -- Bitwise NOR
    U7: Ramos_Bitwise_LeftShift port map(Operand2, Result7);-- Sll
    U8: Ramos_Bitwise_RightShift port map(Operand2, Result8);-- Srl
    U9: Ramos_Bitwise_RightShiftArith port map(Operand2, Result9);-- Sra
    

process(ALUCtrl, Result1, Result2U, Result2L, Result3U, Result3L, Result4, Result5, Result6, Result7, Result8, Result9)
    begin
        case ALUCtrl is
          when "0000" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result1; -- Add/Addu/Addi/Addiu/lw/sw
          when "0001" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result1; -- Sub/Subu/beq/bne
          when "0010" => -- Mult
				ALUResultU <= Result2U; 
				ALUResultL <= Result2L;
          when "0011" => -- Div
				ALUResultU <= Result3U; -- Remainder
				ALUResultL <= Result3L; -- Quotient		
	       when "0100" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result4; -- and/andi 
	       when "0101" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result5; -- ori
			 when "0110" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result6; -- nor
	       when "0111" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result7; -- sll
          when "1000" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result8; -- srl
          when "1001" => 
				ALUResultU <= X"00000000";
				ALUResultL <= Result9; -- sra
          when others => 
			   ALUResultU <= (others => 'Z');
				ALUResultL <= (others => 'Z');
        end case;
    end process;

end arch;
