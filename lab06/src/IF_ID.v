`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 16:11:48
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input Clk,
    input reset,
    input [31:0] inst_in,
    input [31:0] addr_in,
    input IF_ID_STALL,
    input empty,
    output reg [31:0] inst_out,
    output reg [31:0] addr_out
    );
    always @ (posedge Clk)
    begin
        if(IF_ID_STALL==0)
        begin
            addr_out=addr_in;
            inst_out=inst_in;
        end
    end
    always @ (reset or empty)
    begin
        addr_out=0;
        inst_out=0;
    end
    
endmodule
