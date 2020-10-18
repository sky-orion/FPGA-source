`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 21:20:07
// Design Name: 
// Module Name: TopMultiplier
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


module	TopMultiplier ( x_in, y_in, result_out );

input	[15: 0]	x_in, y_in;
output	[31: 0]	result_out;

// internal connections
wire	[15:0]	pp0, pp1, pp2, pp3, pp4, pp5, 
				pp6, pp7, pp8, pp9, pp10, pp11, 
				pp12, pp13, pp14, pp15; 
wire	[31: 0]	opa, opb;
wire	[15: 0]	sign;
//wire	[15: 0]	sign_compensate;
wire	[31: 0]	sign_compensate;
wire	[31: 0]	res_tmp;

// generate PP
Booth_Classic	booth (	.M( x_in ),
						.R( y_in ),
						.pp0( pp0 ),
						.pp1( pp1 ),
						.pp2( pp2 ),
						.pp3( pp3 ),
						.pp4( pp4 ),
						.pp5( pp5 ),
						.pp6( pp6 ),
						.pp7( pp7 ),
						.pp8( pp8 ),
						.pp9( pp9 ),
						.pp10( pp10 ),
						.pp11( pp11 ),
						.pp12( pp12 ),
						.pp13( pp13 ),
						.pp14( pp14 ),
						.pp15( pp15 ),
						.S( sign )
						);

// wallace tree
WallaceTree16X16 wallace (	
							.pp0( pp0 ),
							.pp1( pp1 ),
							.pp2( pp2 ),
							.pp3( pp3 ),
							.pp4( pp4 ),
							.pp5( pp5 ),
							.pp6( pp6 ),
							.pp7( pp7 ),
							.pp8( pp8 ),
							.pp9( pp9 ),
							.pp10( pp10 ),
							.pp11( pp11 ),
							.pp12( pp12 ),
							.pp13( pp13 ),
							.pp14( pp14 ),
							.pp15( pp15 ),
							.opa( opa),
							.opb( opb)
						);

// calculate the sign bit compensate
//CS_Adder32	signcomp (
//						.a( {~sign, 16'b0} ),
//						.b( {15'b0, 1'b1, 16'b0} ),
//						.cin( 1'b0 ),
//						.sum( sign_compensate ),
//						.cout()
//					);

//// temporary result
//CS_Adder32	resulttemp (
//							.a( opa ),
//							.b( opb ),
//							.cin( 1'b0 ),
//							.sum( res_tmp ),
//							.cout()
//						);

//// final result
//CS_Adder32	result (
//						.a( res_tmp ),
//						.b( sign_compensate ),
//						.cin( 1'b0 ),
//						.sum( result_out),
//						.cout()
//					);
prefixadder32	signcomp (
						.A( {~sign, 16'b0} ),
						.B( {15'b0, 1'b1, 16'b0} ),
						.Cin( 1'b0 ),
						.Sum( sign_compensate )
					);

// temporary result
prefixadder32	resulttemp (
							.A( opa ),
							.B( opb ),
							.Cin( 1'b0 ),
							.Sum( res_tmp )
						);

// final result
prefixadder32	result (
						.A( res_tmp ),
						.B( sign_compensate ),
						.Cin( 1'b0 ),
						.Sum( result_out)
					);

endmodule
