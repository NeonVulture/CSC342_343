# Single Cycle CPU (Final Lab)
### Objective: Design and Test a Single Cycle (MIPS Processor) CPU

![Single Cycle CPU](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/Single_Cycle_CPU.PNG)

## R, I, & J Type MIPS Instructions

There exist three types of MIPS instructions
![Breakdown of MIPS Instructions](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/Instructions_Breakdown.PNG)
The Single Cycle (MIPS Processor) CPU designed will be able to implement the following MIPS instructions
![MIPS Instructions List](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/CPU_Instructions_Breakdown.PNG)
Each instruction type will be identified either by their function (*Funct*) field or *Opcode* value. For example, R-Type instructions are identified by their *Funct* field value.
![Summary of R-Type Function Fields](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/R-Type_Function_Field_Summary.PNG)
Meanwhile, I & J Type instructions are identified by their Opcode field value
![Summary of I&J Type Opcode Fields](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/I&J_Type_Opcode_Field_Summary.PNG)
## Control Unit
![Control Unit](https://github.com/NeonVulture/CSC342_343/blob/main/Labs/Single-Cycle-CPU/Images/Control_Unit.PNG)
