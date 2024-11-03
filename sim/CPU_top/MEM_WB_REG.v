//******************************************************************************
// Author: Zhou Yudong
// MEM_WB_REG.v
//******************************************************************************
`timescale 1ns / 1ps
module MEM_WB_REG(//input
                 en, r, clk, 
                 WB1, WB2, WB3, WB4, WB5,
                 //output
                 Q_WB1, Q_WB2, Q_WB3, Q_WB4, Q_WB5);
	input en,r,clk;
	input WB1, WB2; //MemtoReg_mem, RegWrite_mem
	input [31:0] WB3; //MemDout_mem
	input [31:0] WB4; //ALUResult_mem
	input [4:0] WB5; //rdAddr_mem
	output Q_WB1, Q_WB2; //MemtoReg_wb, RegWrite_wb
	output [31:0] Q_WB3; //MemDout_wb
	output [31:0] Q_WB4; //ALUResult_wb
	output [4:0] Q_WB5; //rdAddr_wb
        reg Q_WB1, Q_WB2;
	reg [31:0] Q_WB3;
	reg [31:0] Q_WB4;
	reg [4:0] Q_WB5; 

	always @ (posedge clk) begin
		if(r) begin
		  Q_WB1 = 1'b0;
		  Q_WB2 = 1'b0;
		  Q_WB3 = 32'b0;
		  Q_WB4 = 32'b0;
		  Q_WB5 = 5'b0;
		end
		else if(en) begin
		  Q_WB1 = WB1;
		  Q_WB2 = WB2;
		  Q_WB3 = WB3;
		  Q_WB4 = WB4;
                  Q_WB5 = WB5;
		end
	end

endmodule
