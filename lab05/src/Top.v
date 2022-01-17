`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:05:03
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
input CLK,
input RESET
    );
    wire REG_DST,
    JUMP,
    BRANCH,
    MEM_READ,
    MEM_TO_REG,
    MEM_WRITE,
    ALU_SRC,
    REG_WRITE,
    JAL,
    EXTEND,
    JUMP1;
    wire [2:0] ALU_OP;
    wire [31:0] INST;
    wire [31:0] pre_PC;
    wire [31:0] cur_PC;
    wire [31:0] writedata;
    wire [31:0] readdata;
    wire [31:0] readdata1;
    wire [31:0] readdata2;
    wire [3:0] aluout;
    wire [31:0] aluInput;
    wire [4:0] writereg;
    wire Zero;
    wire [31:0] alures;
    wire [31:0] Destination;
    wire[31:0] destination;
    wire [31:0] result;
    wire [27:0] result1;
    wire [31:0] result2;
    wire [31:0] cur_PC1;
    wire [31:0] rs31;
    //
    PC pc(
        .Clk(CLK),
        .reset(RESET),
        .pre(pre_PC),
        .cur(cur_PC),
        .rs(readdata1),
        .jump(JUMP1));
    Add1 pc_add(
        .CLK(CLK),
        .pre(cur_PC),
        .cur(cur_PC1));
    InstMemory instMemory(
        .instruction(INST),
        .address(cur_PC));
    //
    Ctr Ctr(
        .OpCode(INST[31:26]),
        .regDst(REG_DST),
        .jump(JUMP),
        .branch(BRANCH),
        .memRead(MEM_READ),
        .memToReg(MEM_TO_REG),
        .aluOp(ALU_OP),
        .memWrite(MEM_WRITE),
        .aluSrc(ALU_SRC),
        .regWrite(REG_WRITE),
        .extend(EXTEND),
        .jal(JAL),
        .jump1(JUMP1),
        .fun(INST[5:0]));
    //
    Registers registers(
        .readReg1(INST[25:21]),
        .readReg2(INST[20:16]),
        .writeReg(writereg),
        .writeData(writedata),
        .regWrite(REG_WRITE),
        .readData1(readdata1),
        .readData2(readdata2),
        .Clk(CLK),
        .reset(RESET),
        .jal(JAL),
        .new_PC(cur_PC1));
    //
    ALUCtr aluCtr(
        .ALUOp(ALU_OP),
        .Funct(INST[5:0]),
        .ALUCtrout(aluout));
    
    Alu alu(
         .input1(readdata1),
         .input2(aluInput),
         .aluCtr(aluout),
         .zero(Zero),
         .imme(INST[10:6]),
         .aluRes(alures));
         
     dataMemory datamemory(
         .Clk(CLK),
         .address(alures),
         .writeData(readdata2),
         .memWrite(MEM_WRITE),
         .memRead(MEM_READ),
         .readData(readdata));
     signext signextend(
        .CLK(CLK),
        .extend(EXTEND),
        .inst(INST[15:0]),
        .data(Destination));
     Mux Mux_alu(
         .input1(Destination),
         .input2(readdata2),
         .signal(ALU_SRC),
         .result(aluInput));
     Mux Mux_dataMemory(
         .input1(readdata),
         .input2(alures),
         .signal(MEM_TO_REG),
         .result(writedata));
     Mux1 Mux_write_register(
         .input1(INST[15:11]),
         .input2(INST[20:16]),
         .signal(REG_DST),
         .result(writereg));
     Shift branch(
         .input1(Destination),
         .result(destination));
     Add branch_(
         .input1(destination),
         .input2(cur_PC1),
         .result(result));
     Mux branch_add(
         .input1(result),
         .input2(cur_PC1),
         .signal(BRANCH && Zero),
         .result(result2));
     Shift1 jump(
         .input1(INST[25:0]),
         .result(result1));
     Mux jump_add(
         .input1({cur_PC1[31:28],result1}),
         .input2(result2),
         .signal(JUMP),
         .result(pre_PC));
endmodule
