`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 12:54:20
// Design Name: 
// Module Name: forward_unit
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


module forward_unit(
    input Clk,
    input jump,
    input jr,
    input jal,
    input beq,
    input [4:0] reg_read_add_1,
    input [4:0] reg_read_add_2,
    input [4:0] reg_write_add_WB,
    input [31:0] reg_write_data_WB,
    input regwrite_WB,
    input [4:0] reg_write_add_MEM,
    input [31:0] reg_write_data_MEM,
    input memread_MEM,                   //add_hit & memread & regwrite 则要stall   只有regwrite则回传
    input regwrite_MEM,
    output reg [31:0] new_read_data_1=0,
    output reg [31:0] new_read_data_2=0,
    output reg signal_1_new,
    output reg signal_2_new,
    output reg ID_EX_STALL=0,
    output reg IF_ID_STALL=0,
    output reg EX_MEM_EMPTY=0,
    output reg EMPTY=0
    );
    always @(jump or jr or jal or beq or reg_read_add_1 or reg_read_add_2 or reg_write_add_WB or reg_write_add_MEM ) begin
        signal_1_new=0;
        signal_2_new=0;
        ID_EX_STALL=0;
        IF_ID_STALL=0;
        EX_MEM_EMPTY=0;
        EMPTY=0;
        if(jump==1 || jal==1 || jr==1 || beq==1) begin//说明应该跳转了，清空
            EMPTY=1;
            EX_MEM_EMPTY=1;
        end
        else begin
        if(reg_read_add_1==reg_write_add_WB && reg_read_add_1!=0 && regwrite_WB==1)begin//读写一致
                new_read_data_1=reg_write_data_WB;//提前读
                signal_1_new=1;
        end
        if(reg_read_add_2==reg_write_add_WB && regwrite_WB==1 && reg_read_add_2!=0)begin
                new_read_data_2=reg_write_data_WB;
                signal_2_new=1;
        end

        if(reg_read_add_1==reg_write_add_MEM && regwrite_MEM==1 && reg_read_add_1!=0)begin
                if(memread_MEM==1)begin
                    ID_EX_STALL=1;//需要stall
                    IF_ID_STALL=1;
                    EX_MEM_EMPTY=1;
                end
                else begin
                    new_read_data_1=reg_write_data_MEM;
                    signal_1_new=1;
                end
            end
        if(reg_read_add_2==reg_write_add_MEM && regwrite_MEM==1 && reg_read_add_2!=0 )begin
            if(memread_MEM==1)begin
                ID_EX_STALL=1;
                IF_ID_STALL=1;
                EX_MEM_EMPTY=1;
            end
            else begin
                new_read_data_2=reg_write_data_MEM;
                signal_2_new=1;
            end
        end
        end
    end
endmodule
