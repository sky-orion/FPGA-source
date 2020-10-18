`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/13 16:25:23
// Design Name: 
// Module Name: adder_32
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


module adder32(A,B,S,C31);
    input [31:0] A;
	 input [31:0] B;
	 output [31:0] S;
	 output C31;
	 
	 wire px1,gx1,px2,gx2;
	 wire c15;

  CLA_16 CLA1(
      .A(A[15:0]),
		.B(B[15:0]),
		.cin(0),
		.S(S[15:0]),
		.px(px1),
		.gx(gx1)
	);
  
  CLA_16 CLA2(
        .A(A[31:16]),
		  .B(B[31:16]),
		  .cin(c15),
		  .S(S[31:16]),
		  .px(px2),
		  .gx(gx2)
	);

  assign c15 = gx1 | (px1 && 0), //c0 = 0
         C31 = gx2 | (px2 && c15);

endmodule

