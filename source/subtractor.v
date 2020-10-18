`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 22:54:54
// Design Name: 
// Module Name: subtractor
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


module subtractor(
     input [31:0] A,
	 input [31:0] B,
	 output [31:0] S);
	 wire [31:0] S1;
//	 wire B1;
//	 assign B1=-B;
	 adder32 adder1(
        .A(A),
		  .B(S1),
		  .S(S),
		  .C31()
		 ); //S=S1+A=A+B-1
	   adder32 adder(
        .A(~B),
		  .B(1),
		  .S(S1),
		  .C31()
		 ); //S1=-B+1
		 
endmodule
