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
  
//  wire [31:0] Register_num; //5bits decoding
//  decode_register_5bits decode5bits(.WriteRegister(WriteRegister), .RegWrite(RegWrite), .Register_num(Register_num));
  
//  wire [32*32-1:0] regs;
//  D_trigger REG1(.d(WriteData), .en(Register_num[1]), .r(0), .clk(clk), .q(regs[32*2-1:32*1]));
//  D_trigger REG2(.d(WriteData), .en(Register_num[2]), .r(0), .clk(clk), .q(regs[32*3-1:32*2]));
//  D_trigger REG3(.d(WriteData), .en(Register_num[3]), .r(0), .clk(clk), .q(regs[32*4-1:32*3]));
//  D_trigger REG4(.d(WriteData), .en(Register_num[4]), .r(0), .clk(clk), .q(regs[32*5-1:32*4]));
//  D_trigger REG5(.d(WriteData), .en(Register_num[5]), .r(0), .clk(clk), .q(regs[32*6-1:32*5]));
//  D_trigger REG6(.d(WriteData), .en(Register_num[6]), .r(0), .clk(clk), .q(regs[32*7-1:32*6]));
//  D_trigger REG7(.d(WriteData), .en(Register_num[7]), .r(0), .clk(clk), .q(regs[32*8-1:32*7]));
//  D_trigger REG8(.d(WriteData), .en(Register_num[8]), .r(0), .clk(clk), .q(regs[32*9-1:32*8]));
//  D_trigger REG9(.d(WriteData), .en(Register_num[9]), .r(0), .clk(clk), .q(regs[32*10-1:32*9]));
//  D_trigger REG10(.d(WriteData), .en(Register_num[10]), .r(0), .clk(clk), .q(regs[32*11-1:32*10]));
//  D_trigger REG11(.d(WriteData), .en(Register_num[11]), .r(0), .clk(clk), .q(regs[32*12-1:32*11]));
//  D_trigger REG12(.d(WriteData), .en(Register_num[12]), .r(0), .clk(clk), .q(regs[32*13-1:32*12]));
//  D_trigger REG13(.d(WriteData), .en(Register_num[13]), .r(0), .clk(clk), .q(regs[32*14-1:32*13]));
//  D_trigger REG14(.d(WriteData), .en(Register_num[14]), .r(0), .clk(clk), .q(regs[32*15-1:32*14]));
//  D_trigger REG15(.d(WriteData), .en(Register_num[15]), .r(0), .clk(clk), .q(regs[32*16-1:32*15]));
//  D_trigger REG16(.d(WriteData), .en(Register_num[16]), .r(0), .clk(clk), .q(regs[32*17-1:32*16]));
//  D_trigger REG17(.d(WriteData), .en(Register_num[17]), .r(0), .clk(clk), .q(regs[32*18-1:32*17]));
//  D_trigger REG18(.d(WriteData), .en(Register_num[18]), .r(0), .clk(clk), .q(regs[32*19-1:32*18]));
//  D_trigger REG19(.d(WriteData), .en(Register_num[19]), .r(0), .clk(clk), .q(regs[32*20-1:32*19]));
//  D_trigger REG20(.d(WriteData), .en(Register_num[20]), .r(0), .clk(clk), .q(regs[32*21-1:32*20]));
//  D_trigger REG21(.d(WriteData), .en(Register_num[21]), .r(0), .clk(clk), .q(regs[32*22-1:32*21]));
//  D_trigger REG22(.d(WriteData), .en(Register_num[22]), .r(0), .clk(clk), .q(regs[32*23-1:32*22]));
//  D_trigger REG23(.d(WriteData), .en(Register_num[23]), .r(0), .clk(clk), .q(regs[32*24-1:32*23]));
//  D_trigger REG24(.d(WriteData), .en(Register_num[24]), .r(0), .clk(clk), .q(regs[32*25-1:32*24]));
//  D_trigger REG25(.d(WriteData), .en(Register_num[25]), .r(0), .clk(clk), .q(regs[32*26-1:32*25]));
//  D_trigger REG26(.d(WriteData), .en(Register_num[26]), .r(0), .clk(clk), .q(regs[32*27-1:32*26]));
//  D_trigger REG27(.d(WriteData), .en(Register_num[27]), .r(0), .clk(clk), .q(regs[32*28-1:32*27]));
//  D_trigger REG28(.d(WriteData), .en(Register_num[28]), .r(0), .clk(clk), .q(regs[32*29-1:32*28]));
//  D_trigger REG29(.d(WriteData), .en(Register_num[29]), .r(0), .clk(clk), .q(regs[32*30-1:32*29]));
//  D_trigger REG30(.d(WriteData), .en(Register_num[30]), .r(0), .clk(clk), .q(regs[32*31-1:32*30]));
//  D_trigger REG31(.d(WriteData), .en(Register_num[31]), .r(0), .clk(clk), .q(regs[32*32-1:32*31]));

//  assign ReadData1 = (ReadRegister1 == 5'b0)?32'b0:regs[(ReadRegister1*32)+:32];
//  assign ReadData2 = (ReadRegister2 == 5'b0)?32'b0:regs[(ReadRegister2*32)+:32];
//  always@(posedge clk)
//    if(RegWrite) regs[(WriteRegister*32)+:32] <= WriteData;

  reg [31:0]regs[31:0]; 
  assign ReadData1 = (ReadRegister1 == 5'b0)?32'b0:regs[ReadRegister1];
  assign ReadData2 = (ReadRegister2 == 5'b0)?32'b0:regs[ReadRegister2];
  always@(posedge clk)
    if(RegWrite) regs[WriteRegister] <= WriteData;
  
endmodule
  
  
  










  