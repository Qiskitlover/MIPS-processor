`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:06:22 AM
// Design Name: 
// Module Name: ReservationStations
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


module ReservationStations(
input clk,reset,write,
input[32:0]ReadPC,//add in on bit shower that gives all valid pcs
input[4:0]ReadRegA,
input[4:0]ReadRegB,
input[4:0]ReadRegD,
input[3:0]ReadALUcode,
input[31:0]ReadDataA,
input[31:0]ReadDataB,
output[31:0]OutDataA,
output[31:0]OutDataB,
output[4:0]OutRegD,
output[3:0]OutALUcode,
output[31:0]PCout
    );
    reg[5:0]RegA[0:7];
    reg[5:0]RegB[0:7];
    reg[4:0]RegD[0:7];
    reg[31:0]DataA[0:7];
    reg[31:0]DataB[0:7];
    reg done[0:7];
    reg Va[0:7];
    reg Vb[0:7];
    reg[3:0]ALUcode[0:7];
    reg[31:0]PC[0:7];
    always@(negedge reset)
    begin
    done[0]<=1;done[1]<=1;done[2]<=1;done[3]<=1;
    done[4]<=1;done[5]<=1;done[6]<=1;done[7]<=1;
    end
    always@(posedge clk)
    begin
   
    end
endmodule
