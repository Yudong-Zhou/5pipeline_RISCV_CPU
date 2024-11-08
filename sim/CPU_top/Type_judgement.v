//******************************************************************************
// Author: Zhou Yudong
// Type_judgement.v
//******************************************************************************
`timescale 1ns / 1ps
module Type_judgement(
  //input
  Instruction,
  //output
  rdAddr, rs1Addr, rs2Addr, funct3, opcode);
  input [31:0] Instruction;
  output [4:0] rdAddr;
  output [6:0] opcode;
  output [2:0] funct3;
  output [4:0] rs1Addr, rs2Addr;
  reg [4:0] rdAddr;
  reg [6:0] opcode;
  reg [2:0] funct3;
  reg [4:0] rs1Addr, rs2Addr;
  
  always @ (*) begin
    opcode = Instruction[6:0];
    if(opcode == 7'h33) begin //R_Type
      rdAddr = Instruction[11:7];
      funct3 = Instruction[14:12];
      rs1Addr = Instruction[19:15];
      rs2Addr = Instruction[24:20];
    end
    else if(opcode == 7'h13) begin //I_Type
      rdAddr = Instruction[11:7];
      funct3 = Instruction[14:12];
      rs1Addr = Instruction[19:15];
      rs2Addr = 5'b0;
    end
    else if(opcode == 7'h23) begin //S_Type
      rdAddr = 5'b0;
      funct3 = Instruction[14:12];
      rs1Addr = Instruction[19:15];
      rs2Addr = Instruction[24:20];
    end
    else if(opcode == 7'h63) begin //SB_Type
      rdAddr = 5'b11111;
      funct3 = Instruction[14:12];
      rs1Addr = Instruction[19:15];
      rs2Addr = Instruction[24:20];
    end
    else if((opcode == 7'h37) || (opcode == 7'h17)) begin //U_Type
      rdAddr = Instruction[11:7];
      funct3 = 3'b0;
      rs1Addr = 5'b0;
      rs2Addr = 5'b0;
    end
    else if(opcode == 7'h6f) begin //UJ_Type
      rdAddr = Instruction[11:7];
      funct3 = 3'b0;
      rs1Addr = 5'b0;
      rs2Addr = 5'b0;
    end
  end
  
endmodule
