`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2025 10:56:08 PM
// Design Name: 
// Module Name: BHT
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


module BHT(
    input [5:0]PredictorIndex,
    input reset,
    input clk,
    input [1:0]change,
    output reg branch_taken
    );
    reg [1:0] counter [0:63];
    integer SNT=2'b00;
    integer WNT=2'b01;
    integer WT=2'b10;
    integer ST=2'b11;
    integer a;
    always@(negedge reset)
    begin
    for(a=0;a<64;a=a+1)begin
    counter[a]<=2'b01;
    end
    end
    always@(posedge clk)
    begin
    case(change)
    2'b10:
    if(counter[PredictorIndex]==2'b00)
    begin
    counter[PredictorIndex]=2'b00;
    end
    else begin
    counter[PredictorIndex]=counter[PredictorIndex]-2'b01;
    end
    2'b11:
    if(counter[PredictorIndex]==2'b11)
    begin
    counter[PredictorIndex]=2'b11;
    end
    else begin
    counter[PredictorIndex]=counter[PredictorIndex]+2'b01;
    end
    default:
    branch_taken=counter[PredictorIndex][1];
    endcase
    end

endmodule
