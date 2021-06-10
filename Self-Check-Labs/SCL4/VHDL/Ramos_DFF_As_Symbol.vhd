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
-- CREATED		"Sat Mar 13 21:11:43 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ramos_DFF_As_Symbol IS 
	PORT
	(
		Ramos_PRN :  IN  STD_LOGIC;
		Ramos_D :  IN  STD_LOGIC;
		Ramos_CLRN :  IN  STD_LOGIC;
		Ramos_EDGE :  IN  STD_LOGIC;
		Ramos_Q :  OUT  STD_LOGIC
	);
END Ramos_DFF_As_Symbol;

ARCHITECTURE bdf_type OF Ramos_DFF_As_Symbol IS 



BEGIN 



PROCESS(Ramos_EDGE,Ramos_CLRN,Ramos_PRN)
BEGIN
IF (Ramos_CLRN = '0') THEN
	Ramos_Q <= '0';
ELSIF (Ramos_PRN = '0') THEN
	Ramos_Q <= '1';
ELSIF (RISING_EDGE(Ramos_EDGE)) THEN
	Ramos_Q <= Ramos_D;
END IF;
END PROCESS;


END bdf_type;
