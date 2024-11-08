//******************************************************************************
// Author:Zhou Yudong
// ALU.v
//******************************************************************************
`timescale 1ns / 1ps
module ALU (
	// Outputs
	ALUResult,
	// Inputs
	ALUCode, A, B);
	input [3:0]	ALUCode;				// Operation select
	input [31:0]	A, B;
	output [31:0]	ALUResult;
	
  wire Binvert;
  wire [31:0] Binvert_32bits;
  assign Binvert = ~(ALUCode == 0);
  assign Binvert_32bits = {32{Binvert}};
  
  wire [31:0] sum;
  wire [31:0] ALU_B, ALU_and, ALU_xor, ALU_or;
  adder_32bits ALU_add(.a(A), .b(B ^ Binvert_32bits), .ci(Binvert), .s(sum), .co());
  assign ALU_B = B;
  assign ALU_and = A & B;
  assign ALU_xor = A ^ B;
  assign ALU_or = A | B;
  
  //Branch Detect
  wire [31:0] SUM;
  wire slt, sltu;
  assign SUM = A + (~B) + 1;
  assign slt = A[31] && (~B[31]) || (A[31]~^B[31]) && SUM[31];
  assign sltu = (~A[31]) && B[31] || (A[31]~^B[31]) && SUM[31];
  
  //Shift
  reg signed[31:0] A_reg;
  always@(*) begin
    A_reg = A;
  end
  wire [31:0] ALU_sll, ALU_srl, ALU_sra;
  assign ALU_sll = A << B;
  assign ALU_srl = A >> B;
  assign ALU_sra = A_reg >>> B;
  
  mux_ALU mux_ALU(.addr(ALUCode),
                  .d0_1(sum), 
                  .d2(ALU_B), 
                  .d3(ALU_and), 
                  .d4(ALU_xor), 
                  .d5(ALU_or), 
                  .d6(ALU_sll), 
                  .d7(ALU_srl), 
                  .d8(ALU_sra), 
                  .d9(slt), 
                  .d10(sltu), 
                  .ALUResult(ALUResult));
  
endmodule