`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 16:11:48
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input Clk,
    input reset,
    input EX_MEM_EMPTY,
    input regwrite_in,
    input memtoreg_in,
    input memread_in,
    input memwrite_in,
    input branch_in,
    input [31:0] addres_in,
    input [31:0] add_res_in,
    input [31:0] alures_in,
    input zero_in,
    input [31:0] read_data_2_in,
    input [31:0] read_data_1_in,
    input [4:0] mux_1_in,
    input [4:0] arg1_in,
    input [4:0] arg2_in,
    input [4:0] arg3_in,
    input [31:0] jump_address_in,
    input jump_in,
    input jr_in,
    input jal_in,
        
    output reg regwrite_out,
    output reg memtoreg_out,
    output reg memread_out,
    output reg memwrite_out,
    output reg branch_out,
    output reg [31:0] addres_out,
    output reg [31:0] add_res_out,
    output reg [31:0] alures_out,
    output reg zero_out,
    output reg [31:0] read_data_2_out,
    output reg[31:0] read_data_1_out,    
    output reg [4:0] mux_1_out,
    output reg [4:0] arg1_out,
    output reg [4:0] arg2_out,
    output reg [4:0] arg3_out,
    output reg [31:0] jump_address_out,
    output reg jump_out,
    output reg jr_out,
    output reg jal_out
    );
    always @ (posedge Clk) 
    begin
        if(EX_MEM_EMPTY==0)
        begin
            regwrite_out=regwrite_in;
            memtoreg_out=memtoreg_in;
            memread_out= memread_in;
            memwrite_out=memwrite_in;
            branch_out=branch_in;
            addres_out= addres_in;
            add_res_out= add_res_in;
            alures_out=alures_in;
            zero_out=zero_in;
            read_data_2_out=read_data_2_in;
            read_data_1_out=read_data_1_in;
            mux_1_out=mux_1_in;
            arg1_out=arg1_in;
            arg2_out=arg2_in;
            arg3_out=arg3_in;
            jump_address_out=jump_address_in;
            jump_out=jump_in;
            jr_out=jr_in;
            jal_out=jal_in;
        end
        
        else begin
            regwrite_out=0;
            memtoreg_out=0;
            memread_out= 0;
            memwrite_out=0;
            branch_out=0;
            addres_out= 0;
            add_res_out= 0;
            alures_out=0;
            zero_out=0;
            read_data_2_out=0;
            read_data_1_out=0;
            mux_1_out=0;
            arg1_out=0;
            arg2_out=0;
            arg3_out=0;
            jump_address_out=0;
            jump_out=0;
            jr_out=0;
            jal_out=0;
         end
     end
    always @ (reset)
    begin
        regwrite_out=0;
        memtoreg_out=0;
        memread_out= 0;
        memwrite_out=0;
        branch_out=0;
        addres_out= 0;
        add_res_out= 0;
        alures_out=0;
        zero_out=0;
        read_data_2_out=0;
        read_data_1_out=0;
        mux_1_out=0;
        arg1_out=0;
        arg2_out=0;
        arg3_out=0;
        jump_address_out=0;
        jump_out=0;
        jr_out=0;
        jal_out=0;
    end
endmodule
