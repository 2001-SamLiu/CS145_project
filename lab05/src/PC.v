`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:15:47
// Design Name: 
// Module Name: PC
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


module PC(
    input Clk,
    input reset,
    input jump,
    input [31:0] pre,
    input [31:0] rs,
    output [31:0] cur
    );
    reg [31:0] PC;
    assign cur=PC;
    initial begin
    PC=0;
    end
    always @ (reset)
    begin
        PC=32'b00000000000000000000000000000000;
        end
    always @(posedge Clk)
    begin
    PC=pre;
    if(jump==1)
    PC=rs;
    end
endmodule
