5-Stage Pipelined RISC-V Processor simulator with flushing, stalling, and forwarding. The instructions ADD, ADDI, SUB, LW, SW, SLT, and JAL are implemented in the code. For simulating instructions, use https://luplab.gitlab.io/rvcodecjs/ to decode instructions and write into the testbench. Used iverilog and GTKwave to simulate testbench.

To run:

1. iverilog -g2012 -I include -s Core_tb -o core_tb ./include/core_pkg.sv ./testbench/core_tb.sv Core.sv Fetch.sv EX_Stage.sv DFlipFlop.sv DRAM.sv EX_Stage.sv Fetch.sv FWD_Control.sv ID_Stage.sv IF_Stage.sv Instr_Mem.sv Mem_Stage.sv Register_File.sv Stall_Controll.sv WB_Stage.sv
2. vvp core_tb
3. gtkwave
4. In GTKWave, open new tab and select Core_Simulation.vcd to view simulation
