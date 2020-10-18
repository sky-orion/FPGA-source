`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/18 17:46:28
// Design Name: 
// Module Name: minus
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


module minus(
input [31:0]a,
output [31:0]s
    );
    adder32 adder(.A(~a),.B(1),.S(s),.C31());
endmodule
