`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:31:35 PM
// Design Name: 
// Module Name: RAT
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


module RAT(
input[4:0]Reg,
input write,
output reg[4:0]ReadReg,
input clk,
input reset
    );
    reg [4:0] PhysRegUsed[13:0];
    reg [4:0] RegNext;
    integer a;
    always@(negedge reset)
    begin
    RegNext=5'd14;
    for(a=0;a<14;a=a+1)
    PhysRegUsed[a]=a;
    end
    always@(posedge clk)
    begin
    if(write==1)
    begin
    PhysRegUsed[Reg]=RegNext;
    if(RegNext<31)
    RegNext=RegNext+1;
    else
    RegNext=0;
    end
    ReadReg=PhysRegUsed[Reg];
    end
endmodule
