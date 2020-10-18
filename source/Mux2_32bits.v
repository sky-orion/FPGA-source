`timescale 1ns / 1ps



module Mux2_32bits(
    input choice,
    input [31:0] in0,
    input [31:0] in1,
    output [31:0] out
    );
    
    assign out = (choice==0) ? in0 : in1;
    
endmodule
