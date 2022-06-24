`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  映射方式
//        Q
//        |
//   01   |    00
//________|________ I
//        |
//   11   |    10
//        |

module QPSK_Mod#(
    parameter sps=4,
    parameter Pos_Level = 16'h6665,
    parameter Neg_Level = 16'h999B
)(
    input         clk,
    input         reset,
    // input axis for baseband data
    input  [31:0] axis_in_tdata,
    input         axis_in_tvalid,
    output        axis_in_tready,
    // output axis for qpsk data
    output [31:0] axis_out_tdata,
    output        axis_out_tvalid,
    input         axis_out_tready
    );
    
    wire [31:0] axis_conv2repeat_tdata;
    wire        axis_conv2repeat_tvalid;
    wire        axis_conv2repeat_tready;
    QPSK_data_converter  #(
        .ONE(Pos_Level), .ZERO(Neg_Level)
        ) conv(
        .clk(clk), .reset(reset),
        
        .in_tdata(axis_in_tdata),
        .in_tvalid(axis_in_tvalid),
        .in_tready(axis_in_tready),
        
        .out_tdata(axis_conv2repeat_tdata),
        .out_tvalid(axis_conv2repeat_tvalid),
        .out_tready(axis_conv2repeat_tready)
    );
    
    Repeater #(.N(sps)) repeater(
        .clk(clk), .reset(reset),
        
        .in_tdata(axis_conv2repeat_tdata),
        .in_tvalid(axis_conv2repeat_tvalid),
        .in_tready(axis_conv2repeat_tready),
        
        .out_tdata(axis_out_tdata),
        .out_tvalid(axis_out_tvalid),
        .out_tready(axis_out_tready)
    );
endmodule
