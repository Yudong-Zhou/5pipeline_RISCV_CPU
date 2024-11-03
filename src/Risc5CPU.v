`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Zhou Yudong
// Risc5CPU.v
//////////////////////////////////////////////////////////////////////////////////
module Risc5CPU(clk, reset, JumpFlag, Instruction_id, ALU_A, 
                     ALU_B, ALUResult_ex, PC, MemDout_mem,Stall);
    input clk;
    input reset;
    output[1:0] JumpFlag;
    output [31:0] Instruction_id;
    output [31:0] ALU_A;
    output [31:0] ALU_B;
    output [31:0] ALUResult_ex;
    output [31:0] PC;
    output [31:0] MemDout_mem;
    output Stall;
    
    //IF
    wire Branch, Jump, IFWrite, IF_flush;
    wire [31:0] JumpAddr, Instruction_if;
    //ID
    wire MemtoReg_id, RegWrite_id, MemWrite_id, MemRead_id, ALUSrcA_id;  
    wire [4:0] rs1Addr_id,rs2Addr_id,rdAddr_id;
    wire [3:0] ALUCode_id;
    wire [1:0] ALUSrcB_id;
    wire [31:0] Imm_id, rs1Data_id, rs2Data_id, PC_id;
    //EX
    wire ALUSrcA_ex, MemRead_ex, MemtoReg_ex, MemWrite_ex, RegWrite_ex;
    wire [3:0] ALUCode_ex;
    wire [1:0] ALUSrcB_ex; 
    wire [4:0] rs1Addr_ex, rs2Addr_ex, rdAddr_ex;
    wire [31:0] rs1Data_ex, rs2Data_ex, PC_ex, MemWriteData_ex, Imm_ex;
    //MEM
    wire RegWrite_mem, MemtoReg_mem, MemWrite_mem;
    wire [4:0] rdAddr_mem;
    wire [31:0] ALUResult_mem, MemWriteData_mem;
    //WB
    wire RegWrite_wb, MemtoReg_wb;
    wire [4:0] rdAddr_wb;
    wire [31:0] ALUResult_wb, MemDout_wb, RegWriteData_wb;

    //assign Branch = 0;
    //assign Jump = 1;
    //assign IFWrite = 0;
    //assign JumpAddr = 0;
    IF1 IF(.clk(clk), 
           .reset(reset), 
           .Branch(Branch), 
           .Jump(Jump), 
           .IFWrite(IFWrite), 
           .JumpAddr(JumpAddr), 
           .Instruction_if(Instruction_if), 
           .PC(PC), 
           .IF_flush(IF_flush));
    IF_ID_REG IF_ID_register(.en(IFWrite), 
                             .r(IF_flush), 
                             .clk(clk), 
                             .d1(PC), 
                             .d2(Instruction_if), 
                             .q1(PC_id), 
                             .q2(Instruction_id));
    ID ID(.clk(clk),
          .Instruction_id(Instruction_id), 
          .PC_id(PC_id), 
          .RegWrite_wb(RegWrite_wb), 
          .rdAddr_wb(rdAddr_wb), 
          .RegWriteData_wb(RegWriteData_wb), 
          .MemRead_ex(MemRead_ex), 
          .rdAddr_ex(rdAddr_ex), 
          .MemtoReg_id(MemtoReg_id), 
          .RegWrite_id(RegWrite_id), 
          .MemWrite_id(MemWrite_id), 
          .MemRead_id(MemRead_id), 
          .ALUCode_id(ALUCode_id), 
			    .ALUSrcA_id(ALUSrcA_id), 
			    .ALUSrcB_id(ALUSrcB_id),  
			    .Stall(Stall), 
			    .Branch(Branch), 
			    .Jump(Jump), 
			    .IFWrite(IFWrite),  
			    .JumpAddr(JumpAddr), 
			    .Imm_id(Imm_id),
			    .rs1Data_id(rs1Data_id), 
			    .rs2Data_id(rs2Data_id),
			    .rs1Addr_id(rs1Addr_id),
			    .rs2Addr_id(rs2Addr_id),
			    .rdAddr_id(rdAddr_id));
    ID_EX_REG ID_EX_register(.en(1'b1), .r(Stall), .clk(clk), 
                            .WB1(MemtoReg_id), .WB2(RegWrite_id), //D
                            .MEM1(MemWrite_id), .MEM2(MemRead_id), 
                            .EX1(ALUCode_id), .EX2(ALUSrcA_id), .EX3(ALUSrcB_id), 
                            .EX4(PC_id), .EX5(Imm_id), 
                            .EX6(rdAddr_id), .EX7(rs1Addr_id), .EX8(rs2Addr_id), 
                            .EX9(rs1Data_id), .EX10(rs2Data_id),
                            .Q_WB1(MemtoReg_ex), .Q_WB2(RegWrite_ex), //Q
                            .Q_MEM1(MemWrite_ex), .Q_MEM2(MemRead_ex), 
                            .Q_EX1(ALUCode_ex), .Q_EX2(ALUSrcA_ex), .Q_EX3(ALUSrcB_ex), 
                            .Q_EX4(PC_ex), .Q_EX5(Imm_ex), 
                            .Q_EX6(rdAddr_ex), .Q_EX7(rs1Addr_ex), .Q_EX8(rs2Addr_ex), 
                            .Q_EX9(rs1Data_ex), .Q_EX10(rs2Data_ex));
    EX EX(.ALUCode_ex(ALUCode_ex), 
          .ALUSrcA_ex(ALUSrcA_ex), 
          .ALUSrcB_ex(ALUSrcB_ex),
          .Imm_ex(Imm_ex), 
          .rs1Addr_ex(rs1Addr_ex), 
          .rs2Addr_ex(rs2Addr_ex), 
          .rs1Data_ex(rs1Data_ex), 
          .rs2Data_ex(rs2Data_ex), 
          .PC_ex(PC_ex), 
          .RegWriteData_wb(RegWriteData_wb), 
          .ALUResult_mem(ALUResult_mem),
          .rdAddr_mem(rdAddr_mem), 
          .rdAddr_wb(rdAddr_wb), 
          .RegWrite_mem(RegWrite_mem), 
	  .RegWrite_wb(RegWrite_wb), 
          .ALUResult_ex(ALUResult_ex), 
	  .MemWriteData_ex(MemWriteData_ex), 
	  .ALU_A(ALU_A), 
	  .ALU_B(ALU_B));
    EX_MEM_REG  EX_MEM_register(.en(1'b1), .r(1'b0), .clk(clk), 
                                .WB1(MemtoReg_ex), 
                                .WB2(RegWrite_ex), 
			        .MEM1(MemWrite_ex), 
				.MEM2(ALUResult_ex), 
				.MEM3(MemWriteData_ex), 
				.MEM4(rdAddr_ex),
				.Q_WB1(MemtoReg_mem), 
				.Q_WB2(RegWrite_mem), 
				.Q_MEM1(MemWrite_mem), 
				.Q_MEM2(ALUResult_mem), 
				.Q_MEM3(MemWriteData_mem), 
				.Q_MEM4(rdAddr_mem));
    DataRAM DataRAM(.a(ALUResult_mem[7:2]),
                    .d(MemWriteData_mem),
                    .clk(clk),
                    .we(MemWrite_mem),
                    .spo(MemDout_mem));   
    MEM_WB_REG MEM_WB_register(.en(1'b1), .r(1'b0), .clk(clk), 
                               .WB1(MemtoReg_mem), 
                               .WB2(RegWrite_mem), 
                               .WB3(MemDout_mem), 
                               .WB4(ALUResult_mem), 
                               .WB5(rdAddr_mem),
                               .Q_WB1(MemtoReg_wb), 
                               .Q_WB2(RegWrite_wb), 
                               .Q_WB3(MemDout_wb), 
                               .Q_WB4(ALUResult_wb), 
                               .Q_WB5(rdAddr_wb));    
    //WB mux
    mux_2to1 #(.n(32))mem_mux(.out(RegWriteData_wb), 
                     .in0(ALUResult_wb), 
                     .in1(MemDout_wb), 
                     .addr(MemtoReg_wb)); 
    
    assign JumpFlag = {Jump, Branch};

endmodule

