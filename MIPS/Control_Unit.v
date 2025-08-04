`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:46:44 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [31:0]Instruction,
    output [4:0]Rdst,
    output [4:0]Rsrc1,
    output [4:0]Rsrc2,
    output [4:0]Shamt,
    output reg [20:0]Data,
    input clk,
    output reg isImmediate,
    output reg isShift,
    output reg isArithmatic,
    output reg [3:0]ALU_code
    );
    reg [5:0]Opcode;
    wire[5:0] Funct;
    assign Rdst=Instruction[25:21];
    assign Rsrc1=Instruction[20:16];
    assign Rsrc2=Instruction[15:11];
    assign Shamt=Instruction[10:6];
    assign Funct=Instruction[5:0];
    always@(posedge clk)
    begin
    Opcode=Instruction[31:26];
    case(Opcode)
    111111:
    begin
    Data<={Rdst,Rsrc1,Rsrc2,Shamt,Funct};
    isImmediate<=1;
    isShift<=0;
    isArithmatic<=0;
    end
    000000:
    case(Funct[5])
    0:
    begin
    isImmediate<=0;
    isShift<=1;
    isArithmatic<=0;
    case(Funct[1])
    0:
    ALU_code<=1100;
    1:
    ALU_code<=0011;
    endcase
    end
    1:
    begin
    isImmediate<=0;
    isShift<=0;
    isArithmatic<=1;
    case(Funct[2:0])
    000:
    ALU_code<=0010;
    010:
    ALU_code<=1000;
    100:
    ALU_code<=0000;
    101:
    ALU_code<=0001;
    endcase
    end
    endcase
    endcase
    end
endmodule
