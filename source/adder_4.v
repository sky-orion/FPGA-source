`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/13 16:09:18
// Design Name: 
// Module Name: adder_4
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


module adder_4(x,y,cin,c3,F,Gm,Pm);
     input [3:0] x;
	  input [3:0] y;
	  input cin;
	  output c3,Gm,Pm;
	  output [3:0] F;
	  	  
	  wire p0,p1,p2,p3,g0,g1,g2,g3;
	  wire c0,c1,c2;
	  adder adder1(
	             .X(x[0]),
					 .Y(y[0]),
					 .Cin(cin),
					 .F(F[0]),
					 .Cout()
				);
		
	  adder adder2(
	             .X(x[1]),
					 .Y(y[1]),
					 .Cin(c0),
					 .F(F[1]),
					 .Cout()
				);	
		
	 adder adder3(
	             .X(x[2]),
					 .Y(y[2]),
					 .Cin(c1),
					 .F(F[2]),
					 .Cout()
				);
			
	adder adder4(
	             .X(x[3]),
					 .Y(y[3]),
					 .Cin(c2),
					 .F(F[3]),
					 .Cout()
				);		
		
		CLA CLA(
			.cin(cin),
			.c0(c0),
			.c1(c1),
			.c2(c2),
			.c3(c3),
			.p0(p0),
			.p1(p1),
			.p2(p2),
			.p3(p3),
			.g0(g0),
			.g1(g1),
			.g2(g2),
			.g3(g3)
		);
				
		
	  
  assign   p0 = x[0] | y[0],	  
           p1 = x[1] | y[1],
		   p2 = x[2] | y[2],
		   p3 = x[3] | y[3];

  assign   g0 = x[0] & y[0],
           g1 = x[1] & y[1],
		   g2 = x[2] & y[2],
		   g3 = x[3] & y[3];

  assign Pm = p0 & p1 & p2 & p3,
         Gm = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);

endmodule 

