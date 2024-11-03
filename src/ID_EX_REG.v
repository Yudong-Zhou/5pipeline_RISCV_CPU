//******************************************************************************
// Author: Zhou Yudong
// ID_EX_REG.v
//******************************************************************************
`timescale 1ns / 1ps
module ID_EX_REG(//input
                 en, r, clk, 
                 WB1, WB2, MEM1, MEM2, 
                 EX1, EX2, EX3, EX4, EX5, EX6, EX7, EX8, EX9, EX10,
                 //output
                 Q_WB1, Q_WB2, Q_MEM1, Q_MEM2, 
                 Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_EX5, Q_EX6, Q_EX7, Q_EX8, Q_EX9, Q_EX10);
	input en,r,clk;
	input WB1, WB2;
	input MEM1, MEM2;
	input [3:0] EX1; //ALUCode_id
	input EX2;       //ALUSrcA_id
	input [1:0] EX3; //ALUSrcB_id
	input [31:0] EX4; //PC_id
	input [31:0] EX5; //Imm_id
	input [4:0] EX6, EX7, EX8; //rdAddr_id, rs1Addr_id, rs2Addr_id;
	input [31:0] EX9, EX10; //rs1Data_id, rs2Data_id
	output Q_WB1, Q_WB2;
	output Q_MEM1, Q_MEM2;
	output [3:0] Q_EX1; //ALUCode_ex
	output Q_EX2;       //ALUSrcA_ex
	output [1:0] Q_EX3; //ALUSrcB_ex
	output [31:0] Q_EX4; //PC_ex
	output [31:0] Q_EX5; //Imm_ex
	output [4:0] Q_EX6, Q_EX7, Q_EX8; //rdAddr_ex, rs1Addr_ex, rs2Addr_ex;
	output [31:0] Q_EX9, Q_EX10; //rs1Data_ex, rs2Data_ex
	reg Q_WB1, Q_WB2;
	reg Q_MEM1, Q_MEM2;
	reg [3:0] Q_EX1;
	reg Q_EX2;     
	reg [1:0] Q_EX3; 
	reg [31:0] Q_EX4; 
	reg [31:0] Q_EX5; 
	reg [4:0] Q_EX6, Q_EX7, Q_EX8; 
	reg [31:0] Q_EX9, Q_EX10; 

	always @ (posedge clk) begin
		if(r) begin
		  Q_WB1 = 1'b0;
		  Q_WB2 = 1'b0;
		  Q_MEM1 = 1'b0;
		  Q_MEM2 = 1'b0;
      Q_EX1 = {4{1'b0}};
      Q_EX2 = 1'b0;
      Q_EX3 = {2{1'b0}};
      Q_EX4 = {32{1'b0}};
      Q_EX5 = {32{1'b0}};
      Q_EX6 = {5{1'b0}};
      Q_EX7 = {5{1'b0}};
      Q_EX8 = {5{1'b0}};
      Q_EX9 = {32{1'b0}};
      Q_EX10 = {32{1'b0}};
		end
		else if(en) begin
		  Q_WB1 = WB1;
		  Q_WB2 = WB2;
		  Q_MEM1 = MEM1;
		  Q_MEM2 = MEM2;
      Q_EX1 = EX1;
      Q_EX2 = EX2;
      Q_EX3 = EX3;
      Q_EX4 = EX4;
      Q_EX5 = EX5;
      Q_EX6 = EX6;
      Q_EX7 = EX7;
      Q_EX8 = EX8;
      Q_EX9 = EX9;
      Q_EX10 = EX10;
		end
	end

endmodule
