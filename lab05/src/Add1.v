`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 10:48:32
// Design Name: 
// Module Name: Add1
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


module Add1(
    input CLK,
    input [31:0] pre,
    output [31:0] cur
    );
    reg [31:0] Cur;
    assign cur=Cur;
    always @(negedge CLK)
    begin
    Cur=pre+4;
    end
endmodule
