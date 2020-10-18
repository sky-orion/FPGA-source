`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 21:06:20
// Design Name: 
// Module Name: RegFD
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


module RegFD(
input clk,
input [31:0]instrF,
input en,
output reg [31:0]instrD
    );
always@(posedge clk)
begin
    if(en)
        instrD<=instrF;
    else
        instrD<=instrD;
end
endmodule
