`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/09 14:57:19
// Design Name: 
// Module Name: slt
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


module slt(
    input [31:0] a,b,
    output reg [31:0] s//result <= (A < B) ? 1 : 0; ±È½ÏÊý
    );
    wire [31:0] s1 ;
subtractor subtractor0(.A(a),.B(b),.S(s1));
always@(s1)
begin
 s[31:0]<={30'b0,
 (s1[31]&~a[31]&~b[31])|
 (a[31]&~b[31])|
 (s1[31]&a[31]&b[31])};
end
 
endmodule
