//******************************************************************************
// Author: Zhou Yudong
// mux_3to1.v
//******************************************************************************
`timescale 1ns / 1ps
module mux_3to1(out, in0, in1, in2, addr); 
  parameter n = 32; 
  output[n-1:0] out;
  input[n-1:0] in1, in0, in2;
  input addr;
  reg[n-1:0] out;
       
  always @(in0 or in1 or in2 or addr) begin
    case (addr)
      2'b00: out = in0;
      2'b01: out = in1;
      2'b10: out = in2;
    endcase
  end
 
 endmodule
