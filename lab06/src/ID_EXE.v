`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 16:11:48
// Design Name: 
// Module Name: ID_EXE
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


module ID_EXE(
    input Clk,
    input reset,
    input ID_EXE_STALL,
    input EMPTY,
    input [31:0] read_data_1_in,
    input [31:0] read_data_2_in,
    input [31:0] data_extend_in,
    input branch_in,
    input RegDst_in,
    input memWrite_in,
    input memRead_in,
    input memToReg_in,
    input regWrite_in,
    input [2:0] aluop_in,
    input alusrc_in,
    input [4:0] num_1_in,
    input [4:0] num_2_in,
    input [4:0] num_3_in,
    input [4:0] num_4_in,
    input [31:0] addr_in,
    input jump_in,
    input jal_in,
    input jr_in,
    input [31:0] jump_add_in,
    output reg [31:0] read_data_1_out,
    output reg [31:0] read_data_2_out,
    output reg [31:0] data_extend_out,
    output reg branch_out,
    output reg RegDst_out,
    output reg memWrite_out,
    output reg memRead_out,
    output reg memToReg_out,
    output reg regWrite_out,
    output reg alusrc_out,
    output reg [2:0] aluop_out,
    output reg [4:0] num_1_out,
    output reg [4:0] num_2_out,
    output reg [4:0] num_3_out,
    output reg [4:0] num_4_out,
    output reg [31:0] addr_out,
    output reg jump_out,
    output reg jal_out,
    output reg jr_out,
    output reg [31:0]jump_add_out
    );
    always @ (posedge Clk)
    begin
        if(ID_EXE_STALL==0)
        begin
            jump_add_out=jump_add_in;
            read_data_1_out=read_data_1_in;
            read_data_2_out=read_data_2_in;
            branch_out=branch_in;
            RegDst_out=RegDst_in;
            memWrite_out=memWrite_in;
            memRead_out=memRead_in;
            memToReg_out=memToReg_in;
            regWrite_out=regWrite_in;
            alusrc_out=alusrc_in;
            aluop_out=aluop_in;
            num_1_out=num_1_in;
            num_2_out=num_2_in;
            num_3_out=num_3_in;
            num_4_out=num_4_in;
            addr_out=addr_in;
            jump_out=jump_in;
            jal_out=jal_in;
            jr_out=jr_in;
            data_extend_out=data_extend_in;
        end
        else begin
            read_data_1_out=read_data_1_in;
            read_data_2_out=read_data_2_in;
            end
    end
    
    always @ (reset or EMPTY)
    begin
        jump_add_out=0;
        read_data_1_out=0;
        read_data_2_out=0;
        branch_out=0;
        RegDst_out=0;
        memWrite_out=0;
        memRead_out=0;
        memToReg_out=0;
        regWrite_out=0;
        alusrc_out=0;
        aluop_out=0;
        num_1_out=0;
        num_2_out=0;
        num_3_out=0;
        num_4_out=0;
        addr_out=0;
        jump_out=0;
        jal_out=0;
        jr_out=0;
        data_extend_out=0;
    end
endmodule
