//******************************************************************************
// Author: Zhou Yudong
// Register.v
//******************************************************************************
`timescale 1ns / 1ps
module Registers(
  // inputs
  ReadRegister1, ReadRegister2, WriteData, WriteRegister, RegWrite, clk,
  // outputs
  ReadData1, ReadData2);
  input [4:0] ReadRegister1, ReadRegister2; 
  input [31:0] WriteData;
  input [4:0] WriteRegister;
  input RegWrite, clk;
  output [31:0] ReadData1, ReadData2;

  reg [31:0]regs[31:0]; 
  assign ReadData1 = (ReadRegister1 == 5'b0)?32'b0:regs[ReadRegister1];
  assign ReadData2 = (ReadRegister2 == 5'b0)?32'b0:regs[ReadRegister2];
  always@(posedge clk)
    if(RegWrite) regs[WriteRegister] <= WriteData;
  
endmodule
  
  
  










  