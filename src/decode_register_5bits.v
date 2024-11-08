//******************************************************************************
// Author: Zhou Yudong
// decode_register_5bits.v
//******************************************************************************
`timescale 1ns / 1ps
module decode_register_5bits(WriteRegister, RegWrite, Register_num);
  input [4:0] WriteRegister;
  input RegWrite;
	output [31:0] Register_num;
	reg [31:0] Register_num = 0;

	reg cal;
  always @(*)
	 if(RegWrite) begin
	   assign cal = 16*WriteRegister[4] + 8*WriteRegister[3] + 4*WriteRegister[2] + 2*WriteRegister[1] + WriteRegister[0];
	   Register_num[cal] = 1;
	 end 

endmodule