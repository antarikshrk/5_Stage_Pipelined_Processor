import CORE_PKG::*;

module Stall_Control (
  input logic reset, 

  input logic [6:0] ID_instr_opcode_ip,
  input logic [4:0] ID_src1_addr_ip,
  input logic [4:0] ID_src2_addr_ip,

  //The destination register from the different stages
  input logic [4:0] EX_reg_dest_ip,  // destination register from EX pipe
  input logic [4:0] LSU_reg_dest_ip,
  input logic [4:0] WB_reg_dest_ip,
  input logic WB_write_reg_en_ip,

  // The opcode of the current instr. in ID/EX
  input [6:0] EX_instr_opcode_ip,

  output logic stall_op
);

  always_comb begin
    stall_op = 1'b0;
    case(ID_instr_opcode_ip) 

      OPCODE_OP: begin 
        /**
        * Task 1
        * 
        * Here you will need to decide when to pull the stall control logic high. 
        * 1. Load to use stalls
        * 2. Stalls when reading and writing from Register File
        * For Register Register instructions, what registers are relevant
        */
        if (EX_instr_opcode_ip == OPCODE_LOAD) begin //If the current instruction is a LOAD
          if ((EX_reg_dest_ip == ID_src1_addr_ip) || (EX_reg_dest_ip == ID_src2_addr_ip)) begin
              stall_op = 1'b1; //If the Destination Register equals the Source 1 or 2 Registers, set Stall high
          end
        end
      end
        

      OPCODE_OPIMM: begin

        /**
        * Task 1
        * 
        * Here you will need to decide when to pull the stall control logic high. 
        * 
        * 1. Load to use stalls
        * 2. Stalls when reading and writing from Register File
        * For Register Immedite instructions, what registers are relevant
        */
        if (EX_instr_opcode_ip == OPCODE_LOAD) begin //If the current instruction is a LOAD
          if ((EX_reg_dest_ip == ID_src1_addr_ip)) begin
              stall_op = 1'b1; //If the Destination Register equals the Source 1 or 2 Registers, set Stall high
          end
        end
      end
        

      default: begin
        stall_op = 1'b0;
      end
    endcase
  end

endmodule
