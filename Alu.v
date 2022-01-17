`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 10:24:05
// Design Name: 
// Module Name: Alu
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


module Alu(
    input [31:0] input1,
    input[31:0] input2,
    input [3:0] aluCtr,
    output zero,
    output [31:0] aluRes);
    reg Zero;
    reg [31:0] AluRes;
    assign aluRes=AluRes;
    assign zero=Zero;
    always @ (input1 or input2 or aluCtr)
    begin
        if( aluCtr== 4'b0010)
            AluRes=input1+input2;
        else if(aluCtr==4'b0110)
        begin
            AluRes = input1-input2;
            if(AluRes==0)
                Zero=1;
            else 
                Zero=0;
        end
        else if (aluCtr==4'b0000)
        begin
	AluRes=input1&input2;
        end
        else if(aluCtr==4'b0001)
        begin
	AluRes=input1|input2;
        end
        else if (aluCtr==4'b0111)
        begin
            if(input1<input2)
                begin
                    AluRes=1;
                    Zero=0;
                end
            else 
            begin
                AluRes=0;
                Zero=1;
            end
        end
        else if (aluCtr==4'b1100)
        begin
            AluRes=~(input1|input2);
        end
    end
endmodule
