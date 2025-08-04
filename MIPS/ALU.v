`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 12:03:47 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] code,
    output reg [31:0] ALU_output,
    output reg zero,
    output reg Reg_Write
    );
    always@(*)
    begin
    case(code)
    4'b0000:
    begin
    Reg_Write=0;
    ALU_output=a&b;
    Reg_Write=1;
    end
    4'b0001:
    begin
    Reg_Write=0;
    ALU_output=a|b;
    Reg_Write=1;
    end
    4'b0010:
    begin
    Reg_Write=0;
    ALU_output=a+b;
    Reg_Write=1;
    end
    4'b0100:
    begin
    Reg_Write=0;
    ALU_output=(a>b)?a-b:0;
    Reg_Write=1;
    end
    4'b1000 :
    begin
    Reg_Write=0;
    ALU_output=(a>b)?1:0;
    Reg_Write=1;
    end
    4'b0011:
    begin
    Reg_Write=0;
    ALU_output=a<<b;
    Reg_Write=1;
    end
    4'b1100:
    begin
    Reg_Write=0;
    ALU_output=a>>b;
    Reg_Write=1;
    end
    default:
    begin
    Reg_Write=0;
    ALU_output=0;
    end
    endcase
    if(ALU_output==0)
    zero<=1;
    else
    zero<=0;
    end
endmodule
