//******************************************************************************
// Author:Zhou Yudong
// mux_ALU.v
//******************************************************************************
`timescale 1ns / 1ps
module mux_ALU(
  //input
  addr, d0_1, d2, d3, d4, d5, d6, d7, d8, d9, d10,
  //output
  ALUResult);
  input [3:0] addr;
  input [31:0] d0_1, d2, d3, d4, d5, d6, d7, d8;
  input d9, d10;
  output [31:0] ALUResult;
  reg [31:0] ALUResult;
  
  parameter	 alu_add=  4'b0000;
  parameter	 alu_sub=  4'b0001;
  parameter	 alu_lui=  4'b0010;
  parameter	 alu_and=  4'b0011;
  parameter	 alu_xor=  4'b0100;
  parameter	 alu_or =  4'b0101;
  parameter 	 alu_sll=  4'b0110;
  parameter	 alu_srl=  4'b0111;
  parameter	 alu_sra=  4'b1000;
  parameter	 alu_slt=  4'b1001;
  parameter	 alu_sltu= 4'b1010;
  
  always@(*) begin
    case (addr)
      alu_add: ALUResult = d0_1;
      alu_sub: ALUResult = d0_1;
      alu_lui: ALUResult = d2;
      alu_and: ALUResult = d3;
      alu_xor: ALUResult = d4;
      alu_or:  ALUResult = d5;
      alu_sll: ALUResult = d6;
      alu_srl: ALUResult = d7;
      alu_sra: ALUResult = d8;
      alu_slt: ALUResult = d9;
      alu_sltu: ALUResult = d10;
    endcase
  end
  
endmodule
  
  
  
  
      
