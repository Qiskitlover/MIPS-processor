`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2025 10:39:24 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [31:0]PC ,
    input reset,
    output [31:0]Opcode
    );
    reg [7:0] mem [15:0];
    assign Opcode={mem[PC],mem[PC+1],mem[PC+2],mem[PC+3]};
    always @(reset)
    begin
    if(reset==0)
    begin
    mem[0]=8'h84;mem[1]=8'ha0;mem[2]=8'h1b;mem[3]=8'h12;
    mem[4]=8'h44;mem[5]=8'h00;mem[6]=8'hbb;mem[7]=8'h22;
    mem[8]=8'h30;mem[9]=8'h00;mem[10]=8'hcc;mem[11]=8'haa;
    mem[12]=8'h55;mem[13]=8'h11;mem[14]=8'h29;mem[15]=8'hdd;
    end
    end
    
endmodule
