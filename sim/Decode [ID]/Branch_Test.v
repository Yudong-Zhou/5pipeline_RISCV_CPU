//******************************************************************************
// Author: Zhou Yudong
// Branch_Test.v
//******************************************************************************
`timescale 1ns / 1ps
module Branch_Test(
  //input
  rs1Data, rs2Data, SB_type_judge, funct3_judge,
  //output
  Branch);
  input [31:0] rs1Data, rs2Data;
  input [6:0] SB_type_judge;
  input [2:0] funct3_judge;
  output Branch;
  reg Branch;
  
  //define parameters
  parameter SB_OPCODE = 7'h63;
  parameter BEQ_funct3 = 3'o0;
  parameter BNE_funct3 = 3'o1;
  parameter BLT_funct3 = 3'o4;
  parameter BGE_funct3 = 3'o5;
  parameter BLTU_funct3 = 3'o6;
  parameter BGEU_funct3 = 3'o7;
  
  //add 32bits datas
  wire [31:0] sum;
  wire co;
  adder_32bits adder(.a(rs1Data), .b(rs2Data), .ci(0), .s(sum), .co(co));
  
  //make judgements
  wire isLT,isLTU;
  assign isLT = rs1Data[31] && (~rs2Data[31]) || 
                (rs1Data[31]~^rs2Data[31]) && sum[31];
  assign isLTU = (~rs1Data[31]) && rs2Data[31] || 
                 (rs1Data[31]~^rs2Data[31]) && sum[31];
  
  //Branch selection
  reg sum_judge;
  always@(*) begin
    if (sum == 0) sum_judge = 0;
    else sum_judge = 1;
    if (SB_type_judge == SB_OPCODE)
      case (funct3_judge)
        BEQ_funct3: Branch = ~(sum_judge);
        BNE_funct3: Branch = sum_judge;
        BLT_funct3: Branch = isLT;
        BGE_funct3: Branch = ~isLT;
        BLTU_funct3: Branch = isLTU;
        BGEU_funct3: Branch = ~isLTU;
      endcase
    else Branch = 0;
  end

endmodule
    
    
    
    
    