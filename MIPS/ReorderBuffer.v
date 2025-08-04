`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:10:49 PM
// Design Name: 
// Module Name: ReorderBuffer
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


module ReorderBuffer(
    input clk,reset,
    input [2:0]code,
    input [4:0]PC,
    input [4:0]RegIN,
    input[31:0]DataIN,
    output reg[4:0]RegOut,
    output reg[31:0]DataOut,
    output reg done
    );
    reg Done[31:0];
    reg [4:0]Reg[31:0];
    reg [31:0]Data[31:0];
    reg [4:0]Issue;
    reg [4:0]Commit;
    //integer b;
    always@(negedge reset)
    begin
    Issue=PC;
    end
//    always@(posedge write)
//    begin
//    if(Issue<31)
//    Issue=Issue+1;
//    else
//    Issue=0;
//    Done[Issue]<=0;
//    Reg[Issue]<=RegIN;
//    //PC[newest]<=PCIN;
//    end
//    always@(posedge DataWrite)
//    begin
//    //for(b=0;b<32;b=b+1)
//    //if(PC[b]==PCIN)
//    Data[PC]=DataIN;
//    end
//    always@(posedge commit)
//    begin
//    RegOut=Reg[Commit];
//    DataOut=Data[Commit];
//    done=Done[Commit];
//    if(Commit<31)
//    Commit=Commit+1;
//    else
//    Commit=0;
//    end
//    always@(posedge MarkDone)
//    begin
//    Done[PC]=1;
//    end
    always@(posedge clk)
    begin
    case(code)
    3'b100: //write
    begin
    if(Issue<31)
    Issue=Issue+1;
    else
    Issue=0;
    Done[Issue]<=0;
    Reg[Issue]<=RegIN;
    //PC[newest]<=PCIN;
    end
    3'b010:  //data write/mark done
    begin
    Data[PC]<=DataIN;
    Done[PC]<=1;
    end
    3'b001:  //commit
    begin
    RegOut=Reg[Commit];
    DataOut=Data[Commit];
    done=Done[Commit];
    if(Commit<31)
    Commit=Commit+1;
    else
    Commit=0;
    end
    endcase
    end
endmodule
