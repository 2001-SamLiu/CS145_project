`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 11:24:33
// Design Name: 
// Module Name: Registers
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


module Registers(
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input regWrite,
    output [31:0] readData1,
    output [31:0] readData2,
    input Clk
    );
    reg[31:0] ReadData1=0;
    reg[31:0] ReadData2=0;
    assign readData1=ReadData1;
    assign readData2=ReadData2;
    reg [31:0] regFile[31:0];
    integer i;
    initial begin
    for(i=0;i<32;i=i+1)
    regFile[i]=0;
    end
    always @ ( readReg1 or readReg2)
        begin
        ReadData1=regFile[readReg1];
        ReadData2=regFile[readReg2];
        end
    always @ (negedge Clk)
        begin
        if(regWrite==1)
            begin
            regFile[writeReg]=writeData;
            end
        end
endmodule
