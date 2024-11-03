//////////////////////////////////////////////////////////////////////////////////
// Author:Zhou Yudong
// IF.v
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module IF1(
    //input
    clk, reset, Branch, Jump, IFWrite, JumpAddr, 
    //output
    Instruction_if, PC, IF_flush);
    input clk;
    input reset;
    input Branch;
    input Jump;
    input IFWrite;
    input [31:0] JumpAddr;
    output [31:0] Instruction_if;
    output [31:0] PC;
    output IF_flush;
    
    assign IF_flush = Jump || Branch;
    wire [31:0] NextPC_IF;
    wire [31:0] PC_Selected;
    mux_2to1 #(.n(32))mux_IF(.out(PC_Selected), .in0(NextPC_IF), .in1(JumpAddr), .addr(IF_flush));
    D_trigger PC_register(.d(PC_Selected), .en(IFWrite), .r(reset), .clk(clk), .q(PC));
    adder_32bits PC_add4(.a(PC), .b(32'b100), .ci(1'b0), .s(NextPC_IF), .co());

    wire [5:0] PC_to_ROM;
    assign PC_to_ROM = {PC[7:2]}; 
    InstructionROM InstructionROM(.addr(PC_to_ROM), .dout(Instruction_if));

endmodule
