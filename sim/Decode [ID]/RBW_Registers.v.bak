//******************************************************************************
// Author: Zhou Yudong
// RBW_Register.v
//******************************************************************************
`timescale 1ns / 1ps
module RBW_registers(
  // inputs
  clk, rs1Addr, rs2Addr, WriteAddr, RegWrite, WriteData,
  // outputs
  rs1Data,rs2Data);
  input [4:0] rs1Addr,rs2Addr,WriteAddr;
  input RegWrite,clk;
  input [31:0] WriteData;
  output [31:0] rs1Data,rs2Data;
  
  wire rs1Sel,rs2Sel; //forwarding detection
  assign rs1Sel = RegWrite && (WriteAddr != 0) && (WriteAddr == rs1Addr);
  assign rs2Sel = RegWrite && (WriteAddr != 0) && (WriteAddr == rs2Addr);
  
  wire [31:0] ReadData1,ReadData2;
  Registers RBWRegisters(.ReadRegister1(rs1Addr), .ReadRegister2(rs2Addr), .WriteData(WriteData), 
  .WriteRegister(WriteAddr), .RegWrite(RegWrite), .clk(clk),
  .ReadData1(ReadData1), .ReadData2(ReadData2));
  
  assign rs1Data = (rs1Sel) ? WriteData : ReadData1; //mux
  assign rs2Data = (rs2Sel) ? WriteData : ReadData2;

endmodule
  