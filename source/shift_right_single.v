`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 20:39:18
// Design Name: 
// Module Name: shift_right_single
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


module shift_right_single(
input [31:0] A,    //操作数
input [4:0] cnt,   //移位数
output [31:0] B
    );
reg [31:0] tmp;
always @ (cnt)
begin
    case(cnt)
       5'b00000:tmp<=  {A[31:0]};
       5'b00001:tmp<= {1'b0,A[31:1]};
       5'b00010:tmp<= {2'b0,A[31:2]};
       5'b00011:tmp<= {3'b0,A[31:3]};
       5'b00100:tmp<= {4'b0,A[31:4]};
       5'b00101:tmp<= {5'b0,A[31:5]};
       5'b00110:tmp<= {6'b0,A[31:6]};
       5'b00111:tmp<= {7'b0,A[31:7]};
       5'b01000:tmp<= {8'b0,A[31:8]};
       5'b01001:tmp<= {9'b0,A[31:9]};
       5'b01010:tmp<= {10'b0,A[31:10]};
       5'b01011:tmp<= {11'b0,A[31:11]};
       5'b01100:tmp<= {12'b0,A[31:12]};
       5'b01101:tmp<= {13'b0,A[31:13]};
       5'b01110:tmp<= {14'b0,A[31:14]};
       5'b01111:tmp<= {15'b0,A[31:15]};
       5'b10000:tmp<= {16'b0,A[31:16]};
       5'b10001:tmp<= {17'b0,A[31:17]};
       5'b10010:tmp<= {18'b0,A[31:18]};
       5'b10011:tmp<= {19'b0,A[31:19]};
       5'b10100:tmp<= {20'b0,A[31:20]};
       5'b10101:tmp<= {21'b0,A[31:21]};
       5'b10110:tmp<= {22'b0,A[31:22]};
       5'b10111:tmp<= {23'b0,A[31:23]};
       5'b11000:tmp<= {24'b0,A[31:24]};
       5'b11001:tmp<= {25'b0,A[31:25]};
       5'b11010:tmp<= {26'b0,A[31:26]};
       5'b11011:tmp<= {27'b0,A[31:27]};
       5'b11100:tmp<= {28'b0,A[31:28]};
       5'b11101:tmp<= {29'b0,A[31:29]};
       5'b11110:tmp<= {30'b0,A[31:30]};
       5'b11111:tmp<= {31'b0,A[31]};
    endcase  
end
assign B=tmp;
endmodule
