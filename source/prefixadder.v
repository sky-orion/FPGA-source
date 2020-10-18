`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 19:42:13
// Design Name: 
// Module Name: prefixadder32
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


module prefixadder32(
input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] Sum
    );
    wire g;
    bk32 ag1(A[15:0],B[15:0],Cin,Sum[15:0],g);
    bk32 ag2(A[31:16],B[31:16],g,Sum[31:16]);
endmodule
