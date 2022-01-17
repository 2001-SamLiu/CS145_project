`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 09:53:05
// Design Name: 
// Module Name: ALUCtr
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


module ALUCtr(
    input[1:0] ALUOp,
    input[5:0] Funct,
    output [3:0] ALUCtrout
    );
    reg [3:0] ALUCtrOut;
    assign ALUCtrout=ALUCtrOut;
    always @ ({ALUOp,Funct})
    begin
        casex({ALUOp,Funct})
            8'b00xxxxxx: ALUCtrOut=4'b0010;
            8'b01xxxxxx:ALUCtrOut=4'b0110;
            8'b10100000:ALUCtrOut=4'b0010;
            8'b10100010:ALUCtrOut=4'b0110;
            8'b10100100:ALUCtrOut=4'b0000;
            8'b10100101:ALUCtrOut=4'b0001;
            8'b10101010:ALUCtrOut=4'b0111;
        endcase
    end
endmodule
