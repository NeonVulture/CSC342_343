============================
For MARS Simulator:
============================
1. Open the desired .asm file
2. Execute via Run >> Assemble or hit F3
3. To step through each line of code, press the green play button marked with a 1 or hit F7
============================
For MS Visual Studio
============================
1. Open the desired soloution (.sln) file
2. Goto Build>>Build solution
3. Go to Debug>>Step Into
4. The Disassembly, Register, and Memory windows should appear. 
If not, go to Debug >> Windows >> Disassembly (or Registers, or Memory 1). 
============================
For Linux GDB
============================
1. First compile the C file using gcc -g -o0 <filename> -o <name>
2. Run the command gdb <name> to begin debugging
3. To step through the assembly code we run 'brake main' followed by 'run'. 
4. To run one line of source code, we run 'next'. Likewise to run one assembly instruction, we run 'stepi'