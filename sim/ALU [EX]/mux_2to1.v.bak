//******************************************************************************
// Author: Zhou Yudong
// mux_2to1.v
//******************************************************************************
`timescale 1ns / 1ps
module mux_2to1(out, in0, in1, addr); 
  parameter n=4; 
  output[n-1:0]  out;
  input[n-1:0] in1,in0;
  input addr;
  reg[n-1:0] out;
       
  always @(in0 or in1 or addr)
    if (addr == 0) out = in0;
    else out = in1;
 
 endmodule

