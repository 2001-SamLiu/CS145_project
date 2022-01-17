`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 09:23:18
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
    reg CLK;
    reg RESET;
    Top u100(
        .CLK(CLK),
        .RESET(RESET));
    always #100 CLK=!CLK;
    initial 
        begin
            RESET=1;
            CLK=0;
            #100;
            RESET=0;
        end
            
endmodule
