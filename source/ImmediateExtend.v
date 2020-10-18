`timescale 1ns / 1ps


module ImmediateExtend(
    input [15:0] original,
//    input ExtSel,    // 0: Zero-extend; 1: Sign-extend.
    output reg [31:0] extended
    );
    
    always @(*) begin
        extended[15:0] <= original;    // 低16位保持不变
//        if(ExtSel == 0) begin    // Zero-extend 零扩展
//            extended[31:16] <= 0;
//        end
//        else begin    // Sign-extended 符号扩展
//            if(original[15] == 0) extended[31:16] <= 0;
//            else extended[31:16] <= 16'hFFFF;
//        end
         extended[31:16] <= {16{original[15]}};   
    end
    
endmodule
