//******************************************************************************
// Author: Zhou Yudong
// IF_ID_REG.v
//******************************************************************************
`timescale 1ns / 1ps
module IF_ID_REG(en, r, clk, d1, d2, q1, q2);
	input en,r,clk;
	input [31:0] d1, d2;//PC, Insturction
	output [31:0] q1, q2;
	reg [31:0] q1, q2;

	always @ (posedge clk) begin
		if(r) begin
		  q1 = {32{1'b0}};
		  q2 = {32{1'b0}};
		end
		else if(en) begin
		  q1 = d1;
		  q2 = d2;
		end
	end

endmodule
