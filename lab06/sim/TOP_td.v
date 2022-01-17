`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 13:38:30
// Design Name: 
// Module Name: TOP_td
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


module TOP_td(

    );
    reg Clk;
    reg reset;
    Top u0(
        .CLK(Clk),
        .RESET(reset)
    );
    parameter PERIOD=50;
    always #(PERIOD) Clk = !Clk;
    initial begin
        Clk =1'b0;
        reset=0;
        
    end
endmodule
