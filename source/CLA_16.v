`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/13 16:23:38
// Design Name: 
// Module Name: CLA_16
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


module CLA_16(A,B,cin,S,px,gx);
   input [15:0] A;
	input [15:0] B;
	input cin;
	output gx,px;
	output [15:0] S;
	
	wire c3,c7,c11;
	wire Pm0,Gm0,Pm1,Gm1,Pm2,Gm2,Pm3,Gm3;
	
	adder_4 adder1(
	     .x(A[3:0]),
		  .y(B[3:0]),
		  .cin(cin),
		  .c3(),
		  .F(S[3:0]),
		  .Gm(Gm0),
		  .Pm(Pm0)
	);
	
	adder_4 adder2(
	     .x(A[7:4]),
		  .y(B[7:4]),
		  .cin(c3),
		  .c3(),
		  .F(S[7:4]),
		  .Gm(Gm1),
		  .Pm(Pm1)
	);
	
   adder_4 adder3(
	     .x(A[11:8]),
		  .y(B[11:8]),
		  .cin(c7),
		  .c3(),
		  .F(S[11:8]),
		  .Gm(Gm2),
		  .Pm(Pm2)
	);

   adder_4 adder4(
	     .x(A[15:12]),
		  .y(B[15:12]),
		  .cin(c11),
		  .c3(),
		  .F(S[15:12]),
		  .Gm(Gm3),
		  .Pm(Pm3)
	);
	
	assign   c3 = Gm0 | (Pm0 & cin),
	         c7 = Gm1 | (Pm1 & Gm0) | (Pm1 & Pm0 & cin),
			 c11 = Gm2 | (Pm2 & Gm1) | (Pm2 & Pm1 & Gm0) | (Pm2 & Pm1 & Pm0 & cin);
 
   assign  px = Pm0 & Pm1 & Pm2 & Pm3,
	       gx = Gm3 | (Pm3 & Gm2) | (Pm3 & Pm2 & Gm1) | (Pm3 & Pm2 & Pm1 & Gm0);
	       
endmodule 

