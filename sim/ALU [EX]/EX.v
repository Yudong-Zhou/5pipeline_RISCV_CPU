`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer: qmj
//////////////////////////////////////////////////////////////////////////////////
module EX(ALUCode_ex, ALUSrcA_ex, ALUSrcB_ex,Imm_ex, rs1Addr_ex, rs2Addr_ex, rs1Data_ex, 
          rs2Data_ex, PC_ex, RegWriteData_wb, ALUResult_mem,rdAddr_mem, rdAddr_wb, 
		      RegWrite_mem, RegWrite_wb, ALUResult_ex, MemWriteData_ex, ALU_A, ALU_B);
    input [3:0] ALUCode_ex;
    input ALUSrcA_ex;
    input [1:0] ALUSrcB_ex;
    input [31:0] Imm_ex;
    input [4:0]  rs1Addr_ex;
    input [4:0]  rs2Addr_ex;
    input [31:0] rs1Data_ex;
    input [31:0] rs2Data_ex;
	  input [31:0] PC_ex;
    input [31:0] RegWriteData_wb;
    input [31:0] ALUResult_mem;
	  input [4:0] rdAddr_mem;
    input [4:0] rdAddr_wb;
    input RegWrite_mem;
    input RegWrite_wb;
    output [31:0] ALUResult_ex;
    output [31:0] MemWriteData_ex;
    output [31:0] ALU_A;// WHAT ARE THOSE TWO???
    output [31:0] ALU_B;
    
    forwarding Forwarding(.RegWrite_wb(RegWrite_wb), 
                          .RegWrite_mem(RegWrite_mem), 
                          .rdAddr_wb(rdAddr_wb), 
                          .rdAddr_mem(rdAddr_mem), 
                          .rs1Addr_ex(rs1Addr_ex), 
                          .rs2Addr_ex(rs2Addr_ex), 
                          .ForwardA(ForwardA), 
                          .ForwardB(ForwardB));
    wire [31:0] A, B;
    mux_3to1 mux1(.out(A), .in0(rs1Data), .in1(RegWriteData_wb), .in2(ALUResult_mem), .addr(ForwardA));
    mux_3to1 mux2(.out(B), .in0(rs2Data), .in1(RegWriteData_wb), .in2(ALUResult_mem), .addr(ForwardB));
    mux_2to1 mux4(.out(ALU_A), .in0(A), .in1(PC_ex), .addr(ALUSrcA_ex));
    mux_3to1 mux3(.out(ALU_B), .in0(B), .in1(Imm_ex), .in2(32'b100), .addr(ALU_B));
    assign MemWriteData_ex = B;
    
    ALU ALU(.ALUResult(ALUResult_ex), 
            .ALUCode(ALUCode_ex), 
            .A(ALU_A), 
            .B(ALU_B));
    
    
    
    
    
    
    
    
    
    

endmodule
