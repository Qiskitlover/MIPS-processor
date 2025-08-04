`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2025 05:20:25 PM
// Design Name: 
// Module Name: BTB
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


module BTB(
input [5:0]PCnow,
output reg [31:0]PCnext,
input clk,
input reset,
input write,
input [31:0]loadPCnext);

//reg[31:0] CurrentPC[0:49];
reg[31:0] NextPC[0:63];
integer a;

always@(negedge reset)
begin
for(a=0;a<64;a=a+1)
begin
//CurrentPC[a]=0;
NextPC[a]=0;
end
end

always@(posedge clk)
begin
case(write)
0:
PCnext=NextPC[PCnow];
1:
NextPC[PCnow]=loadPCnext;
default:
PCnext=32'bx;
endcase

end

endmodule
