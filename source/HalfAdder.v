`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 21:15:47
// Design Name: 
// Module Name: HalfAdder
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


module HalfAdder(a, b, sum, cout);

input a, b;
output sum, cout;

assign	sum = a ^ b;
assign	cout = a & b;

endmodule
