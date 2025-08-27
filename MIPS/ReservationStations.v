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

//Entries that are younger than branch will have to be accessed using ROB
module ReservationStations(
input clk,reset,write,writeData,
input[4:0]index,
input[4:0]ReadRegA,
input[4:0]ReadRegB,
input[4:0]ReadRegD,
input[3:0]ReadALUcode,
input[31:0]ReadDataA,
input[31:0]ReadDataB,
output reg[31:0]OutDataA,
output reg[31:0]OutDataB,
output reg[4:0]OutRegD,
output reg[3:0]OutALUcode,
output[4:0]Occupancy,
output[4:0]Ready
    );
    
    reg[5:0]RegA[0:4];
    reg[5:0]RegB[0:4];
    reg[4:0]RegD[0:4];
    
    reg[31:0]DataA[0:4];
    reg[31:0]DataB[0:4];
    
    reg vacant[0:4];
    reg Va[0:4];
    reg Vb[0:4];
    reg[3:0]ALUcode[0:4];
    
    integer a;
    
    assign Occupancy={vacant[4],vacant[3],vacant[2],vacant[1],vacant[0]};
    assign Ready={Va[4]&Vb[4],Va[3]&Vb[3],Va[2]&Vb[2],Va[1]&Vb[1],Va[0]&Vb[0]};
    always@(negedge reset)
    begin
    case(write)
    0:
    for(a=0;a<5;a=a+1)
    begin
    if((RegA[a]>ReadRegA&&RegA[a]<ReadRegB)||(RegB[a]>ReadRegA&&RegB[a]<ReadRegB))
    vacant[a]=0;//Entry is empty
    end
    1:
    for(a=0;a<5;a=a+1)
    begin
    if((RegA[a]<ReadRegA&&RegA[a]>ReadRegB)||(RegB[a]<ReadRegA&&RegB[a]>ReadRegB))
    vacant[a]=0;//Entry is empty
    end
    endcase
    end
    always@(posedge clk)
    begin
    case(write)
    0:
    begin
    OutDataA<=DataA[index];
    OutDataB<=DataB[index];
    OutRegD<=RegD[index];
    OutALUcode<=ALUcode[index];
    end
    1:
    begin
    RegA[index]<=ReadRegA;
    RegB[index]<=ReadRegB;
    RegD[index]<=ReadRegD;
    vacant[index]<=1;
    ALUcode[index]<=ReadALUcode;
    end
    endcase
    if(writeData)
    begin
    for(a=0;a<5;a=a+1)
    begin
    
    if(RegA[a]==ReadRegA&&Va[a]==0)
    begin
    DataA[a]<=ReadDataA;
    Va[a]<=1;
    end
    
    if(RegB[a]==ReadRegB&&Vb[a]==0)
    begin
    DataB[a]<=ReadDataB;
    Vb[a]<=1;
    end
    
    end
    end
    end
endmodule