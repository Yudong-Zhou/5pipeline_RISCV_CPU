//******************************************************************************
// Author: Zhou Yudong
// EX_MEM_REG.v
//******************************************************************************
`timescale 1ns / 1ps
module EX_MEM_REG(//input
                 en, r, clk, 
                 WB1, WB2, MEM1, MEM2, MEM3, MEM4,
                 //output
                 Q_WB1, Q_WB2, Q_MEM1, Q_MEM2, Q_MEM3, Q_MEM4);
	input en,r,clk;
	input WB1, WB2; //MentoReg_ex, RegWrite_ex
	input MEM1; //MemWrite_ex
	input [31:0] MEM2; //ALUResult_EX
	input [31:0] MEM3; //MemWriteData_ex
	input [4:0] MEM4; //rdAddr_ex
	output Q_WB1, Q_WB2; //MentoReg_MEM, RegWrite_MEM
	output Q_MEM1; //MemWrite_MEM
	output [31:0] Q_MEM2; //ALUResult_MEM
	output [31:0] Q_MEM3; //MemWriteData_MEM
	output [4:0] Q_MEM4; //rdAddr_MEM
	reg Q_WB1, Q_WB2;
	reg Q_MEM1;
	reg [31:0] Q_MEM2;
	reg [31:0] Q_MEM3; 
	reg [4:0] Q_MEM4;
	
	always @ (posedge clk) begin
		if(r) begin
		  Q_WB1 = 1'b0;
		  Q_WB2 = 1'b0;
		  Q_MEM1 = 1'b0;
		  Q_MEM2 = 32'b0;
		  Q_MEM3 = 32'b0;
		  Q_MEM4 = 5'b0;
		end
		else if(en) begin
		  Q_WB1 = WB1;
		  Q_WB2 = WB2;
		  Q_MEM1 = MEM1;
		  Q_MEM2 = MEM2;
                  Q_MEM3 = MEM3;
                  Q_MEM4 = MEM4;
		end
	end

endmodule
