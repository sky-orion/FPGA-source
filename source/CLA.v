`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/13 16:08:39
// Design Name: 
// Module Name: CLA
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


module CLA(cin,c0,c1,c2,c3,p0,p1,p2,p3,g0,g1,g2,g3);
   
	 input cin,g0,g1,g2,g3,p0,p1,p2,p3;
	 output c0,c1,c2,c3;
	 
	 assign    c0 = g0 | (p0 & cin),
	          c1 = g1 | (p1 & g0) | (p1 & p0 & cin),
			  c2 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin),
			  c3 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) |(p3 & p2 & p1 & p0 & cin);
	 
endmodule 

