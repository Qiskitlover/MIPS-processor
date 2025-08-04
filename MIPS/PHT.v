`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 11:14:26 PM
// Design Name: 
// Module Name: PHT
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


module PHT(
input BranchTaken,
input clk,
input reset,
input [5:0]PC,
output reg [5:0]Pattern,

output reg [5:0]PredictorIndex
);
    reg [5:0]StoredPattern[0:63];


    integer a;
    always@(negedge reset)
    begin
    for(a=0;a<64;a=a+1)
    StoredPattern[a]<=11'bx;
    end
    always@(posedge clk)
    begin
    StoredPattern[PC]<=StoredPattern[PC]>>1;
    StoredPattern[PC][10]<=BranchTaken;
    Pattern<=StoredPattern[PC];
    PredictorIndex<=StoredPattern[PC]^PC;
    end
endmodule
