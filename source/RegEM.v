`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 20:46:55
// Design Name: 
// Module Name: RegEM
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


module RegEM(
input clk,
input RegwriteE,
input MemtoregE,
input MemwriteE,
input [31:0]ALUoutE,
input [31:0]WritedataE,
input [4:0]WriteregE,
output reg RegwriteM,
output reg MemtoregM,
output reg MemwriteM,
output reg [31:0]ALUoutM,
output reg [31:0]WritedataM,
output reg [4:0]WriteregM
    );
 always @(posedge clk) 
    begin
           RegwriteM<=RegwriteE;
           MemtoregM<=MemtoregE;
           MemwriteM<=MemwriteE;
           ALUoutM<=ALUoutE;
           WritedataM<=WritedataE; 
           WriteregM<=WriteregE;
     end
endmodule
