`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:30:41
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
    input[31:0] address,
    output [31:0] instruction
    );
    reg [31:0] File[127:0];
    reg [31:0] Instruction;
    assign instruction=Instruction;
    initial begin
        $readmemb("G:/SJTU/2021-4/体系结构实验/lab05/lab05/lab05.srcs/sources_1/new/Instructions.txt",File);
        end
    always @(address)
    begin
    Instruction=File[address>>2];
    end
endmodule
