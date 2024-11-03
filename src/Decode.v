//******************************************************************************
// Author: Zhou Yudong
// Decode.v
//******************************************************************************
`timescale 1ns / 1ps
module Decode(   
	// Outputs
	MemtoReg, RegWrite, MemWrite, MemRead,ALUCode,ALUSrcA,ALUSrcB,Jump,JALR,Imm,offset,
	// Inputs
  Instruction);
	input [31:0]	Instruction;	 // current instruction
	output MemtoReg;	        	 // use memory output as data to write into register
	output	RegWrite;		         // enable writing back to the register
	output	MemWrite;		         // write to memory
	output MemRead;
	output [3:0] ALUCode;      // ALU operation select
	reg [3:0] ALUCode;
	output ALUSrcA;
	output [1:0] ALUSrcB;
	output Jump;
	output JALR;
	output [31:0] Imm,offset;
	reg [31:0] Imm,offset;
	
//******************************************************************************
//  instruction type decode
//******************************************************************************
	parameter  R_type_op =  7'b0110011;
	parameter  I_type_op =  7'b0010011;
	parameter  SB_type_op = 7'b1100011;
	parameter  LW_op =      7'b0000011;
	parameter  JALR_op =    7'b1100111;
	parameter  SW_op =      7'b0100011;
	parameter  LUI_op =     7'b0110111;
	parameter  AUIPC_op =   7'b0010111;	
	parameter  JAL_op =     7'b1101111;	
//
  parameter  ADD_funct3 =  3'b000;
  parameter  SUB_funct3 =  3'b000;
  parameter  SLL_funct3 =  3'b001;
  parameter  SLT_funct3 =  3'b010;
  parameter  SLTU_funct3 = 3'b011;
  parameter  XOR_funct3 =  3'b100;
  parameter  SRL_funct3 =  3'b101;
  parameter  SRA_funct3 =  3'b101;
  parameter  OR_funct3 =   3'b110;
  parameter  AND_funct3 =  3'b111;
//
  parameter  ADDI_funct3 =  3'b000;
  parameter  SLLI_funct3 =  3'b001;
  parameter  SLTI_funct3 =  3'b010;
  parameter  SLTIU_funct3 = 3'b011;
  parameter  XORI_funct3 =  3'b100;
  parameter  SRLI_funct3 =  3'b101;
  parameter  SRAI_funct3 =  3'b101;
  parameter  ORI_funct3 =   3'b101;
  parameter  ANDI_funct3 =  3'b111;
//
  parameter	 alu_add =  4'b0000;
  parameter	 alu_sub =  4'b0001;
  parameter	 alu_lui =  4'b0010;
  parameter	 alu_and =  4'b0011;
  parameter	 alu_xor =  4'b0100;
  parameter	 alu_or =   4'b0101;
  parameter 	alu_sll =  4'b0110;
  parameter	 alu_srl =  4'b0111;
  parameter	 alu_sra =  4'b1000;
  parameter	 alu_slt =  4'b1001;
  parameter	 alu_sltu = 4'b1010; 

//******************************************************************************
// instruction field
//******************************************************************************
	wire [6:0]	op;
	wire funct6_7;
	wire [2:0]	funct3;
	reg Shift;
	assign op = Instruction[6:0];
	assign funct6_7 = Instruction[30];
 	assign funct3 = Instruction[14:12];
 	
 	//judge which type
 	wire R_type, I_type, SB_type, LW, JALR, SW, LUI, AUIPC, JAL;
 	assign R_type = (op == R_type_op);
 	assign I_type = (op == I_type_op);
 	assign SB_type = (op == SB_type_op);
 	assign LW = (op == LW_op);
 	assign JALR = (op == JALR_op);
 	assign SW = (op == SW_op);
 	assign LUI = (op == LUI_op);
 	assign AUIPC = (op == AUIPC_op);
 	assign JAL = (op == JAL_op);
 	
 	//LW instruction
 	assign MemtoReg = LW;
  assign MemRead = LW;
  
  //SW instruction
  assign MemWrite = SW;
  
  //instrcutions need write back
  assign RegWrite = R_type || I_type || LW || JALR || LUI || AUIPC || JAL;
  
  //JALR & JAL instruction
  assign Jump = JALR || JAL;
  
  //opcode choice
  assign ALUSrcA = JALR || JAL || AUIPC;
  assign ALUSrcB[0] = ~(R_type || JAL || JALR);
  assign ALUSrcB[1] = JAL || JALR;
  
  //determine ALUcode
  always@(*) begin
  if (R_type && ~(I_type) && ~(LUI)) begin
    if (funct6_7)
      case (funct3)
        3'o0: ALUCode = 4'd1; //minus
        3'o5: ALUCode = 4'd8; //arithmetic shift right
      endcase
    else
      case (funct3)
        3'o0: ALUCode = 4'd0; //add
	      3'o1: ALUCode = 4'd6; //shift left
	      3'o2: ALUCode = 4'd9; //A<B?1:0
	      3'o3: ALUCode = 4'd10;//A<B?1:0 unsigned
	      3'o4: ALUCode = 4'd4; //xor
	      3'o5: ALUCode = 4'd7; //shift right
	      3'o6: ALUCode = 4'd5; //or
	      3'o7: ALUCode = 4'd3; //and
	    endcase
	end
  else if (~(R_type) && I_type && ~(LUI)) begin
    if ((funct3 == 3'o5) && ~(funct6_7)) ALUCode = 4'd7;
    if ((funct3 == 3'o5) && funct6_7) ALUCode = 4'd8;
    case (funct3)
      3'o0: ALUCode = 4'd0; //add
	    3'o1: ALUCode = 4'd6; //shift left
	    3'o2: ALUCode = 4'd9; //A<B?1:0
	    3'o3: ALUCode = 4'd10;//A<B?1:0 unsigned
	    3'o4: ALUCode = 4'd4; //xor
	    3'o6: ALUCode = 4'd5; //or
	    3'o7: ALUCode = 4'd3; //and
	  endcase
	end
	else if (~(R_type) && ~(I_type) && LUI) ALUCode = 4'd2; //ALUResult=B
	else ALUCode = 4'd0; //add
	
	//ImmGen & offset
	Shift = (funct3 == 1) || (funct3 == 5);
	if (I_type && Shift) 
	 Imm = {26'd0,Instruction[25:20]};
	if ((I_type && ~(Shift)) || LW) 
	 Imm = {{20{Instruction[31]}},Instruction[31:20]};
	if (SW)
	 Imm = {{20{Instruction[31]}},Instruction[31:25],Instruction[11:7]};
	if (LUI || AUIPC)
	 Imm = {Instruction[31:12],12'd0};
	if (JALR)
	 offset = {{20{Instruction[31]}},Instruction[31:20]};
	if (JAL)
	 offset = {{11{Instruction[31]}},Instruction[31],Instruction[19:12],
	                 Instruction[20],Instruction[30:21],1'b0};
	if (SB_type)
	 offset = {{19{Instruction[31]}},Instruction[31],Instruction[7],
	                 Instruction[30:25],Instruction[11:8],1'b0};
  end

endmodule


