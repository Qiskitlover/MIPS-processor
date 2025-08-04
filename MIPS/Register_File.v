`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 01:10:15 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input [4:0] RegA,
    input [4:0] RegB,
    input [4:0] WriteReg,
    input [31:0] Data,
    input clk,
    input RegWrite,
    input reset,
    output [31:0] DataA,
    output [31:0] DataB
    );
    reg [31:0] file[31:0];
    assign DataA=file[RegA];
    assign DataB=file[RegB];
    integer i;
    always @(posedge clk)
    begin
    if(RegWrite==1)
    file[WriteReg]<=Data;
    end
    always@(negedge reset)
    begin
    if(reset==0)
    for(i=0;i<32;i=i+1)begin
    file[i]<=0;
    end
    end
endmodule
