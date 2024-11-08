//******************************************************************************
// Author: Zhou Yudong
// Register.v
//******************************************************************************
`timescale 1ns / 1ps
module registers(
  // inputs
  ReadRegister1, ReadRegister2, WriteData, WriteRegister, RegWrite, clk,
  // outputs
  ReadData1, ReadData2);
  input [4:0] ReadRegister1, ReadRegister2; 
  input [31:0] WriteData;
  input [4:0] WriteRegister;
  input RegWrite, clk;
  output [31:0] ReadData1, ReadData2;
  
  wire [31:0] Register_num; //5bits decoding
  decode_register_5bits decode5bits(.WriteRegister(WriteRegister), .RegWrite(RegWrite), .Register_num(Register_num));
  
  reg [31:0]regs[31:0];
  always@* regs[0] = 0;
  D_trigger REG1(.d(WriteData), .en(Register_num[1]), .r(0), .clk(clk), .q(regs[1]));
  D_trigger REG2(.d(WriteData), .en(Register_num[2]), .r(0), .clk(clk), .q(regs[2]));
  D_trigger REG3(.d(WriteData), .en(Register_num[3]), .r(0), .clk(clk), .q(regs[3]));
  D_trigger REG4(.d(WriteData), .en(Register_num[4]), .r(0), .clk(clk), .q(regs[4]));
  D_trigger REG5(.d(WriteData), .en(Register_num[5]), .r(0), .clk(clk), .q(regs[5]));
  D_trigger REG6(.d(WriteData), .en(Register_num[6]), .r(0), .clk(clk), .q(regs[6]));
  D_trigger REG7(.d(WriteData), .en(Register_num[7]), .r(0), .clk(clk), .q(regs[7]));
  D_trigger REG8(.d(WriteData), .en(Register_num[8]), .r(0), .clk(clk), .q(regs[8]));
  D_trigger REG9(.d(WriteData), .en(Register_num[9]), .r(0), .clk(clk), .q(regs[9]));
  D_trigger REG10(.d(WriteData), .en(Register_num[10]), .r(0), .clk(clk), .q(regs[10]));
  D_trigger REG11(.d(WriteData), .en(Register_num[11]), .r(0), .clk(clk), .q(regs[11]));
  D_trigger REG12(.d(WriteData), .en(Register_num[12]), .r(0), .clk(clk), .q(regs[12]));
  D_trigger REG13(.d(WriteData), .en(Register_num[13]), .r(0), .clk(clk), .q(regs[13]));
  D_trigger REG14(.d(WriteData), .en(Register_num[14]), .r(0), .clk(clk), .q(regs[14]));
  D_trigger REG15(.d(WriteData), .en(Register_num[15]), .r(0), .clk(clk), .q(regs[15]));
  D_trigger REG16(.d(WriteData), .en(Register_num[16]), .r(0), .clk(clk), .q(regs[16]));
  D_trigger REG17(.d(WriteData), .en(Register_num[17]), .r(0), .clk(clk), .q(regs[17]));
  D_trigger REG18(.d(WriteData), .en(Register_num[18]), .r(0), .clk(clk), .q(regs[18]));
  D_trigger REG19(.d(WriteData), .en(Register_num[19]), .r(0), .clk(clk), .q(regs[19]));
  D_trigger REG20(.d(WriteData), .en(Register_num[20]), .r(0), .clk(clk), .q(regs[20]));
  D_trigger REG21(.d(WriteData), .en(Register_num[21]), .r(0), .clk(clk), .q(regs[21]));
  D_trigger REG22(.d(WriteData), .en(Register_num[22]), .r(0), .clk(clk), .q(regs[22]));
  D_trigger REG23(.d(WriteData), .en(Register_num[23]), .r(0), .clk(clk), .q(regs[23]));
  D_trigger REG24(.d(WriteData), .en(Register_num[24]), .r(0), .clk(clk), .q(regs[24]));
  D_trigger REG25(.d(WriteData), .en(Register_num[25]), .r(0), .clk(clk), .q(regs[25]));
  D_trigger REG26(.d(WriteData), .en(Register_num[26]), .r(0), .clk(clk), .q(regs[26]));
  D_trigger REG27(.d(WriteData), .en(Register_num[27]), .r(0), .clk(clk), .q(regs[27]));
  D_trigger REG28(.d(WriteData), .en(Register_num[28]), .r(0), .clk(clk), .q(regs[28]));
  D_trigger REG29(.d(WriteData), .en(Register_num[29]), .r(0), .clk(clk), .q(regs[29]));
  D_trigger REG30(.d(WriteData), .en(Register_num[30]), .r(0), .clk(clk), .q(regs[30]));
  D_trigger REG31(.d(WriteData), .en(Register_num[31]), .r(0), .clk(clk), .q(regs[31]));

  assign ReadData1 = (ReadRegister1 == 5'b0)?32'b0:regs[ReadRegister1];
  assign ReadData2 = (ReadRegister2 == 5'b0)?32'b0:regs[ReadRegister2];
  always@(posedge clk)
    if(RegWrite) regs[WriteRegister] <= WriteData;
      
endmodule
  
  
  










  