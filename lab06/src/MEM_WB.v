`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 16:11:48
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input Clk,
    input reset,
    
    input [31:0] read_data_in,
    input [31:0] alures_in,
    input memtoreg_in,
    input regwrite_in,
    input [4:0] arg1_in,
    input [4:0] arg2_in,
    input [4:0] arg3_in,
    input [4:0] mux_1_in,
    input jal_in,
    input [31:0] add_res_in,
    
    output reg memtoreg_out,
    output reg regwrite_out,
    output reg [31:0] read_data_out,
    output reg [31:0] alures_out,
    output reg [4:0] arg1_out,
    output reg [4:0] arg2_out,
    output reg [4:0] arg3_out,
    output reg [4:0] mux_1_out,
    output reg jal_out,
    output reg [31:0] add_res_out
    
    );
    always @ (posedge Clk) 
    begin
        memtoreg_out=memtoreg_in;
        regwrite_out=regwrite_in;
        read_data_out=read_data_in;
        alures_out=alures_in;
        arg1_out=arg1_in;
        arg2_out=arg2_in;
        arg3_out=arg3_in;
        mux_1_out=mux_1_in;
        jal_out=jal_in;
        add_res_out=add_res_in;
    end
    always @(reset)
    begin 
        memtoreg_out=0;
        regwrite_out=0;
        read_data_out=0;
        alures_out=0;
        arg1_out=0;
        arg2_out=0;
        arg3_out=0;
        mux_1_out=0;
        jal_out=0;
        add_res_out=0;
    end
        
endmodule
