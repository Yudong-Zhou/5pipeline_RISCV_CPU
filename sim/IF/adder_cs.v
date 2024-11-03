//******************************************************************************
// Author: Zhou Yudong
// adder_cs.v
//******************************************************************************
`timescale 1ns / 1ps
module adder_cs(a, b, ci, s, co);
  input [3:0] a, b;
  input ci;
  output [3:0] s;
  output co;
  wire [3:0] s_1, s_0;
  wire co_1, co_0;
  
  adder_4bits adder1(.a(a), .b(b), .ci(1'b1), .s(s_1), .co(co_1));
  adder_4bits adder0(.a(a), .b(b), .ci(1'b0), .s(s_0), .co(co_0));
  mux_2to1 mux(.out(s), .in0(s_0), .in1(s_1), .addr(ci));
  
  assign co = (co_1 && ci) || co_0;
  
endmodule