`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 20:58:37
// Design Name: 
// Module Name: RegMW
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


module RegMW(
input clk,
input RegwriteM,
input MemtoregM,
input [31:0]ReaddataM,
input [31:0]ALUoutM,
input [4:0]WriteregM,
output reg RegwriteW,
output reg MemtoregW,
output reg [31:0]ReaddataW,
output reg [31:0]ALUoutW,
output reg [4:0]WriteregW
    );
 always @(posedge clk) 
    begin
           RegwriteW<=RegwriteM;
           MemtoregW<=MemtoregM;
           ALUoutW<=ALUoutM;
           ReaddataW<=ReaddataM; 
           WriteregW<=WriteregM;
     end
endmodule
