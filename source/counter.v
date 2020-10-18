`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 18:22:44
// Design Name: 
// Module Name: counter
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


module counter(
 input clock,reset,
 output reg [12:0]count
    );
    always@(posedge clock or negedge reset)
    begin
    if(reset==0)
    count<=0;
    else count <=count+1;
    end
endmodule
