-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
-- CREATED		"Sat Mar 13 21:46:17 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ramos_D_Flip_Flop_Master_Slave IS 
	PORT
	(
		Ramos_PRN :  IN  STD_LOGIC;
		Ramos_D :  IN  STD_LOGIC;
		Ramos_CLK :  IN  STD_LOGIC;
		Ramos_CLRN :  IN  STD_LOGIC;
		Ramos_Q :  OUT  STD_LOGIC
	);
END Ramos_D_Flip_Flop_Master_Slave;

ARCHITECTURE bdf_type OF Ramos_D_Flip_Flop_Master_Slave IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



PROCESS(Ramos_CLRN,Ramos_PRN,SYNTHESIZED_WIRE_0,Ramos_D)
BEGIN
IF (Ramos_CLRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '0';
ELSIF (Ramos_PRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '1';
ELSIF (SYNTHESIZED_WIRE_0 = '1') THEN
	SYNTHESIZED_WIRE_1 <= Ramos_D;
END IF;
END PROCESS;


PROCESS(Ramos_CLRN,Ramos_PRN,Ramos_CLK,SYNTHESIZED_WIRE_1)
BEGIN
IF (Ramos_CLRN = '0') THEN
	Ramos_Q <= '0';
ELSIF (Ramos_PRN = '0') THEN
	Ramos_Q <= '1';
ELSIF (Ramos_CLK = '1') THEN
	Ramos_Q <= SYNTHESIZED_WIRE_1;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_0 <= NOT(Ramos_CLK);



END bdf_type;
