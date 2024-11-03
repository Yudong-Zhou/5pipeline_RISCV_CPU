//******************************************************************************
// Author: Zhou Yudong
// D_trigger.v
//******************************************************************************
`timescale 1ns / 1ps
module D_trigger(d, en, r, clk, q);
	parameter n = 32;
	input en,r,clk;
	input [n-1:0] d;
	output [n-1:0] q;
	reg [n-1:0] q = 0;

	always @ (posedge clk)
		if(r) q={n{1'b0}};
		else if(en) q=d;

endmodule
