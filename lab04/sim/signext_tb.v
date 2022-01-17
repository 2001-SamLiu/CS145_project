`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 09:39:57
// Design Name: 
// Module Name: signext_tb
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


module signext_tb(

    );
    reg [15:0] inst;
    wire [31:0] data;
    signext u0(
    .inst(inst),
    .data(data));
    initial begin
    inst=0;
    #100;
    inst=16'b0000000000010001;
    #100;
    inst=16'b1111111111111111;
    #100;
    inst=16'b0000000000001010;
    #100;
    inst=16'b1111111111111110;
    end
endmodule
