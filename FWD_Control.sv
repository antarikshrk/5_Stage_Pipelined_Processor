import CORE_PKG::*;

module FWD_Control (
  input logic reset, 

  input [6:0] id_instr_opcode_ip, // ID/EX pipeline buffer opcode

  input write_back_mux_selector EX_MEM_wb_mux_ip,
  input write_back_mux_selector MEM_WB_wb_mux_ip,

  input logic [4:0] EX_MEM_dest_ip, //EX/MEM Dest Register
  input logic [4:0] MEM_WB_dest_ip, //MEM/WB Dest Register
  input logic [4:0] ID_dest_rs1_ip, //Rs from decode stage
  input logic [4:0] ID_dest_rs2_ip, //Rt from decode stage

  output forward_mux_code fa_mux_op, //select lines for forwarding muxes (Rs)
  output forward_mux_code fb_mux_op  //select lines for forwarding muxes (Rt)
);

  logic EX_MEM_RegWrite_en;
  logic MEM_WB_RegWrite_en;

  assign EX_MEM_RegWrite_en = (EX_MEM_wb_mux_ip == NO_WRITEBACK) ? 1'b0 : 1'b1;
  assign MEM_WB_RegWrite_en = (MEM_WB_wb_mux_ip == NO_WRITEBACK) ? 1'b0 : 1'b1;

  always @(*) begin
    fa_mux_op = ORIGINAL_SELECT;
    fb_mux_op = ORIGINAL_SELECT;

    case (id_instr_opcode_ip)

      OPCODE_OP: begin // Register-Register ALU operation

        /**
        * Task 2
        * 
        * Here you will need to check for hazards and decide if and what you will forward 
        * For Register Register instructions, what registers are relevant for you to check 
        */

      end

      OPCODE_OPIMM: begin // Register Immediate 

        /**
        * Task 2
        * 
        * Here you will need to check for hazards and decide if and what you will forward 
        * For Register Register instructions, what registers are relevant for you to check
        */

      end

    endcase

  end
endmodule
