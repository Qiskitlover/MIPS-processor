`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2025 11:26:07 PM
// Design Name: 
// Module Name: Instruction_fetch
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


module Instruction_fetch(
    input clk,
    input reset,
    output [31:0] Opcode
    );
    reg [31:0] PC;
    InstructionMemory utt(.PC(PC),.reset(reset),.Opcode(Opcode));
    always@(negedge reset or posedge clk)
    begin
    if(reset==0)
    PC<=0;
    else
    PC<=PC+4;
    end
endmodule
