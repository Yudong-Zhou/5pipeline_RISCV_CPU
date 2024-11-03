//******************************************************************************
// Author: Zhou Yudong
// adder_4bits.v
//******************************************************************************
`timescale 1ns / 1ps
module adder_4bits(a, b, ci, s, co);
  input [3:0] a, b;
  input ci;
  output [3:0] s;
  output co;
  reg  [3:0] G, P;
  integer i;
  always @(*)
    for (i=0; i<=3; i=i+1)
      begin
        G[i] = a[i] && b[i];
        P[i] = a[i] || b[i];
      end
  assign co = G[3] || P[3] && G[2] || P[3] && P[2] && G[1] || P[3] && P[2] && P[1] && G[0] || P[3] && P[2] && P[1] && P[0] && ci;
  assign s[0] = (P[0] && ~G[0]) ^ ci;
  assign s[1] = (P[1] && ~G[1]) ^ (G[0] || P[0] && ci);
  assign s[2] = (P[2] && ~G[2]) ^ (G[1] || P[1] && G[0] || P[1] && P[0] && ci);
  assign s[3] = (P[3] && ~G[3]) ^ (G[2] || P[2] && G[1] || P[2] && P[1] && G[0] || P[2] && P[1] && P[0] && ci);

endmodule